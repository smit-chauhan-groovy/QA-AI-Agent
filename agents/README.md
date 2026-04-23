# 🧪 E2E Test Agents

A library of specialized AI agents for **complete end-to-end quality coverage** — UI, API, database, performance, accessibility, and security — all orchestrated through a single master agent.

Built for **Claude Code** (`.claude/agents/`). Compatible with GitHub Copilot (`.github/agents/`) and Cursor (`.cursor/rules/`).

---

## Architecture

```
                    ┌───────────────────┐
                    │  e2e-orchestrator  │  ← Start here
                    └────────┬──────────┘
                             │ dispatches
          ┌──────────────────┼──────────────────┐
          │          ┌───────┴──────┐            │
    ┌─────▼─────┐  ┌─▼────────────┐  ┌──────────▼──┐
    │ security  │  │   api-contract│  │  ui-flow    │
    │ scanner   │  │   tester      │  │  tester     │
    └─────┬─────┘  └───────┬──────┘  └──────┬──────┘
          │                │                 │
    ┌─────▼─────┐          │         ┌──────▼──────┐
    │   perf    │          └────────►│  db-integrity│
    │ load-tester│                  │  checker     │
    └─────┬─────┘                  └──────┬───────┘
          │                               │
    ┌─────▼─────┐                  ┌──────▼──────┐
    │   a11y    │                  │             │
    │  auditor  │──────────────────► test-reporter│
    └───────────┘                  └─────────────┘
```

---

## Agents

| Agent | Trigger | What it tests |
|-------|---------|---------------|
| `e2e-orchestrator` | "test everything", "full E2E" | Plans and coordinates all agents |
| `ui-flow-tester` | "test the UI", "browser test" | Playwright user journeys, forms, nav |
| `api-contract-tester` | "test the API", "REST test" | Status codes, schemas, auth, CRUD |
| `db-integrity-checker` | "check the database" | Row presence, cascades, constraints |
| `perf-load-tester` | "load test", "latency check" | p95/p99, throughput, spike handling |
| `a11y-auditor` | "accessibility", "WCAG" | axe-core WCAG 2.1 AA, keyboard nav |
| `security-scanner` | "security scan", "secrets scan" | OWASP Top 10, CVEs, headers |
| `test-reporter` | "generate test report" | Consolidated P1/P2 quality report |

---

## Quick Install

### Claude Code
```bash
git clone https://github.com/your-org/e2e-test-agents
cp e2e-test-agents/.claude/agents/*.md ~/.claude/agents/
```

### GitHub Copilot
```bash
mkdir -p .github/agents
cp e2e-test-agents/.claude/agents/*.md .github/agents/
```

### Cursor
```bash
mkdir -p .cursor/rules
for f in e2e-test-agents/.claude/agents/*.md; do
  cp "$f" ".cursor/rules/$(basename $f .md).mdc"
done
```

Or use the install script:
```bash
bash e2e-test-agents/scripts/install.sh --tool claude-code
bash e2e-test-agents/scripts/install.sh --tool copilot
bash e2e-test-agents/scripts/install.sh --tool cursor
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
PHASE 1  security-scanner      ← Static analysis first
PHASE 2  api-contract-tester   ← API before UI
PHASE 3  ui-flow-tester        ← UI after API validated
PHASE 4  db-integrity-checker  ← Validate state changes
PHASE 5  perf-load-tester      ┐ Run in parallel after
PHASE 6  a11y-auditor          ┘ functional tests pass
PHASE 7  test-reporter         ← Always last
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
