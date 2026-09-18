# Agent-Readable Requirement Skeleton (Complex-Tier PRD)

Use this skeleton for complex requirements that need an Agent-readable spec alongside the human-readable PRD. Copy into the requirement directory as `prd-agent.md`.

```markdown
# <Requirement Title> (Agent-Readable Spec)

## Meta

| Field | Value |
|-------|-------|
| requirement_id | req-XXXX-<short-name> |
| status | candidate / analyzing / defined / approved / released / closed |
| priority | P0 / P1 / P2 / P3 |
| owner | <product manager> |
| approved_by | |
| approved_at | |

## Problem

<One or two sentences: what is the real user or business problem.>

## Goal

<What the requirement is meant to achieve, with the success metric and baseline if known.>

## Scope

- <In-scope items>

## Out of Scope

- <Explicitly excluded items and why>

## Dependencies

- <Technical, data, or cross-requirement dependencies>

## Acceptance Criteria

Checkable statements, each independently verifiable:

- [ ] <criterion 1>
- [ ] <criterion 2>

## Source

- <Which input files, reviews, or decisions this requirement derives from>

## Do Not Implement

- <Items the Agent proposed that were cut; record the reason for each cut>

## Change History

| Date | Change | Reason |
|------|--------|--------|
| YYYY-MM-DD | <change> | <why> |
```

Rules:

- One requirement = one folder under `05-requirements/`, named `req-XXXX-<english-short-name>`.
- Status values live only in the requirement pool; the spec references them, never redefines them.
- Every entry in "Do Not Implement" must have a recorded reason so it can be retrieved months later.
