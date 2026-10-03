# File Index - Website Sync Fetch

## Project Directory Tree

```
WebsiteSyncFetch/
├── AI_PROJECT_CONTEXT.md                # Universal public root-level AI handoff file
├── AGENTS.md                            # Rules, recovery hierarchy, and instructions for AI agents
├── pubspec.yaml                         # Flutter dependencies and assets config
├── .github/
│   └── workflows/
│       └── flutter-ci.yml               # GitHub Actions CI verification workflow
├── android/
│   └── app/src/main/
│       └── AndroidManifest.xml          # Main manifest with INTERNET permission
├── lib/
│   ├── main.dart                        # App entry point and theme config
│   ├── models/
│   │   └── seo_result.dart              # SEO data class & failure factory
│   ├── services/
│   │   └── seo_fetch_service.dart        # URL normalization, HTTP client, DOM parser
│   ├── controllers/
│   │   └── seo_controller.dart          # ChangeNotifier managing state & actions
│   └── ui/
│       └── main_screen.dart             # Main screen UI with input, buttons, DataTable
├── test/
│   ├── service_test.dart                # Unit tests for URL normalization & HTML parsing
│   ├── controller_test.dart             # Unit tests for controller logic & actions
│   └── widget_test.dart                 # Widget tests for UI interactions
└── .project-audit/
    ├── AI_ENTRY_POINT.md                # Central entry point for AI agents
    ├── PROJECT_OVERVIEW.md              # High-level overview & goals
    ├── PROJECT_STATE.md                 # Key-value state summary
    ├── ARCHITECTURE.md                  # Architecture & data flow diagrams
    ├── MODULES.md                       # Detailed list of project modules
    ├── PHASES.md                        # Phase breakdown & roadmap
    ├── CURRENT_TASK.md                  # Details of task WSF-006
    ├── CHANGELOG.md                     # Revision history
    ├── BUILD_STATUS.md                  # Build matrix & verification status
    ├── ERRORS.md                        # Error log & resolution guide
    ├── DECISIONS.md                     # Architectural decision record (includes DEC-004)
    ├── FILE_INDEX.md                    # Project file index
    ├── NEXT_ACTIONS.md                  # Recommended future tasks
    └── sessions/
        ├── 2026-10-03_WSF-001_session_report.md
        ├── 2026-10-03_WSF-002_session_report.md
        ├── 2026-10-03_WSF-003_session_report.md
        ├── 2026-10-03_WSF-004_session_report.md
        ├── 2026-10-03_WSF-005_session_report.md
        └── 2026-10-03_WSF-006_session_report.md
```
