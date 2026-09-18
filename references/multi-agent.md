# Multi-Agent Collaboration Patterns

## Single Agent

Fits:
- Requirement analysis
- Market research
- PRD
- Daily product work

Advantages:
- Centralized context
- Low coordination cost
- Easier to control

Default to a single Agent unless there is a clear reason not to. Forcing a multi-Agent architecture on a simple task is an anti-pattern.

## Multi Agent

Split by responsibility:

```
Research Agent
    ↓
Product Agent
    ↓
Design Agent
    ↓
Engineering Agent
    ↓
QA Agent
```

All Agents share the same structured project context. Each Agent operates at the permission level described in `assets/rules/agent-permissions.md`.

## Agent Auto-Execution + Human Approval

Suitable for auto-execution:
- Document sync
- Test reports
- Data organization
- Status updates
- Standardized tasks

Not suitable for direct auto-execution:
- Core product decisions
- Billing rule changes
- Permission changes
- Security policy changes
- Production data deletion
- High-risk external operations

Rule: anything in the second list requires an explicit human approval step recorded in the decision log.
