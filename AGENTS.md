# Agent Audit Rules and Guidelines

After EVERY future coding task, any AI agent working on this codebase MUST perform the following steps:

1. Inspect `git status`
2. Inspect `git diff`
3. Run `flutter analyze`
4. Run relevant tests (`flutter test`)
5. Run an appropriate build when practical (`flutter build apk --debug`)
6. Update `.project-audit/PROJECT_STATE.md`
7. Update `.project-audit/CURRENT_TASK.md`
8. Append to `.project-audit/CHANGELOG.md`
9. Update `.project-audit/BUILD_STATUS.md`
10. Update `.project-audit/ERRORS.md`
11. Update `.project-audit/FILE_INDEX.md` when needed
12. Update `.project-audit/NEXT_ACTIONS.md`
13. Create a timestamped session report under `.project-audit/sessions/`

> **CRITICAL RULE**: Never report a verification as PASS unless it was actually executed and verified.

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
- `ANALYZE_RESULT`: `PASS` / `FAIL` (with details)
- `TEST_RESULT`: `PASS` / `FAIL` (with details)
- `BUILD_RESULT`: `PASS` / `FAIL` (with details)
- `FUNCTIONAL_QA_RESULT`: `PASS` / `FAIL` (with details)
- `ERRORS_FOUND`: List of errors encountered during task
- `ERRORS_FIXED`: List of fixes applied
- `REMAINING_ISSUES`: List of open/unresolved issues
- `LAST_COMMIT`: Git commit hash / message
- `RECOMMENDED_NEXT_TASK`: Recommended next task or phase
