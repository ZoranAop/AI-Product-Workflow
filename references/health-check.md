# Project Health Check

Run this periodically or at the end of each version.

## Checklist

### Context Freshness
- [ ] Are there facts in `02-product/` or decision logs that are known to be outdated?
- [ ] Have recent review or development decisions been written back with background?

### Status Consistency
- [ ] Do the statuses in the requirement pool match actual progress?
- [ ] Are there requirements stuck in `analyzing` or `defined` for too long without reason?

### Decision Traceability
- [ ] For every major cut or change, is the background (when / who / why) recorded?
- [ ] Can someone ask "why was this feature removed three months ago?" and get an answer from the project files?
- [ ] Are there requirements without acceptance criteria?

### Source of Truth Integrity
- [ ] Is information duplicated across multiple places?
- [ ] Are there conflicting rules in more than one file?
- [ ] Is each formal rule maintained in exactly one place?
- [ ] Are raw inputs properly registered before being treated as formal requirements?
- [ ] Are there documents changed but not synced elsewhere?

### Dual Artifacts
- [ ] For active complex requirements, do both human-readable and Agent-readable specs exist and stay roughly in sync?

### Agent & AI Hygiene
- [ ] Can the Agent still correctly understand core product rules (spot-check against the regression set)?
- [ ] Are there Agent operations that exceeded their permission level?
- [ ] Are AI feature definitions (model, cost, latency, failure strategy) current?

### Feedback Loop
- [ ] Have post-launch feedback, bugs, and deferred items been fed back into the pool or planning files?

## How to Act on Findings

- Outdated facts → move to `99-archive/` or update with new date and reason.
- Missing backgrounds → interview the people who made the decision and write them down.
- Status drift → correct the pool and note the correction.
- Missing Agent-readable spec for complex requirement → generate the missing version before further work.
- Conflicting rules → consolidate to one source, mark others as derived.
- Exceeded-permission Agent operations → review audit log, record remediation.
