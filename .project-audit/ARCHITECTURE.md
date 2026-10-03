# Architecture - Website Sync Fetch

## Overview
The project follows a decoupled, testable Flutter architecture separating UI, controller state, network/parsing services, and data models.

```
lib/
├── models/
│   └── seo_result.dart         # Data model representing SEO metrics & fetch status
├── services/
│   └── seo_fetch_service.dart   # URL normalization, HTTP client, and HTML DOM parsing
├── controllers/
│   └── seo_controller.dart     # ChangeNotifier managing state, input validation, row list
├── ui/
│   └── main_screen.dart        # Single-screen UI with input, actions, and DataTable
└── main.dart                   # Application entry point & theme configuration
```

## Data Flow
1. **User Action**: User enters URL and presses `Sync`.
2. **Controller**: `SeoController.syncUrl` validates the string format.
3. **Service**: `SeoFetchService.fetchSeoData` normalizes the URL (`https://...`), issues `http.get`, and parses the HTML DOM with `package:html`.
4. **Model Creation**: `SeoResult` object is instantiated with extracted metadata or failure information.
5. **State Update**: `SeoController` appends `SeoResult` to `results` list and notifies UI listeners.
6. **UI Render**: `MainScreen` updates `DataTable` to display the newly appended row.
