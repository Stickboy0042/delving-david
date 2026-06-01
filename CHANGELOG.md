# Changelog

## 2026-05-31

- Windows build: published a fresh Windows VM build under `windows/latest` and refreshed `Delving_David_Windows.zip` from source commit `65c30bb`. Verification: built with `source/Tools/build_game.sh windows`, confirmed the zip contains the executable, current `data.win`, fonts, and options, and validated the archive with `unzip -t`.
- Screenshot: refreshed `latest-build-screenshot.png` from the current HTML5 smoke run so the branch preview matches the latest source/UI state.
- Build note: GameMaker still logs the macOS-hosted `kernel32.dll` Windows version-resource warning, but the fallback packaging path completed and produced the expected Windows zip.

## 2026-05-30

- Windows build: published a fresh Windows VM build under `windows/latest` and refreshed `Delving_David_Windows.zip` from the current local GameMaker source tree. Verification: built with `source/Tools/build_game.sh windows` and confirmed the zip contains the executable, `data.win`, fonts, and options.
- Windows build: published a fresh Windows VM build under `windows/latest`, including the runnable executable, `data.win`, fonts, options, and a zip package. Verification: confirmed the zip contains the expected Windows runtime files.
