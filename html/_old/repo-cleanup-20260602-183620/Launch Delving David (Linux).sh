#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

if [[ ! -f "index.html" || ! -d "html5game" ]]; then
  printf 'Delving David: could not find the HTML5 game files next to this launcher.\n' >&2
  exit 1
fi

if command -v python3 >/dev/null 2>&1; then
  python_cmd=(python3)
elif command -v python >/dev/null 2>&1; then
  python_cmd=(python)
else
  printf 'Delving David requires Python 3 or Python to run the local HTML server on Linux.\n' >&2
  exit 1
fi

port=8087
port_in_use() {
  if command -v ss >/dev/null 2>&1; then
    ss -ltn "( sport = :$1 )" | grep -q ":$1"
  elif command -v lsof >/dev/null 2>&1; then
    lsof -nP -iTCP:"$1" -sTCP:LISTEN >/dev/null 2>&1
  else
    return 1
  fi
}

while port_in_use "$port"; do
  port=$((port + 1))
done

url="http://127.0.0.1:${port}/"
printf '%s' "$port" > .last_server_port

if command -v xdg-open >/dev/null 2>&1; then
  (sleep 0.5 && xdg-open "$url" >/dev/null 2>&1) &
elif command -v sensible-browser >/dev/null 2>&1; then
  (sleep 0.5 && sensible-browser "$url" >/dev/null 2>&1) &
fi

printf 'Serving Delving David at %s\n' "$url"
printf 'Close this window or press Control-C to stop the server.\n'
"${python_cmd[@]}" -m http.server "$port" --bind 127.0.0.1 &
server_pid=$!

cleanup() {
  kill "$server_pid" >/dev/null 2>&1 || true
}

trap cleanup EXIT INT TERM
wait "$server_pid"
