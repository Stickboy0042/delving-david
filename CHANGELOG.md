# Changelog

## 2026-05-30

- Mac build: published a fresh unsigned Mac app zip under `mac/latest` from the current local GameMaker source tree. Verification: built with `source/Tools/build_game.sh mac` and confirmed the zip contains `Delving David.app`.
- Mac build: published a fresh unsigned Mac app zip under `mac/latest` after generating the app with the GameMaker build pipeline. Verification: confirmed the zip contains `Delving David.app`; signing remains unsigned because the configured Developer ID certificate was not available in the local keychain.
