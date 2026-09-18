# Quality Gates for AI Output

Do not evaluate Agent work only by "did it produce output". Judge whether the output is trustworthy.

## Quality Indicators

Track these when Agent output is reused or relied upon:

| Indicator | Meaning |
|-----------|---------|
| Task completion rate | Did the Agent finish the assigned task |
| Accuracy rate | Are the contents correct |
| Fact-error rate | Are there false facts |
| Requirement-miss rate | Are key requirements missing |
| Edge-case-miss rate | Are edge cases missing |
| Human-edit ratio | How much had to be fixed by hand |
| Tool-call error rate | Did the Agent use tools correctly |
| Cost / latency | What the task consumed |

## AI Regression Test Set

Maintain a fixed set of cases in `03-planning/ai-regression-cases.md` (or similar):

```
Case 001: Normal requirement analysis
Case 002: Complex permission requirement
Case 003: Billing rule
Case 004: Exception flow
Case 005: Conflicting historical rules
Case 006: Insufficient information
```

Re-run the set whenever the model or the Agent workflow changes. Record results with the date and the model/Agent version.

## Gate Rules

- Draft-quality output may flow freely into drafts and analyses.
- Before output enters a formal product baseline, it must pass a human review against the indicators above.
- Test results must be labeled as one of: `AI-inferred`, `actually-executed`, `human-verified`.
- A failing regression case blocks workflow/model changes from being treated as "improvements" until fixed.
