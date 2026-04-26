# 🧪 E2E Test Agents

A library of specialized AI agents for **complete end-to-end quality coverage** — UI, API, database, performance, accessibility, and security — all orchestrated through a single master agent.

Built for **Claude Code** (`.claude/agents/`). Compatible with GitHub Copilot (`.github/agents/`) and Cursor (`.cursor/rules/`).

---

## Architecture

```
          ┌──────────────────────────────────────┐
          │  universal-master-orchestrator.md    │  ← Start here
          │  (qa-agents/ in your project)        │
          └───────────────┬──────────────────────┘
                          │ dispatches phases 0-10
     ┌────────────────────┼─────────────────────┐
     │                    │                     │
┌────▼──────┐  ┌──────────▼──────┐  ┌──────────▼──┐
│ security  │  │  api-contract   │  │  ui-flow    │
│ scanner   │  │  tester         │  │  tester     │
└────┬──────┘  └──────────┬──────┘  └──────┬──────┘
     │                    │                │
┌────▼──────┐             │        ┌──────▼──────┐
│   perf    │             └───────►│ db-integrity│
│ load-tester│                    │  checker    │
└────┬──────┘                    └──────┬───────┘
     │                                  │
┌────▼──────┐                   ┌───────▼────────────────┐
│   a11y    │                   │  universal-test-reporter│
│  auditor  │───────────────────►  (always last)          │
└───────────┘                   └────────────────────────┘
```

---

## Agents

| Agent | Trigger | What it tests |
|-------|---------|---------------|
| `universal-master-orchestrator` | "Run the QA orchestrator", "test everything", "full E2E" | Plans, delegates all phases, generates final report |
| `universal-project-discoverer` | "discover my project", "analyze my codebase" | Auto-generates `.qa-knowledge/` from codebase analysis |
| `smoke-tester` | "smoke test", "post-deploy check" | App availability, login, critical routes (<5 min) |
| `unit-tester` | "unit tests", "check coverage" | Jest/Pytest/Vitest, coverage thresholds |
| `integration-tester` | "integration test", "test connections" | API↔DB, auth middleware, cache, service-to-service |
| `regression-tester` | "regression test", "did I break anything" | Baseline diff, visual regression, coverage drops |
| `ui-flow-tester` | "test the UI", "browser test" | Playwright user journeys — Chrome, Firefox, Safari, Edge, mobile |
| `api-contract-tester` | "test the API", "REST test" | Status codes, schemas, auth, CRUD |
| `db-integrity-checker` | "check the database" | Row presence, cascades, constraints |
| `perf-load-tester` | "load test", "latency check" | p95/p99, throughput, spike handling |
| `a11y-auditor` | "accessibility", "WCAG" | axe-core WCAG 2.1 AA, keyboard nav |
| `security-scanner` | "security scan", "secrets scan" | OWASP Top 10, CVEs, headers |
| `universal-test-reporter` | "generate test report" | Consolidated P1/P2/P3 quality report with CI exit codes |

---

## Quick Install

```bash
# Copy the agents folder into your project
mkdir -p qa-agents
cp /path/to/QA-AI-Agent/agents/*.md qa-agents/
```

Then tell your AI assistant:
```
"Run the QA orchestrator from qa-agents/universal-master-orchestrator.md"
```

Or use the install script:
```bash
bash install.sh --tool claude-code   # installs to ~/.claude/agents/
bash install.sh --tool copilot       # installs to .github/agents/
bash install.sh --tool cursor        # installs to .cursor/rules/
```

---

## Usage

### Full E2E Campaign
```
"Run a full E2E test on my app at http://localhost:3000"
```

### Individual Agents
```
"Test the login flow with the UI Flow Tester"
"Check all API endpoints with the API Contract Tester"
"Run a security scan"
"Generate the quality report"
```

---

## Required Environment Variables

```bash
# .env.test
BASE_URL=http://localhost:3000
API_BASE_URL=http://localhost:8080
TEST_DATABASE_URL=postgresql://user:pass@localhost:5432/testdb
TEST_USER_EMAIL=test@example.com
TEST_USER_PASSWORD=TestPass1!
AUTH_TOKEN=  # populated automatically by api-contract-tester
```

---

## Phase Order (enforced by Orchestrator)

```
PHASE 0   smoke-tester          ← Abort if app is broken
PHASE 1   security-scanner      ← Static analysis first
PHASE 2   unit-tester           ← Isolated logic, coverage gate
PHASE 3   integration-tester    ← Wired connections
PHASE 4   api-contract-tester   ← API before UI
PHASE 5   ui-flow-tester        ← Chrome, Firefox, Safari, Edge, mobile
PHASE 6   db-integrity-checker  ← Validate state changes
PHASE 7   perf-load-tester      ┐ Run in parallel after
PHASE 8   a11y-auditor          ┘ functional tests pass
PHASE 9   regression-tester     ← Diff against baseline
PHASE 10  test-reporter         ← Always last
```

---

## Release Decision

The **Test Reporter** produces a single verdict:

```
✅ READY TO RELEASE — All P1 gates passed (3 P2 advisory issues noted)
❌ BLOCKED          — 2 P1 issues must be resolved before release
```

Exit code `0` = release ready. Exit code `1` = blocked.

---

## Tech Stack Compatibility

| Category | Supported |
|----------|-----------|
| Frontend | React, Vue, Angular, Next.js, plain HTML |
| Backend  | Node.js, Python (FastAPI/Flask/Django), Go, Ruby |
| Database | PostgreSQL, MySQL, SQLite, MongoDB |
| Auth     | JWT, session cookies, OAuth2 |
| CI/CD    | GitHub Actions, GitLab CI, CircleCI, Jenkins |

---

## Contributing

Each agent is a self-contained Markdown file. To add a new specialist:

1. Create `.claude/agents/<name>.md` with YAML frontmatter
2. Add it to the Orchestrator's phase list
3. Add it to the Reporter's summary table
4. Update this README

---

*Designed for production QA teams who test everything before shipping anything.*
