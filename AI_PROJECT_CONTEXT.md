# AI Project Context

## Identity
- PROJECT_NAME: Website Sync Fetch
- PROJECT_ID: WSF
- REPOSITORY: https://github.com/shaazad007/WebsiteSyncFetch
- PRIMARY_BRANCH: main

## Application Purpose
Website Sync Fetch is a Flutter desktop and mobile application designed to fetch web pages, parse HTML metadata, and display structured SEO inspection results in a clean, scrollable tabular interface. Key extracted SEO attributes include Title, Meta Description, Canonical URL, Meta Robots, First H1, H1 Count, HTTP Status, and Fetch Status.

## Platform
Cross-platform Flutter (Android targeted, Desktop/Mobile compatible). Debug APK build verified.

## Technology Stack
- **Framework**: Flutter (Dart)
- **Dependencies**: `http` (^1.2.0), `html` (^0.15.4)
- **Testing**: `flutter_test`, widget testing, unit testing
- **Build System**: Gradle 8.10, Android Gradle Plugin 9.1.0, Kotlin 2.4.0

## Architecture
Clean architecture emphasizing separation of concerns:
- **Models**: `SeoResult` (`lib/models/seo_result.dart`) defines SEO data structure and factory methods for missing values.
- **Services**: `SeoFetchService` (`lib/services/seo_fetch_service.dart`) handles URL normalization, HTTP GET requests, status code checking, and DOM HTML parsing.
- **Controllers**: `SeoController` (`lib/controllers/seo_controller.dart`) manages app state (`ChangeNotifier`), input validation, syncing, row deletion, and application exit.
- **UI**: `MainScreen` (`lib/ui/main_screen.dart`) provides the user interface with URL input, Sync, OK, Close App buttons, and a responsive scrollable `DataTable`.

## Important Source Locations
- `lib/` - Application source code
- `test/` - Unit tests (`service_test.dart`, `controller_test.dart`) and widget tests (`widget_test.dart`)
- `android/` - Native Android project and Gradle build configuration
- `.github/workflows/flutter-ci.yml` - GitHub Actions CI verification pipeline
- `.project-audit/` - Detailed historical and architectural audit records (hidden/dot-folder)

## Module Status
TOTAL_MODULES: 1
COMPLETED_MODULES: 1
IN_PROGRESS_MODULES: 0
PENDING_MODULES: 0

- **Core / MVP Module**: COMPLETE (Evidence: Implemented, fully tested with 15 passing tests, and verified via static analysis and debug APK build).

## Phase Status
TOTAL_PHASES: 2
COMPLETED_PHASES: 1 (Implementation & testing complete; awaiting manual functional QA)
CURRENT_PHASE: Phase 1 - MVP Development (Transitioning to Phase 2 / UAT)
PENDING_PHASES: 1 (Phase 2 - Advanced Features: Offline persistence, CSV/JSON export)

- **Phase 1 - MVP Development**: COMPLETE (Core MVP built, tested, and CI integrated).
- **Phase 2 - Advanced Features**: NOT_STARTED (Planned persistence and export features).

## Current Development State
- CURRENT_TASK: WSF-006 - Upgrade project audit/handoff system for reliable cross-agent recovery
- LAST_COMPLETED_TASK: WSF-005 - Add independent GitHub CI verification and clean repository hygiene
- CURRENT_STATUS: COMPLETED
- DEVELOPMENT_STOPPING_POINT: WSF-006 implementation ready for commit and push.

## Verification Status
- FORMAT_STATUS: PASS
- ANALYZE_STATUS: PASS
- TEST_STATUS: PASS
- ANDROID_APK_BUILD_STATUS: PASS
- FUNCTIONAL_QA_STATUS: NOT_RUN (Requires live device/emulator UAT)
- GITHUB_CI_STATUS: PENDING / NOT VERIFIED (Recorded snapshot; live GitHub Actions execution overrides this snapshot if newer)

*Note on CI*: If live GitHub Actions evidence is newer than the recorded snapshot, **LIVE CI EVIDENCE OVERRIDES THE SNAPSHOT**.

## Git State
- LAST_VERIFIED_COMMIT_SHA: `fd420e0c09c04aae25b47408e8f2b836326151e8`
- LAST_VERIFIED_COMMIT_SHORT: `fd420e0`
- LAST_VERIFIED_COMMIT_MESSAGE: `ci: add Flutter verification workflow`

## Known Errors / Blockers
- None. All previous build and selector parsing issues have been resolved.

## Recent Development Activity
- **WSF-001**: Built MVP application logic, UI, and initialized project audit system.
- **WSF-002**: Fixed Android Studio Gradle root path sync error in `.idea/gradle.xml`.
- **WSF-003**: Initialized local Git repository, updated audit guidelines, and established baseline commit.
- **WSF-004**: Connected repository to GitHub (`https://github.com/shaazad007/WebsiteSyncFetch`) and published baseline.
- **WSF-005**: Added GitHub Actions CI workflow and cleaned repository hygiene (`git rm --cached` on `.dart_tool/` and `local.properties`).
- **WSF-006**: Upgraded cross-agent project recovery system with root `AI_PROJECT_CONTEXT.md`, actual commit SHA tracking, and fallback rules.

## Next Recommended Action
1. Push WSF-006 commit to GitHub.
2. Verify live GitHub Actions CI run results.
3. Perform User Acceptance Testing (UAT) on an Android device or emulator.

## Detailed Audit Locations
For agents with access to dot-prefixed directories, detailed records are available under:
- `.project-audit/AI_ENTRY_POINT.md`
- `.project-audit/PROJECT_STATE.md`
- `.project-audit/ARCHITECTURE.md`
- `.project-audit/MODULES.md`
- `.project-audit/PHASES.md`
- `.project-audit/BUILD_STATUS.md`
- `.project-audit/ERRORS.md`
- `.project-audit/DECISIONS.md`
- `.project-audit/NEXT_ACTIONS.md`
- `.project-audit/sessions/`

## Recovery Rules & Cross-Agent Fallback
New AI agents must follow this recovery hierarchy:
1. **Level 1**: Read root `AI_PROJECT_CONTEXT.md`.
2. **Level 2**: If accessible, read `.project-audit/` records.
3. **Level 3**: Cross-check claims against source code (`lib/`), `pubspec.yaml`, tests (`test/`), and git history (`git log`).
4. **Level 4**: Cross-check automated verification against GitHub Actions workflow (`.github/workflows/flutter-ci.yml`) and remote run status.

### Fallback Behavior:
- If `.project-audit/` cannot be accessed: Use `AI_PROJECT_CONTEXT.md`, cross-check against repository source files, and mark unavailable details `NOT_VERIFIED` or `UNKNOWN`.
- If Git history cannot be accessed: Use accessible source context and mark commit-history claims `NOT_VERIFIED`.
- If GitHub Actions cannot be accessed: Use recorded CI snapshot and label it `RECORDED`, not independently verified.
- If source files cannot be accessed: Do not invent architecture details; distinguish `DOCUMENTED` from `VERIFIED`.

## Context Metadata
- CONTEXT_SCHEMA_VERSION: 1.0
- CONTEXT_LAST_UPDATED: 2026-10-03
- CONTEXT_GENERATED_FROM_COMMIT: fd420e0c09c04aae25b47408e8f2b836326151e8
