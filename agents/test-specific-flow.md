# Test Specific Flow - Quick Reference

> Use this when you want to test a specific user flow

## How to Use

Tell your AI:
```
"Test the [flow name] flow using qa-agents/test-specific-flow.md"
```

## Common Flows

### Login Flow
```
"Test the login flow"
```
**What happens:**
1. Finds login page URL
2. Tests with valid credentials → should succeed
3. Tests with invalid credentials → should fail with error
4. Checks for proper error handling
5. Reports results

### Registration Flow
```
"Test the registration flow"
```
**What happens:**
1. Finds registration/signup page
2. Tests new user creation
3. Tests duplicate email handling
4. Tests password validation
5. Reports results

### Checkout Flow
```
"Test the checkout flow"
```
**What happens:**
1. Finds checkout/payment page
2. Tests checkout process
3. Tests payment validation
4. Tests success/error states
5. Reports results

### Dashboard Flow
```
"Test the dashboard flow"
```
**What happens:**
1. Verifies authentication required
2. Tests dashboard loads
3. Tests data displays correctly
4. Reports results

---

## What the AI Will Do

### Step 1: Find the Flow
- Search for relevant files
- Identify URLs/endpoints
- Note form fields and requirements

### Step 2: Prepare Test Data
- Use test credentials from `.qa-knowledge/testing-config.md`
- Or create defaults: `test@example.com` / `TestPass123!`

### Step 3: Execute Tests

**If AI has browser tools (Playwright, etc.):**
- ✅ Actually navigates to the page
- ✅ Actually fills forms and clicks buttons
- ✅ Actually verifies results

**If AI doesn't have browser tools:**
- ⚠️ Creates detailed test checklist
- ⚠️ Describes what should happen
- ⚠️ Lists verification steps

### Step 4: Report Results
```
FLOW: Login
STATUS: ✅ PASS / ❌ FAIL
STEPS TESTED: 5
PASSED: 5
FAILED: 0

DETAILS:
- Login page accessible: ✅
- Valid credentials work: ✅
- Invalid credentials show error: ✅
- Empty fields validated: ✅
- Success redirects correctly: ✅

ISSUES: None
```

---

## Example Session

```
You: Test the login flow

AI: I'll test the login flow for you.

[AI reads project knowledge]
[AI finds login page at /login]
[AI tests the flow]

AI: Login Flow Test Results
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅ PASS - Login flow working correctly

Steps tested: 5
Passed: 5
Failed: 0

Details:
✓ Login page loads at /login
✓ Email field accepts input
✓ Password field accepts input
✓ Submit button works
✓ Valid login redirects to /dashboard

Issues found: None
```

---

## Requirements

For best results, have:
1. `.qa-knowledge/critical-flows.md` - Describes the flow
2. `.qa-knowledge/testing-config.md` - Test credentials
3. App running on `http://localhost:3000` (or your URL)

If knowledge doesn't exist, the AI will create it first.

---

## Troubleshooting

**"AI didn't actually test anything"**
→ Your AI CLI may not have browser tools
→ You'll get a test checklist instead

**"AI can't find the login page"**
→ Run discovery first: "Discover my project"
→ Or manually add to `.qa-knowledge/critical-flows.md`

**"Tests failed but app works"**
→ Check test credentials in `.qa-knowledge/testing-config.md`
→ Verify app is running on expected URL

---

**Version:** 1.0
**Compatible:** All AI CLIs
