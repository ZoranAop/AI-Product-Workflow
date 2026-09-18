# Requirement Analysis, Prioritization, and Technical Feasibility

## AI Addition (Agent expands fully)

- Normal flows
- Exception flows
- Edge conditions
- Permissions
- Empty states
- Loading states
- Error states
- Network failures
- Retry mechanisms
- Data consistency
- Compatibility
- Security

## PM Subtraction

For each candidate item judge:
- Is it really needed?
- Does it touch the core flow?
- Does it add complexity?
- What is the development cost?
- Does it increase user cognitive load?
- Does it belong in this version?

Principle: **expansion can diverge; implementation must converge.**

Apply the questions in `references/decision-checklist.md`. Every retained key design must be explainable by the PM without asking the Agent again.

## Prioritization

At minimum, classify:

```
P0: core goal; cannot ship without it
P1: important capability; should be in this version
P2: valuable; can be deferred
P3: not considered for now
```

Priority must have justification — user value, business value, frequency, technical cost, risk, strategic value, or data evidence.

## Technical Feasibility Check (after requirement confirmation)

Before development, check at least:
- Technical dependencies
- APIs
- Data structures
- Database changes
- Third-party services
- Client compatibility
- Performance
- Security
- Data migration
- Rollout strategy (grayscale)
- Rollback plan

Agent can analyze the technical plan, produce issue lists, split development tasks, draft API docs, and generate test cases — but the engineering team confirms the final technical approach.
