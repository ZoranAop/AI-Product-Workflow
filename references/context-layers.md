# Project Knowledge and Context Management

Keep Agent work stable by layering project knowledge so facts, drafts, and decisions never blur together.

## Four Layers

### Layer 1 — Raw Material
- User interviews, meeting notes, screenshots, external pages, competitor material, user feedback, test records.
- Keep original sources intact. Register each item in `01-inputs/source-register.md` before treating it as input.

### Layer 2 — Product Facts
- Product positioning, user roles, functional rules, system limits, design system, business rules.
- Live only in `02-product/`. Verified or explicitly marked as assumptions.

### Layer 3 — Decisions and Requirements
- Product goals, problem space, requirements, decisions, version scope.
- Live in `03-planning/`, `04-requirement-pool/`, `05-requirements/`, `06-versions/`.

### Layer 4 — Execution Outcomes
- Development results, test results, release results, user data, operations feedback.
- Live in `07-reviews/` and feed back into Layer 1/3 for the next cycle.

## Movement Rules

- Layer 1 never becomes formal fact without analysis and confirmation.
- Layer 2 changes are governed by change-management rules.
- Layer 3 status changes follow the status machine.
- Layer 4 must be read back into the next cycle; a version that does not feed the pool or planning is incomplete.

## The Context Principle

Agent capability is bounded by context completeness. Before blaming the model for a wrong result, first check:
- Is the relevant fact present in the right layer?
- Is it current?
- Is its status marker correct (verified / assumed / pending)?
