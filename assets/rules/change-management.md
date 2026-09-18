# Change Management Rules

Control how changes to formal product baselines are proposed, recorded, and applied.

## What Counts as a Change

- Product rules in `02-product/`
- Approved requirement scope
- Version committed scope
- Core business logic, billing rules, permission rules
- Formal acceptance criteria

## Process

1. **Propose** — the change is described with its background (when, who, why) before any file is edited.
2. **Review** — human review; decision and rejected alternatives are recorded.
3. **Apply** — only after confirmation. Agent never silently overwrites source-of-truth files.
4. **Record** — update the decision log (`03-planning/decision-log.md`) with:
   - Date, participants
   - Background and problem
   - Candidate options
   - Final decision
   - Reasons
   - Rejected options
   - Impact scope
   - Follow-up actions
   - Confirmer

## Rules

- An approved requirement that changes substantively must move status back to `analyzing` (or `defined` if the change only affects the review of an already-defined design). `reviewing` is a gate action, not a status.
- If a decision is reversed, the original entry stays; append a new entry that supersedes it, never delete history.
- Any Agent-performed L2+ change must carry an audit entry naming the authorizing human.
- Changes made in meetings must be written back before the meeting ends or within the agreed window; otherwise they do not exist.
