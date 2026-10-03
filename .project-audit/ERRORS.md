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
