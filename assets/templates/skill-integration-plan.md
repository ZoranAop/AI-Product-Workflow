# Skill Integration Plan

Record here when a team adopts an external skill from the open skills ecosystem (see `references/skill-ecosystem.md`). This file lives in the project's `03-planning/` directory.

## Rules

- Default permission level for any adopted skill is **L1** (draft write) per `assets/rules/agent-permissions.md`.
- Skill output is treated as a **draft / analysis** until a human confirms it, consistent with the stage-gate protocol.
- If a skill's output would modify a formal product baseline (product rules, billing, permissions, security), it must pass `assets/rules/change-management.md` before being written to a permanent file.
- When a skill changes (new version, different model), re-run the AI regression set in `assets/rules/quality-gates.md`.

## Template

| Skill (owner/repo@skill) | v1.1 Stage | Output Lands In | Permission Level | Confirmed By | Date |
|---------------------------|------------|-----------------|------------------|--------------|------|
| <skill> | <stage> | <directory / file> | L1 | <human> | YYYY-MM-DD |

## Examples

| Skill | v1.1 Stage | Output Lands In | Permission Level | Confirmed By | Date |
|-------|------------|-----------------|------------------|--------------|------|
| phuryn/pm-skills@prioritization-frameworks | Requirement Analysis & Prioritization | 05-requirements/req-XXX/priority.md | L1 | <PM> | <date> |
| wshobson/agents@architecture-decision-records | Review & Decision Recording | 03-planning/decision-log.md | L1 | <PM> | <date> |
| arvindrk/extract-design-system/extract-design-system | Prototype & Interaction Design | 02-product/design-system.md | L1 | <PM> | <date> |

## Adoption History

<Append one line per adopted skill, newest last.>
