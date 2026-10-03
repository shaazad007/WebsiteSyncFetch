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

## Technology Stack & Dependencies
- **Framework**: Flutter (Dart)
- **Core Packages**: HTTP networking and HTML DOM parsing packages (`http`, `html`).
- **Testing**: `flutter_test`, widget testing, unit testing.
- **Build System**: Gradle 8.10, Android Gradle Plugin 9.1.0, Kotlin 2.4.0.
- **Dependency Source-of-Truth Rules**:
  - Declared dependencies, package constraints, and SDK versions: **Authoritative Source is `pubspec.yaml`**.
  - Resolved dependency versions: **Authoritative Source is `pubspec.lock`**.

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
- CURRENT_TASK: WSF-007 - Add universal README recovery capsule and eliminate stale duplicated project context
- LAST_COMPLETED_TASK: WSF-006 - Upgrade project audit/handoff system for reliable cross-agent recovery
- CURRENT_STATUS: COMPLETED
- DEVELOPMENT_STOPPING_POINT: WSF-007 implementation ready for commit and push.

## Verification Status
- FORMAT_STATUS: PASS
- ANALYZE_STATUS: PASS
- TEST_STATUS: PASS
- ANDROID_APK_BUILD_STATUS: PASS
- FUNCTIONAL_QA_STATUS: NOT_RUN (Requires live device/emulator UAT)
- LATEST_KNOWN_GITHUB_CI_STATUS: PENDING / NOT VERIFIED (Recorded snapshot; live GitHub Actions execution overrides this snapshot if newer)

*Note on CI*: If live GitHub Actions evidence is newer than the recorded snapshot, **LIVE CI EVIDENCE OVERRIDES THE SNAPSHOT**.

## Git State
- CONTEXT_BASE_COMMIT: `127a2ee269baf8c4ae392980818102cf4f551e1e` (short: `127a2ee`)
- LATEST_PROJECT_COMMIT: `127a2ee269baf8c4ae392980818102cf4f551e1e` (short: `127a2ee`)
- LAST_VERIFIED_COMMIT_MESSAGE: `docs: add cross-agent project recovery context`

## Known Errors / Blockers
- None. All previous build and selector parsing issues have been resolved.

## Recent Development Activity
- **WSF-001**: Built MVP application logic, UI, and initialized project audit system.
- **WSF-002**: Fixed Android Studio Gradle root path sync error in `.idea/gradle.xml`.
- **WSF-003**: Initialized local Git repository, updated audit guidelines, and established baseline commit.
- **WSF-004**: Connected repository to GitHub (`https://github.com/shaazad007/WebsiteSyncFetch`) and published baseline.
- **WSF-005**: Added GitHub Actions CI workflow and cleaned repository hygiene (`git rm --cached` on `.dart_tool/` and `local.properties`).
- **WSF-006**: Upgraded cross-agent project recovery system with root `AI_PROJECT_CONTEXT.md`, actual commit SHA tracking, and fallback rules.
- **WSF-007**: Added universal README recovery capsule and source-of-truth governance.

## Next Recommended Action
1. Push WSF-007 commit to GitHub.
2. Verify live GitHub Actions CI run results.
3. Perform User Acceptance Testing (UAT) on an Android device or emulator.

## Source-of-Truth Matrix
| Domain / Fact Type | Primary Authoritative Source | Detailed Documentation |
|---|---|---|
| **Project Purpose / Scope** | `README.md` + verified source behavior | `.project-audit/PROJECT_OVERVIEW.md` |
| **Current Project Snapshot** | `README.md` recovery snapshot & `AI_PROJECT_CONTEXT.md` | `.project-audit/PROJECT_STATE.md` |
| **Application Architecture** | Actual source tree (`lib/`) | `.project-audit/ARCHITECTURE.md` |
| **Declared Dependencies / SDK** | `pubspec.yaml` | `pubspec.yaml` |
| **Resolved Dependencies** | `pubspec.lock` | `pubspec.lock` |
| **Current Git Commit** | Git repository (`git rev-parse HEAD`) | Git history (`git log`) |
| **CI Result** | Live GitHub Actions workflow execution | GitHub Actions tab |
| **Static Analysis** | Latest actual `flutter analyze` execution | `.project-audit/BUILD_STATUS.md` |
| **Automated Tests** | Latest actual `flutter test` execution | `.project-audit/BUILD_STATUS.md` |
| **Android Build** | Latest actual `flutter build apk` execution | `.project-audit/BUILD_STATUS.md` |
| **Functional QA** | Documented manual/integration QA evidence | Session reports |
| **Module / Phase Status** | Current repo evidence + `AI_PROJECT_CONTEXT.md` | `.project-audit/MODULES.md`, `PHASES.md` |
| **Historical Tasks** | `.project-audit/CHANGELOG.md` | `.project-audit/sessions/` |

## Conflict Resolution Rules
1. Never silently choose between contradictory evidence.
2. For current facts, newer direct repository evidence normally supersedes older snapshots.
3. `pubspec.yaml` overrides documentation for declared dependency versions and SDK constraints.
4. `pubspec.lock` overrides documentation for resolved package versions.
5. Git repository evidence overrides a documented commit value.
6. Live GitHub Actions evidence overrides an older recorded CI snapshot.
7. A successful CI workflow does **not** override `FUNCTIONAL_QA_STATUS: NOT_RUN` unless functional QA was actually part of that workflow.
8. Source code overrides stale architecture documentation when describing what is actually implemented.
9. Historical audit records must not be rewritten merely because the current state changed; update current snapshot files instead.
10. When a contradiction is discovered, report: `DOCUMENTED_VALUE`, `VERIFIED_VALUE`, `AUTHORITATIVE_SOURCE`, `ACTION_TAKEN`.

## Recovery Discovery Order (AGENTS.md Hierarchy)
- **Level 0 (Universal Fallback)**: `README.md`
- **Level 1 (Root AI Context)**: `AI_PROJECT_CONTEXT.md`
- **Level 2 (Agent Operating Rules)**: `AGENTS.md`
- **Level 3 (Detailed Audit)**: `.project-audit/`
- **Level 4 (Direct Verification)**: Source code (`lib/`), `pubspec.yaml`, `pubspec.lock`, tests (`test/`), Git history, GitHub Actions.

### Fallback Behavior:
- If `.project-audit/` cannot be accessed: Use `README.md` and `AI_PROJECT_CONTEXT.md`, cross-check against repository source files, and mark unavailable details `NOT_VERIFIED` or `UNKNOWN`.
- If Git history cannot be accessed: Use accessible source context and mark commit-history claims `NOT_VERIFIED`.
- If GitHub Actions cannot be accessed: Use recorded CI snapshot and label it `RECORDED`, not independently verified.
- If source files cannot be accessed: Do not invent architecture details; distinguish `DOCUMENTED` from `VERIFIED`.

## Context Metadata
- CONTEXT_SCHEMA_VERSION: 1.0
- CONTEXT_LAST_UPDATED: 2026-10-03
- CONTEXT_GENERATED_FROM_COMMIT: 127a2ee269baf8c4ae392980818102cf4f551e1e
