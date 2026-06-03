#!/bin/bash
set -euo pipefail

cd "$(dirname "$0")"

port=8087
while lsof -iTCP:"$port" -sTCP:LISTEN >/dev/null 2>&1; do
  port=$((port + 1))
done

url="http://127.0.0.1:${port}/"
echo "Serving Delving David at ${url}"
echo "Press Control-C in this window to stop the server."

open "$url"
python3 -m http.server "$port"
