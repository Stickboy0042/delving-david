# Delving David - HTML5 Build

HTML5 build of the current Delving David GameMaker prototype.

This branch contains the browser-based version. The Mac DMG build is on the `main` branch.

![Latest build screenshot](latest-build-screenshot.png)

## Download

[Download Delving_David_HTML5.zip](Delving_David_HTML5.zip)

Unzip the package first, then use the launcher for your platform.

## Launch Steps

### macOS

1. Unzip `Delving_David_HTML5.zip`.
2. Double-click `Launch Delving David.app`.
3. Your browser opens automatically.
4. Quit the launcher app to stop the local server.

macOS may show a security warning because this prototype launcher is ad-hoc signed and not notarized with Apple Developer ID. If needed, right-click the app and choose Open.

### Windows

1. Unzip `Delving_David_HTML5.zip`.
2. Double-click `Launch Delving David (Windows).cmd`.
3. Your browser opens automatically.
4. Close the command window to stop the local server.

Optional: run `Create Windows Desktop Shortcut.cmd` to create a desktop shortcut using the game favicon. Windows does not allow a plain `.cmd` file itself to have a custom icon.

### Linux

1. Unzip `Delving_David_HTML5.zip`.
2. Run `Launch Delving David (Linux).sh`.
3. Your browser opens automatically if `xdg-open` or `sensible-browser` is available.
4. Close the terminal window or press Control-C to stop the local server.

Optional: run `Install Linux Desktop Shortcut.sh` to create an icon-bearing desktop shortcut.

## Patch Notes - May 27, 2026

- Added jump movement on `Space`, with stamina cost and separate player/shadow rendering.
- Added the `Q` flurry ability and `E` ground stomp ability with cooldown icons near the player stats UI.
- Added a generated ground stomp shockwave animation, stomp impact sound, and stronger camera shake on landing.
- Made the player invulnerable while airborne during ground stomp.
- Refined player and enemy knockback easing so hits slide to a smoother stop.
- Cleaned up the in-game debug tools menu, including clearer toggle states and cooldown testing.
- Refreshed the HTML5 build from the latest GameMaker project state, including updated web audio assets.

## Distribution Notes

This repo is being used as a lightweight build-sharing repo. For a larger release workflow, the cleaner GitHub pattern is to keep source code in the main project repo and attach platform builds to versioned GitHub Releases instead of committing every binary build into Git history.
