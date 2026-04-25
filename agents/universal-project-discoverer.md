# Universal Project Discoverer

> Works with Claude Code, Gemini CLI, Codex, Cursor, GitHub Copilot, or any AI CLI

## Purpose

Automatically analyzes any codebase to extract project information for QA testing. Creates a knowledge base that other QA agents use to test intelligently.

## How to Invoke

Tell your AI assistant:
- "Discover my project"
- "Analyze my codebase"
- "Create QA knowledge base"
- "Run the project discoverer"

## What This Creates

Creates a `.qa-knowledge/` directory with:
- `project-overview.md` - Tech stack and structure
- `critical-flows.md` - User journeys to test
- `api-endpoints.md` - API documentation
- `database-schema.md` - Database structure
- `testing-config.md` - Test configuration
- `.last-updated` - Timestamp

## Discovery Instructions

### PART 1: Identify Project Type

Read these files to understand the project:

1. **Check for README**
   - Read `README.md` if it exists
   - Note: Project name, description, main purpose

2. **Identify Language/Framework**
   - If `package.json` exists → JavaScript/TypeScript project
   - If `requirements.txt` or `pyproject.toml` exists → Python project
   - If `go.mod` exists → Go project
   - If `Cargo.toml` exists → Rust project
   - If `pom.xml` exists → Java/Maven project
   - If `build.gradle` exists → Java/Gradle project
   - If `Gemfile` exists → Ruby project
   - If `composer.json` exists → PHP project

### PART 2: Analyze Frontend (if applicable)

For JavaScript/TypeScript projects, read `package.json` and note:

**Framework Detection:**
- `"react"` → React
- `"vue"` → Vue
- `"@angular/core"` → Angular
- `"next"` → Next.js
- `"nuxt"` → Nuxt
- `"svelte"` → Svelte
- `"@solidjs/core"` → SolidJS

**UI Library:**
- `"@mui/material"` or `"@material-ui/core"` → Material-UI
- `"antd"` → Ant Design
- `"@chakra-ui/react"` → Chakra UI
- `"tailwindcss"` → Tailwind CSS
- `"bootstrap"` → Bootstrap

**State Management:**
- `"@reduxjs/toolkit"` or `"redux"` → Redux
- `"zustand"` → Zustand
- `"recoil"` → Recoil
- `"@tanstack/react-query"` → React Query

**Routing:**
- Look for `react-router` in dependencies
- For Next.js/Nuxt, routing is file-based
- For Angular, look for routing configuration files

### PART 3: Analyze Backend

**For Node.js:**
- `"express"` → Express
- `"@nestjs/core"` → NestJS
- `"fastify"` → Fastify
- `"koa"` → Koa

**For Python:**
- Look in requirements.txt or pyproject.toml
- `"fastapi"` → FastAPI
- `"flask"` → Flask
- `"django"` → Django

**For Go:**
- Note the web framework if mentioned in go.mod

**For Java:**
- `"spring-boot"` → Spring Boot
- `"micronaut"` → Micronaut

### PART 4: Analyze Database

**Database Type:**
- Look for references in config files:
  - `postgres` or `postgresql` → PostgreSQL
  - `mysql` → MySQL
  - `sqlite` → SQLite
  - `mongo` or `mongodb` → MongoDB
  - `redis` → Redis
  - `dynamodb` → DynamoDB

**ORM Detection:**
- `prisma` → Prisma
- `sequelize` → Sequelize
- `TypeORM` → TypeORM
- `SQLAlchemy` → SQLAlchemy (Python)
- `django.db` → Django ORM

### PART 5: Discover Project Structure

List the main directories:
```
src/          - Source code
app/          - Application code (Next.js, Rails)
public/       - Static assets
tests/        - Test files
lib/          - Library code
config/       - Configuration files
```

Note the actual directories found in the project.

### PART 6: Discover Critical Flows

**Authentication Flow:**
- Look for files containing: login, register, auth, signin, signup
- Note the file paths and what they do

**Main Application Flow:**
- Look for the main entry point
- Note the primary user actions

**Key Business Flows:**
- Look for files related to the main business logic
- Examples: cart, checkout, order, dashboard, profile, settings

### PART 7: Discover API Endpoints

**For Express/Node.js:**
- Look in files with: route, router, controller, api
- Note patterns like: `router.get()`, `app.post()`, etc.

**For FastAPI/Python:**
- Look for decorators: `@app.get()`, `@router.post()`, etc.

**For Django:**
- Look in `urls.py` files
- Note path() definitions

**For Next.js:**
- Look in `app/api/` or `pages/api/` directories

Document each endpoint as:
```
### METHOD /path
**Description:** What it does
**Authentication:** Required/not required
**Request:** Expected input
**Response:** Expected output
```

### PART 8: Discover Database Schema

**For Prisma:**
- Read `prisma/schema.prisma`
- List all models and their fields

**For SQLAlchemy:**
- Look for `models.py` files
- Note class definitions and relationships

**For TypeORM:**
- Look for `*.entity.ts` files
- Note entity definitions

