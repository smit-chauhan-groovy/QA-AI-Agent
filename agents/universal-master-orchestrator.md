# Universal QA Master Orchestrator - ACTION MODE

> AI MUST FOLLOW THESE STEPS IN ORDER

---

## STEP 1 - IMMEDIATE ACTION: Check for Knowledge

**YOU MUST DO THIS NOW:**

1. Check if directory `.qa-knowledge` exists
2. If NO → Go to STEP 2
3. If YES → Check file `.qa-knowledge/.last-updated`
   - If date is older than 7 days → Go to STEP 2
   - If recent → Go to STEP 3

**DO NOT PROCEED TO STEP 3 until knowledge is verified or created.**

---

## STEP 2 - CREATE KNOWLEDGE BASE (if needed)

**YOU MUST CREATE THESE FILES:**

### File 1: Create `.qa-knowledge/project-overview.md`

**READ these files to gather info:**
- `README.md` (if exists)
- `package.json` (if exists)
- `requirements.txt` or `pyproject.toml` (if exists)

**THEN WRITE this file:**

```markdown
# Project Overview

**Project Name:** [Extract from README or directory name]

## Tech Stack
**Frontend:** [React/Vue/Next.js/etc from package.json]
**Backend:** [Express/FastAPI/Django/etc from dependencies]
**Database:** [PostgreSQL/MySQL/MongoDB/etc from dependencies]

## Key Files
- `package.json` - [list main purpose]
- `README.md` - [list main purpose]

## Project Structure
[List the main directories: src/, app/, public/, etc.]

## How to Run
[Extract from package.json scripts or README]
```

### File 2: Create `.qa-knowledge/critical-flows.md`

**FIND these files:**
```
find . -name "*login*" -o -name "*auth*" -o -name "*register*" 2>/dev/null | head -5
find . -name "*route*" -o -name "*page*" 2>/dev/null | head -10
```

**THEN WRITE this file:**

```markdown
# Critical User Flows

## Authentication

### Login
**Page/File:** [Path to login component or /login URL]
**API Endpoint:** [POST /api/auth/login or similar]

**Steps:**
1. Navigate to login page
2. Enter email and password
3. Click submit
4. Verify authentication

### Registration
**Page/File:** [Path to register component or /register URL]
**API Endpoint:** [POST /api/auth/register or similar]

**Steps:**
1. Navigate to registration page
2. Enter user details
3. Submit form
4. Verify account created

## Main Flows

### [Main Feature 1]
**Description:** [What this flow does]

### [Main Feature 2]
**Description:** [What this flow does]
```

### File 3: Create `.qa-knowledge/api-endpoints.md`

**FIND API files:**
```
find . -path "*/api/*" -name "*.ts" -o -name "*.js" 2>/dev/null | head -10
find . -name "*controller*" -o -name "*route*" 2>/dev/null | head -10
```

**READ these files and extract endpoints**

**THEN WRITE:**

```markdown
# API Endpoints

## Base URL
[http://localhost:8000 or similar]

## Authentication Endpoints

### POST /api/auth/login
**Description:** Login user

### POST /api/auth/register
**Description:** Register new user

### POST /api/auth/logout
**Description:** Logout user

## Other Endpoints

[List all discovered endpoints]
```

### File 4: Create `.qa-knowledge/database-schema.md`

**FIND schema files:**
```
find . -name "schema.prisma" -o -name "models.py" -o -name "*.entity.ts" 2>/dev/null
```

**READ and extract models**

**THEN WRITE:**

```markdown
# Database Schema

## Database Type
[PostgreSQL/MySQL/MongoDB/etc]

## Models/Tables

### User
- id (primary key)
- email (unique)
- password (hashed)
- createdAt

### [Other models]
[List fields]
```

### File 5: Create `.qa-knowledge/testing-config.md`

```markdown
# Testing Configuration

## Test Users

### Standard User
Email: test@example.com
Password: TestPass123!

### Admin User
Email: admin@example.com
Password: AdminPass123!

## Test URLs
Frontend: http://localhost:3000
API: http://localhost:8000
```

