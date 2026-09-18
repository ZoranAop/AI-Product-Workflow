# Status and Stage Gates

## Minimal Status Flow

candidate → analyzing → defined → approved → released → closed

## Rules

- Status is maintained only in the requirement pool. Never duplicate status elsewhere.
- After a requirement reaches `approved`, any substantive change must be recorded with background (see `change-management.md`) and the status moved back to `analyzing` (major change) — or, if the change only affects review of an already-defined design, kept at `defined` and re-reviewed. The status machine has exactly six statuses: candidate, analyzing, defined, approved, released, closed. There is no `reviewing` status; "review" is a gate action, not a status.
- `released` requires real launch verification evidence.
- Prefer keeping a requirement independently definable, reviewable, developable, and acceptable.

## Stage Gate Discipline

- Raw inputs are registered first; they are not formal requirements until analyzed.
- Stage conclusions are confirmed with the responsible human before being written into permanent files.
- Agent must not silently overwrite source-of-truth files.
