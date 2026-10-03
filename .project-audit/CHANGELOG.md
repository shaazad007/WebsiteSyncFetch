# Changelog - Website Sync Fetch

All notable changes to this project will be documented in this file.

## [1.0.6] - 2026-10-03 - Task WSF-007
### Added
- Added universal `README.md` recovery capsule and AI agent instructions (Level 0 fallback) so projects can be recovered even when dot-prefixed folders or root AI contexts are missed.
- Established authoritative dependency source-of-truth rules (`pubspec.yaml` for declared dependencies/constraints, `pubspec.lock` for resolved versions) and removed hardcoded stale dependency version numbers from documentation.
- Added comprehensive Source-of-Truth Matrix and 10 Conflict Resolution Rules to `AI_PROJECT_CONTEXT.md` and `AGENTS.md`.
- Updated recovery hierarchy to Level 0 (README) through Level 4 (Direct Verification) and instituted Snapshot Maintenance Rule for future tasks.

## [1.0.5] - 2026-10-03 - Task WSF-006
### Added
- Created root-level `AI_PROJECT_CONTEXT.md` as a universal public AI handoff file to support cross-agent recovery even when dot-prefixed folders (`.project-audit/`) cannot be accessed.
- Updated `AGENTS.md` with explicit 4-level recovery hierarchy, evidence priority rules, and fallback behavior for restricted environments.
### Changed
- Replaced ambiguous commit references with actual git commit evidence (`fd420e0c09c04aae25b47408e8f2b836326151e8`).
- Established CI synchronization guidelines specifying live GitHub Actions evidence overrides recorded snapshots.

## [1.0.4] - 2026-10-03 - Task WSF-004
### Added
- Created GitHub Actions CI workflow (`.github/workflows/flutter-ci.yml`) for automated dependency installation, formatting check, static analysis, unit/widget testing, and debug APK build.
### Changed
- Performed repository hygiene audit: removed generated `.dart_tool/` directories and local configuration `local.properties` from Git tracking using `git rm --cached`.

## [1.0.3] - 2026-10-03 - Task WSF-004
### Added
- Connected local repository to GitHub (`https://github.com/shaazad007/WebsiteSyncFetch`).
- Configured `origin` remote and pushed complete audited project baseline and audit logs to `origin/main`.

## [1.0.2] - 2026-10-03 - Task WSF-003
### Changed
- Refined `.gitignore` to properly exclude Flutter/Dart build outputs and local configuration files.
- Updated `AGENTS.md` with enhanced audit guidelines for single-source verification, distinguishing NOT RUN from PASS, and separating build/test/manual QA.
- Established local Git repository baseline commit `chore: establish Website Sync Fetch audited baseline`.

## [1.0.1] - 2026-10-03 - Task WSF-002
### Fixed
- Fixed Android Studio Gradle project sync error by updating `externalProjectPath` in `.idea/gradle.xml` from `$PROJECT_DIR$` to `$PROJECT_DIR$/android`.
- Verified successful Gradle sync and clean Dart/Flutter test and static analysis execution.

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
