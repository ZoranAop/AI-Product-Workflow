# Directory Structure and Responsibilities

Numbered prefixes ensure natural workflow order when sorted by name.

## Top-Level Directories

```
00-rules/                 # Rules and templates (how we work)
01-inputs/                # Raw inputs (discussions, docs, screenshots, external materials)
02-product/               # Stable product facts (glossary, background, platform baseline, design system)
03-planning/              # Cross-requirement planning (problem space, module map, decision log)
04-requirement-pool/      # Requirement pool (candidate registration and status tracking)
05-requirements/          # Individual requirement work packages (one subdir per req)
06-versions/              # Version management (goals, scope, milestones)
07-reviews/               # Reviews, acceptance records, retrospectives
90-assets/                # Shared assets (demos, prototype screenshots)
99-archive/               # Closed or outdated materials
```

## Naming Conventions

- Markdown files: lowercase kebab-case (`problem-space.md`, `decision-log.md`)
- Date-prefixed materials: `YYYY-MM-DD-<topic>`
- Requirement directories: `req-<4-digit-number>-<english-short-name>` (e.g. `req-0001-route-management`)
- Version directories: `v<major>.<minor>`

## Key Rules

- Each category of information has exactly one maintenance location (source of truth). Other places only reference, never copy.
- Status lives only in the requirement pool.
- Raw inputs must be registered before being treated as formal requirements.
- Stage conclusions require human confirmation before being written to permanent files.
- Unconfirmed content may exist as drafts but must carry a status marker and is never treated as formal fact.

## Recommended Substructure (Full Setup)

```
00-rules/
├── naming-and-structure.md
├── source-of-truth.md
├── status-and-gates.md
├── product-workflow.md
├── agent-permissions.md
├── evidence-and-confidence.md
├── quality-gates.md
└── change-management.md

01-inputs/
├── interviews/
├── meeting-notes/
├── competitor/
├── research/
├── screenshots/
├── feedback/
└── source-register.md

02-product/
├── product-overview.md
├── product-goals.md
├── metrics.md
├── user-segments.md
├── glossary.md
├── product-rules.md
├── design-system.md
└── system-constraints.md

03-planning/
├── problem-space.md
├── opportunity-map.md
├── module-map.md
├── decision-log.md
├── experiment-plan.md
├── technical-dependencies.md
└── ai-regression-cases.md

04-requirement-pool/
└── requirement-pool.md

05-requirements/
└── req-0001-example/
    ├── requirement.md
    ├── prd-human.md
    ├── prd-agent.md
    ├── acceptance-criteria.md
    ├── test-cases.md
    ├── technical-notes.md
    ├── evidence.md
    └── change-log.md

06-versions/
└── v1.0/
    ├── release-plan.md
    ├── scope.md
    ├── rollout-plan.md
    └── release-metrics.md

07-reviews/
├── decision-log.md
├── confirmation-summary.md
├── quality-review.md
├── agent-audit-log.md
└── retrospective.md
```

Substructure is optional for minimal setup; the top-level ten directories and four core rule files are the floor.
