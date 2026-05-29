# Delving David - HTML5 Build

This branch contains the browser build of Delving David.

![Latest build screenshot](latest-build-screenshot.png)

## Launching

Do not open `index.html` directly from Finder/File Explorer. Browsers block some game assets when HTML5 builds are run from `file://`.

- macOS: double-click `run_local_server.command`
- Windows: double-click `Launch Delving David (Windows).cmd`
- Linux: run `./Launch Delving David (Linux).sh`

Each launcher starts a local web server and opens the game in your browser. Close the server window when you are done.

## Patch Notes - May 28, 2026

- Stabilized player attack impact timing so damage, enemy red flash, hitstop, and attack SFX all fire from the same resolved hit frame.
- Locked attack sprite and hit-frame timing once per swing to prevent later hits from drifting.
- Tuned default combat feel: normal attack hit frame, normal hitstop, flurry hitstop, and ground stomp hitstop.
- Preserved the sustained flurry attack window while keeping normal sword swings to a single impact timing event.
- Rebuilt the HTML5 package and removed compiler cache files from the published artifact.