### File 6: Create `.qa-knowledge/.last-updated`

```
2025-01-24
```

**CONFIRMATION:** After creating all files, say "✅ Knowledge base created at .qa-knowledge/"

---

## STEP 3 - LOAD KNOWLEDGE

**YOU MUST NOW:**

1. Read `.qa-knowledge/project-overview.md`
2. Read `.qa-knowledge/critical-flows.md`
3. Read `.qa-knowledge/api-endpoints.md`

**SAY THIS:** "Loaded project knowledge. Project: [name], Framework: [framework]"

---

## Test Campaign Phases

| Phase | Agent | Purpose |
|-------|-------|---------|
| 0 | smoke-tester | Availability check — **abort if fails** |
| 1 | security-scanner | Static analysis, secrets, OWASP |
| 2 | unit-tester | Isolated logic + coverage gate |
| 3 | integration-tester | Service-to-service connections |
| 4 | api-contract-tester | Status codes, schemas, auth |
| 5 | ui-flow-tester | Cross-browser + mobile flows |
| 6 | db-integrity-checker | State changes, constraints |
| 7 | perf-load-tester | p95/p99 thresholds *(parallel with Phase 8)* |
| 8 | a11y-auditor | WCAG 2.1 AA compliance *(parallel with Phase 7)* |
| 9 | regression-tester | Diff against baseline |
| 10 | universal-test-reporter | Consolidated report — **always last** |

---

## STEP 4 - DETERMINE WHAT TO TEST

**IF user said "test [specific flow]":**
- Test ONLY that flow
- Go to SPECIFIC FLOW TESTING below

**IF user said "test everything" or "run QA":**
- Test all flows from critical-flows.md
- Test all API endpoints
- Go to FULL TESTING below

---

## SPECIFIC FLOW TESTING (e.g., "test login")

**DO THIS NOW:**

1. **Find the flow in `.qa-knowledge/critical-flows.md`**
2. **Note the steps listed**
3. **For each step:**

   **WITH browser tools:**
   - Navigate to the URL
   - Perform the action
   - **Call `browser_network_requests` after EVERY action that triggers an API call — do this before moving to the next step**
   - **⛔ API ERROR CAPTURE PROTOCOL — run after every network check:**
     1. If ANY response has `status >= 400` → **STOP. Mark the ENTIRE FLOW as ❌ FAIL.**
        - Record in Issues: URL, method, status code, response body (first 300 chars)
        - Add to the "API Errors Detected via Network Monitoring" report table
        - ⛔ **DO NOT call `browser_navigate`, `browser_click`, or ANY tool that changes the page.**
        - ⛔ **DO NOT use a URL to jump to a later step in this flow — this is a CRITICAL VIOLATION.**
          Navigating past a failed step via URL does not test the real flow; it hides the bug and
          produces meaningless results for all dependent steps.
        - "Skip to the NEXT SEPARATE TEST SCENARIO" means begin a completely different test flow
          (e.g., move on to the registration flow), NOT navigate to the next page of the current flow.
        - **Write the bug to the report immediately**, then abandon this flow entirely.
     2. If response is 2xx but body contains `"error"` or `"errors"` key with a non-empty value → **STOP. Mark the ENTIRE FLOW as ❌ FAIL.**
        - Record: URL, method, `200 OK but body.error = "[value]"`
        - Add to the "API Errors Detected via Network Monitoring" report table
        - ⛔ **DO NOT call `browser_navigate` or any navigation tool. DO NOT use a URL to bypass this step.**
        - **Write the bug to the report immediately**, then abandon this flow entirely.
     3. Only if NO errors detected → mark step ✅ PASS and use browser navigation to proceed to the next step in the flow
   - Verify the visible UI result after the network check
   - Document Pass/Fail with API response details

   **WITHOUT browser tools:**
   - Create a test checklist
   - List what should be verified
   - Mark as Pass/Fail based on observed runtime behavior only
   - ⛔ **DO NOT inspect source code to determine Pass/Fail — test behavior, not implementation**

4. **Report results:**

