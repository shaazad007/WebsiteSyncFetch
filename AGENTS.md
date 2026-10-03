# Agent Audit Rules and Guidelines

After EVERY future coding task, any AI agent working on this codebase MUST perform the following steps:

1. Inspect `git status`
2. Inspect `git diff`
3. Run `flutter analyze`
4. Run relevant tests (`flutter test`)
5. Run an appropriate build when practical (`flutter build apk --debug`)
6. Update root `AI_PROJECT_CONTEXT.md` (when applicable per Context Maintenance Rule)
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

## Cross-Agent Recovery Hierarchy (Mandatory)

Every new AI agent recovering project context must inspect sources in this precise order:

- **Level 1**: Read root `AI_PROJECT_CONTEXT.md` (universal public AI handoff file).
- **Level 2**: If accessible, read `.project-audit/` files (`AI_ENTRY_POINT.md`, `PROJECT_STATE.md`, `ARCHITECTURE.md`, `MODULES.md`, `PHASES.md`, `CURRENT_TASK.md`, `BUILD_STATUS.md`, `ERRORS.md`, `DECISIONS.md`, `NEXT_ACTIONS.md`).
- **Level 3**: Cross-check claims against repository source code (`lib/`), `pubspec.yaml`, tests (`test/`), and git history (`git log`).
- **Level 4**: Cross-check automated verification against GitHub Actions workflow (`.github/workflows/flutter-ci.yml`) and remote GitHub Actions run status.

### Evidence Priority
When resolving conflicting claims about current state, prioritize newer direct evidence:
1. Current source/repository evidence
2. Git commit/history evidence
3. Live GitHub Actions evidence for CI/build/test claims (Live CI evidence overrides snapshots)
4. Root `AI_PROJECT_CONTEXT.md`
5. Detailed `.project-audit/` records
6. Historical session reports

---

## Fallback Behavior

- **If `.project-audit/` cannot be accessed** (e.g. environment dot-folder restriction):
  - Do not stop project recovery. Use root `AI_PROJECT_CONTEXT.md`.
  - Cross-check against accessible repository evidence (`lib/`, `test/`, `pubspec.yaml`).
  - Mark unavailable details as `NOT_VERIFIED` or `UNKNOWN`.
- **If Git history cannot be accessed**:
  - Continue using accessible context and source evidence.
  - Clearly mark commit-history claims as `NOT_VERIFIED`.
- **If GitHub Actions cannot be accessed**:
  - Use recorded CI snapshot from `AI_PROJECT_CONTEXT.md` / `.project-audit/BUILD_STATUS.md` and label it as `RECORDED` (not independently verified).
- **If source files cannot be accessed**:
  - Do not invent architecture details; distinguish `DOCUMENTED` from `VERIFIED`.

---

## Context Maintenance Rule

After every future development task, the agent must update root `AI_PROJECT_CONTEXT.md` if the task changes any of:
- current task
- module status
- phase status
- architecture
- source locations
- errors/blockers
- verification status
- development stopping point
- next action

Root `AI_PROJECT_CONTEXT.md` must remain concise enough for a new AI to read quickly. Detailed historical records belong under `.project-audit/`.

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
