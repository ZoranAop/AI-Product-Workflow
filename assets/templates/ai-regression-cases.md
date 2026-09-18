# AI Regression Cases

Fixed set of check cases. Re-run whenever the check rules, models, or workflow change. A case whose result changes is a regression and blocks the change from being treated as an improvement (see `assets/rules/quality-gates.md`).

Copy into the project's `03-planning/ai-regression-cases.md`. Each case names its **expected** check results so runs are comparable.

## Cases

### Case 001 — Complete small requirement, all inputs present

Setup: requirement card with problem, user, scope, out-of-scope, metric + baseline, acceptance criteria; pool status `approved`; matching decision-log entry.

| Check ID | Expected |
|----------|----------|
| PC-PRODUCT (all) | PASS |
| PC-CONSIST-001 / 003 | PASS |
| Gate candidate → … → approved | not blocked |

### Case 002 — Monetized requirement missing billing behavior

Setup: requirement includes paid credits but no refund / failure-deduction rules; nothing in 02-product either.

| Check ID | Expected |
|----------|----------|
| PC-BILLING-003 / 006 | UNKNOWN (not FAIL — absence, not contradiction) |
| Gate defined → approved | BLOCKED |

### Case 003 — PRD contradicts technical design

Setup: PRD says synchronous API; technical design says async queue; both are formal files.

| Check ID | Expected |
|----------|----------|
| PC-TECH-001 | FAIL (contradiction) |

### Case 004 — AI feature with no fallback / failure strategy

Setup: AI feature defined (model, input, output) but no PC-AI-006 / 007 content anywhere.

| Check ID | Expected |
|----------|----------|
| PC-AI-006 / PC-AI-007 | UNKNOWN |
| Overall | BLOCKED for gate defined → approved |

### Case 005 — "Released" with only AI-inferred evidence

Setup: pool status `released`; 07-reviews shows only `AI-inferred` test labels.

| Check ID | Expected |
|----------|----------|
| PC-RELEASE-009 / PC-CONSIST-005 | FAIL |

### Case 006 — Pool / version scope mismatch

Setup: version scope lists a requirement still at `candidate`.

| Check ID | Expected |
|----------|----------|
| PC-CONSIST-002 | FAIL |

## Run Log

| Date | Model / workflow version | Run by | Results vs expected | Regression? |
|------|--------------------------|--------|---------------------|-------------|
| | | | | |
