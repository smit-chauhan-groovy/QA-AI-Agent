# Universal QA Agent Setup Guide

> Works with Claude Code, Gemini CLI, Codex, Cursor, GitHub Copilot, or any AI CLI

## Overview

This is a **universal, markdown-only QA testing system** that you can drop into any project. It works with any AI CLI because it uses only natural language instructions - no code execution required.

## What You Get

- **Automated project discovery** - Learn your codebase structure
- **Knowledge base** - Stored in markdown files
- **Comprehensive testing** - UI, API, Database, Security, Performance, Accessibility
- **Structured reports** - Clear, actionable quality reports

## Quick Start

### Step 1: Copy to Your Project

Copy these files to your project root:

```
your-project/
├── .qa-knowledge/          (auto-created)
├── .qa-reports/            (auto-created)
└── qa-agents/              (create this directory)
    ├── universal-master-orchestrator.md
    ├── universal-project-discoverer.md
    └── universal-test-reporter.md
```

### Step 2: Run Your First Test

Tell your AI assistant:

```
"Read qa-agents/universal-master-orchestrator.md and follow its instructions"
```

That's it! The orchestrator will:
1. Check for existing knowledge
2. Discover your project if needed
3. Run appropriate tests
4. Generate a report

## Directory Structure

After first run, your project will have:

```
your-project/
├── qa-agents/                          (you create this)
│   ├── universal-master-orchestrator.md
│   ├── universal-project-discoverer.md
│   └── universal-test-reporter.md
│
├── .qa-knowledge/                      (auto-created)
│   ├── project-overview.md             (tech stack, structure)
│   ├── critical-flows.md               (user journeys)
│   ├── api-endpoints.md                (API documentation)
│   ├── database-schema.md              (database structure)
│   ├── testing-config.md               (test configuration)
│   └── .last-updated                   (timestamp)
│
└── .qa-reports/                        (auto-created)
    ├── qa-report-2025-01-24.md         (dated reports)
    └── latest-report.md                (most recent)
```

## Installation Methods

### Method 1: Manual Copy (Recommended)

```bash
# In your project directory
mkdir -p qa-agents

# Copy the agent files
cp /path/to/qa-agents/*.md qa-agents/
```

### Method 2: Git Submodule

```bash
# Add as a submodule
git submodule add https://github.com/your-org/universal-qa-agents.git qa-agents

# Update submodule
git submodule update --remote qa-agents
```

### Method 3: NPM Package (if published)

```bash
npm install --save-dev universal-qa-agents
```

## Usage by AI CLI

### Claude Code

```
"Run the QA orchestrator from qa-agents/universal-master-orchestrator.md"
```

### Gemini CLI

```
"Follow the instructions in qa-agents/universal-master-orchestrator.md"
```

### Cursor

```
"Load qa-agents/universal-master-orchestrator.md and execute its workflow"
```

### GitHub Copilot

```
"Read qa-agents/universal-master-orchestrator.md and follow the QA testing process"
```

### Codex

```
"Execute the QA workflow defined in qa-agents/universal-master-orchestrator.md"
```

## Common Commands

### Initial Discovery

```
"Discover my project using qa-agents/universal-project-discoverer.md"
```

### Run Full QA

```
"Run a complete QA test using the orchestrator"
```

### Generate Report Only

```
"Generate a QA report using qa-agents/universal-test-reporter.md"
```

### Update Knowledge

```
"Refresh my project knowledge"
```

## Configuration

### Environment Variables (Optional)

Create a `.qa-env` file (not committed to git):

```bash
# Application URLs
BASE_URL=http://localhost:3000
API_BASE_URL=http://localhost:8000

# Test Users
TEST_USER_EMAIL=test@example.com
TEST_USER_PASSWORD=TestPass123!
TEST_ADMIN_EMAIL=admin@example.com
TEST_ADMIN_PASSWORD=AdminPass123!

# Skip Categories (optional)
SKIP_SECURITY=true
SKIP_PERFORMANCE=true
```

### Custom Test Flows

Edit `.qa-knowledge/critical-flows.md` to add business-specific flows:

```markdown
## Custom Business Flow

### Subscription Renewal
**Entry Point:** /subscription/renew
**Steps:**
1. Navigate to subscription page
2. Click "Renew" button
3. Confirm payment details
4. Verify success message
**Success Criteria:** Subscription extended by 1 year
```

## CI/CD Integration

### GitHub Actions

```yaml
name: QA Tests
on: [push, pull_request]

jobs:
  qa:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Run QA Tests
        run: |
          echo "Ask AI to run qa-agents/universal-master-orchestrator.md"
          # Actual AI CLI invocation here
```

### GitLab CI

```yaml
qa:
  script:
    - echo "Run QA orchestrator"
    # AI CLI invocation
  artifacts:
    paths:
      - .qa-reports/
```

## Git Configuration

Add to `.gitignore`:

```
# QA knowledge (may contain sensitive info)
.qa-knowledge/

# QA reports
.qa-reports/

# QA environment
.qa-env
```

Or commit knowledge files (recommended for team sharing):

```
# Commit these for team visibility
.qa-knowledge/*.md

# But ignore sensitive data
.qa-knowledge/testing-config.md
.qa-env
```

## Troubleshooting

### Discovery Fails

**Problem:** Project discoverer can't identify framework

**Solution:** Manually create `.qa-knowledge/project-overview.md` with your tech stack

### Tests Not Running

**Problem:** AI doesn't follow the workflow

**Solution:** Be more explicit with your prompt:
```
"Read qa-agents/universal-master-orchestrator.md step by step. Start with STEP 1 and report back after each step."
```

### Knowledge Outdated

**Problem:** Knowledge is old and inaccurate

**Solution:** Force rediscovery:
```
"Re-run project discovery and update all knowledge files"
```

### AI CLI Limitations

**Problem:** Your AI CLI can't read files

**Solution:** Copy the content directly:
```
"Here's the QA workflow: [paste content of universal-master-orchestrator.md]"
```

## Best Practices

1. **Run Before Releases** - Always run QA before deploying
2. **Update Knowledge Regularly** - Re-run discovery when code changes
3. **Review Reports** - Check the generated reports for issues
4. **Fix P1 Issues** - Address critical issues before release
5. **Keep Knowledge Updated** - Edit knowledge files manually for accuracy
6. **Share with Team** - Commit knowledge files for team visibility

## Advanced Usage

### Custom Test Categories

Create your own specialist agent by following the template:

```markdown
# My Custom Tester

## Purpose
[What it tests]

## How to Test
[Step-by-step instructions]

## What to Report
[What information to collect]
```

### Integration with Existing Tests

If you have existing tests (Jest, Cypress, etc.):

1. Document them in `.qa-knowledge/testing-config.md`
2. The orchestrator can reference them
3. Results can be included in reports

### Multiple Environments

Create environment-specific knowledge:

```
.qa-knowledge/
├── development/
│   └── testing-config.md
├── staging/
│   └── testing-config.md
└── production/
    └── testing-config.md
```

## Support

For issues or questions:
- Check the troubleshooting section
- Review the agent files for detailed instructions
- Ensure your AI CLI can read files
- Verify file paths are correct

## Version History

- **v1.0** (2025-01-24) - Initial universal release
  - Works with any AI CLI
  - Pure markdown, no code execution
  - Portable and lightweight

---

**Version:** 1.0
**Compatible:** All AI CLIs
**Last Updated:** 2025-01-24
