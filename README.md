# Delving David

Mac build of the current Delving David GameMaker prototype.

![Latest build screenshot](latest-build-screenshot.png)

## Download

[Download Delving David.dmg](Delving%20David.dmg)

Open the DMG, then drag `Delving David.app` into Applications.

macOS may show a security warning because this prototype build is ad-hoc signed and not notarized with Apple Developer ID. If needed, right-click the app and choose Open.

## Patch Notes - May 28, 2026

- Stabilized player attack impact timing so damage, enemy red flash, hitstop, and attack SFX all fire from the same resolved hit frame.
- Locked attack sprite and hit-frame timing once per swing to prevent later hits from drifting.
- Tuned default combat feel: normal attack hit frame, normal hitstop, flurry hitstop, and ground stomp hitstop.
- Preserved the sustained flurry attack window while keeping normal sword swings to a single impact timing event.
- Rebuilt the Mac DMG from the current GameMaker project state.

## Distribution Notes

This repo is being used as a lightweight build-sharing repo. For a larger release workflow, the cleaner GitHub pattern is to keep source code in the main project repo and attach DMG files to versioned GitHub Releases instead of committing every binary build into Git history.
