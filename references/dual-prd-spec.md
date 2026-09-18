# PRD Specification (Single Structured Source + Viewed Outputs)

Do not force two fully independent PRDs for every requirement. Recommend:

> **One structured requirement source + multiple presentation views**, chosen by requirement size.

## 1. Sizing Tiers

### 1.1 Small Requirements
Use:

```
Requirement card
+
Acceptance criteria
```

That is enough. A short `requirement.md` plus a checkable acceptance list.

### 1.2 Regular Requirements
Use:

```
Human-readable PRD (prd-human.md)
+
Structured fields embedded in the PRD
```

### 1.3 Complex Requirements
Use:

```
Full human-readable PRD
+
Agent-readable spec (prd-agent.md)
+
Test cases
+
Technical constraints
```

## 2. Human-Readable PRD

Purpose: for product managers, designers, engineers, and testers to read and discuss.

Recommended structure (adapt to company template if one exists):

- Background and goals
- User stories / scenarios
- Functional requirements (prioritized)
- Non-functional requirements
- Acceptance criteria (clear, testable)
- Out of scope / deferred items
- Open questions

Style: narrative where helpful, concise, uses language the team already understands.

## 3. Agent-Readable PRD

Purpose: for other Agents (engineering Agent, test Agent, future planning Agent) to consume without information loss.

Suggested structured fields:

```yaml
requirement_id:
title:
status:
priority:
owner:

problem:
goal:

scope:
out_of_scope:

dependencies:

acceptance_criteria:

source:

approved_by:
approved_at:

change_history:
```

Must include:

- Structured fields (status, priority, owner, linked sources)
- Explicit boundaries and edge cases
- Source references (which input files or decisions this came from)
- Change history with timestamps and reasons
- Machine-friendly acceptance criteria (checkable statements)
- Explicit "do not implement" list

Prefer complete Markdown with clear headings and lists over free prose.

## 4. Generation Practice

1. Start from the same analysis conclusions.
2. Generate the human version first (or from company template).
3. For complex requirements, derive the Agent version by adding structure, sources, history, and explicit boundaries.
4. Keep chosen views in the requirement directory (`requirement.md`, `prd-human.md`, `prd-agent.md` as needed by tier).
5. When a view changes, update the other views or clearly mark the divergence.

Future handoff is often Agent → Agent. Information loss at this boundary is expensive — but do not pay that cost by forcing full dual PRDs on trivial requirements.
