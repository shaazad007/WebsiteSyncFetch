# AI Entry Point - Website Sync Fetch

Welcome to **Website Sync Fetch**! This document serves as the primary entry point for any AI agent joining this codebase with zero prior chat history.

---

## 1. Application Purpose & Overview
**Website Sync Fetch** is an Android mobile application built with Flutter that allows users to enter website URLs, fetch webpage contents over HTTP, parse HTML SEO metadata (Title, Meta Description, Canonical URL, Meta Robots, First H1, H1 Count, HTTP Status, Fetch Status), and display the extracted information in an interactive, multi-row table.

Key Features:
- URL input validation and automatic scheme prepending (`https://`).
- Synchronous/asynchronous fetching of HTML SEO data.
- Appending new fetch results as cumulative rows in an in-memory table.
- Row-level delete action without affecting other rows.
- Reset/OK action to clear input field without purging table data.
- Exit/Close App functionality via `SystemNavigator.pop()`.

---

## 2. Technology Stack
- **Framework**: Flutter 3.47.5 / Dart 3.13.4
- **Platform**: Android
- **Packages**:
  - `http` (^1.6.0) for HTTP GET web requests
  - `html` (^0.15.7) for DOM parsing
  - `flutter_test` for unit & widget test suites

---

## 3. Architecture & Code Structure
The codebase follows a clean separation of concerns:
- **`lib/models/seo_result.dart`**: Data model representing extracted SEO metadata and fetch errors.
- **`lib/services/seo_fetch_service.dart`**: Web service handling URL normalization, HTTP GET requests, and HTML parsing.
- **`lib/controllers/seo_controller.dart`**: `ChangeNotifier` state controller managing result list, loading state, error messages, row deletion, and OK/Close triggers.
- **`lib/ui/main_screen.dart`**: Single-screen UI rendering input field, action buttons, and scrollable SEO results table.
- **`lib/main.dart`**: App entry point.

---

## 4. Audit & Project System Documentation
For detailed information, refer to the following audit documents:

- [PROJECT_OVERVIEW.md](PROJECT_OVERVIEW.md)
- [PROJECT_STATE.md](PROJECT_STATE.md)
- [ARCHITECTURE.md](ARCHITECTURE.md)
- [MODULES.md](MODULES.md)
- [PHASES.md](PHASES.md)
- [CURRENT_TASK.md](CURRENT_TASK.md)
- [CHANGELOG.md](CHANGELOG.md)
- [BUILD_STATUS.md](BUILD_STATUS.md)
- [ERRORS.md](ERRORS.md)
- [DECISIONS.md](DECISIONS.md)
- [FILE_INDEX.md](FILE_INDEX.md)
- [NEXT_ACTIONS.md](NEXT_ACTIONS.md)
- [AGENTS.md](../AGENTS.md)

---

## 5. Current State Summary
- **Current Phase**: Phase 1 - MVP Development
- **Current Task**: `WSF-001` - Build Website Sync Fetch MVP + initialize project audit system
- **Completed Work**: Full MVP implementation (URL validation, HTTP fetching, HTML parsing, multi-row table, row deletion, OK reset button, Close App, unit tests, widget tests, audit system).
- **Pending Work**: None for MVP; future enhancements may include persistent storage, export to CSV, or advanced SEO checks.
- **Current Blockers**: None
- **Build Status**: `PASS` (`flutter build apk --debug`)
- **Test Status**: `PASS` (`flutter test` - 15/15 tests passing)
- **Analyze Status**: `PASS` (`flutter analyze` - 0 issues found)
- **Last Verified Git Commit**: `4cfe380` ("WSF-001: Build Website Sync Fetch MVP and initialize app logic")
- **Stopping Point**: MVP completed and verified.
- **Recommended Next Task**: Perform manual functional testing or add optional features like export functionality or offline persistence.