**For Django:**
- Look for `models.py` files
- Note model classes

**For Mongoose (MongoDB):**
- Look for schema definitions

Document relationships:
- One-to-many
- Many-to-many
- Foreign keys

### PART 9: Create Knowledge Files

Now create the following files in `.qa-knowledge/`:

#### 1. project-overview.md

```markdown
# Project Overview

**Last Updated:** [Today's Date]

## Project Name

[From README or directory name]

## Description

[From README or code analysis]

## Tech Stack

### Frontend
- **Framework:** [Detected framework]
- **UI Library:** [Detected UI library]
- **State Management:** [Detected state management]
- **Build Tool:** [Vite, Webpack, Next.js built-in, etc.]

### Backend
- **Framework:** [Detected backend framework]
- **Language:** [JavaScript, Python, Go, etc.]
- **API Style:** [REST, GraphQL, etc.]

### Database
- **Type:** [PostgreSQL, MySQL, MongoDB, etc.]
- **ORM:** [Prisma, SQLAlchemy, etc.]

### Authentication
- **Method:** [JWT, Session, OAuth, etc.]

## Project Structure

[List main directories and their purposes]

## Key Files

- `package.json` - Dependencies
- `README.md` - Project documentation
- [Add other important config files]

## Environment Variables

[List important non-secret variables from .env.example or config files]

## Development Setup

[How to run the project based on package.json scripts or similar]
```

#### 2. critical-flows.md

```markdown
# Critical User Flows

**Last Updated:** [Today's Date]

## Authentication

### User Registration
**Entry Point:** [File path or URL]
**Steps:**
1. [Step 1]
2. [Step 2]
**Success Criteria:** [What indicates success]

### User Login
**Entry Point:** [File path or URL]
**Steps:**
1. [Step 1]
2. [Step 2]
**Success Criteria:** [What indicates success]

### User Logout
**Entry Point:** [File path or URL]
**Steps:**
1. [Step 1]
**Success Criteria:** [What indicates success]

## Main Application Flows

### [Flow Name]
**Entry Point:** [File path or URL]
**Steps:**
1. [Step 1]
2. [Step 2]
**Success Criteria:** [What indicates success]

## Additional Notes

[Any additional context about the flows]
```

#### 3. api-endpoints.md

```markdown
# API Endpoints

**Last Updated:** [Today's Date]

## Base URL

[The base URL for API calls]

## Authentication

[How authentication works - token, cookies, etc.]

## Endpoints

### Authentication

#### POST /auth/register
**Description:** Register a new user
**Request Body:**
```json
{
  "email": "string",
  "password": "string"
}
```
**Response:** User object or token

#### POST /auth/login
**Description:** Login user
**Request Body:**
```json
{
  "email": "string",
  "password": "string"
}
```
**Response:** Authentication token

[Continue for all discovered endpoints...]

## Error Handling

[Common error responses and their meanings]
```

#### 4. database-schema.md

```markdown
# Database Schema

**Last Updated:** [Today's Date]

## Database Type

[PostgreSQL, MySQL, MongoDB, etc.]

## Models/Tables

### [Model Name]

**Fields:**
- `field_name` - Type - Description

**Relationships:**
- Related to [Other Model] via [relationship type]

[Continue for all models...]

## Important Notes

[Constraints, indexes, cascade rules, etc.]
```

#### 5. testing-config.md

```markdown
# Testing Configuration

**Last Updated:** [Today's Date]

## Test Users

### Standard User
```
Email: test@example.com
Password: TestPass123!
Role: user
```

### Admin User
```
Email: admin@example.com
Password: AdminPass123!
Role: admin
```

## Test Environments

### Development
- URL: http://localhost:PORT
- Database: [connection info]

### Staging
- URL: [staging URL]
- Database: [connection info]

## Special Considerations

- [Any special testing requirements]
- [Data that needs cleanup after tests]
- [External services that may need mocking]

## Test Data

[Sample data for testing various scenarios]
```

#### 6. .last-updated

```
YYYY-MM-DD
```

## After Discovery

Once discovery is complete:
1. Review the generated files
2. Manually add any missing business logic
3. Update test user credentials if needed
4. Run the QA Orchestrator to test with this knowledge

## Troubleshooting

**Discovery finds nothing:** Confirm you are running from the project root directory (where `package.json`, `requirements.txt`, or `go.mod` lives).
**Framework not detected:** Manually create `.qa-knowledge/project-overview.md` with your stack details — the orchestrator will use it on the next run.
**Knowledge seems stale or wrong:** Delete `.qa-knowledge/.last-updated` (or `.last-discovered`) to force a fresh discovery run.
**Incomplete flows discovered:** Automated discovery cannot infer business rules — edit `.qa-knowledge/critical-flows.md` directly to add domain-specific steps.

## Updating Knowledge

Re-run the discoverer when:
- New features are added
- API endpoints change
- Database schema changes
- It's been more than 7 days

The `.last-updated` file helps track when knowledge was last refreshed.

---

**Version:** 1.0
**Compatible:** All AI CLIs
**Last Updated:** 2025-01-24
