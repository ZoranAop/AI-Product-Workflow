# Check Modes

The Agent operates the workflow in six modes. They share the same rules (`assets/rules/`) and produce evidence-labeled results. Modes are entry points, not separate systems — routing depends on the question being asked.

| Mode | Core question | Reference | Rules |
|------|---------------|-----------|-------|
| Understand | What is this project? | `references/project-understanding.md` | evidence-and-confidence |
| Advance (Product Workflow) | How should this project move forward? | `SKILL.md` stage instructions | all |
| Completeness | Is this project/requirement complete? | `assets/rules/completeness-check.md` § PC-* matrices | completeness-check |
| Consistency | Do the documents contradict each other? | `assets/rules/completeness-check.md` § PC-CONSIST + `source-of-truth.md` | completeness-check, source-of-truth |
| Change Impact | What does this change affect? | `assets/rules/completeness-check.md` § Change Impact Analysis | change-management |
| Retrospective | What did we learn, and what should change? | `references/retrospective-loop.md` | change-management, quality-gates |

## Routing Rules

1. **First contact / stale context → Understand first.** No check or advance work on an unconfirmed understanding.
2. **Completeness vs Consistency**: "missing something?" → Completeness (expect UNKNOWNs). "documents disagree?" → Consistency (expect FAILs). A full review runs both; the report has separate sections.
3. **Any change to a formal baseline → Change Impact first**, then Completeness on the affected scope, then the change-management gate.
4. **Version end → Retrospective**, which may propose rule changes — those go through the change-management gate + regression re-run, never directly into `assets/rules/`.

## Output Discipline (all modes)

- Every factual claim carries an evidence label (VERIFIED / ASSUMED / INFERRED / UNVERIFIED).
- Drafts (understanding summaries, completeness reports, impact traces) are **not formal facts** until the human confirms them.
- Only confirmed conclusions are written into permanent files (stage-gate protocol in `SKILL.md`).
