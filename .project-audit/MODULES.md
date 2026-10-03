# Modules - Website Sync Fetch

## Core Modules

### 1. Data Model (`lib/models/`)
- `seo_result.dart`: Encapsulates extracted SEO metadata (Title, Meta Description, Canonical URL, Meta Robots, First H1, H1 Count, HTTP Status, Fetch Status) and factory methods for failure handling.

### 2. Networking & Parsing Service (`lib/services/`)
- `seo_fetch_service.dart`: Handles URL validation/normalization, HTTP GET requests with custom User-Agent headers, timeout handling, and case-insensitive HTML metadata extraction.

### 3. Controller State (`lib/controllers/`)
- `seo_controller.dart`: `ChangeNotifier` providing state management for result collection, active loading indicators, input error messages, row deletion, and OK/Close triggers.

### 4. UI Layer (`lib/ui/`)
- `main_screen.dart`: Single-screen Material 3 UI rendering input field, action buttons (`Sync`, `OK`, `Close App`), and a horizontally and vertically scrollable `DataTable`.
