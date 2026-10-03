# Agent Audit Rules and Guidelines

After EVERY future coding task, any AI agent working on this codebase MUST perform the following steps:

1. Inspect `git status`
2. Inspect `git diff`
3. Run `flutter analyze`
4. Run relevant tests (`flutter test`)
5. Run an appropriate build when practical (`flutter build apk --debug`)
6. Update BOTH root `README.md` recovery snapshot AND root `AI_PROJECT_CONTEXT.md` (Snapshot Maintenance Rule)
7. Update `.project-audit/PROJECT_STATE.md`
8. Update `.project-audit/CURRENT_TASK.md`
9. Append to `.project-audit/CHANGELOG.md`
10. Update `.project-audit/BUILD_STATUS.md`
11. Update `.project-audit/ERRORS.md`
12. Update `.project-audit/FILE_INDEX.md` when needed
13. Update `.project-audit/NEXT_ACTIONS.md`
14. Create a timestamped session report under `.project-audit/sessions/`

> **CRITICAL RULE**: Never report a verification as PASS unless it was actually executed and verified.

---

## Recovery Discovery Order (Hierarchy)

Every new AI agent recovering project context must inspect sources in this precise order:

- **Level 0 — Universal Fallback**: `README.md` (guaranteed minimum recovery surface).
- **Level 1 — Root AI Context**: `AI_PROJECT_CONTEXT.md` (structured snapshot and handoff).
- **Level 2 — Agent Operating Rules**: `AGENTS.md` (audit guidelines and recovery rules).
- **Level 3 — Detailed Audit**: `.project-audit/` (architectural records, history, session reports).
- **Level 4 — Direct Verification**: Source code (`lib/`), `pubspec.yaml`, `pubspec.lock`, tests (`test/`), Git history (`git log`), GitHub Actions workflow & runs.

---

## Conflict Resolution & Source-of-Truth Rules

1. **Never silently choose between contradictory evidence.**
2. **Current Facts**: Newer direct repository evidence normally supersedes older snapshots.
3. **Declared Dependencies & SDK**: `pubspec.yaml` is the **authoritative source**.
4. **Resolved Package Versions**: `pubspec.lock` is the **authoritative source**.
5. **Git Commit Value**: Git repository (`git rev-parse HEAD`) overrides documented commit values.
6. **CI State**: Live GitHub Actions evidence overrides older recorded CI snapshots.
7. **Functional QA**: A successful CI workflow does **not** override `FUNCTIONAL_QA_STATUS: NOT_RUN` unless manual functional QA was actually executed.
8. **Architecture**: Actual source code (`lib/`) overrides stale architecture documentation when describing implementation.
9. **Historical Records**: Historical audit records (`.project-audit/CHANGELOG.md`, session reports) must not be rewritten; update current snapshot files instead.
10. **Reporting Contradictions**: When a contradiction is discovered, report: `DOCUMENTED_VALUE`, `VERIFIED_VALUE`, `AUTHORITATIVE_SOURCE`, `ACTION_TAKEN`.

---

## Fallback Behavior

- **If `.project-audit/` cannot be accessed** (e.g. environment dot-folder restriction):
  - Do not stop project recovery. Use root `README.md` and `AI_PROJECT_CONTEXT.md`.
  - Cross-check against accessible repository evidence (`lib/`, `test/`, `pubspec.yaml`, `pubspec.lock`).
  - Mark unavailable details as `NOT_VERIFIED` or `UNKNOWN`.
- **If Git history cannot be accessed**:
  - Continue using accessible context and source evidence.
  - Clearly mark commit-history claims as `NOT_VERIFIED`.
- **If GitHub Actions cannot be accessed**:
  - Use recorded CI snapshot from `README.md` / `AI_PROJECT_CONTEXT.md` and label it as `RECORDED` (not independently verified).
- **If source files cannot be accessed**:
  - Do not invent architecture details; distinguish `DOCUMENTED` from `VERIFIED`.

---

## Snapshot Maintenance Rule

After every future meaningful task, if project state changes, the agent must update **BOTH**:
1. `README.md` recovery snapshot
2. `AI_PROJECT_CONTEXT.md`

Relevant changes include task completion, new current task, module status, phase status, build/test status, CI state, functional QA state, blockers, architecture, stopping point, or next action. Do NOT rewrite unrelated human-facing README sections. Detailed history remains under `.project-audit/`.

---

## Final Task Report & Verification Rules

Future final task reports and session reports MUST strictly follow these principles:
- **Single Source of Verification**: Contain each verification result only once; never duplicate report sections or verification tables.
- **Distinguish Verification States**: Explicitly distinguish `NOT RUN` from `PASS` or `FAIL`. Do NOT mark an unexecuted verification step as `PASS`.
- **Separate Build from Test**: Maintain explicit distinction between compilation/build output (`BUILD_RESULT`: e.g. `flutter build apk` or Gradle sync) and test suite execution (`TEST_RESULT`: e.g. `flutter test`).
- **Separate Automated Verification from Manual Functional QA**: Clearly differentiate automated verification outputs (`ANALYZE_RESULT`, `TEST_RESULT`, `BUILD_RESULT`) from manual UI/device interactions (`FUNCTIONAL_QA_RESULT`).

---

## Session Report Template

Every session report saved in `.project-audit/sessions/` MUST contain the following fields:

- `TASK_ID`: Task identifier (e.g., WSF-001)
- `START_TIME`: ISO timestamp or readable start time
- `END_TIME`: ISO timestamp or readable end time
- `REQUESTED_WORK`: Description of requested prompt/feature
- `FILES_CREATED`: List of newly created files
- `FILES_MODIFIED`: List of modified files
- `FILES_DELETED`: List of deleted files
- `IMPLEMENTATION_SUMMARY`: Summary of technical implementation
- `GIT_DIFF_SUMMARY`: Concise summary of git diff
- `ANALYZE_RESULT`: `PASS` / `FAIL` / `NOT RUN` (with details)
- `TEST_RESULT`: `PASS` / `FAIL` / `NOT RUN` (with details)
- `BUILD_RESULT`: `PASS` / `FAIL` / `NOT RUN` (with details)
- `FUNCTIONAL_QA_RESULT`: `PASS` / `FAIL` / `NOT RUN` (manual verification details)
- `ERRORS_FOUND`: List of errors encountered during task
- `ERRORS_FIXED`: List of fixes applied
- `REMAINING_ISSUES`: List of open/unresolved issues
- `LAST_COMMIT`: Git commit hash / message
- `RECOMMENDED_NEXT_TASK`: Recommended next task or phase
