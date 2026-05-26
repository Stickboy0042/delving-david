# Delving David

Mac build of the current Delving David GameMaker prototype.

![Latest build screenshot](latest-build-screenshot.png)

## Download

[Download Delving David.dmg](Delving%20David.dmg)

Open the DMG, then drag `Delving David.app` into Applications.

macOS may show a security warning because this prototype build is ad-hoc signed and not notarized with Apple Developer ID. If needed, right-click the app and choose Open.

## Patch Notes - May 26, 2026

- Added generated sound effects for footsteps, sword swings, slime hops, sprint blade flurry attacks, and backsteps.
- Added proximity-based slime hop audio so off-screen enemies stay quiet and nearby slimes get louder.
- Added loopable field music with a tunable `music_volume` control.
- Kept SFX controls volume-only for now; pitch controls were removed because GameMaker pitch changes playback speed.
- Updated the HTML build so music starts after first player input, matching browser autoplay requirements.

## Distribution Notes

This repo is being used as a lightweight build-sharing repo. For a larger release workflow, the cleaner GitHub pattern is to keep source code in the main project repo and attach DMG files to versioned GitHub Releases instead of committing every binary build into Git history.