```
FLOW: [Flow Name]
STATUS: ✅ PASS / ❌ FAIL

Steps Tested: [number]
Passed: [number]
Failed: [number]

Details:
[Step 1]: ✅/❌ - [notes]
[Step 2]: ✅/❌ - [notes]

Issues Found:
[List any issues]
```

---

## FULL TESTING ("test everything")

**DO THIS NOW:**

### 4A - UI Flows
For each flow in `.qa-knowledge/critical-flows.md`:
- Follow the steps
- Document results

### 4B - API Endpoints
For each endpoint in `.qa-knowledge/api-endpoints.md`:
- Test with sample data
- **Verify BOTH the status code AND the response body**
- A 2xx response with an `error` or `message` field containing an error value is a FAIL
- A 4xx/5xx response with an empty body is a FAIL (client cannot display a meaningful error)
- Document results

**API Error Detection Rules (apply to every endpoint test and every UI step):**

> ⛔ **MANDATORY: Capture errors BEFORE moving to the next step/page. Never silently continue.**

1. After every form submit, button click, or navigation that triggers a network call:
   - Call `browser_network_requests` immediately
   - Do NOT navigate to the next page until this check is complete

2. Check `response.status_code`:
   - If `status >= 400` → **FAIL — mark the ENTIRE FLOW as ❌ FAIL and abandon it**
     - Record to Issues: `[METHOD] [URL] → [status] — [body excerpt ≤300 chars]`
     - Add row to "API Errors Detected via Network Monitoring" table in the report
     - ⛔ **DO NOT call `browser_navigate` or any navigation tool**
     - ⛔ **DO NOT use a direct URL to jump to a later step in this flow — this is a CRITICAL VIOLATION**
       (URL-bypassing a failed step hides the bug and makes dependent-step results meaningless)
     - "Skip to the NEXT SEPARATE TEST SCENARIO" = start a completely different test flow, NOT navigate
       to the next page of the current flow
     - **Write the bug to the report NOW**, then abandon this flow entirely

3. If `status` is 2xx, parse `response.json()` and check for keys: `error`, `errors`, `detail`, `message`
   - If any key has a non-empty error value → **FAIL — mark the ENTIRE FLOW as ❌ FAIL and abandon it**
     - Record: `[METHOD] [URL] → 200 OK but body.error = "[value]"`
     - Add row to "API Errors Detected via Network Monitoring" table
     - ⛔ **DO NOT call `browser_navigate` or any navigation tool. DO NOT use a URL to bypass this step.**
     - **Write the bug to the report NOW**, then abandon this flow entirely

4. If `status` is 4xx/5xx AND body is empty or not JSON → **FAIL — abandon this flow**
   - Record: `[METHOD] [URL] → [status] — empty/non-JSON body`
   - ⛔ **DO NOT navigate further** — write the bug to the report immediately

5. Only advance to the next step (via browser navigation) if NO errors were detected in steps 2, 3, or 4

### 4C - Database
For each model in `.qa-knowledge/database-schema.md`:
- Verify schema exists
- Check relationships
- Document results

---

## STEP 5 - GENERATE REPORT

**YOU MUST CREATE:** `.qa-reports/qa-report-[YYYY-MM-DD].md`

```markdown
# QA Test Report

**Date:** [Current Date]
**Project:** [From knowledge]
**Flow Tested:** [Specific flow or "All"]

## Summary

| Metric | Value |
|--------|-------|
| Total Tests | [number] |
| Passed | [number] |
| Failed | [number] |
| Pass Rate | [%] |

## Results

### UI Flows
| Flow | Status | Notes |
|------|--------|-------|
| [name] | [PASS/FAIL] | [details] |

### API Endpoints
| Endpoint | HTTP Status | Body Valid | Status | Notes |
|----------|-------------|------------|--------|-------|
| [path] | [code] | [Yes/No] | [PASS/FAIL] | [details] |

### API Errors Detected via Network Monitoring

> **IMPORTANT:** Every API error captured during UI flow steps MUST appear here. If none were detected, write "None detected" — never leave this section empty or omit it.

| URL | Method | Status Code | Response Body Excerpt | Detected In |
|-----|--------|-------------|----------------------|-------------|
| [url] | [GET/POST/etc] | [4xx/5xx or 200+body.error] | [first 300 chars] | [flow name / step] |

## Issues

### Critical (P1)
[List any blocking issues]

### Important (P2)
[List any important issues]

## Recommendation

[READY / NOT READY for release]
```

