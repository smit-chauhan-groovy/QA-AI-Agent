# Universal QA Agents

> **AI-CLI Agnostic QA Testing System** - Works with Claude Code, Gemini CLI, Codex, Cursor, GitHub Copilot, or any AI CLI

## What Is This?

A **portable, markdown-only QA testing system** that:
- ✅ Works with **any** AI CLI (no tool-specific code)
- ✅ Requires **no code execution** (pure markdown instructions)
- ✅ **Auto-discovers** your project structure
- ✅ **Stores knowledge** for intelligent testing
- ✅ Generates **structured QA reports**
- ✅ **Drops into any project** in seconds

## Quick Start

```bash
# 1. Copy to your project
mkdir qa-agents
cp universal-*.md qa-agents/

# 2. Run with any AI CLI
"Read qa-agents/universal-master-orchestrator.md and follow instructions"

# 3. Get your report
cat .qa-reports/latest-report.md
```

## Files

| File | Purpose |
|------|---------|
| `universal-master-orchestrator.md` | Main coordinator - run this first |
| `universal-project-discoverer.md` | Analyzes your codebase |
| `universal-test-reporter.md` | Generates QA reports |
| `QUICK-START.md` | Get started in 3 minutes |
| `UNIVERSAL-SETUP-GUIDE.md` | Full documentation |

## How It Works

```
┌─────────────────────────────────────────────────────────────┐
│                    YOU SAY TO ANY AI:                       │
│   "Run QA tests using qa-agents/universal-master-orchestrator.md" │
└────────────────────────┬────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────────┐
│              1. CHECK KNOWLEDGE BASE                        │
│     Does .qa-knowledge/ exist? Is it fresh?                 │
└────────────────────────┬────────────────────────────────────┘
                         │
                         ▼ (if needed)
┌─────────────────────────────────────────────────────────────┐
│              2. DISCOVER PROJECT                            │
│     - Analyze code structure                                │
│     - Find APIs, database, flows                            │
│     - Create .qa-knowledge/ files                           │
└────────────────────────┬────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────────┐
│              3. RUN TESTS                                   │
│     - UI flows                                              │
│     - API endpoints                                         │
│     - Database integrity                                    │
│     - Security, performance, accessibility                  │
└────────────────────────┬────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────────┐
│              4. GENERATE REPORT                             │
│     - Create .qa-reports/qa-report-YYYY-MM-DD.md           │
│     - Show summary with release decision                    │
└─────────────────────────────────────────────────────────────┘
```

## Supported AI CLIs

| AI CLI | Status | Notes |
|--------|--------|-------|
| Claude Code | ✅ Full Support | Native |
| Gemini CLI | ✅ Full Support | Works perfectly |
| Cursor | ✅ Full Support | Works perfectly |
| GitHub Copilot | ✅ Full Support | Works perfectly |
| Codex | ✅ Full Support | Works perfectly |
| Any AI | ✅ Full Support | If it can read files, it works |

## What Gets Tested

Based on your project, the system automatically:

- ✅ **UI Flows** - User journeys, navigation, forms
- ✅ **API Endpoints** - REST/GraphQL, authentication, CRUD
- ✅ **Database** - Schema, relationships, integrity
- ✅ **Security** - OWASP Top 10, secrets, headers
- ✅ **Performance** - Response times, throughput
- ✅ **Accessibility** - WCAG 2.1 AA compliance

## Project Knowledge Stored

After discovery, `.qa-knowledge/` contains:

```
.qa-knowledge/
├── project-overview.md     # Tech stack, structure
├── critical-flows.md       # User journeys to test
├── api-endpoints.md        # All discovered APIs
├── database-schema.md      # Database models
├── testing-config.md       # Test users, environments
└── .last-updated           # Timestamp for refresh
```

## Report Sample

