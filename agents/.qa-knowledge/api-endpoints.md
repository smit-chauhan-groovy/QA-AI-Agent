# API Endpoints

**Last Updated**: {{TIMESTAMP}}

## Authentication Endpoints

### POST `/api/auth/register`
**Description**: Register new user account
**Authentication**: None required
**Request Body**:
```json
{
  "email": "user@example.com",
  "password": "SecurePass123!",
  "confirm_password": "SecurePass123!"
}
```
**Response**: 201 Created
```json
{
  "id": 1,
  "email": "user@example.com",
  "verified": false,
  "created_at": "2025-04-24T14:30:00Z"
}
```

### POST `/api/auth/login`
**Description**: Authenticate user and receive JWT token
**Authentication**: None required
**Request Body**:
```json
{
  "email": "user@example.com",
  "password": "SecurePass123!"
}
```
**Response**: 200 OK
```json
{
  "access_token": "eyJhbGciOiJIUzI1NiIs...",
  "token_type": "bearer",
  "expires_in": 3600
}
```

## {{API_GROUP_1_NAME}} Endpoints

### {{METHOD_1}} `{{ROUTE_1}}`
**Description**: {{DESCRIPTION_1}}
**Authentication**: {{AUTH_1}}
**Request Body**: {{REQUEST_BODY_1}}
**Response**: {{RESPONSE_1}}

### {{METHOD_2}} `{{ROUTE_2}}`
**Description**: {{DESCRIPTION_2}}
**Authentication**: {{AUTH_2}}
**Request Body**: {{REQUEST_BODY_2}}
**Response**: {{RESPONSE_2}}

## {{API_GROUP_2_NAME}} Endpoints

### {{METHOD_3}} `{{ROUTE_3}}`
**Description**: {{DESCRIPTION_3}}
**Authentication**: {{AUTH_3}}
**Query Params**: {{QUERY_PARAMS_3}}
**Response**: {{RESPONSE_3}}

## Authentication Method
- **Type**: {{AUTH_TYPE}}
- **Header**: `{{AUTH_HEADER}}`
- **Token Lifetime**: {{TOKEN_LIFETIME}}
- **Refresh Endpoint**: {{REFRESH_ENDPOINT}}

## Important Notes

{{API_NOTES}}