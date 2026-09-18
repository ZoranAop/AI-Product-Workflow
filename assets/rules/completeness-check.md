# Product Completeness Check Rules

This rule turns the project's checklists into **executable checks**: the Agent reads project context, applies numbered check items, classifies evidence, and produces a structured Completeness Report with stage-gate conclusions. It complements `health-check.md` (periodic hygiene) — this file defines the systematic, repeatable check engine.

## Check Result Model

Every check item outputs:

| Field | Description |
|-------|-------------|
| Check ID | Stable rule ID, e.g. `PC-PRODUCT-001` |
| Category | Check domain (see Check ID System) |
| Result | `PASS` / `FAIL` / `UNKNOWN` / `N/A` |
| Severity | `blocker` / `major` / `minor` / `info` |
| Evidence | Which file/source the result is based on |
| Finding | What the Agent found (or cannot find) |
| Action | Recommended next step |
| Blocking | `yes` / `no` — does this block the current stage gate |

### Result Semantics (aligned with `evidence-and-confidence.md`)

- **PASS** — sufficient evidence in a source of truth.
- **FAIL** — clear defect: required information missing from a formal file, two formal sources contradict, or a gate precondition is unmet.
- **UNKNOWN** — current context is insufficient to judge. **Never** resolve UNKNOWN by assuming the negative ("no refund support" is UNKNOWN until defined; it is not FAIL unless a formal source explicitly contradicts).
- **N/A** — capability confirmed inapplicable; record the reason.

## Execution Protocol (12 Steps)

Run when a requirement is created or modified, at any stage-gate review, or on demand:

```
1. Load project context (00-rules, 02-product, active requirement, version)
2. Identify current requirement / version and its pool status
3. Load applicable rules by scope (product / ux / data / tech / ai / agent / billing / security / test / release / metrics)
4. Run completeness checks (check items in the applicable matrices below)
5. Run cross-document consistency checks (source-of-truth.md invariants)
6. Classify all evidence (VERIFIED / ASSUMED / INFERRED / UNVERIFIED)
7. Identify missing information (UNKNOWN findings)
8. Identify contradictions (FAIL findings)
9. Compute stage-gate readiness
10. Produce a Completeness Report (template: assets/templates/completeness-report.md)
11. Wait for human confirmation
12. Only then write formal conclusions into permanent files
```

## Check ID System

```
PC-PRODUCT-*   product-goal & scope completeness
PC-UX-*        UX / interaction completeness
PC-DATA-*      data completeness
PC-TECH-*      technical completeness
PC-AI-*        AI feature completeness
PC-AGENT-*     in-product Agent completeness
PC-BILLING-*   billing completeness
PC-SECURITY-*  security / privacy / compliance
PC-TEST-*      testing completeness
PC-RELEASE-*   release completeness
PC-METRICS-*   metrics & analytics completeness
PC-CONSIST-*   cross-document consistency
PC-GATE-*      stage gate readiness
```

Run by scope (`Run PC-AI-*`), by version, or ALL. Every check item must carry its ID so results are comparable across runs.

## Completeness Matrices

A matrix applies to a requirement when its scope matches. "Applies" is a judgment the Agent states in the report (with reason); when in doubt, apply it and mark individual items N/A with reasons.
- **Applicability grading (Required / Conditional / Recommended / N/A)**: Required = must always check when scope matches (default for core checks like PC-PRODUCT, PC-GATE); Conditional = only check when pre-conditions met (e.g., PC-TEST-003 only when testing phase reached); Recommended = advised for quality/robustness but not gate-blocking (e.g., PC-UX-004 when auth is relevant); N/A = explicitly out of scope, with recorded reason. Use this to prevent over-checking simple/minimal projects.

### PC-PRODUCT (always applies to formal requirements)

- PC-PRODUCT-001 Problem is stated (what + for whom) — Severity: blocker
- PC-PRODUCT-002 Why-now is justified — major
- PC-PRODUCT-003 Target user and scenario are named — blocker
- PC-PRODUCT-004 Product goal and expected outcome are stated — blocker
- PC-PRODUCT-005 Success metric + baseline + target are defined — blocker
- PC-PRODUCT-006 In-scope and out-of-scope are both explicit — blocker
- PC-PRODUCT-007 Dependencies listed — major
- PC-PRODUCT-008 Constraints recorded (platform, budget, time, regulatory) — major
- PC-PRODUCT-009 Key design decisions explainable by PM without re-asking the Agent — major

