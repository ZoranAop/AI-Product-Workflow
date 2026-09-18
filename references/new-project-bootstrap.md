# New Project Bootstrap (First Two Weeks)

Use this when starting a new product project with the AI Product Workflow v1.1 suite. It is a 14-day checklist that assumes you have already run `scripts/init-product-project.sh --minimal`.

## Day 0 — Scaffold

- [ ] Run `bash scripts/init-product-project.sh --minimal <project-root>`
- [ ] Confirm `00-rules/` has the 4 core rule files and adapt them to the product (naming, status, source-of-truth, workflow)
- [ ] Confirm `01-inputs/`, `02-product/`, `05-requirements/` exist
- [ ] Register any existing materials in `01-inputs/source-register.md`

## Days 1–3 — Product Facts (before any requirement)

The biggest risk for a new project is starting the workflow with an empty `02-product/`. The single-source-of-truth principle has no constraint power on empty directories. Fill these first:

- [ ] `02-product/product-overview.md` — positioning, user roles, platform baseline
- [ ] `02-product/glossary.md` — shared terms, one row per term
- [ ] `02-product/product-goals.md` — product goal, user goal, business goal, core problem
- [ ] `02-product/user-segments.md` — who the product is for
- [ ] `02-product/metrics.md` — core metrics + guardrail metrics, each with: definition, computation, data source, statistical period, current baseline, target value

Rule: a goal like "increase user activity" without a computation, source, period, and target is not valid. See `references/product-goals-metrics.md`.

## Days 4–5 — First Candidate Requirements

- [ ] Add 3–5 candidate requirements to `04-requirement-pool/requirement-pool.md` (status: candidate, priority: P0–P3 with justification)
- [ ] Each candidate has a one-line problem statement and a target user / scenario

## Days 6–8 — Analyze One Requirement End-to-End

Pick the most important P0 requirement and run it through the full stage chain as a dry run:

- [ ] Market / user research for this requirement → mark unverified claims "pending verification"
- [ ] Requirement analysis: Agent expands, PM subtracts using `references/decision-checklist.md`
- [ ] Technical feasibility check (see `references/requirement-analysis.md`)
- [ ] Draft the PRD at the right tier (`references/dual-prd-spec.md`): small → requirement card; regular → human PRD + structured fields; complex → full dual PRD + Agent-readable spec
- [ ] Prototype with design constraints provided first (`references/prototype-design.md`)
- [ ] Stage confirmation summary → human confirmation → write into permanent files

## Days 9–10 — Review & Decision Recording

- [ ] Hold a review; record decision + background using `assets/templates/review-record.md`
- [ ] Append to `03-planning/decision-log.md` (create it if minimal mode did not)
- [ ] Record rejected options and "reconsider if" conditions

## Days 11–12 — Test & Acceptance Plan

- [ ] Generate test cases (Agent-assisted); label results `AI-inferred` / `actually-executed` / `human-verified`
- [ ] Define launch verification criteria for this requirement

## Day 13 — Project Health Check

Run `references/health-check.md`. For a 2-week-old project, focus on:

- [ ] Are the `02-product/` facts still accurate and not yet outdated?
- [ ] Does the requirement pool status match reality?
- [ ] Are decision backgrounds complete?
- [ ] Is there any "result without reason"?

## Day 14 — Decide: Stay Minimal or Go Full

Move to full setup when **all three** are true:

1. The requirement pool has 3+ active requirements.
2. The team is using 2+ Agents sharing context.
3. At least one requirement has entered development and needs a version plan.

When switching:

- [ ] Run `bash scripts/init-product-project.sh --minimal` was done; now create `03-planning/`, `06-versions/`, `07-reviews/`, `90-assets/`, `99-archive/`
- [ ] Add the 4 extra rule files to `00-rules/`: `agent-permissions.md`, `evidence-and-confidence.md`, `quality-gates.md`, `change-management.md`
- [ ] Create `03-planning/decision-log.md`, `03-planning/problem-space.md`, `03-planning/ai-regression-cases.md`
- [ ] Create `06-versions/v<major>.<minor>/{release-plan,scope,rollout-plan,release-metrics}.md`
- [ ] Set up `07-reviews/agent-audit-log.md`

## What to Skip for a Purely Functional (Non-AI) Product

If the new product is not itself AI-powered:

- Skip `references/ai-product-rules.md` (AI capability / Agent / billing sections)
- Skip `references/multi-agent.md` if a single Agent is sufficient
- Treat `references/skill-ecosystem.md` and `assets/templates/skill-integration-plan.md` as reference-only; install nothing unless needed

## Anti-Patterns at Bootstrap

- Starting the workflow with an empty `02-product/` and jumping straight to requirements.
- Defining goals without metric baselines.
- Forcing full dual PRDs on every trivial requirement.
- Adopting the full directory set on day 1 for a project that only has 1–2 requirements.
- Treating Agent output as fact before source verification.
