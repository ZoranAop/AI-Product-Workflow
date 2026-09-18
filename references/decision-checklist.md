# Decision Checklist — AI Adds, Product Manager Subtracts

After the Agent expands a requirement, run through these questions before finalizing.

## Core Worthiness

- What is the real user or business problem this solves?
- If we do nothing, what concrete negative consequence occurs?
- Is this the smallest change that addresses the core problem?

## Complexity vs Benefit

- For each added validation / edge case / state / page:
  - How often will it happen in real usage?
  - What is the cost of implementing and maintaining it?
  - What is the cost of NOT implementing it now?
- Can this be deferred to a later version without major risk?

## Understanding Test

- Can the product manager explain every retained key design decision without asking the Agent again?
- If an engineer asks "why is it designed this way?", is the answer already written in the project?

## Scope Control

- List the items the Agent proposed that were cut, and record the reason for each cut.
- Explicitly state "out of scope for this version".

## Final Gate

Only move a requirement to `defined` or `approved` when:

1. Subtraction is complete.
2. Reasons for both inclusions and exclusions are recorded.
3. Product manager can defend the final shape.
