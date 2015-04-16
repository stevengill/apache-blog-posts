---
layout: post
author:
    name: Steve Gill
    url: https://twitter.com/stevesgill
title:  "Plugins Release and Moving plugins to NPM: April 15, 2015"
categories: announcement release
tags: plugins announcement releass
---

The **Apache Cordova** team is happy to announce a new plugins release that coincides with us moving our core plugins to **[npm](://www.npmjs.org/)**! We are also encouraging third party plugin developers to start publishing their plugins to npm! To start using plugins from **npm**, developers will have to update their **Cordova CLI** to version 5.0.0 or higher. 

With the move over to **npm**, we have decided to rename our core plugins for improved readability and to better fit within the npm ecosystem. All of our core plugins have changed their IDs from `org.apache.cordova.*` to `cordova-plugin-*`. Developers can now install a plugin with the command `cordova plugin add cordova-plugin-device`. Using the new ID will fetch the plugin directly from **npm**. 

Our current **Cordova plugins registry** (CPR), [plugins.cordova.io](http://plugins.cordova.io) will continue to be operational for at least 6 months (October 15th, 2015) as we help plugin developers with transitioning over to **npm**. This will also allow current **Cordova** developers to upgrade their `CLI` to version 5.0.0 or higher. We will be switching **CPR** to read-only on July 15th, 2015.

To find plugins on **npm**, search for [ecosystem:cordova](https://www.npmjs.com/search?q=ecosystem%3Acordova). We are working with **npm** to improve discoverability and will have more to announce later this year. We encourage all third party plugin developers to add `ecosystem:cordova` as a keyword in their plugin's `package.json`.

## Plugin Authors: Steps to move your plugin to **npm**
1. **Optional** Decide if you want to change your plugin's `id`. If you decide to change it, update the `id` in `plugin.xml` and update your readme with the new `id`. Next, send a pull request adding your new id and old id to [Cordova Registry Mapper](https://github.com/stevengill/cordova-registry-mapper). We integrate that module into the **Cordova CLI** to warn users to use the new `id` when adding plugins to their projects.

2. Add a `package.json` to your plugins using `plugman createpackagejson [PLUGIN DIRECTORY]`. This will create defaults based on existing values in your `plugin.xml`. It will also automatically add the keyword `ecosystem:cordova` to your newly generated `package.json` file. In addition, a **cordova** key will be added to your `package.json` which we plan to use in future updates of the tooling. View the `package.json` of [cordova-plugin-device](https://github.com/apache/cordova-plugin-device/blob/master/package.json) to see an example of what your `package.json` should look like after running `plugman createpackagejson [PLUGIN DIRECTORY] command. Plugins still require a `plugin.xml` to be installed into **Cordova** projects. **Note** To keep things simple, please make sure your `id` in `plugin.xml` is the same as your `package-name` in `package.json`. 

3. Publish your plugin to **npm** using the `npm publish [PLUGIN DIRECTORY]`

----
The following plugins were updated today:

cordova-plugin-battery-status@1.0.0
cordova-plugin-camera@1.0.0
cordova-plugin-console@1.0.0
cordova-plugin-contacts@1.0.0
cordova-plugin-device@1.0.0
cordova-plugin-device-motion@1.0.0
cordova-plugin-device-orientation@1.0.0
cordova-plugin-dialogs@1.0.0
cordova-plugin-file@2.0.0
cordova-plugin-file-transfer@1.0.0
cordova-plugin-geolocation@1.0.0
cordova-plugin-globalization@1.0.0
cordova-plugin-inappbrowser@1.0.0
cordova-plugin-legacy-whitelist@1.0.1
cordova-plugin-media@1.0.0
cordova-plugin-media-capture@1.0.0
cordova-plugin-network-information@1.0.0
cordova-plugin-splashscreen@2.0.0
cordova-plugin-statusbar@1.0.0
cordova-plugin-test-framework@1.0.0
cordova-plugin-vibration@1.0.0

----
To update your existing plugins, you need to update your version of `Cordova CLI` to version 5.0.0.

    E.g. To update your cli:
        
        `npm install -g cordova@5.0.0`

Then remove your old plugin and re-add it using the new ID.

    E.g. To update your camera plugin:

        `cordova plugin rm org.apache.cordova.camera`
        `cordova plugin add cordova-plugin-camera`

Plugin changes include:
<!--more-->

cordova-plugin-battery-status@1.0.0
* CB-8746 gave plugin major version bump
* CB-8808 Fixed tests to pass on **Windows Phone 8.1**
* CB-8831 Adds extra check for available `API` on **Windows**
* CB-8653 properly updated translated docs to use new id
* CB-8683 changed `plugin-id` to `package-name`
* CB-8653 updated translated docs to use new id
* Use `TRAVIS_BUILD_DIR`, install paramedic by **npm**
* add **Android**+**FireOS** warning to tell devs that prolonged use will drain the battery.
* CB-7971 Add `cordova-plugin-battery-status` support for **Windows Phone 8.1**
* CB-8659: `iOS`: 4.0.x Compatibility: Remove use of `initWithWebView` method
* added apache/travis badge - will not show until INFRA updates the github integration
* add `travis.yml` for CI with paramedic
* CB-8538 Added `package.json` file

cordova-plugin-camera@1.0.0
* CB-8780 - Display popover using main thread. Fixes popover slowness (closes #81)
* CB-8746 bumped version of file dependency
* CB-8746 gave plugin major version bump
* CB-8707 refactoring **Windows** code to improve readability
* CB-8706 use `filePicker` if `saveToPhotoAlbum` is true
* CB-8706 remove unnecessary capabilities from `xml`
* CB-8747 updated dependency, added peer dependency
* CB-8683 updated **Blackberry** specific references of `org.apache.cordova.camera` to `cordova-plugin-camera`
* CB-8782: Updated the docs to talk about the `allowEdit` quirks, it's not 100% working, but better than it was
* CB-8782: Fixed the flow so that we save the cropped image and use it, not the original non-cropped.  Crop only supports G+ Photos Crop, other crops may not work, depending on the OEM
* CB-8740: Removing `FileHelper` call that was failing on Samsung Galaxy S3, now that we have a real path, we only need to update the `MediaStore`, not pull from it in this case
* CB-8740: Partial fix for Save Image to Gallery error found in `MobileSpec`
* CB-8683 changed `plugin-id` to `package-name`
* CB-8653 updated translated docs to use new id
* CB-8351 Fix custom implementation of `integerValueForKey` (close #79)
* Fix `cordova-paramedic` path change, build with `TRAVIS_BUILD_DIR`, use **npm** to install paramedic
* docs: added **Windows** to supported platforms
* CB-8653 Updated Readme
* CB-8659: **iOS**: 4.0.x Compatibility: Remove use of deprecated headers

cordova-plugin-console@1.0.0
* CB-8746 gave plugin major version bump
* CB-8683 changed `plugin-id` to `package-name`
* CB-8653 updated translated docs to use new id
* Use `TRAVIS_BUILD_DIR`, install paramedic by **npm**
* docs: renamed **Windows8** to **Windows**
* CB-8560 Integrate `TravisCI`
* CB-8538 Added `package.json` file
* CB-8362 Add **Windows** platform section to Console plugin

cordova-plugin-contacts@1.0.0
* CB-8746 gave plugin major version bump
* CB-8683 updated **wp** specific references of old id to new id
* CB-8683 changed `plugin-id` to `package-name`
* CB-8653 updated translated docs to use new id
* Use `TRAVIS_BUILD_DIR`, install paramedic by **npm**
* CB-8659: **iOS**: 4.0.x Compatibility: Remove use of `initWebView` method
* CB-8659: **iOS**: 4.0.x Compatibility: Remove use of deprecated headers
* CB-8604 Pended unsupported test for **wp8**, updated documentation
* CB-8561 Integrate `TravisCI`
* CB-8538 Added `package.json` file
* CB-8395 marked unsupported tests pending on **wp8**

cordova-plugin-device@1.0.0
* CB-8746 gave plugin major version bump
* CB-8683 changed `plugin-id` to `package-name`
* CB-8653 updated translated docs to use new id
* Use `TRAVIS_BUILD_DIR`, install paramedic by **npm**
* remove defunct **windows8** version
* add travis badge
* Add cross-plugin ios paramedic test running for `TravisCI`
* CB-8538 Added `package.json` file

cordova-plugin-device-motion@1.0.0
* CB-8746 gave plugin major version bump
* CB-8683 updated **Windows** and **Tizen** specific references of old id to new id
* CB-8683 changed `plugin-id` to `package-name`
* CB-8653 updated translated docs to use new id
* Use `TRAVIS_BUILD_DIR`, install paramedic by **npm**
* CB-8312 Multiply accelerometer values by -g on **Windows**
* CB-8562 Integrate `TravisCI`
* CB-8538 Added `package.json` file
* CB-8096 Pended recently added spec.12 if accelerometer doesn't exist on the device
* CB-8096 Pended auto tests if accelerometer doesn't exist on the device
* CB-8083 Adds test to make sure success callback is called each time

cordova-plugin-device-orientation@1.0.0
* CB-8746 gave plugin major version bump
* CB-8683 updated **Windows** and **tizen** specific references of old id to new id
* CB-8683 changed `plugin-id` to `package-name`
* CB-8653 updated translated docs to use new id
* Use `TRAVIS_BUILD_DIR`, install paramedic by **npm**
* CB-8653 Updated Readme
* CB-8659: **iOS**: 4.0.x Compatibility: Remove use of `initWebView` method
* CB-8659: **iOS**: 4.0.x Compatibility: Remove use of deprecated headers
* force async callbacks
* Updated plugin to be **Windows** instead of **Windows8**
* CB-8614 Fixed `getCurrentHeading` and `watchHeading` on **Windows** platform
* CB-8563 Integrate `TravisCI`
* CB-8538 Added `package.json` file
* CB-8458 Fixes false failure of test, when compass hardware is not available

cordova-plugin-dialogs@1.0.0
* CB-8746 gave plugin major version bump
* CB-8683 updated wp and bb specific references of old id to new id
* CB-8683 changed `plugin-id` to `package-name`
* CB-8653 properly updated translated docs to use new id
* CB-8653 updated translated docs to use new id
* Use `TRAVIS_BUILD_DIR`, install paramedic by **npm**
* CB-8659: **iOS**: 4.0.x Compatibility: Remove use of deprecated headers
* CB-8565 Integrate `TravisCI`
* CB-8538 Added `package.json` file
* CB-8367 [org.apache.cordova.dialogs] Add Prompt support on **Windows**

cordova-plugin-file@2.0.0
* CB-8849 Fixed `ReadAsArrayBuffer` to return `ArrayBuffer` and not Array on **WP8**
* CB-8819 Fixed FileReader's `readAsBinaryString` on **wp8**
* CB-8746 gave plugin major version bump
* CB-8683 `Android`: Fix broken unit tests from plugin rename
* CB-8683 changed `plugin-id` to `package-name`
* CB-8653 updated translated docs to use new id
* Use `TRAVIS_BUILD_DIR`, install paramedic by **npm**
* docs: added **Windows** to supported platforms
* CB-8699 CB-6428 Fix uncompressed assets being copied as zero length files
* CB-6428 **Android**: Fix assets `FileEntry` having size of -1
* **Android**: Move `URLforFullPath` into base class (and rename to `localUrlforFullPath`)
* CB-6428 Mention `build-extras.gradle` in README
* CB-7109 **Android**: Parse arguments off of the main thread (close #97)
* CB-8695 **iOS**: Fix `blob.slice()` for `asset-library` URLs (close #105)
* Tweak build-extras.gradle to just read/write to main `assets/` instead of `build/`
* CB-8689 Fix `NPE` in `makeEntryForNativeUri` (was affecting file-transfer)
* CB-8675 Revert "CB-8351 ios: Use `base64EncodedStringWithOptions` instead of `CordovaLib's` class extension"
* CB-8659: **iOS**: 4.0.x Compatibility: Remove use of `initWebView` method
* Add a cache to speed up `AssetFilesystem` directory listings
* CB-8663 **Android**: Don't notify `MediaScanner` of private files
* Don't log stacktrace for normal exceptions (e.g. file not found)
* **Android**: Don't use LimitedInputStream when reading entire file (optimization)
* CB-6428 **Android**: Add support for directory copies from assets -> filesystem
* **Android**: Add `listChildren()`: Java-consumable version of `readEntriesAtLocalURL()`
* CB-6428 **Android**: Add support for `file:///android_asset` URLs
* CB-8642 **Android**: Fix content URIs not working with resolve / copy
* Tweak tests to fail if `deleteEntry` fails (rather than time out)
* **Android**: Ensure `LocalFilesystemURL` can only be created with `cdvfile` URLs
* **Android**: Move `CordovaResourceApi` into Filesystem base class
* **Android**: Use `CordovaResourceApi.mapUriToFile()` rather than own custom logic in `ContentFilesystem`
* **Android**: Use Uri.parse rather than manual parsing in resolveLocalFileSystemURI
* **Android**: Delete invalid `JavaDoc` (lint errors)
* **Android**: Use `CordovaResourceAp`i rather than `FileHelper`
* CB-8032 - File Plugin - Add `nativeURL` external method support for `CDVFileSystem->makeEntryForPath:isDirectory:` (closes #96)
* CB-8567 Integrate `TravisCI`
* CB-8538 Added `package.json` file
* CB-7956 Add `cordova-plugin-file` support for **Browser** platform
* CB-8423 Corrected usage of `done()` in async tests
* CB-8459 Fixes spec 111 failure due to incorrect relative paths handling
* Added `nativeURL` property to `FileEntry`, implemented `readAsArrayBuffer` and `readAsBinaryString`

cordova-plugin-file-transfer@1.0.0
* CB-8746 bumped version of file dependency
* CB-8746 gave plugin major version bump
* CB-8641 Fixed tests to pass on **Windows** and **wp8**
* CB-8583 Forces download to overwrite existing target file
* CB-8589 Fixes upload failure when server's response doesn't contain any data
* CB-8747 updated dependency, added peer dependency
* CB-8683 changed `plugin-id` to `package-name`
* CB-8653 updated translated docs to use new id
* Use `TRAVIS_BUILD_DIR`, install paramedic by **npm**
* CB-8654 Note **WP8** download requests caching in docs
* CB-8590 **Windows** Fixed `download.onprogress.lengthComputable`
* CB-8566 Integrate `TravisCI`
* CB-8538 Added `package.json` file
* CB-8495 Fixed **wp8** and **wp8.1** test failures
* CB-7957 Adds support for `browser` platform
* CB-8407 Use File proxy to construct valid FileEntry for download success callback
* CB-8407 Removes excess path to native path conversion in download method
* CB-8429 Updated version and `RELEASENOTES.md for release 0.5.0
* CB-7957 Adds support for **Browser** platform
* CB-8095 Fixes JSHint and formatting issues
* CB-8095 Updates tests and documentation
* CB-8095 Rewrite upload method to support progress events properly
* **Android**: Fix error reporting for unknown `uri` type on `sourceUri` instead of `targetUri`

cordova-plugin-geolocation@1.0.0
* CB-8746 gave plugin major version bump
* CB-8683 changed `plugin-id` to `package-name`
* CB-8653 updated translated docs to use new id
* Use `TRAVIS_BUILD_DIR`, install paramedic by **npm**
* CB-8681 Fixed occasional test failures
* docs: added **Windows** to supported platforms
* CB-8659: **iOS**: 4.0.x Compatibility: Remove use of `initWebView` method
* CB-8659: **iOS**: 4.0.x Compatibility: Remove use of deprecated headers
* Wrong parameter in **Firefox OS** plugin
* CB-8568 Integrate `TravisCI`
* CB-8538 Added `package.json` file
* CB-8443 Geolocation tests fail on **Windows** due to done is called multiple times

cordova-plugin-globalization@1.0.0
* CB-8746 gave plugin major version bump
* CB-8683 updated **tizen** and **Browser** specific references of old id to new id
* CB-8683 changed `plugin-id` to `package-name`
* CB-8653 updated translated docs to use new id
* Use `TRAVIS_BUILD_DIR`, install paramedic by **npm**
* separate section in `plugin.xml` and docs for **Windows8** platform
* CB-7960 Add `cordova-plugin-globalization` support for **Browser** platform
* CB-8659: **iOS**: 4.0.x Compatibility: Remove use of `initWebView` method
* CB-8569 Integrate `TravisCI`
* CB-8538 Added `package.json` file
* CB-8394 pended unsupported tests for **Windows** and **wp8**

cordova-plugin-inappbrowser@1.0.0
* CB-8746 gave plugin major version bump
* CB-7689 Adds `insertCSS` support for **Windows** platform
* CB-4930 - (prefix) InAppBrowser should take into account the status bar
* CB-8635 Improves UX on **Windows** platform
* CB-8661 Return executed script result on **Windows**
* CB-8683 updated **WP** and **Browser** specific references of old id to new id
* CB-8683 changed `plugin-id` to `package-name`
* CB-8653 updated translated docs to use new id
* Use `TRAVIS_BUILD_DIR`, install paramedic by **npm**
* CB-8432 Correct styles for **Browser** wrapper to display it correctly on some pages
* CB-8659 - Update `InAppBrowser` to support both **cordova-ios** 4.0.x and 3.x (closes #93)
* CB-7961 Add `cordova-plugin-inappbrowser` support for **Browser** platform
* Update docs for **Android** `zoom=no` option
* Added option to disable/enable zoom controls
* updated docs, set `hardwareback` default to true
* Add a `hardwareback` option to allow for the hardware back button to go back.
* CB-8570 Integrate `TravisCI`
* CB-8538 Added `package.json` file
* Keep external **Android** pages in a single tab. (close #61)
* CB-8444 Add a clobber for `cordova.InAppBrowser.open` (close #80)
* CB-8444 Don't clobber `window.open` - Add new symbol/clobber to access open function (`cordova.InAppBrowser.open`) - Change existing tests to use new symbol (i.e. don't rely on plugin clobber of `window.open`) - Add tests to use `window.open` via manual replace with new symbol - Update docs to deprecate plugin clobber of `window.open`

cordova-plugin-media@1.0.0
* CB-8793 Fixed tests to pass on **wp8** and **Windows**
* CB-8746 bumped version of file dependency
* CB-8746 gave plugin major version bump
* CB-8779 Fixed media status reporting on **wp8**
* CB-8747 updated dependency, added peer dependency
* CB-8683 changed `plugin-id` to `package-name`
* CB-8653 updated translated docs to use new id
* CB-8541 Adds information about available recording formats on **Windows**
* Use `TRAVIS_BUILD_DIR`, install paramedic by **npm**
* CB-8686 - remove `musicLibrary` capability
* CB-7962 Adds **Browser** platform support
* CB-8659: **iOS**: 4.0.x Compatibility: Remove use of deprecated headers
* CB-8572 Integrate `TravisCI`
* CB-8538 Added `package.json` file
* CB-8428 Fix tests on **Windows** if no audio playback hardware is available
* CB-8428 Fix multiple `done()` calls in media plugin test on devices where audio is not configured
* CB-8426 Add **Windows** platform section to Media plugin
* CB-8425 Media plugin `.ctr`: make src param required as per spec

cordova-plugin-media-capture@1.0.0
* CB-8746 bumped version of file dependency
* CB-8746 gave plugin major version bump
* CB-8747 updated dependency, added peer dependency
* CB-8683 changed `plugin-id` to `package-name`
* CB-8653 updated translated docs to use new id
* Use `TRAVIS_BUILD_DIR`, install paramedic by **npm**
* CB-8687 consolidate manifest targets
* CB-7963 Adds support for **Browser** platform
* CB-8659: **iOS**: 4.0.x Compatibility: Remove use of `initWebView` method
* CB-8571 Integrate `TravisCI`
* CB-8538 Added `package.json` file

cordova-plugin-network-information@1.0.0
* CB-8746 gave plugin major version bump
* CB-8683 changed `plugin-id` to `package-name`
* CB-8653 updated translated docs to use new id
* CB-8185 Fixes typo in `cordova.platformId`
* Use `TRAVIS_BUILD_DIR`, install paramedic by **npm**
* CB-8185 Use `navigator.onLine` as connection information source on **Browser** platform
* CB-8659: **iOS**: 4.0.x Compatibility: Remove use of `initWebView` method
* CB-8573 Integrate `TravisCI`
* CB-8538 Added `package.json` file

cordova-plugin-splashscreen@2.0.0
* CB-8746 gave plugin major version bump
* CB-8797 - Splashscreen preferences `FadeSplashScreenDuration` and `FadeSplashScreen` (**iOS**) are missing
* CB-8836 - Crashes after animating `splashscreen`
* CB-8753 **Android**: Fix missing import in previous commit
* CB-8753 **Android**: Adds `SplashMaintainAspectRatio` preference (close #43)
* CB-8683 changed `plugin-id` to `package-name`
* CB-8653 properly updated translated docs to use new id
* CB-8653 updated translated docs to use new id
* CB-8345 Make default for splashscreen resource `screen` (which is what template and **CLI** assume it to be)
* Use `TRAVIS_BUILD_DIR`, install paramedic by **npm**
* docs: added **Windows** to supported platforms
* CB-7964 Add `cordova-plugin-splashscreen` support for **browser** platform
* Extend **WP8** Splash Screen to respect `SplashScreen` and `SplashScreenDelay` preferences from config file
* CB-8574 Integrate `TravisCI`
* CB-8538 Added `package.json` file
* CB-8397 Add support to **Windows** for showing the **Windows Phone** splashscreen

cordova-plugin-statusbar@1.0.0
* CB-8746 gave plugin major version bump
* CB-8683 changed `plugin-id` to `package-name`
* CB-8653 updated translated docs to use new id
* Use `TRAVIS_BUILD_DIR`, install paramedic by **npm**
* - Use `StatusBarBackgroundColor` instead of `AndroidStatusBarBackgroundColor`, and added a quirk to the readme.
* - Add support for `StatusBar.backgroundColorByHexString` (and `StatusBar.backgroundColorByName`) on **Android 5** and up
* Allow setting the `statusbar backgroundcolor` on **Android**
* CB-8575 Integrate `TravisCI`
* CB-8538 Added `package.json` file

cordova-plugin-test-framework@1.0.0
* CB-8746 gave plugin major version bump
* CB-8683 changed `plugin-id` to `package-name`
* CB-8528 Add a shim for `jasmine.Expectation.addMatchers` being moved in **jasmine 2.2.0**
* CB-8528 Update test framework plugin to use **Jasmine 2.2.0** (close #11)
* CB-8538 Added `package.json` file
* CB-8385 Ensure `plugin-test-framework` trigger tests only once

cordova-plugin-vibration@1.0.0
* CB-8746 gave plugin major version bump
* CB-8683 changed `plugin-id` to `package-name`
* CB-8653 properly updated translated docs to use new id
* CB-7970 Reference proxy project instead of compiled `winmd`
* CB-7970 Add `cordova-plugin-vibration` support for **Windows Phone 8.1**
* CB-8576 Integrate `TravisCI`
* CB-8538 Added `package.json` file