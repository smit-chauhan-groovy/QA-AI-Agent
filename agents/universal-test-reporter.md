# Universal Test Reporter

> Works with Claude Code, Gemini CLI, Codex, Cursor, GitHub Copilot, or any AI CLI

## Purpose

Generates a comprehensive, structured QA report after testing is complete. Works with any AI CLI and produces consistent, readable reports.

## How to Invoke

Tell your AI assistant:
- "Generate a QA report"
- "Create a test report"
- "Summarize test results"
- "Run the test reporter"

## What This Creates

Creates a `.qa-reports/` directory with:
- `qa-report-YYYY-MM-DD.md` - Detailed markdown report
- `latest-report.md` - Symlink/copy to the most recent report

## Report Generation Instructions

### STEP 1: Collect Test Results

Gather information from:
1. Previous test runs in `.qa-reports/`
2. Any test output files
3. The `.qa-knowledge/` directory for context
4. Current git state (branch, recent commits)

### STEP 2: Determine Test Coverage

Check which tests were performed:
- UI Flow Tests
- API Endpoint Tests
- Database Integrity Tests
- Performance Tests
- Security Tests
- Accessibility Tests

### STEP 3: Generate the Report

Create a new file: `.qa-reports/qa-report-[YYYY-MM-DD].md`

Use the following template:

---

```markdown
# QA Test Report

**Generated:** [Current Date and Time]
**Project:** [Project Name from .qa-knowledge/project-overview.md]
**AI Assistant:** [Name of AI CLI used]
**Git Branch:** [Current git branch]
**Recent Commit:** [Most recent commit hash and message]

---

## Executive Summary

| Metric | Value |
|--------|-------|
| **Total Tests** | [Number] |
| **Passed** | [Number] |
| **Failed** | [Number] |
| **Skipped** | [Number] |
| **Pass Rate** | [Percentage]% |
| **Release Status** | [READY / BLOCKED] |

### Release Decision

**[RELEASE READY]** or **[RELEASE BLOCKED]**

[One sentence summary of release readiness]

---

## Test Results by Category

### UI Flow Tests

| Flow Name | Status | Details |
|-----------|--------|---------|
| [Flow 1] | [PASS/FAIL/SKIP] | [Brief note] |
| [Flow 2] | [PASS/FAIL/SKIP] | [Brief note] |

**Summary:** [X/Y passed]

### API Endpoint Tests

| Endpoint | Method | Status | Details |
|----------|--------|--------|---------|
| [/path] | [GET/POST/etc] | [PASS/FAIL/SKIP] | [Brief note] |
| [/path] | [GET/POST/etc] | [PASS/FAIL/SKIP] | [Brief note] |

**Summary:** [X/Y passed]

### Database Integrity Tests

| Check | Status | Details |
|-------|--------|---------|
| [Check name] | [PASS/FAIL/SKIP] | [Brief note] |
| [Check name] | [PASS/FAIL/SKIP] | [Brief note] |

**Summary:** [X/Y passed]

### Performance Tests

| Metric | Target | Actual | Status |
|--------|--------|--------|--------|
| [Response time] | [target] | [actual] | [PASS/FAIL] |
| [Throughput] | [target] | [actual] | [PASS/FAIL] |

**Summary:** [X/Y passed]

### Security Tests

| Check | Status | Details |
|-------|--------|---------|
| [Check name] | [PASS/FAIL/SKIP] | [Brief note] |
| [Check name] | [PASS/FAIL/SKIP] | [Brief note] |

**Summary:** [X/Y passed]

### Accessibility Tests

| Check | Status | Details |
|-------|--------|---------|
| [Check name] | [PASS/FAIL/SKIP] | [Brief note] |
| [Check name] | [PASS/FAIL/SKIP] | [Brief note] |

**Summary:** [X/Y passed]

---

## Issues Found

### Critical (P1) - Release Blockers

These issues must be fixed before release:

#### [Issue ID or Title]
- **Category:** [UI/API/Database/Security/Performance]
- **Location:** [File, component, or endpoint]
- **Description:** [What's wrong]
- **Impact:** [What this breaks]
- **Reproduction:** [How to reproduce]
- **Suggested Fix:** [How to fix it]

[Add more P1 issues as needed...]

### Important (P2) - Should Fix

These issues should be fixed soon but don't block release:

#### [Issue ID or Title]
- **Category:** [UI/API/Database/Security/Performance]
- **Location:** [File, component, or endpoint]
- **Description:** [What's wrong]
- **Impact:** [What this affects]
- **Suggested Fix:** [How to fix it]

[Add more P2 issues as needed...]

### Minor (P3) - Nice to Have

These are minor issues or suggestions:

[Add P3 issues as needed...]

---

## Recommendations

### Immediate Actions
1. [Action item 1 - what to fix first]
2. [Action item 2]

### Short-term Improvements
1. [Improvement suggestion 1]
2. [Improvement suggestion 2]

### Long-term Considerations
1. [Long-term suggestion 1]
2. [Long-term suggestion 2]

---

## Test Coverage Notes

- **What Was Tested:** [List of areas covered]
- **What Was Not Tested:** [List of areas not covered]
- **Testing Limitations:** [Any constraints or limitations]

---

## Knowledge Base Status

- **Knowledge Directory:** `.qa-knowledge/`
- **Last Updated:** [Date from .last-updated file]
- **Files Present:** [List of knowledge files]

**Recommendation:** [If knowledge is old, suggest refreshing it]

---

## Metadata

| Field | Value |
|-------|-------|
| **Report Version** | 1.0 |
| **Test Duration** | [Approximate time] |
| **Environment** | [Development/Staging/Production] |
| **AI CLI Used** | [Claude/Gemini/Codex/etc] |
| **Report Generated By** | [Universal Test Reporter v1.0] |

---

## Next Steps

1. Review all P1 (critical) issues
2. Fix critical issues
3. Re-run affected tests
4. Update this report or create a new one

---

*This report was generated by the Universal Test Reporter*
*For questions or issues, refer to the QA documentation*
```

