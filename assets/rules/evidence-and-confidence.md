# Evidence and Confidence Rules

Distinguish what is verified from what is inferred.

## Evidence Hierarchy (market data)

1. Official data (government / regulator publications)
2. Company financial reports
3. Official product documentation
4. Authoritative industry reports
5. Third-party research
6. Media coverage
7. Community discussion

Key numbers must carry a verifiable source at level 1–5 wherever possible.

## Four-Level Evidence Model

Every claim or check result in project files must be traceable to one of:

- **VERIFIED** — has a checkable source; record the source link or file. Includes human-confirmed decisions (record in `decision-log.md`).
- **ASSUMED** — a deliberate, explicitly recorded inference or hypothesis; marked with a date so it can be revisited.
- **INFERRED** — content produced by an Agent by reasoning, without a checkable source. **An inference is never a product fact.** It may flow freely in drafts and analyses, but the moment it is written into a PRD, a formal rule, or version scope it must first become VERIFIED or ASSUMED through human confirmation.
- **UNVERIFIED / pending** — a useful candidate fact; mark it "pending verification" and do not treat it as a product fact.

## Judgment Rules for Check Results

Completeness checks produce one of four results: `PASS` / `FAIL` / `UNKNOWN` / `N/A` (see `completeness-check.md`).

| Situation | Result | Rationale |
|-----------|--------|-----------|
| Sufficient evidence in a source of truth | PASS | — |
| Two formal sources contradict each other | FAIL | Conflict is a defect |
| Required information simply does not exist anywhere | UNKNOWN | Absence of evidence is not evidence of absence |
| Capability explicitly confirmed as not applicable | N/A | Must record the reason |
| Only an Agent inference exists where a fact is required | UNKNOWN (or FAIL if the inference was written into a formal file) | Inferences do not count as evidence |

## The "AI Inference → Formal Fact" Firewall

Prevent this chain:

```
Agent inference → written into PRD → PRD treated as formal fact → later Agents rely on it as a real requirement
```

Rule: any content in a formal file (PRD, rule, version scope, billing spec) must be labeled VERIFIED or ASSUMED at the point of confirmation. If a human confirmed it, label VERIFIED with confirmer + date. If the human accepted it "for now", label ASSUMED with the revisit condition. Unlabeled content in a formal file is a **FAIL** finding.

## Rules

1. Never present an Agent inference as a user fact. The chain is:
   `user fact → user feedback → analysis → product hypothesis` — each step must stay labeled.
2. Product facts in `02-product/` must be VERIFIED or explicitly ASSUMED with a date.
3. When an assumption is later confirmed or invalidated, update it in place with the new status and the reason.
4. "Result without reason" is a defect: any conclusion in a permanent file must have its supporting evidence or reasoning recorded.
