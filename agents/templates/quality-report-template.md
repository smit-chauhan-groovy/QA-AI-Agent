# Quality Report — {{APP_NAME}}
**Date:** {{YYYY-MM-DD HH:MM}} UTC
**Environment:** {{ENVIRONMENT}}
**Branch:** {{GIT_BRANCH}}
**Commit:** {{GIT_COMMIT_SHORT}}

---

## Release Decision

| Status | Verdict |
|--------|---------|
| {{VERDICT_ICON}} {{VERDICT_TEXT}} | {{VERDICT_DETAIL}} |

---

## Executive Summary

| Metric | Value |
|--------|-------|
| Total Tests Run | {{TOTAL_TESTS}} |
| Passed | {{TOTAL_PASSED}} |
| Failed | {{TOTAL_FAILED}} |
| Pass Rate | {{PASS_RATE}}% |
| P1 Issues (Blocking) | {{P1_COUNT}} |
| P2 Issues (Advisory) | {{P2_COUNT}} |

---

## Layer-by-Layer Status

| Layer | Status | Tests Run | Passed | Failed | Notes |
|-------|--------|-----------|--------|--------|-------|
| UI Flows | {{UI_STATUS}} | {{UI_TESTS}} | {{UI_PASSED}} | {{UI_FAILED}} | {{UI_NOTES}} |
| API Contract | {{API_STATUS}} | {{API_TESTS}} | {{API_PASSED}} | {{API_FAILED}} | {{API_NOTES}} |
| DB Integrity | {{DB_STATUS}} | {{DB_TESTS}} | {{DB_PASSED}} | {{DB_FAILED}} | {{DB_NOTES}} |
| Performance | {{PERF_STATUS}} | {{PERF_TESTS}} | {{PERF_PASSED}} | {{PERF_FAILED}} | {{PERF_NOTES}} |
| Accessibility | {{A11Y_STATUS}} | {{A11Y_TESTS}} | {{A11Y_PASSED}} | {{A11Y_FAILED}} | {{A11Y_NOTES}} |
| Security | {{SEC_STATUS}} | {{SEC_TESTS}} | {{SEC_PASSED}} | {{SEC_FAILED}} | {{SEC_NOTES}} |

---

## P1 Issues — Release Blockers

> ⚠️ **Must be resolved before release. No exceptions.**

