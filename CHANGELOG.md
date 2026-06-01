# Changelog

## 2026-05-31

- Mac build: published a fresh unsigned Mac app zip under `mac/latest` from source commit `65c30bb`. Verification: built with `source/Tools/build_game.sh mac`, confirmed the zip contains `Delving David.app`, and validated the archive with `unzip -t`.
- Screenshot: refreshed `latest-build-screenshot.png` from the current HTML5 smoke run so the branch preview matches the latest source/UI state.
- Packaging: removed the stale root `Delving David.dmg`; the current local GameMaker pipeline produced the unsigned app zip artifact.

## 2026-05-30

- Mac build: published a fresh unsigned Mac app zip under `mac/latest` from the current local GameMaker source tree. Verification: built with `source/Tools/build_game.sh mac` and confirmed the zip contains `Delving David.app`.
- Mac build: published a fresh unsigned Mac app zip under `mac/latest` after generating the app with the GameMaker build pipeline. Verification: confirmed the zip contains `Delving David.app`; signing remains unsigned because the configured Developer ID certificate was not available in the local keychain.
