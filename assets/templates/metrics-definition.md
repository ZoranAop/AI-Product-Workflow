# Metrics Definitions

Record explicit metric definitions so goals are verifiable. One block per metric.

## Template

```
Metric name:
Metric definition:
How it is computed:
Data source:
Statistical period:
Current baseline (at approval time):
Target value:
Guardrail metric (if any):
```

## Rules

- A goal like "increase user activity" is not valid without a computation, source, period, and target.
- Baselines are recorded at approval time and are not retroactively moved.
- After release, compare actuals against baselines in the version's `release-metrics.md`.

## Examples

<Fill in one block per metric used by active requirements.>

```
Metric name: <…>
Metric definition: <…>
How it is computed: <…>
Data source: <…>
Statistical period: <…>
Current baseline: <…>
Target value: <…>
Guardrail metric: <…>
```