{{# EACH P1_ISSUE }}
### [{{ID}}] {{TITLE}}

- **Layer:** {{LAYER}}
- **Severity:** Critical
- **Found In:** {{LOCATION}}
- **Description:** {{DESCRIPTION}}
- **Evidence:** `{{EVIDENCE}}`
- **Fix Guidance:** {{FIX_GUIDANCE}}

{{/ END_EACH }}

{{# IF_NO_P1 }}
✅ No P1 issues detected. All release-blocking tests passed.
{{/ END_IF }}

---

## P2 Issues — Advisory

> 📋 **Should be fixed in the next sprint. Does not block this release.**

{{# EACH P2_ISSUE }}
### [{{ID}}] {{TITLE}}

- **Layer:** {{LAYER}}
- **Severity:** {{SEVERITY}}
- **Description:** {{DESCRIPTION}}
- **Recommendation:** {{RECOMMENDATION}}

{{/ END_EACH }}

{{# IF_NO_P2 }}
✅ No P2 issues detected.
{{/ END_IF }}

---

## Performance Metrics

{{# IF_PERF_TESTS_RUN }}

| Endpoint / Test | p50 | p95 | p99 | Error Rate | Status |
|-----------------|-----|-----|-----|------------|--------|
{{# EACH_ENDPOINT }}
| {{NAME}} | {{P50}} | {{P95}} | {{P99}} | {{ERROR_RATE}} | {{STATUS}} |
{{/ END_EACH }}

### Performance Analysis

{{PERF_ANALYSIS}}

{{/ END_IF }}

{{# IF_NO_PERF }}
Performance tests were not run.
{{/ END_IF }}

---

## Accessibility Summary

{{# IF_A11Y_TESTS_RUN }}

| Route / Page | Violations | Critical | Serious | Moderate | Status |
|--------------|------------|----------|---------|----------|--------|
{{# EACH_PAGE }}
| {{PATH}} | {{TOTAL}} | {{CRITICAL}} | {{SERIOUS}} | {{MODERATE}} | {{STATUS}} |
{{/ END_EACH }}

### WCAG 2.1 AA Compliance

- **Critical Violations:** {{A11Y_CRITICAL}} (must be 0 for AA compliance)
- **Serious Violations:** {{A11Y_SERIOUS}}
- **Overall Status:** {{A11Y_OVERALL_STATUS}}

{{/ END_IF }}

{{# IF_NO_A11Y }}
Accessibility tests were not run.
{{/ END_IF }}

---

## Security Findings

{{# IF_SEC_TESTS_RUN }}

| Check | Status | Notes |
|-------|--------|-------|
| Secrets in code (gitleaks) | {{SECRETS_STATUS}} | {{SECRETS_NOTES}} |
| Dependency CVEs | {{DEPS_STATUS}} | {{DEPS_NOTES}} |
| Security headers | {{HEADERS_STATUS}} | {{HEADERS_NOTES}} |
| SQL injection probes | {{SQLI_STATUS}} | {{SQLI_NOTES}} |
| XSS payload sanitisation | {{XSS_STATUS}} | {{XSS_NOTES}} |
| IDOR check | {{IDOR_STATUS}} | {{IDOR_NOTES}} |

{{/ END_IF }}

{{# IF_NO_SEC }}
Security tests were not run.
{{/ END_IF }}

---

## Test Coverage Details

```
┌─────────────────────────────────────────────────────────────────┐
│                        TEST COVERAGE                            │
├─────────────────────────────────────────────────────────────────┤
│ UI Flows:       {{UI_TESTS:3}} tests │ {{UI_PASSED:3}} passed │ {{UI_FAILED:2}} failed │ {{UI_PCT:6}}% │
│ API Contract:   {{API_TESTS:3}} tests │ {{API_PASSED:3}} passed │ {{API_FAILED:2}} failed │ {{API_PCT:6}}% │
│ DB Integrity:   {{DB_TESTS:3}} tests │ {{DB_PASSED:3}} passed │ {{DB_FAILED:2}} failed │ {{DB_PCT:6}}% │
│ Performance:    {{PERF_TESTS:3}} tests │ {{PERF_PASSED:3}} passed │ {{PERF_FAILED:2}} failed │ {{PERF_PCT:6}}% │
│ Accessibility:  {{A11Y_TESTS:3}} tests │ {{A11Y_PASSED:3}} passed │ {{A11Y_FAILED:2}} failed │ {{A11Y_PCT:6}}% │
│ Security:       {{SEC_TESTS:3}} tests │ {{SEC_PASSED:3}} passed │ {{SEC_FAILED:2}} failed │ {{SEC_PCT:6}}% │
├─────────────────────────────────────────────────────────────────┤
│ TOTAL:          {{TOTAL_TESTS:3}}       │ {{TOTAL_PASSED:3}} pass  │ {{TOTAL_FAILED:2}} fail  │ {{TOTAL_PCT:6}}% │
└─────────────────────────────────────────────────────────────────┘
```

---

## Artifacts

| File | Description |
|------|-------------|
| `playwright-report/index.html` | UI test HTML report (open in browser) |
| `results.json` | Raw Playwright test results |
| `api-results.json` | API contract test results |
| `db-results.json` | Database integrity check results |
| `perf-results.json` | k6 performance test output |
| `a11y-results.json` | axe-core accessibility scan results |
| `security-report.json` | gitleaks and security scan results |
| `summary.json` | Machine-readable summary for CI/CD |

---

## Recommendations

### Immediate Actions (P1)

{{# IF_P1_ISSUES }}
{{# EACH_P1_RECOMMENDATION }}
1. **{{TITLE}}** — {{ACTION}}
{{/ END_EACH }}
{{/ END_IF }}

{{# IF_NO_P1 }}
No immediate actions required. All P1 gates passed.
{{/ END_IF }}

### Next Sprint (P2)

{{# IF_P2_ISSUES }}
{{# EACH_P2_RECOMMENDATION }}
1. **{{TITLE}}** — {{ACTION}}
{{/ END_EACH }}
{{/ END_IF }}

{{# IF_NO_P2 }}
No advisory issues. Great work!
{{/ END_IF }}

---

## Metadata

| Field | Value |
|-------|-------|
| Report Generated | {{REPORT_TIMESTAMP}} |
| Test Duration | {{TEST_DURATION}} |
| Test Environment | {{TEST_ENV}} |
| OS / Platform | {{OS_PLATFORM}} |
| Agent Version | {{AGENT_VERSION}} |

---

*This report was automatically generated by the E2E Test Reporter Agent.*
*For questions about these results, consult the individual agent reports linked in Artifacts.*
