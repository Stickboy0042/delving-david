$ErrorActionPreference = "Stop"

$Root = (Resolve-Path (Join-Path $PSScriptRoot "..\..")).Path
Set-Location $Root

if (!(Test-Path "index.html") -or !(Test-Path "html5game")) {
    Add-Type -AssemblyName PresentationFramework
    [System.Windows.MessageBox]::Show("Could not find the HTML5 game files next to this launcher.", "Delving David", "OK", "Error") | Out-Null
    exit 1
}

function Get-ContentType($Path) {
    switch ([System.IO.Path]::GetExtension($Path).ToLowerInvariant()) {
        ".html" { "text/html; charset=utf-8"; break }
        ".js"   { "application/javascript; charset=utf-8"; break }
        ".json" { "application/json; charset=utf-8"; break }
        ".png"  { "image/png"; break }
        ".jpg"  { "image/jpeg"; break }
        ".jpeg" { "image/jpeg"; break }
        ".ico"  { "image/x-icon"; break }
        ".wasm" { "application/wasm"; break }
        ".ini"  { "text/plain; charset=utf-8"; break }
        default { "application/octet-stream" }
    }
}

$Port = 8087
$Listener = New-Object System.Net.HttpListener
while ($Port -lt 9000) {
    try {
        $Listener.Prefixes.Clear()
        $Listener.Prefixes.Add("http://127.0.0.1:$Port/")
        $Listener.Start()
        break
    } catch {
        $Port++
    }
}

if (!$Listener.IsListening) {
    Write-Host "Could not start a local server on ports 8087-8999."
    pause
    exit 1
}

Set-Content -Path ".last_server_port" -Value $Port -NoNewline
$Url = "http://127.0.0.1:$Port/"
Write-Host "Serving Delving David at $Url"
Write-Host "Close this window to stop the server."
Start-Process $Url

try {
    while ($Listener.IsListening) {
        $Context = $Listener.GetContext()
        $RequestPath = [Uri]::UnescapeDataString($Context.Request.Url.AbsolutePath.TrimStart("/"))
        if ([string]::IsNullOrWhiteSpace($RequestPath)) { $RequestPath = "index.html" }

        $FilePath = [System.IO.Path]::GetFullPath((Join-Path $Root $RequestPath))
        if (!$FilePath.StartsWith($Root, [System.StringComparison]::OrdinalIgnoreCase)) {
            $Context.Response.StatusCode = 403
            $Bytes = [System.Text.Encoding]::UTF8.GetBytes("Forbidden")
        } elseif (!(Test-Path $FilePath -PathType Leaf)) {
            $Context.Response.StatusCode = 404
            $Bytes = [System.Text.Encoding]::UTF8.GetBytes("Not Found")
        } else {
            $Context.Response.StatusCode = 200
            $Context.Response.ContentType = Get-ContentType $FilePath
            if ($Context.Request.HttpMethod -eq "HEAD") {
                $Bytes = [byte[]]::new(0)
            } else {
                $Bytes = [System.IO.File]::ReadAllBytes($FilePath)
            }
        }

        $Context.Response.Headers.Set("Cache-Control", "no-store")
        $Context.Response.ContentLength64 = $Bytes.Length
        if ($Bytes.Length -gt 0) {
            $Context.Response.OutputStream.Write($Bytes, 0, $Bytes.Length)
        }
        $Context.Response.OutputStream.Close()
    }
} finally {
    $Listener.Stop()
    $Listener.Close()
}
