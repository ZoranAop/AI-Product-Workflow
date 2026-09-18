# Requirement Status Machine and Stage Gates

## Recommended Minimal Status Flow

```
candidate → analyzing → defined → approved → released → closed
```

### Status Definitions

| Status     | Meaning |
|------------|---------|
| candidate  | Idea or request registered, not yet analyzed |
| analyzing  | In active analysis (research, expansion, subtraction) |
| defined    | Analysis complete, dual PRD and prototype ready for review |
| approved   | Reviewed and committed for development |
| released   | Shipped with real verification evidence |
| closed     | Finished or explicitly abandoned |

## Critical Rules

1. Status is maintained **only** in the requirement pool. Never copy status into other files.
2. After `approved`, any substantive change must:
   - Record the change and its background
   - Move status back to `reviewing` (or `analyzing` if major)
3. `released` requires actual launch verification evidence (not just "code merged").
4. A single requirement should be independently definable, reviewable, developable, and acceptable.

## Stage Gates (Must Pass Before Moving Forward)

- **candidate → analyzing**: Registered in pool + basic problem statement exists
- **analyzing → defined**: Subtraction completed, key designs explainable by PM, dual PRD drafted
- **defined → approved**: Human review passed, decisions + backgrounds recorded
- **approved → released**: Development changes synced, acceptance evidence present
- **released → closed**: Feedback collected and fed back into next cycle (or explicitly closed)

When in doubt, keep the status conservative and ask for human confirmation.
