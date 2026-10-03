# Architectural & Design Decisions - Website Sync Fetch

## Decision Record

### DEC-001: In-Memory State Management with `ChangeNotifier`
- **Context**: Need lightweight state management for MVP without unnecessary boilerplate or external DB dependencies.
- **Decision**: Use Flutter's native `ChangeNotifier` (`SeoController`) to hold `List<SeoResult>`.
- **Status**: Approved & Implemented.

### DEC-002: Service Layer HTTP & HTML Parsing
- **Context**: Need reliable web fetching and HTML extraction with custom header support and timeout handling.
- **Decision**: Use `package:http` with 15-second timeouts and custom User-Agent, coupled with `package:html` for DOM tree traversal.
- **Status**: Approved & Implemented.

### DEC-003: UI Scrollable Data Table
- **Context**: SEO results table contains 11 columns which cannot fit natively on narrow mobile screens.
- **Decision**: Wrap Material `DataTable` inside dual `SingleChildScrollView` widgets (horizontal and vertical directions).
- **Status**: Approved & Implemented.

### DEC-004: Root-Level AI Project Context (`AI_PROJECT_CONTEXT.md`) for Cross-Agent Recovery
- **Context**: Some AI environments or browser agents cannot access dot-prefixed folders like `.project-audit/`, leading to context loss for new agents.
- **Decision**: Introduce a public root-level `AI_PROJECT_CONTEXT.md` file adhering to a structured handoff schema, backed by explicit recovery hierarchy and fallback rules in `AGENTS.md`.
- **Status**: Approved & Implemented.

### DEC-005: Universal README Recovery Capsule (`README.md`) & Source-of-Truth Governance
- **Context**: Recovery can fail if dot folders (`.project-audit/`) or root AI context files (`AI_PROJECT_CONTEXT.md`) are missed or inaccessible. Hardcoded version numbers in documentation also risk becoming stale.
- **Decision**: Embed a guaranteed minimum recovery capsule and agent instructions at Level 0 in `README.md`, enforce `pubspec.yaml`/`pubspec.lock` as the single source of truth for dependencies, and establish 10 Conflict Resolution Rules.
- **Status**: Approved & Implemented.