**AFTER creating report, say:**
"✅ Report generated at .qa-reports/qa-report-[date].md"
"Summary: [X] passed, [Y] failed"

---

## Handoff Format

When delegating to a specialist agent, always provide:

```
AGENT: <agent-name>
TARGET: <URL | file | endpoint>
SCOPE: <what to test>
ENVIRONMENT: <relevant env vars>
PROJECT_CONTEXT: <which .qa-knowledge files are relevant>
SUCCESS_CRITERIA: <what pass looks like>
```

**Examples:**
```
AGENT: ui-flow-tester
TARGET: http://localhost:3000
SCOPE: Test all flows from .qa-knowledge/critical-flows.md
PROJECT_CONTEXT: critical-flows.md, testing-config.md
SUCCESS_CRITERIA: All critical user journeys pass without API errors

AGENT: api-contract-tester
TARGET: http://localhost:8000
SCOPE: All endpoints in .qa-knowledge/api-endpoints.md
PROJECT_CONTEXT: api-endpoints.md, project-overview.md
SUCCESS_CRITERIA: All endpoints return expected status codes and valid response bodies

AGENT: db-integrity-checker
TARGET: Database from environment config
SCOPE: Validate schema from .qa-knowledge/database-schema.md
PROJECT_CONTEXT: database-schema.md
SUCCESS_CRITERIA: All relationships, constraints, and cascade rules validate
```

---

## Orchestration Rules

1. Always run Phase 0 first — abort if the app is broken
2. Unit before integration — isolated logic before wired connections
3. Integration before API — real connections before full contract suite
4. API before UI — broken APIs make UI tests noisy and misleading
5. DB after API — validate state changes that API calls should produce
6. Phases 7 and 8 run in parallel after functional tests pass
7. Regression runs after all functional phases complete
8. Never skip the reporter — all output must be consolidated
9. If any P1 phase fails, halt and surface the blocker before continuing

## Anti-Patterns

- ❌ Running UI tests against an unstarted server
- ❌ Mutating production data during test runs
- ❌ Skipping discovery and assuming the stack
- ❌ Reporting pass when any P1 test is unverified
- ❌ Using `Thread.sleep()` — always use explicit waits/polling
- ❌ **URL-bypassing a failed step** — if an API error blocks step N, navigating directly to the URL
  of step N+1 is forbidden. Subsequent steps depend on step N succeeding; testing them via URL
  produces invalid results and masks the real bug. Always report the failure and stop the flow.
- ❌ **Inspecting source code when a bug is found** — when a test fails or an error is detected,
  **NEVER read, grep, or investigate the source code**. Your job is to report what failed
  (URL, status code, error message, screenshot) and move to the next test. Root-cause analysis
  of the implementation is the developer's responsibility, not the QA agent's.

## Bug Found → Correct Behavior

When ANY bug or error is detected during testing:

1. **Record it immediately** — URL/endpoint, status code, error message, response body (≤300 chars)
2. **Mark the flow as ❌ FAIL**
3. **Add it to the Issues section of the report** (P1 = blocking, P2 = important)
4. **Move on** — either to the next test scenario or generate the final report
5. ⛔ **DO NOT open any source file, run grep on the codebase, or investigate WHY the bug exists**
6. ⛔ **DO NOT attempt to fix or diagnose the bug** — only document it

---

## IMPORTANT - DO NOT SKIP STEPS

1. ✅ MUST check .qa-knowledge exists
2. ✅ MUST create knowledge if missing
3. ✅ MUST read knowledge files before testing
4. ✅ MUST test what user requested
5. ✅ MUST generate report

**DO NOT make assumptions - READ the actual files.**

---

**Version:** 2.0 - ACTION MODE
**Compatible:** All AI CLIs
