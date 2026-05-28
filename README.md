# Delving David

Mac build of the current Delving David GameMaker prototype.

![Latest build screenshot](latest-build-screenshot.png)

## Download

[Download Delving David.dmg](Delving%20David.dmg)

Open the DMG, then drag `Delving David.app` into Applications.

macOS may show a security warning because this prototype build is ad-hoc signed and not notarized with Apple Developer ID. If needed, right-click the app and choose Open.

## Patch Notes - May 27, 2026

- Added jump movement on `Space`, with stamina cost and separate player/shadow rendering.
- Added the `Q` flurry ability and `E` ground stomp ability with cooldown icons near the player stats UI.
- Added a generated ground stomp shockwave animation, stomp impact sound, and stronger camera shake on landing.
- Made the player invulnerable while airborne during ground stomp.
- Refined player and enemy knockback easing so hits slide to a smoother stop.
- Cleaned up the in-game debug tools menu, including clearer toggle states and cooldown testing.
- Rebuilt the player stats HUD with swappable portrait art, separate health/stamina/mana bars, and scalable ability icon layout.
- Added red and blue loot drops from defeated slimes, with top-down pop, bounce, slide, idle float, and eased pickup motion.
- Added top-left loot counters and a debug option to kill all enemies and force loot drops.
- Added a one-second pickup delay after loot drops so rewards remain visible before being collected.
- Fixed the upward idle animation disappearing by stretching the valid up-facing idle frames.
- Rebuilt the Mac DMG from the latest GameMaker project state.

## Distribution Notes

This repo is being used as a lightweight build-sharing repo. For a larger release workflow, the cleaner GitHub pattern is to keep source code in the main project repo and attach DMG files to versioned GitHub Releases instead of committing every binary build into Git history.
