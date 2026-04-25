# Quick Start - Universal QA Agents

> Get started in 3 minutes with any AI CLI

## The 3-Step Process

### 1. Copy Files to Your Project

```bash
# Create directory
mkdir -p qa-agents

# Copy these 3 files to qa-agents/:
# - universal-master-orchestrator.md
# - universal-project-discoverer.md
# - universal-test-reporter.md
```

### 2. Run with Any AI CLI

Tell your AI assistant:

```
"Read qa-agents/universal-master-orchestrator.md and follow its instructions"
```

### 3. Get Your Report

Find your report in: `.qa-reports/latest-report.md`

---

## What Happens

1. **Knowledge Check** - Checks if `.qa-knowledge/` exists
2. **Project Discovery** - Analyzes your codebase (if first run)
3. **Testing** - Tests UI, API, Database based on your stack
4. **Report** - Generates a detailed QA report

---

## Directory Created

```
your-project/
├── qa-agents/              (you create)
│   ├── universal-master-orchestrator.md
│   ├── universal-project-discoverer.md
│   └── universal-test-reporter.md
│
├── .qa-knowledge/          (auto-created)
│   ├── project-overview.md
│   ├── critical-flows.md
│   ├── api-endpoints.md
│   ├── database-schema.md
│   └── testing-config.md
│
└── .qa-reports/            (auto-created)
    └── qa-report-YYYY-MM-DD.md
```

---

## Common Commands

| What You Want | What to Say |
|---------------|-------------|
| First time setup | "Discover my project" |
| Run all tests | "Run QA tests on my project" |
| Generate report | "Generate a QA report" |
| Update knowledge | "Refresh my project knowledge" |

---

## Works With Any AI

- ✅ Claude Code
- ✅ Gemini CLI
- ✅ Cursor
- ✅ GitHub Copilot
- ✅ Codex
- ✅ Any AI that can read files

---

## Example Output

```
╔═══════════════════════════════════════════════════════════════╗
║                        QA TEST REPORT                         ║
╠═══════════════════════════════════════════════════════════════╣
║  RELEASE STATUS: ✅ READY                                      ║
║  ───────────────────────────────────────────────────────────  ║
║  Total Tests: 47                                              ║
║  Passed: 45 | Failed: 2 | Skipped: 0                          ║
║  Pass Rate: 95.7%                                             ║
╠═══════════════════════════════════════════════════════════════╣
║  📄 Full Report: .qa-reports/qa-report-2025-01-24.md          ║
╚═══════════════════════════════════════════════════════════════╝
```

---

## Next Steps

1. Read your report in `.qa-reports/latest-report.md`
2. Fix any P1 (critical) issues
3. Re-run tests after fixes
4. Update knowledge manually for business-specific flows

---

**Full documentation:** See `UNIVERSAL-SETUP-GUIDE.md`
