# Agent Permissions and Security Rules

AI Agent work in a product project must be permissioned and auditable.

## Permission Levels

| Level | Scope | Allowed | Not Allowed |
|-------|-------|---------|-------------|
| L0 Read-only | Search, read, analyze | Produce drafts in the conversation | Modify any project file |
| L1 Draft write | Create/modify non-authoritative files | Drafts, analysis, PRD drafts, test case drafts | Update the requirement pool status, rules, or product facts |
| L2 Project write | Update structured project data | Update requirements, planning files, structured data | Modify source-of-truth rules or product baselines |
| L3 External execution | Call APIs, create tasks, run automation | External system operations with explicit authorization | Changes to production data |
| L4 Production | Production data, billing rules, permissions, deletion | Only with explicit human authorization and an audit record | Anything unauthenticated |

## Rules

1. Default level for a new project is L1. L2+ requires an explicit authorization note in `00-rules/agent-permissions.md` (this file, copied into the project).
2. L3/L4 actions must each have: what, when, who authorized, and an audit record.
3. Agent may never modify:
   - Formal product rules in `02-product/` without human confirmation.
   - Billing or permission logic.
   - Deletion of production data.
4. Unconfirmed Agent output may exist in the project as drafts, but must carry a visible status marker (draft / pending-confirmation). It must not be treated as formal fact.
5. Any permission escalation must be recorded with background (when / who / why).

## Auditing

- Log L2+ operations to `07-reviews/agent-audit-log.md`.
- Log L3/L4 operations with the authorizing human named.
- Health checks must verify no Agent operation exceeded its level.
