# Delving David

Mac build of the current Delving David GameMaker prototype.

![Latest build screenshot](latest-build-screenshot.png)

## Download

[Download Delving David.dmg](Delving%20David.dmg)

Open the DMG, then drag `Delving David.app` into Applications.

macOS may show a security warning because this prototype build is ad-hoc signed and not notarized with Apple Developer ID. If needed, right-click the app and choose Open.

## Patch Notes - May 26, 2026

- Added a sprint attack blade-flurry visual so the stronger attack has a clearer cone-shaped effect.
- Matched the sprint attack hitbox timing to the flurry/dash window so enemies can be hit during the dash.
- Made sprint attacks cost more stamina and grant brief temporary invincibility.
- Increased sprint attack usability by widening the attack area while reducing overgenerous origin coverage.
- Updated idle and walking attacks so the player turns toward the mouse click before attacking.
- Kept sprint attacks locked to the current movement/facing direction.
- Improved slime AI threat behavior with longer detection range, faster chase movement, faster chase hopping, and better obstacle steering around buildings.
- Restored the previous retro-bedroom splash art.

## Distribution Notes

This repo is being used as a lightweight build-sharing repo. For a larger release workflow, the cleaner GitHub pattern is to keep source code in the main project repo and attach DMG files to versioned GitHub Releases instead of committing every binary build into Git history.
