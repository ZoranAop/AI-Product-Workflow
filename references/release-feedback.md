# Release and Operations Feedback

Launch is not the end of the workflow. Observe after release:

- Core metrics
- User behavior
- Error logs
- User feedback
- Support tickets
- Performance
- Crashes
- Business anomalies

## Feedback Classification

```
Bug
Missing requirement
User experience issue
Performance issue
Business issue
Content issue
Data issue
AI output issue
```

## Feed-Back Loop

```
launch
  ↓
data
  ↓
feedback
  ↓
classification
  ↓
prioritization
  ↓
new requirement
  ↓
next version
```

Continuously feed user feedback, online issues, and deferred items back into the requirement pool or planning files so they become input for the next version.

## AI-Specific Observations

For AI features, additionally observe:
- Model failure modes observed in production
- Cost and latency in production vs. targets
- Quality drift after model or prompt changes
- User trust signals (corrections, overrides, drop-off)

These feed back into the AI regression test set and the quality gates (`assets/rules/quality-gates.md`).
