# Changelog - Website Sync Fetch

All notable changes to this project will be documented in this file.

## [1.0.0] - 2026-10-03 - Task WSF-001
### Added
- Initialized Flutter Android project with `http` and `html` dependencies.
- Added `<uses-permission android:name="android.permission.INTERNET"/>` to `AndroidManifest.xml`.
- Created `SeoResult` model (`lib/models/seo_result.dart`).
- Created `SeoFetchService` (`lib/services/seo_fetch_service.dart`) with URL normalization, HTTP fetching, and HTML metadata extraction.
- Created `SeoController` (`lib/controllers/seo_controller.dart`) for managing state, validation, sync, deletion, and app exit.
- Created `MainScreen` (`lib/ui/main_screen.dart`) featuring URL input field, `Sync`, `OK`, `Close App` buttons, and a scrollable `DataTable`.
- Created unit tests (`test/service_test.dart`, `test/controller_test.dart`) and widget tests (`test/widget_test.dart`).
- Created complete project audit system under `.project-audit/` and root `AGENTS.md`.
