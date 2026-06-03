#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "$0")/../.." && pwd)"
desktop_dir="${XDG_DESKTOP_DIR:-$HOME/Desktop}"
mkdir -p "$desktop_dir"

shortcut="$desktop_dir/Delving David.desktop"
cat > "$shortcut" <<EOF
[Desktop Entry]
Type=Application
Name=Delving David
Comment=Launch Delving David HTML5
Exec=$root/Launch Delving David (Linux).sh
Icon=$root/launcher/icons/DelvingDavid.png
Terminal=true
Categories=Game;
EOF

chmod +x "$shortcut"
printf 'Created shortcut: %s\n' "$shortcut"
