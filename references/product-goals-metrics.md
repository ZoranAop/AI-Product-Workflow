# Product Goals and Metrics

Define goals before diving into individual requirements.

## Before a Requirement, Define

- Product goal
- User goal
- Business goal
- Core problem
- Success criteria
- Core metrics
- Guardrail metrics

## Minimum Per Requirement

```
Problem:
Why do it:

Target user:
Usage scenario:

Expected outcome:
Core metric:

Current baseline:
Target value:

Observation window:
```

## Metric Definitions Must Be Explicit

For every metric used in a goal, record:

```
Metric name:
Metric definition:
How it is computed:
Data source:
Statistical period:
Current baseline:
Target value:
```

Avoid unverifiable goals such as "increase user activity" without a computation, source, period, and target.

## Rules

- A requirement without a success metric and a baseline cannot be `approved`.
- Guardrail metrics prevent local optimization from harming the whole (e.g., raising engagement while degrading crash rate).
- Baselines are recorded at approval time; do not move them after the fact.
