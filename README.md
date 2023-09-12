# FakeStore 2 PlayStore

This is a Magisk module that replaces FakeStore with the [patched Play Store by Nanolx](https://nanolx.org/fdroid/repo/Phonesky_132.apk) and is mainly intended to be used with 
LineageOS for microG, which already ships with microG and FakeStore. I only tested it on LineageOS 18.1 for microG. Use at your own risk, if you are on a different ROM.

The module uses fixed permissions settings from nift4's [microG Installer Revived](https://github.com/nift4/microg_installer_revived). Additionally it adds the Nanolx's [NanoDroid companion F-Droid repository](https://nanolx.org/fdroid/repo/) to F-Droid for automatic updates of the patched Play Store.

## Why you want to use it

You want to have **License Verification and In-App-Purchases with microG** and already have a system with microG + FakeStore (like LineageOS for microG)

## Installation

- Install [LineageOS for microG](https://lineage.microg.org/)
- Install [Magisk](https://github.com/topjohnwu/Magisk/)
- Install the module through the Magisk Manager App

**Important:** Do NOT flash in TWRP, you need to use the Magisk app and have an active internet connection for downloading the patched PlayStore.

**Note:** If you decide to install this module at a later stage and you have already added your Google account to microG, it may be necessary to remove your account from the system first and sign in again after the installation.


## NanoDroid or microG Installer Revived already do the job, don't they?

Yes and no. After several tries with combinations of LineageOS 18.1, Lineage OS 18.1 for microG, NanoDroid and microG Installer Revived, I always ended up with either an unbootable system
or with configurations that don't survive OTA upates or that would render microG upgrades useless or install too much.

- NanoDroid's patcher (currently?) isn't able to successfully patch signature spoofing into LOS 18.1 and I didn't want to fiddle around with deodexing. My intention was to have a ready-to-use solution for LineageOS that survives OTAs. So I had to use LOS for microG, which already 
has the signature spoofing patch. However installing the patched PlayStore in LOS 18.1 for microG using NanoDroid always resulted in an unbootable system - even when disabling every other feature in .nanodroid-setup and hiding FakeStore with .nanodroid-overlay.
- Though microG Installer Revived does a better job (the system was bootable after installing the patched PlayStore :), it isn't able to hide FakeStore on it's own. So I had to still hide FakeStore somehow. Additionally microG Installer Revived installs DroidGuard as a system app, which is not what I wanted.
Furthermore, it overwrites GmsCore with it's own version and therefor any OTA updates by LineageOS for microG would've been overwritten by the Installer's version.

That said, it's possible to use NanoDroid's .nanodroid-overlay feature to hide FakeStore in combination with microG Installer Revived to install the patched PlayStore and live with the DroidGuard and OTA issues. But I decided to make a Magisk module that does no more than replacing FakeStore with a patched
version of PlayStore. Here it is.

## Build

### Linux, BSD, macOS, Android

Requires wget.

    wget -O META-INF/com/google/android/update-binary https://raw.githubusercontent.com/topjohnwu/Magisk/master/scripts/module_installer.sh && zip fakestore2playstore.zip -9r *

### Other

Download [this](https://raw.githubusercontent.com/topjohnwu/Magisk/master/scripts/module_installer.sh) and put it into `META-INF/com/google/android/update-binary`. And ZIP it.

## Credits

- **Nanolx** for the PlayStore patch.
- **nift4** for microG Installer Revived
