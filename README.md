# Delving David - HTML5 Build

HTML5 build of the current Delving David GameMaker prototype.

This branch contains the browser-based version. The Mac DMG build is on the `main` branch.

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

This repo is being used as a lightweight build-sharing repo. For a larger release workflow, the cleaner GitHub pattern is to keep source code in the main project repo and attach platform builds to versioned GitHub Releases instead of committing every binary build into Git history.