---

## Report Summary for Console Output

After generating the markdown report, also display a brief summary:

```
╔═══════════════════════════════════════════════════════════════╗
║                        QA TEST REPORT                         ║
╠═══════════════════════════════════════════════════════════════╣
║  Date: [YYYY-MM-DD]                                           ║
║  Project: [Project Name]                                      ║
╠═══════════════════════════════════════════════════════════════╣
║  RELEASE STATUS: [✅ READY / ❌ BLOCKED]                       ║
║  ───────────────────────────────────────────────────────────  ║
║  Total Tests: [##]                                            ║
║  Passed: [##] | Failed: [##] | Skipped: [##]                  ║
║  Pass Rate: [##]%                                             ║
╠═══════════════════════════════════════════════════════════════╣
║  Issues:                                                       ║
║    P1 (Critical): [##]                                        ║
║    P2 (Important): [##]                                       ║
║    P3 (Minor): [##]                                           ║
╠═══════════════════════════════════════════════════════════════╣
║  📄 Full Report: .qa-reports/qa-report-[YYYY-MM-DD].md        ║
╚═══════════════════════════════════════════════════════════════╝
```

## Classification Guidelines

### P1 (Critical) - Release Blockers
- Any test failure in a critical user flow
- Security vulnerabilities
- Data loss or corruption
- API errors on happy path
- Performance issues (p95 > 2s)
- Critical accessibility issues

### P2 (Important) - Should Fix
- Edge case failures
- Non-critical security issues
- Performance degradation (p95 1s-2s)
- Moderate accessibility issues
- UI/UX problems

### P3 (Minor) - Nice to Have
- Code quality issues
- Minor documentation gaps
- Slight performance improvements
- Cosmetic issues

## After Report Generation

1. Save the report to `.qa-reports/qa-report-[YYYY-MM-DD].md`
2. Update `.qa-reports/latest-report.md` with the same content
3. Display the console summary
4. Note any recommendations for follow-up

## Report History

The `.qa-reports/` directory maintains a history of all test runs:
- Reports are dated for easy reference
- `latest-report.md` always points to the most recent
- Old reports can be compared to track progress

---

**Version:** 1.0
**Compatible:** All AI CLIs
**Last Updated:** 2025-01-24
