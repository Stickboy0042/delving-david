# Delving David

Mac build of the current Delving David GameMaker prototype.

![Latest build screenshot](latest-build-screenshot.png)

## Download

[Download Delving David.dmg](Delving%20David.dmg)

Open the DMG, then drag `Delving David.app` into Applications.

macOS may show a security warning because this prototype build is ad-hoc signed and not notarized with Apple Developer ID. If needed, right-click the app and choose Open.

## Patch Notes - May 27, 2026

- Replaced the placed village buildings and tents with five generated fantasy house assets.
- Added two generated vendor stall props to the town layout.
- Registered the generated houses as GameMaker sprite/object resources under the Buildings organization.
- Kept the new buildings on the existing collision/depth/fade behavior path.
- Refreshed the Mac build from the latest GameMaker project state and cleaned stray Finder metadata from the organized build folders.

## Distribution Notes

This repo is being used as a lightweight build-sharing repo. For a larger release workflow, the cleaner GitHub pattern is to keep source code in the main project repo and attach DMG files to versioned GitHub Releases instead of committing every binary build into Git history.
