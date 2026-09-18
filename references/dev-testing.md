# Development and Testing

## Development Sync

Any change affecting product behavior must be written back into the project context:
- Product rule changes
- API changes
- Data structure changes
- Interaction changes
- Technical constraints
- Requirement scope changes

Stale context makes Agent capability useless.

## Testing

Agent may assist generating:
- Functional tests
- Boundary tests
- Exception tests
- Permission tests
- API tests
- UI tests
- Regression tests

But test results must be labeled one of:

```
AI-inferred
actually-executed
human-verified
```

A "passing" AI-generated test case without execution is not acceptance evidence. `released` requires actually-executed or human-verified evidence, not just "code merged".

## Launch Verification

- Agent can assist verification (Computer Use / browser checks).
- Final usability and business-goal judgment remain with the human.
