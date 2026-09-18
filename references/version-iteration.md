# Version Iteration Principles

Every version must form a complete closed loop:

```
goal
  ↓
problem
  ↓
requirement
  ↓
decision
  ↓
development
  ↓
testing
  ↓
release
  ↓
metrics
  ↓
feedback
  ↓
retrospective
  ↓
next version
```

## End-of-Version Five Questions

At version close, answer at least:

1. What problem did we set out to solve?
2. What did we actually do?
3. Do users actually use it?
4. Did the result meet expectations?
5. What should change next?

If any question cannot be answered from project files, the version is not closed — the gap is a requirement for the next cycle.

## Version Artifacts

In `06-versions/v<major>.<minor>/` maintain:
- `release-plan.md`
- `scope.md`
- `rollout-plan.md`
- `release-metrics.md`

## Principle

The product manager's role is not "the person who writes the PRD" nor simply "the person who asks the AI questions". It is:
- Define goals
- Provide real context
- Build constraints
- Make trade-offs
- Confirm decisions

The Agent's role is:
- Understand context
- Expand analysis
- Execute work
- Verify results
- Continuously organize project knowledge

Resulting loop:

```
human defines direction
  ↓
AI expands and executes
  ↓
human judges and trims
  ↓
AI implements and verifies
  ↓
real user and data feedback
  ↓
AI organizes feedback
  ↓
human redefines direction
  ↓
next cycle
```
