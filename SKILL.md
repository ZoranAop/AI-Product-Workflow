---
name: ai-product-workflow
version: 1.1.1
status: stable
license: MIT
description: Guide product managers to run full product cycles with AI Agents — project init, market analysis, requirement research, analysis, prototype, PRD, review, development sync, testing, release, feedback loop, plus Agent permissions, output quality gates, and version iteration. Use when user wants to initialize a product project scaffold, let Agent join end-to-end product work, build long-term product context, or apply AI product manager workflow.
---

# AI Product Workflow

Enable an AI Agent to participate in the complete product lifecycle as a long-term collaborator, not a one-off tool. Core principle: maintain persistent, accurate project context so the Agent can work from market analysis through release and feedback without repeated re-explanation.

## When to Use

- User asks to initialize a product project for AI collaboration
- User wants Agent involvement from requirement to launch
- User mentions product project init, full-process participation, building Agent project space, or AI product manager workflow
- Starting a new feature or version that needs sustained context
- Multiple Agents need to share one product knowledge base
- User needs AI assistance across market, user, competitor, and requirement analysis
- User needs decision and change records with traceability

## Core Principles (Five Methods)

1. **Sufficient context**: When results are wrong, first check missing background rather than blaming the model. Agent capability is bounded by context completeness.
2. **Constraint and subtraction**: AI naturally expands (exceptions, edge cases, extra pages, extra validation). Product manager must deliberately cut what does not justify its complexity.
3. **Slow down first**: Generation cost approaches zero; thinking cost must not. Clarify intent before asking Agent to accelerate.
4. **Single source of truth**: Each category of product fact has exactly one maintenance location. Other files reference, never copy.
5. **Unconfirmed is not formal fact**: Drafts, analyses, and meeting notes may be auto-recorded, but unconfirmed content never becomes a formal product rule, approved requirement, or version scope.

## Human-AI Division of Labor

| Responsibility | Product Manager | AI Agent |
|----------------|-----------------|----------|
| User interviews | Lead | Organize, analyze |
| Internal business context | Provide | Structure |
| Market research | Judge conclusions | Search, organize, analyze |
| Competitor analysis | Final judgment | Collect and compare |
| Problem definition | Own | Assist |
| Requirement expansion | Review | Drive initial expansion |
| Requirement subtraction | Own | Suggest |
| Prioritization | Own | Provide evidence |
| Prototype | Review | Generate / modify |
| PRD | Final confirmation | Generate / structure |
| Technical approach | Work with engineering | Analyze and organize |
| Test cases | Review | Generate |
| Launch verification | Final responsibility | Assist execution |
| Metrics analysis | Judge | Organize data |
| Final product decision | **Own** | Does not own |

Agent handles information and execution; product manager owns goals, trade-offs, decisions, and final accountability.

## Workflow Overview

```
Init Project Space
  → Product Goals & User Problem
  → Market & User Research
  → Requirement Analysis & Prioritization (AI adds, PM subtracts)
  → Technical Feasibility
  → Prototype (with design constraints)
  → PRD / Structured Requirement (tiered by size)
  → Review (record decisions + background)
  → Engineering Breakdown & Development Sync
  → Test and Acceptance
  → Release & Metric Monitoring
  → User Feedback → Retrospective → next cycle
```

This is a continuous loop, not a linear waterfall. Completed stages feed their outcomes back into project context for the next cycle.

## 1. Project Initialization (Scaffold)

Run the initialization script first:

```bash
bash scripts/init-product-project.sh [project-root]           # full setup (default)
bash scripts/init-product-project.sh --minimal [project-root] # minimal setup
```

If the script is unavailable, manually create the directory structure and core rule files described in `references/directory-structure.md` and `assets/rules/`.

After initialization:

- Place existing product materials into `01-inputs/` and register them in `source-register.md`.
- Fill stable product facts into `02-product/`.
- Confirm the core rule files in `00-rules/` are present and adapted to the product.

## 2. Stage-by-Stage Instructions

### Product Goals & Metrics
Before diving into individual requirements, define product goal, user goal, business goal, core problem, success criteria, core metrics, and guardrail metrics. See `references/product-goals-metrics.md`.

