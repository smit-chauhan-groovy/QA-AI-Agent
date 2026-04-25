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
   - **Call `browser_network_requests` after every action that triggers an API call**
   - **Check ALL network responses: any status >= 400 is a detected API error → FAIL**
   - **Also check 2xx responses: if body contains `"error"` or `"errors"` key with non-empty value → FAIL**
   - Verify the visible UI result
   - Document Pass/Fail with API response details

   **WITHOUT browser tools:**
   - Create a test checklist
   - List what should be verified
   - Mark as Pass/Fail based on code review

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

**API Error Detection Rules (apply to every endpoint test):**
1. Check `response.status_code` is in the expected range
2. Parse `response.json()` and look for keys: `error`, `errors`, `detail`, `message`
   - If status is 2xx AND any of these keys contain a non-empty error value → **FAIL**
   - If status is 4xx/5xx AND body is empty or not JSON → **FAIL**
3. When using browser tools (`browser_network_requests`), after every form submit or action:
   - Call `browser_network_requests` to capture all network calls
   - Flag any response with `status >= 400` as a detected API error
   - Report: method, URL, status code, and response body

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
| URL | Status Code | Response Body Excerpt | Detected In |
|-----|-------------|----------------------|-------------|
| [url] | [4xx/5xx] | [first 200 chars] | [flow name] |

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
