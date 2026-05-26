import Dispatch
import Foundation
import Network

let htmlRoot = Bundle.main.bundleURL.deletingLastPathComponent()
let rootPath = htmlRoot.standardizedFileURL.path
let queue = DispatchQueue(label: "delving-david.http")

func makeListener() throws -> (NWListener, UInt16) {
    var port: UInt16 = 8087
    while port < 9000 {
        do {
            let listener = try NWListener(using: .tcp, on: NWEndpoint.Port(rawValue: port)!)
            return (listener, port)
        } catch {
            port += 1
        }
    }
    throw NSError(domain: "DelvingDavidLauncher", code: 1, userInfo: [NSLocalizedDescriptionKey: "No local port was available."])
}

func contentType(for path: String) -> String {
    let ext = URL(fileURLWithPath: path).pathExtension.lowercased()
    switch ext {
    case "html": return "text/html; charset=utf-8"
    case "js": return "application/javascript; charset=utf-8"
    case "json": return "application/json; charset=utf-8"
    case "png": return "image/png"
    case "jpg", "jpeg": return "image/jpeg"
    case "ico": return "image/x-icon"
    case "wasm": return "application/wasm"
    case "ini": return "text/plain; charset=utf-8"
    default: return "application/octet-stream"
    }
}

func response(status: String, body: Data, contentType: String = "text/plain; charset=utf-8") -> Data {
    var header = "HTTP/1.1 \(status)\r\n"
    header += "Content-Length: \(body.count)\r\n"
    header += "Content-Type: \(contentType)\r\n"
    header += "Cache-Control: no-store\r\n"
    header += "Connection: close\r\n\r\n"
    return Data(header.utf8) + body
}

func fileResponse(for requestPath: String, method: String) -> Data {
    let decodedPath = requestPath.split(separator: "?", maxSplits: 1).first.flatMap(String.init) ?? "/"
    let cleanPath = (decodedPath.removingPercentEncoding ?? decodedPath)
    let relativePath = cleanPath == "/" ? "index.html" : String(cleanPath.drop(while: { $0 == "/" }))
    let fileURL = htmlRoot.appendingPathComponent(relativePath).standardizedFileURL
    let filePath = fileURL.path

    guard filePath == rootPath || filePath.hasPrefix(rootPath + "/") else {
        return response(status: "403 Forbidden", body: Data("Forbidden".utf8))
    }

    guard FileManager.default.fileExists(atPath: filePath), let data = try? Data(contentsOf: fileURL) else {
        return response(status: "404 Not Found", body: Data("Not Found".utf8))
    }

    if method == "HEAD" {
        return response(status: "200 OK", body: Data(), contentType: contentType(for: filePath))
    }

    return response(status: "200 OK", body: data, contentType: contentType(for: filePath))
}

func handle(_ connection: NWConnection) {
    connection.start(queue: queue)
    connection.receive(minimumIncompleteLength: 1, maximumLength: 8192) { data, _, _, _ in
        guard let data, let request = String(data: data, encoding: .utf8) else {
            connection.cancel()
            return
        }

        let firstLine = request.split(separator: "\r\n", maxSplits: 1).first ?? ""
        let parts = firstLine.split(separator: " ")
        let method = parts.count > 0 ? String(parts[0]) : "GET"
        let path = parts.count > 1 ? String(parts[1]) : "/"

        let payload: Data
        if method == "GET" || method == "HEAD" {
            payload = fileResponse(for: path, method: method)
        } else {
            payload = response(status: "405 Method Not Allowed", body: Data("Method Not Allowed".utf8))
        }

        connection.send(content: payload, completion: .contentProcessed { _ in
            connection.cancel()
        })
    }
}

func openBrowser(url: String) {
    let chrome = Process()
    chrome.executableURL = URL(fileURLWithPath: "/usr/bin/open")
    chrome.arguments = ["-na", "Google Chrome", "--args", "--new-window", url]

    do {
        try chrome.run()
        chrome.waitUntilExit()
        if chrome.terminationStatus == 0 { return }
    } catch {}

    let fallback = Process()
    fallback.executableURL = URL(fileURLWithPath: "/usr/bin/open")
    fallback.arguments = [url]
    try? fallback.run()
}

do {
    let (listener, port) = try makeListener()
    let url = "http://127.0.0.1:\(port)/"
    try String(port).write(to: htmlRoot.appendingPathComponent(".last_server_port"), atomically: true, encoding: .utf8)

    listener.newConnectionHandler = handle
    listener.start(queue: queue)

    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
        openBrowser(url: url)
    }

    RunLoop.main.run()
} catch {
    let alert = Process()
    alert.executableURL = URL(fileURLWithPath: "/usr/bin/osascript")
    alert.arguments = ["-e", "display alert \"Delving David\" message \"\(error.localizedDescription)\" as critical"]
    try? alert.run()
}
