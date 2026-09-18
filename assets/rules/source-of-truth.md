# Source of Truth Rules

Core principle: every category of information has exactly one maintenance location. Other places only reference it; they never copy the content.

## Complete Mapping Table

| Information | Single Source | All Other Places |
|-------------|---------------|------------------|
| Requirement status | `04-requirement-pool/requirement-pool.md` | Derived view / reference only |
| Requirement detail (problem, scope, acceptance criteria) | The requirement's folder in `05-requirements/req-XXXX-name/` | Reference / summary only |
| Product facts (glossary, baseline, functional rules) | `02-product/` | Reference only |
| Cross-requirement decisions | `03-planning/decision-log.md` | Reference / summary only |
| Version scope | `06-versions/` | Reference only |
| Test evidence | Test records in `07-reviews/` | Reference only |
| Release evidence | Release records in `07-reviews/` | Reference only |
| Raw inputs | `01-inputs/` (registered in `source-register.md`) | Never edited after registration |

## Derived Views

Agent-readable specs (`prd-agent.md`) may **display** status and other pool fields for convenience, but they are derived views: the pool is always authoritative, and any discrepancy is resolved in favor of the pool.

## Cross-Document Consistency Check

When running a completeness check, verify these consistency invariants:

1. **Status invariant**: status shown anywhere (pool, spec, version doc) matches the pool. If pool says `approved` but PRD says `analyzing`, result = **FAIL**.
2. **Scope invariant**: version scope in `06-versions/` contains only requirements with status `approved` (or `released`). Including a `candidate` in a committed version scope = **FAIL**.
3. **Decision invariant**: any change reflected in a requirement or PRD has a corresponding entry in `decision-log.md`. Missing entry = **FAIL** (or **UNKNOWN** if the change may be informal and unrecorded).
4. **Acceptance invariant**: every requirement at status `defined` or later has checkable acceptance criteria in its requirement folder. Missing = **FAIL**.
5. **Evidence invariant**: status `released` has actual launch verification evidence in `07-reviews/` labeled `actually-executed` or `human-verified`. AI-inferred evidence does not satisfy this.

## Practical Rules

1. Before creating a new document, ask: "Does this information already have a home?"
2. When updating a fact, update the single source and leave a short note if needed.
3. Prefer links or clear references over duplication.
4. If duplication is temporarily unavoidable, mark the copies as "derived / not authoritative" and point to the source.
