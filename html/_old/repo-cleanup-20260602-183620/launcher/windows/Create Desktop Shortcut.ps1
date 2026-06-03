$ErrorActionPreference = "Stop"

$Root = (Resolve-Path (Join-Path $PSScriptRoot "..\..")).Path
$Launcher = Join-Path $Root "Launch Delving David (Windows).cmd"
$Icon = Join-Path $Root "favicon.ico"
$Desktop = [Environment]::GetFolderPath("Desktop")
$ShortcutPath = Join-Path $Desktop "Delving David.lnk"

$Shell = New-Object -ComObject WScript.Shell
$Shortcut = $Shell.CreateShortcut($ShortcutPath)
$Shortcut.TargetPath = $Launcher
$Shortcut.WorkingDirectory = $Root
$Shortcut.IconLocation = "$Icon,0"
$Shortcut.Description = "Launch Delving David HTML5"
$Shortcut.Save()

Write-Host "Created shortcut: $ShortcutPath"
