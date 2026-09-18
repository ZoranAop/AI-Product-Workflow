# Market and User Research

## Market Analysis

Agent may:
- Search market data
- Organize industry figures
- Analyze competitors
- Extract trends
- Compare product features
- Build candidate hypotheses

### Source Priority for Key Numbers

1. Official data
2. Company financial reports
3. Official product documentation
4. Authoritative industry reports
5. Third-party research
6. Media coverage
7. Community discussion

Ask multiple models when available; collect candidates. Unverified claims must be marked "pending verification" and never enter `02-product/` as fact. Final judgment stays with the human.

## User Research

Agent may help:
- Organize interviews
- Extract user quotes
- Classify problems
- Identify repeating patterns
- Build problem hypotheses

But keep the chain labeled — never collapse it:

```
user fact
  ↓
user feedback
  ↓
analysis conclusion
  ↓
product hypothesis
```

An Agent inference is a hypothesis, not a user need. The product manager owns the internal truths the Agent cannot see (leader intent, engineering constraints, internal priorities) and must inject them continuously.

## Forced Question

After every research round ask: **"What important context still exists only in someone's head?"** and write it down.
