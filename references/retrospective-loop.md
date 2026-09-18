# Retrospective Loop

The version-end and post-incident reflection step that feeds learning back into the workflow itself. It closes the loop:

```
Actual results → Retrospective → Rule / Skill proposals → change-management gate + regression re-run → next cycle
```

## When to Run

- End of every version (the five questions in `version-iteration.md`)
- After any significant incident (data loss, billing error, security event)
- When the same class of mistake appears a second time (repeat defects are a system defect, not a personal one)

## Inputs

- Version goals vs actual metric results (`product-goals-metrics.md`, `07-reviews/`)
- Completeness / consistency reports from the cycle (which checks would have caught each defect, if any)
- Agent quality indicators from `quality-gates.md` (human-edit ratio, miss rates, cost)
- Decision log entries made during the cycle

## Protocol

```
1. Answer the five version questions (version-iteration.md)
2. Classify every defect / surprise: caught by an existing check? missing check? failing check? rule not followed?
3. Propose one of:
   a. New / amended check item (PC-* ID, with expected result on a real case)
   b. Rule amendment (which rule file, what changes, why)
   c. Regression case added (03-planning/ai-regression-cases.md)
   d. No change needed (record why — prevents rule bloat)
4. Proposals are drafts. Rule / check amendments go through change-management.md (recorded decision + human confirm) and are only applied after the regression set re-runs clean.
5. Write the retrospective into 07-reviews/; rule-level conclusions into decision-log.md.
```

## Rules

- **A proposal to change `assets/rules/` or `SKILL.md` is a formal baseline change.** It is never applied silently. The decision log entry names: what changed, why, which case triggered it, and the regression run that validated it.
- **Repeat-defect rule**: if the same defect class appears twice, a check for it is mandatory before the next version starts — not "suggested".
- **Anti-bloat rule**: every retrospective must explicitly consider option (d) "no change needed". Rules grow only when a concrete, repeated, evidence-backed failure exists; not when something "seemed off".
- Feedback from production (bug, missing requirement, UX, performance, business, content, data, AI output) is registered into `01-inputs/` and then flows into the pool as new candidates (per `release-feedback.md`).

## Output Shape

```markdown
# Retrospective — <version> — <date>
1. Goal vs result
2. Defect / surprise classification (check-missed / check-failed / rule-not-followed / new-class)
3. Proposals (each: target, change, trigger case, regression result)
4. No-change-needed items (with reasons)
5. New candidates registered into the pool
6. Human confirmation: <name>, <date>
```