### PC-UX (applies to user-facing requirements)

- PC-UX-001 Main flow defined: entry → main flow → completion → exit — blocker
- PC-UX-002 States defined: empty, loading, success, error — major
- PC-UX-003 Failure states defined: network failure, retry, timeout — major
- PC-UX-004 Access states defined: permission denied, unauthorized, disabled, expired — major (or N/A with reason)
- PC-UX-005 Destructive operations defined: confirm, cancel, delete, undo, duplicate action, back navigation — major
- PC-UX-006 Compatibility scope explicit (OS, platforms, screen sizes, versions) — major
- PC-UX-007 Accessibility requirements stated or explicitly deferred — minor

Principle: checks verify not only the happy path but "what the user sees and can do in every non-happy state".

### PC-DATA (applies to requirements that create, modify, or display data)

- PC-DATA-001 Data entities and fields defined (name, type, required/optional, default) — blocker
- PC-DATA-002 Ownership and lifecycle defined (created by, modified by, read by, deleted by, when it becomes invalid) — major
- PC-DATA-003 Validation rules defined — major
- PC-DATA-004 Relationships and consistency behavior across entities defined — major
- PC-DATA-005 Migration path for existing data defined (or N/A: new feature only) — major
- PC-DATA-006 Retention and deletion behavior defined — major

### PC-TECH (applies before development starts)

- PC-TECH-001 API surface defined: requests, responses, error codes — blocker (or N/A for client-only changes)
- PC-TECH-002 Auth and authorization per endpoint defined — blocker
- PC-TECH-003 Third-party service dependencies named, with failure behavior — major
- PC-TECH-004 Concurrency / rate limit / timeout / retry / idempotency defined where applicable — major
- PC-TECH-005 Rollout strategy (grayscale / feature flag) and rollback defined — blocker
- PC-TECH-006 Chain check: requirement → API → data → client → server → third-party, each hop covered — major

### PC-AI (applies to AI-powered features)

- PC-AI-001 Model and provider defined — blocker
- PC-AI-002 Input, output, and context defined — blocker
- PC-AI-003 Tools callable and their permissions defined — major
- PC-AI-004 Memory / knowledge scope defined (what is stored, for how long) — major
- PC-AI-005 Cost model and quota defined — major
- PC-AI-006 Failure strategy defined: model failure, timeout, malformed output — blocker
- PC-AI-007 Degradation / fallback defined — blocker
- PC-AI-008 Human-confirmation points defined where the AI acts — major
- PC-AI-009 Call logging and per-user usage tracking defined — major

### PC-AGENT (applies to in-product Agents)

- PC-AGENT-001 Identity defined (what the Agent is, what it is not) — blocker
- PC-AGENT-002 Permission boundary defined (can do / cannot do) — blocker
- PC-AGENT-003 Tool and data access lists defined — blocker
- PC-AGENT-004 Memory scope and retention defined — major
- PC-AGENT-005 Execution scope defined; user-authorization points listed — blocker
- PC-AGENT-006 Audit fields defined: who triggered, what the Agent did, which tools were called — major
- PC-AGENT-007 Human-takeover conditions defined — blocker
- PC-AGENT-008 Exception handling defined: tool failure, permission failure, timeout, invalid output, model failure — major

### PC-BILLING (applies to any monetized capability)

- PC-BILLING-001 Plan / subscription model defined — blocker
- PC-BILLING-002 Billing unit and quota defined — blocker
- PC-BILLING-003 Deduction timing defined; behavior on request failure / timeout defined — blocker
- PC-BILLING-004 Insufficient balance and overage behavior defined — blocker
- PC-BILLING-005 Expiration, renewal, and cancellation behavior defined — major
- PC-BILLING-006 Refund behavior defined, including what happens to quota after refund — blocker
- PC-BILLING-007 Duplicate-charging prevention (idempotency) defined — blocker
- PC-BILLING-008 Reconciliation defined — major

### PC-SECURITY (applies to all formal requirements; deeper for AI / payment / user-data / community / IM)

- PC-SECURITY-001 Authentication and session handling defined — blocker
- PC-SECURITY-002 Authorization (who can do what, incl. data-level) — blocker
- PC-SECURITY-003 Sensitive / personal data handling: encryption, retention, deletion — major
- PC-SECURITY-004 Logging and audit requirements defined — major
- PC-SECURITY-005 Abuse / moderation / risk-control rules defined where user-generated content or money is involved — major
- PC-SECURITY-006 Platform rules and regulatory constraints listed — major

