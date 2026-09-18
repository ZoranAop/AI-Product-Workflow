# Project Understanding (Mode: Understand)

Entry point before any check or workflow run on an unfamiliar project. Answers: **what is this project?** Produces a short, evidence-labeled understanding summary. It is a *draft* until the human confirms it; it never silently becomes formal fact.

## When to Run

- First contact with a project (or first contact after > N weeks)
- Before running any completeness / consistency check (so checks are scoped to what the project actually is)
- After a large change, to refresh understanding

## Protocol

```
1. Read 00-rules/, 02-product/, 04-requirement-pool/, 06-versions/ (or project equivalents)
2. Read the active requirement(s) and their specs
3. Produce an Understanding Summary (template below)
4. Label every factual claim VERIFIED / ASSUMED / INFERRED / UNVERIFIED
   (per evidence-and-confidence.md — unconfirmed claims in a summary are drafts, not facts)
5. List "Unknowns" — questions whose answers are not in the project context
6. Wait for human confirmation before the summary may be cited as context
```

## Understanding Summary Template

```markdown
# Project Understanding — <project> — <date>

## One-line description
<what the product is, for whom>  (source: ...)

## Goal & success metric
<problem, goal, baseline/target>  (VERIFIED / ASSUMED / ...)

## Active scope
<version + requirements in flight, status from pool>  (VERIFIED)

## Key rules
<top 3–5 product rules / billing / permission facts the Agent must know>  (source + evidence level)

## Known unknowns
- <question whose answer is not in the project context>

## Confidence
- Facts relied on: X VERIFIED, Y ASSUMED, Z INFERRED
- Weakest area: <...>
```

## Rules

- The summary is a **derived view**. It cites the pool, 02-product, and decision-log; it must not introduce new product facts.
- Any claim the Agent inferred (not read from a source of truth) must be labeled INFERRED and goes into "Known unknowns" as a question, not as a fact.
- Confirmation is recorded in the decision log: `<date> — project understanding confirmed by <human>, confidence <summary>`.
- When the human later corrects a claim, update the underlying source of truth (not just the summary) and re-run the summary.

## Relation to Other Modes

```
Understand → (context) → Completeness / Consistency / Change Impact
```

Checks are always scoped to the confirmed understanding. An understanding with a high INFERRED ratio makes most checks return UNKNOWN — that is correct behavior, not a bug.
