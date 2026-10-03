# Errors & Resolutions - Website Sync Fetch

## Logged Issues & Fixes

### Issue 1: CSS Selector parsing exception in `package:html`
- **Error**: `FormatException: 'meta[name="description" i]' is not a valid selector`
- **Cause**: Dart's `package:html` query selector engine does not support the CSS4 case-insensitive modifier `i`.
- **Resolution**: Refactored `SeoFetchService` helper methods `_getMetaContent` and `_getCanonicalUrl` to iterate over elements and perform explicit case-insensitive property comparisons.

### Issue 2: Overflow on small screen width in results table header
- **Error**: `A RenderFlex overflowed by 55 pixels on the right`
- **Cause**: Header `Row` containing title and subtitle exceeded screen width on small viewports.
- **Resolution**: Wrapped header in a responsive `Wrap` widget with `WrapAlignment.spaceBetween`.

### Issue 3: AGP `AndroidLocationsException` during build
- **Error**: `com.android.prefs.AndroidLocationsException: Several environment variables... contain different paths...`
- **Cause**: Conflicts when both `ANDROID_PREFS_ROOT` and `ANDROID_USER_HOME` environment variables are present.
- **Resolution**: Unset `ANDROID_PREFS_ROOT` prior to invoking `flutter build apk --debug`.

### Issue 4: Android Studio Gradle Sync Failure on Root Directory
- **Error**: `Directory 'C:\my-apps\WebsiteSyncFetch' does not contain a Gradle build.`
- **Cause**: `.idea/gradle.xml` configured `externalProjectPath` as `$PROJECT_DIR$` instead of the Android subfolder `$PROJECT_DIR$/android`.
- **Resolution**: Updated `externalProjectPath` in `.idea/gradle.xml` to `$PROJECT_DIR$/android` and triggered Gradle sync.

### Issue 5: Tracked Generated Files in Repository Hygiene
- **Error**: `.dart_tool/` and `local.properties` tracked in Git repository.
- **Cause**: Initial commit tracked local/generated cache directories.
- **Resolution**: Removed `.dart_tool/` and `local.properties` from Git index using `git rm --cached` and ensured robust `.gitignore` patterns.

### Issue 6: Stale Duplicated Dependency Versions in Documentation
- **Error**: Hardcoded version constraints (`^1.2.0`, etc.) in documentation files becoming out of sync with manifests.
- **Cause**: Duplicate version documentation across files.
- **Resolution**: Implemented Dependency Source-of-Truth Rule designating `pubspec.yaml` as authoritative for declared dependencies and `pubspec.lock` for resolved versions.
