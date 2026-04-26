# Database Schema

**Last Updated**: {{TIMESTAMP}}

## {{TABLE_1_NAME}} Table
**Model**: `{{MODEL_1_NAME}}` ({{ORM_1_TYPE}})
**File**: `{{MODEL_1_FILE}}`

```python
class {{MODEL_1_NAME}}(Base):
    __tablename__ = '{{TABLE_1_NAME}}'
    
    id = Column(Integer, primary_key=True)
    {{FIELD_1_NAME}} = Column({{FIELD_1_TYPE}}, {{FIELD_1_CONSTRAINTS}})
    {{FIELD_2_NAME}} = Column({{FIELD_2_TYPE}}, {{FIELD_2_CONSTRAINTS}})
    {{FIELD_3_NAME}} = Column({{FIELD_3_TYPE}}, {{FIELD_3_DEFAULT}})
    created_at = Column(DateTime, default=datetime.utcnow)
```

**Constraints**:
- `{{FIELD_1_NAME}}` {{CONSTRAINT_1_DESCRIPTION}}
- `{{FIELD_2_NAME}}` {{CONSTRAINT_2_DESCRIPTION}}
- `{{FIELD_3_NAME}}` {{CONSTRAINT_3_DESCRIPTION}}

**Relationships**:
- {{RELATIONSHIP_1_DESCRIPTION}}
- {{RELATIONSHIP_2_DESCRIPTION}}

## {{TABLE_2_NAME}} Table
**Model**: `{{MODEL_2_NAME}}`
**File**: `{{MODEL_2_FILE}}`

```python
class {{MODEL_2_NAME}}(Base):
    __tablename__ = '{{TABLE_2_NAME}}'
    
    id = Column(Integer, primary_key=True)
    {{FIELD_4_NAME}} = Column({{FIELD_4_TYPE}}, {{FIELD_4_CONSTRAINTS}})
    {{FIELD_5_NAME}} = Column({{FIELD_5_TYPE}}, {{FIELD_5_CONSTRAINTS}})
    {{FIELD_6_NAME}} = Column({{FIELD_6_TYPE}}, {{FIELD_6_DEFAULT}})
    {{FIELD_7_NAME}} = Column(Integer, ForeignKey('{{FOREIGN_KEY_TABLE}}.id'))
```

**Constraints**:
- `{{FIELD_4_NAME}}` {{CONSTRAINT_4_DESCRIPTION}}
- `{{FIELD_5_NAME}}` {{CONSTRAINT_5_DESCRIPTION}}
- Foreign key to `{{FOREIGN_KEY_TABLE}}` table

**Relationships**:
- {{RELATIONSHIP_3_DESCRIPTION}}
- {{RELATIONSHIP_4_DESCRIPTION}}

## Key Relationships
- `{{RELATIONSHIP_KEY_1}}`
- `{{RELATIONSHIP_KEY_2}}`
- `{{RELATIONSHIP_KEY_3}}`

## Cascade Rules
- {{CASCADE_RULE_1}}
- {{CASCADE_RULE_2}}
- {{CASCADE_RULE_3}}

## Important Notes

{{DATABASE_NOTES}}