```
╔═══════════════════════════════════════════════════════════════╗
║                        QA TEST REPORT                         ║
╠═══════════════════════════════════════════════════════════════╣
║  Date: 2025-01-24                                            ║
║  Project: my-awesome-app                                      ║
╠═══════════════════════════════════════════════════════════════╣
║  RELEASE STATUS: ✅ READY                                     ║
║  ───────────────────────────────────────────────────────────  ║
║  Total Tests: 47                                              ║
║  Passed: 45 | Failed: 2 | Skipped: 0                          ║
║  Pass Rate: 95.7%                                             ║
╠═══════════════════════════════════════════════════════════════╣
║  Issues:                                                       ║
║    P1 (Critical): 0                                           ║
║    P2 (Important): 2                                          ║
║    P3 (Minor): 5                                              ║
╠═══════════════════════════════════════════════════════════════╣
║  📄 Full Report: .qa-reports/qa-report-2025-01-24.md          ║
╚═══════════════════════════════════════════════════════════════╝
```

## Example Commands

### Initial Setup
```
"Discover my project using qa-agents/universal-project-discoverer.md"
```

### Run Full QA
```
"Run QA tests on my project using the orchestrator"
```

### Generate Report
```
"Generate a QA report from the test results"
```

### Update Knowledge
```
"Refresh my project knowledge - re-run discovery"
```

## Tech Stack Detection

Automatically detects:

**Frontend:** React, Vue, Angular, Next.js, Nuxt, Svelte, SolidJS
**Backend:** Express, NestJS, Fastify, FastAPI, Flask, Django, Go
**Database:** PostgreSQL, MySQL, SQLite, MongoDB, Redis
**ORM:** Prisma, Sequelize, TypeORM, SQLAlchemy, Django ORM

## Features

- 🚀 **Zero Setup** - Copy and run
- 📁 **Portable** - Drop into any project
- 🤖 **AI-Agnostic** - Works with any AI CLI
- 📝 **Markdown Only** - No code execution
- 🧠 **Knowledge Base** - Learns your project
- 📊 **Structured Reports** - Clear, actionable
- 🔄 **Auto-Update** - Refreshes knowledge daily
- 🔒 **Safe** - Never modifies source code

## Directory Structure

```
your-project/
├── qa-agents/                    ← Copy these files here
│   ├── universal-master-orchestrator.md
│   ├── universal-project-discoverer.md
│   └── universal-test-reporter.md
│
├── .qa-knowledge/                ← Auto-created
│   ├── project-overview.md
│   ├── critical-flows.md
│   ├── api-endpoints.md
│   ├── database-schema.md
│   ├── testing-config.md
│   └── .last-updated
│
└── .qa-reports/                  ← Auto-created
    ├── qa-report-2025-01-24.md
    └── latest-report.md
```

## Git Configuration

Add to `.gitignore`:

```
.qa-knowledge/
.qa-reports/
```

Or commit for team sharing:

```
.qa-knowledge/*.md
```

## Documentation

- **Quick Start:** `QUICK-START.md`
- **Full Guide:** `UNIVERSAL-SETUP-GUIDE.md`
- **Orchestrator:** `universal-master-orchestrator.md`
- **Discoverer:** `universal-project-discoverer.md`
- **Reporter:** `universal-test-reporter.md`

## Why Universal?

Most QA agent systems are tied to specific tools:
- ❌ Claude Code agents only work with Claude Code
- ❌ GitHub Copilot agents only work with Copilot
- ❌ Code-specific implementations limit portability

**Universal QA Agents:**
- ✅ Pure markdown instructions
- ✅ No tool-specific syntax
- ✅ Works with ANY AI that can read files
- ✅ Portable across projects
- ✅ Future-proof

## License

MIT - Use in any project, commercial or personal

## Contributing

Contributions welcome! The system is designed to be:
- Framework agnostic
- AI CLI agnostic
- Easy to extend

---

**Version:** 1.0
**Compatible:** All AI CLIs
**Last Updated:** 2025-01-24