### Market Analysis
- Ask multiple models if possible; collect candidates.
- Require every key number to have a verifiable source (official data, financial report, industry report, tracking site).
- Mark unverified claims clearly. Final judgment stays with human.
- Source priority: official data > financial reports > official docs > industry reports > third-party research > media > community. See `references/market-user-research.md`.

### Requirement Research
- Agent handles public information.
- Product manager must continuously inject internal truths into the project.
- Force the question: "What important context still exists only in someone's head?"
- Keep the chain labeled: user fact → user feedback → analysis → product hypothesis. An Agent inference is a hypothesis, not a user need.

### Requirement Analysis & Prioritization
- Let Agent expand fully (validations, partial failures, error messages, edge states, permissions, empty/loading/error states, network failures, retries, data consistency, compatibility, security).
- Apply subtraction using the checklist in `references/decision-checklist.md`.
- Classify priority P0–P3 with justification (user value, business value, frequency, cost, risk, strategy, data).
- Every retained key design must be explainable by the product manager without asking the Agent again.
- See `references/requirement-analysis.md`.

### Technical Feasibility
Before development, check technical dependencies, APIs, data structures, database changes, third-party services, client compatibility, performance, security, data migration, rollout (grayscale), and rollback. Agent can analyze and draft; engineering confirms the final approach.

### Prototype
- Always supply design constraints first (component library, existing pages, interaction rules, platform guidelines, reference products).
- Without constraints the prototype looks good in isolation but fails to fit the real product.
- See `references/prototype-design.md`.

### PRD / Structured Requirement (Tiered by Size)
Do not force two fully independent PRDs on every requirement. Choose the tier:
- **Small**: requirement card + acceptance criteria.
- **Regular**: human-readable PRD + structured fields.
- **Complex**: full PRD + Agent-readable spec + test cases + technical constraints.

Agent-readable specs use the structured skeleton in `assets/templates/dual-prd-skeleton.md`. Details in `references/dual-prd-spec.md`.

### Review and Decision Recording
- After every review, write both the decision and its background (when, which meeting, why, rejected options, impact) back into the project.
- Use the template in `assets/templates/review-record.md` and append to `03-planning/decision-log.md`.
- Never only tell the Agent "delete this feature". Always record the reason so it can be retrieved months later.
- See `references/review-decisions.md`.

### Development Sync
- Any scheme change during development must be written back (product rules, APIs, data structures, interaction, technical constraints, scope).
- If context is stale, Agent capability becomes useless.
- See `references/dev-testing.md` and `assets/rules/change-management.md`.

### Test, Launch, Feedback
- Agent can assist verification (Computer Use / browser checks) and generate test cases.
- Test results must be labeled `AI-inferred` / `actually-executed` / `human-verified`; `released` requires actually-executed or human-verified evidence.
- Final usability and business-goal judgment remain human.
- Continuously feed user feedback, online issues, and deferred items back into the project so they become input for the next version. Classify feedback: bug, missing requirement, UX, performance, business, content, data, AI output.
- See `references/release-feedback.md`.

## 3. Stage Gate Protocol (Mandatory)

At the end of each major stage:

1. Agent produces a short confirmation summary.
2. Wait for explicit human confirmation ("确认" / "OK" / requested changes).
3. Only after confirmation write the conclusion into the permanent project files.
4. Never silently overwrite source-of-truth files.

Formal product baseline (rules, approved requirements, version scope, core business logic, billing, permissions, security) requires human confirmation; drafts and analyses may flow freely but must carry a status marker. See `assets/rules/quality-gates.md`.

## 4. Agent Permissions & Security

Permission levels (L0 read-only → L1 draft write → L2 project write → L3 external execution → L4 production). Default new project level is L1. L3/L4 require explicit human authorization and audit. Never allow Agent to modify billing rules, permissions, or delete production data without authorization. See `assets/rules/agent-permissions.md`.

## 5. AI Output Quality

Judge not only "did the Agent produce output" but "is it trustworthy". Track task completion, accuracy, fact-error rate, requirement/edge miss rate, human-edit ratio, tool-call error rate, cost, and latency. Maintain a fixed AI regression test set and re-run on model or workflow changes. See `assets/rules/quality-gates.md` and `references/multi-agent.md` for auto-execution vs human-approval boundaries.

