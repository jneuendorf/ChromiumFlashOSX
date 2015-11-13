# ChromiumFlashOSX

Tool for integrating the PepperFlashPlayer into Chromium on Mac OS X.

## What you will need

1. Chromium installed in `/Applications`
2. PepperFlashPlayer
3. jq

## Usage

1. Just use the ChromiumFlash.app application if you've already got everything setup right.

2. Otherwise you can create the application by running `make`.

    This will create a `ChromiumFlash` Application in your current directory.

    Run `make force` to recreate the app if it already exists.

    If errors occur the script will tell you.


## Setup & Errors

Before the app is created the `check` script will be run. In case something is wrong the script stops the `make` process.

Possible errors are:

1. `jq` is not installed correctly
    - it must be in `/usr/local/bin/jq` and it must be executable
        - installing it with homebrew (`brew install jq`) does all the things right!
    - I could not get it to work when just using it from the `$PATH` (it seeems that from within the application the `$PATH` is different)
2. PepperFlashPlayer is not installed correctly
    - when using the installer from Adobe it will be put into `/Library/Internet Plug-Ins/PepperFlashPlayer`
    - if [get.adobe.com/flashplayer](https://get.adobe.com/flashplayer/download/?installer=FP_19_Mac_for_Opera_and_Chromium_-_PPAPI&os=OSX&browser_type=KHTML&browser_dist=Chrome) does not work make sure you choose Mac OS X as operating system and the Chrome distribution when downloading the flash player!
    - make sure the folder contains the `PepperFlashPlayer.plugin` and `manifest.json` files

If the checks are passed the application is built. It contains the `chromium-flash` as executable and that's it.
All the script does is to get the current version of the PepperFlashPlayer and starts Chromium with the correct command line arguments:

`--ppapi-flash-path="/Library/Internet Plug-Ins/PepperFlashPlayer/PepperFlashPlayer.plugin/`

`--ppapi-flash-version=<VERSION>`

In Chromium you should see the PepperFlashPlayer with the correct version under `chrome://plugins/`.

#### Have fun!
