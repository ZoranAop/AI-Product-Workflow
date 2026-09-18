# Naming and Structure Rules

## Directory Responsibilities

| Directory | Put Here | Do Not Put Here |
|-----------|----------|-----------------|
| 00-rules/ | How we work, templates, conventions | Product facts or requirements |
| 01-inputs/ | Raw original materials | Analyzed conclusions |
| 02-product/ | Stable, long-lived product facts | Temporary analysis or single-requirement details |
| 03-planning/ | Cross-requirement views and decision log | Single-requirement PRDs |
| 04-requirement-pool/ | Master list and status of all requirements | Detailed specs |
| 05-requirements/ | One folder per requirement with its full work package | Cross-cutting decisions |
| 06-versions/ | Version goals and committed scope | Individual requirement details |
| 07-reviews/ | Review notes, acceptance evidence, retrospectives | Living requirements |
| 90-assets/ | Shared screenshots, demos, prototypes | Source of truth documents |
| 99-archive/ | Closed or superseded materials | Anything still active |

## Naming Conventions

- Markdown files: lowercase kebab-case (`problem-space.md`, `decision-log.md`)
- Date materials: `YYYY-MM-DD-<topic>`
- Requirement directories: `req-<4-digit>-<english-short-name>` (example: `req-0001-route-management`)
- Version directories: `v<major>.<minor>`
