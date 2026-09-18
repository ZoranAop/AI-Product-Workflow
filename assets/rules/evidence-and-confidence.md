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

## Confidence Markers

Every claim in project files must be traceable to one of:

- **Verified** — has a checkable source; record the source link or file.
- **Assumed** — an inference; record the assumption explicitly so it can be revisited.
- **Unverified / pending** — a useful candidate fact; mark it "pending verification" and do not treat it as a product fact.

## Rules

1. Never present an Agent inference as a user fact. The chain is:
   `user fact → user feedback → analysis → product hypothesis` — each step must stay labeled.
2. Product facts in `02-product/` must be verified or explicitly marked as assumptions with a date.
3. When an assumption is later confirmed or invalidated, update it in place with the new status and the reason.
4. "Result without reason" is a defect: any conclusion in a permanent file must have its supporting evidence or reasoning recorded.
