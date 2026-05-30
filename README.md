# Delving David - HTML5 Build

This branch contains the browser build of Delving David.

![Latest build screenshot](latest-build-screenshot.png)

## Launching

Do not open `index.html` directly from Finder/File Explorer. Browsers block some game assets when HTML5 builds are run from `file://`.

- macOS: double-click `run_local_server.command`
- Windows: double-click `Launch Delving David (Windows).cmd`
- Linux: run `./Launch Delving David (Linux).sh`

Each launcher starts a local web server and opens the game in your browser. Close the server window when you are done.

## Patch Notes - May 30, 2026

- Added a dynamic `F` interaction prompt for nearby NPCs.
- Tightened the global interact range so talking requires standing closer to NPCs.
- Reduced and cleaned up the top-right controls panel.
- Reworked debug menu spacing so rows and columns no longer overlap.
- Fixed the debug menu hotkey so only the physical backslash key opens it.
- Fixed fractional damage-number scaling and set damage numbers to the current 0.5 scale.
- Added an HTML-safe UI font fallback so the browser build loads reliably.
- Verified the HTML build in Chrome from a local web server and included the latest screenshot.