## 6. Project Health Check

Periodically or at version end, run a health check:

- Are there outdated facts still treated as current?
- Do requirement statuses match reality?
- Is each formal rule maintained in exactly one place, with no conflicting rules?
- Are decision backgrounds complete?
- Is there any "result without reason" situation?
- Are there requirements without acceptance criteria?
- Are there documents changed but not synced?
- Can the Agent still correctly understand core product rules?
- Are there Agent operations that exceeded their permission level?

See `references/health-check.md` for the checklist.

## 7. Version Iteration

Every version forms a closed loop: goal → problem → requirement → decision → development → testing → release → metrics → feedback → retrospective → next version. End-of-version, answer five questions: (1) what problem did we set out to solve? (2) what did we actually do? (3) do users actually use it? (4) did the result meet expectations? (5) what should change next? See `references/version-iteration.md`.

## 8. AI-Product Specific Rules

For products that are themselves AI-powered, define per AI feature: model, input, output, context, tools, permissions, cost, latency, failure strategy, degradation strategy. For in-product Agents define identity, permissions, tools, data access, memory scope, execution scope, user authorization, logs, exception handling, and human takeover. For AI billing define billing unit, quota, deduction timing/failure, insufficient balance, retry, refund, plan state, expiry, renewal, reconciliation — and treat billing rules as formal product baseline that Agents must not modify without authorization. See `references/ai-product-rules.md`.

## 9. Minimal vs Full Setup

- **Minimal (start here)**: `00-rules/`, `01-inputs/`, `02-product/`, `05-requirements/` plus requirement status, basic decision recording, and basic acceptance criteria. Use `--minimal`.
- **Full**: Complete directory set (00–07, 90, 99), tiered PRD, full decision log, Agent permissions, AI quality gates, release plans, data retrospectives. Use default.

## Anti-Patterns to Avoid

- Treating Agent output as facts without source verification.
- Citing market data without a source.
- Letting Agent expand requirements without human subtraction.
- Treating Agent inferences as user needs.
- Recording only decision results, never reasons.
- Maintaining the same product rule in multiple files.
- Allowing Agent to modify formal product rules without authorization.
- Requirements without success metrics.
- Requirements without acceptance criteria.
- Development changes not synced back to product context.
- No data validation after release.
- Forcing a complex multi-Agent architecture on simple tasks.
- Forcing two independent PRDs on every requirement.
- Changing decisions in meetings but never writing the background back.
- Generating PRD or prototype before providing design or format constraints.
- Using the Agent as a pure messenger (PM asks Agent, then relays to engineering).

## Resource Map

- `scripts/init-product-project.sh` — one-command scaffold (`--minimal` or full)
- `references/directory-structure.md` — full directory responsibilities
- `references/context-layers.md` — four-layer knowledge model
- `references/status-machine.md` — status flow and gates
- `references/dual-prd-spec.md` — tiered PRD rules
- `references/decision-checklist.md` — subtraction and decision questions
- `references/health-check.md` — project health checklist
- `references/product-goals-metrics.md` — goals and metric definitions
- `references/market-user-research.md` — market and user research
- `references/requirement-analysis.md` — analysis, prioritization, feasibility
- `references/prototype-design.md` — prototype design constraints
- `references/review-decisions.md` — review and decision recording
- `references/dev-testing.md` — development sync and testing
- `references/release-feedback.md` — release and operations feedback
- `references/ai-product-rules.md` — AI product specific requirements
- `references/multi-agent.md` — multi-Agent collaboration patterns
- `references/version-iteration.md` — version iteration principles
- `references/new-project-bootstrap.md` — first-two-weeks checklist for a new product project
- `references/skill-ecosystem.md` — online skill ecosystem mapping (reference only, no installation)
- `assets/rules/` — copy-ready core rule templates (naming-and-structure, source-of-truth, status-and-gates, product-workflow, agent-permissions, evidence-and-confidence, quality-gates, change-management)
- `assets/templates/` — requirement pool + card, confirmation summary, tiered PRD skeleton, review record, decision log, metrics definition, skill integration plan
