# Testing Configuration

**Last Updated**: {{TIMESTAMP}}

## Test User Accounts

### Standard User
```json
{
  "name": "standard_user",
  "email": "{{STANDARD_USER_EMAIL}}",
  "password": "{{STANDARD_USER_PASSWORD}}",
  "role": "user",
  "permissions": [
    "{{PERMISSION_1}}",
    "{{PERMISSION_2}}",
    "{{PERMISSION_3}}"
  ]
}
```

### Admin User
```json
{
  "name": "admin_user",
  "email": "{{ADMIN_USER_EMAIL}}",
  "password": "{{ADMIN_USER_PASSWORD}}",
  "role": "admin",
  "permissions": [
    "{{ADMIN_PERMISSION_1}}",
    "{{ADMIN_PERMISSION_2}}",
    "{{ADMIN_PERMISSION_3}}",
    "{{ADMIN_PERMISSION_4}}"
  ]
}
```

## Environment Configuration

### Development
```bash
BASE_URL={{DEV_BASE_URL}}
API_BASE_URL={{DEV_API_BASE_URL}}
DATABASE_URL={{DEV_DATABASE_URL}}
```

### Staging
```bash
BASE_URL={{STAGING_BASE_URL}}
API_BASE_URL={{STAGING_API_BASE_URL}}
# Database: Use read replica for testing
```

### Production
```bash
BASE_URL={{PROD_BASE_URL}}
API_BASE_URL={{PROD_API_BASE_URL}}
# NEVER test against production database
```

## Test Data Fixtures

### {{FIXTURE_1_NAME}}
**File**: `{{FIXTURE_1_FILE}}`
```json
[
  {
    "{{FIELD_1}}": "{{VALUE_1}}",
    "{{FIELD_2}}": {{VALUE_2}},
    "{{FIELD_3}}": "{{VALUE_3}}"
  }
]
```

### {{FIXTURE_2_NAME}}
**File**: `{{FIXTURE_2_FILE}}`
```json
[
  {
    "{{FIELD_4}}": {{VALUE_4}},
    "{{FIELD_5}}": "{{VALUE_5}}",
    "{{FIELD_6}}": "{{VALUE_6}}"
  }
]
```

## Special Testing Considerations

- {{TESTING_CONSIDERATION_1}}
- {{TESTING_CONSIDERATION_2}}
- {{TESTING_CONSIDERATION_3}}
- {{TESTING_CONSIDERATION_4}}

## Important Notes

{{TESTING_NOTES}}