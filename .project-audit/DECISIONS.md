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