Auto-trigger rule: requirement touches AI + payment, AI + user data, AI Agent, AI + community, or AI + IM → run the full PC-SECURITY matrix, not just applicable items.

### PC-TEST (applies at `defined` and later)

- PC-TEST-001 Every acceptance criterion has at least one test case — blocker
- PC-TEST-002 Coverage matrix: normal, exception, edge, permission, empty/loading, network, retry, concurrency, compatibility, security, billing, AI-failure, data-consistency — major
- PC-TEST-003 Traceability: requirement → acceptance criteria → test case → execution evidence — blocker
- PC-TEST-004 Execution evidence labeled `actually-executed` or `human-verified` for anything gating `released` — blocker

### PC-RELEASE (applies at `approved` → `released`)

- PC-RELEASE-001 Requirement approved (pool status) — blocker
- PC-RELEASE-002 Development changes synced back to product context — blocker
- PC-RELEASE-003 Acceptance passed with labeled evidence — blocker
- PC-RELEASE-004 Regression passed — major
- PC-RELEASE-005 Critical bugs resolved — blocker
- PC-RELEASE-006 Release configuration confirmed — major
- PC-RELEASE-007 Monitoring ready — major
- PC-RELEASE-008 Rollback ready — major
- PC-RELEASE-009 Release evidence is `actually-executed` or `human-verified`; AI-inferred completion **never** satisfies this — blocker

### PC-METRICS (applies to all P0/P1 requirements)

- PC-METRICS-001 Goal → metric → baseline → target chain complete — blocker
- PC-METRICS-002 Event definitions and tracking plan exist — major
- PC-METRICS-003 Dashboard / review cadence and owner defined — major
- PC-METRICS-004 Anomaly response defined (what happens when the metric moves unexpectedly) — minor

## PC-CONSIST (cross-document, runs after all scoped matrices)

- PC-CONSIST-001 Status invariant: pool is the only status source; any view showing a different status = FAIL
- PC-CONSIST-002 Scope invariant: version scope contains only `approved`/`released` requirements
- PC-CONSIST-003 Decision invariant: reflected changes have decision-log entries
- PC-CONSIST-004 Acceptance invariant: `defined`+ requirements have checkable acceptance criteria
- PC-CONSIST-005 Evidence invariant: `released` has actually-executed / human-verified evidence

See `source-of-truth.md` for the full invariants and resolution rule (the pool / source of truth always wins).

## PC-GATE (stage gate readiness)

A stage gate passes when **all blocker-severity checks in scope are PASS or N/A (with reason)**, and no FAIL or UNKNOWN blocker remains. A FAIL or UNKNOWN blocker makes the gate **BLOCKED** unless a human records an explicit exception with reason + accepted risk (record in `decision-log.md`).

Gates:

| Gate | Must be PASS |
|------|-------------|
| candidate → analyzing | PC-PRODUCT-001, PC-PRODUCT-003 registered |
| analyzing → defined | PC-PRODUCT (all), PC-UX/DATA/TECH/AI/AGENT/BILLING/SECURITY as scoped (all blockers), PC-CONSIST-004 |
| defined → approved | Human review recorded; PC-TEST-001/003; PC-GATE blockers all PASS/N/A |
| approved → released | PC-RELEASE (all blockers), PC-CONSIST-005 |
| released → closed | Feedback collected or explicitly closed |

## Completeness Report

Output format: `assets/templates/completeness-report.md`. The report ends with an overall verdict: `READY` / `BLOCKED` / `PARTIAL`, the counts by result, the blocker list, and a human-confirmation block. **The report is a draft until the human confirms it; only confirmed conclusions are written into permanent files** (consistent with the stage-gate protocol in `SKILL.md`).

## Change Impact Analysis

When an approved requirement changes, run the impact trace before applying (feeds `change-management.md`):

```
requirement change
  → affected PRD / spec
  → affected API
  → affected data
  → affected UI
  → affected tests
  → affected version scope
  → affected metrics / tracking
  → affected documentation
```

Classify each target `Changed` / `Affected` / `Not affected` / `Unknown`. `Unknown` items are UNKNOWN findings in the next completeness report.

## Regression

Fixed regression cases live in the project's `03-planning/ai-regression-cases.md` (template: `assets/templates/ai-regression-cases.md`). Each case names its expected check results; re-run whenever the check rules, models, or workflow change. A case whose results change is a regression and blocks the change from being treated as an improvement (see `quality-gates.md`).
