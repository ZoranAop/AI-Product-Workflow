# Skill Ecosystem Mapping (Online Skills)

Mapping of the AI Product Workflow v1.1 mainline to skills available from the open agent skills ecosystem (skills.sh). This file is a **reference only** — it does not install or invoke any skill. It records which online skill can assist each stage, so a product team can decide what to adopt.

All skills below are external and optional. Per `assets/rules/agent-permissions.md`, any adopted skill should default to permission level **L1** unless the team explicitly authorizes a higher level.

Install command pattern (when a team chooses to adopt):

```
npx skills add <owner/repo@skill> -g
```

Browse: https://skills.sh

## By v1.1 Workflow Stage

### 1. Project Init / Context Layers
| Skill (owner/repo@skill) | Installs | Use |
|---|---|---|
| mattpocock/skills@improve-codebase-architecture | 950k | After init, review directory structure through the "deep module" lens; validates the single-source-of-truth principle in 00-rules/02-product |
| affaan-m/ecc@agent-architecture-audit | 5.6k | In multi-Agent setups, audit Agent architecture against `assets/rules/agent-permissions.md` |

### 2. Product Goals & Metrics
| Skill | Installs | Use |
|---|---|---|
| phuryn/pm-skills@outcome-roadmap | 9.5k | Organize the roadmap by outcomes, not features; lands the success criteria in `references/product-goals-metrics.md` |
| phuryn/pm-skills@prioritization-frameworks | 9.5k | RICE / MoSCoW / Kano frameworks; can replace the P0–P3 scheme with a more systematic one |
| phuryn/pm-skills@release-notes | 2.6k | Generate release notes for `06-versions/v*/release-plan.md` |

### 3. Market & User Research
| Skill | Installs | Use |
|---|---|---|
| coreyhaines31/marketingskills@customer-research | 95k | Organize and synthesize user research; lands the "user fact → hypothesis" chain in `references/market-user-research.md` |
| coreyhaines31/marketingskills@product-marketing-context | 61k | Sediment positioning and user roles into `02-product/`, landing the second layer of `references/context-layers.md` |
| firecrawl/firecrawl-workflows@firecrawl-market-research | 32k | Scrape industry data; pair with the 7-level source priority in §8.1 |

### 4. Requirement Analysis & Prioritization (PM Subtraction)
| Skill | Installs | Use |
|---|---|---|
| jwynia/agent-skills@requirements-analysis | 2.2k | Systematic requirement analysis; pairs with `references/decision-checklist.md` |
| product-on-purpose/pm-skills@define-prioritization-framework | 0.6k | Customize a prioritization framework per project, finer than P0–P3 |
| warpdotdev/common-skills@write-product-spec | 25k | Turn a requirement into a structured spec (maps to the Agent-readable fields in §12.4) |

### 5. Technical Approach & Engineering
| Skill | Installs | Use |
|---|---|---|
| wshobson/agents@architecture-decision-records | 17k | Record technical decisions as ADRs; maps directly to the "rejected options" field of `references/review-decisions.md` |
| wshobson/agents@architecture-patterns | 22k | 10+ architecture patterns; supports the technical-feasibility check in `references/requirement-analysis.md` |
| github/awesome-copilot@architecture-blueprint-generator | 12k | Generate architecture blueprint docs |

### 6. Prototype & Interaction Design
| Skill | Installs | Use |
|---|---|---|
| arvindrk/extract-design-system/extract-design-system | 129k | Extract the design system from an existing product; lands the "provide design constraints" rule in `references/prototype-design.md` |
| wshobson/agents@tailwind-design-system | 64k | Force generated prototypes to follow the existing component library |
| anthropics/knowledge-work-plugins@design-system | 3.7k | Manage the design system so `02-product/design-system.md` stays current |

### 7. PRD & Structured Requirements
| Skill | Installs | Use |
|---|---|---|
| deanpeters/product-manager-skills@prd-development | 4.1k | Lands the tiered PRD in `references/dual-prd-spec.md` |
| deanpeters/product-manager-skills@user-story | 3.8k | Write user stories; the "human-readable PRD" layer of §12 |
| pluginagentmarketplace/custom-plugin-product-manager@requirements-specification | 0.2k | Structured requirement spec; the Agent-readable fields of §12.4 |

### 8. Review & Decision Recording
| Skill | Installs | Use |
|---|---|---|
| wshobson/agents@architecture-decision-records | 17k | Decision records (shared with stage 5) |
| jasonkneen/kiro@requirements-engineering | 0.3k | Requirements engineering method; supports review in `references/review-decisions.md` |
| proyecto26/system-design-skills@requirements-scoping | 0.2k | Scope definition; maps to the Scope Control section of `references/decision-checklist.md` |

### 9. Development & Testing
| Skill | Installs | Use |
|---|---|---|
| anthropics/skills@webapp-testing | 158k | Browser-side product test cases; lands Agent-assisted testing in `references/dev-testing.md` |
| affaan-m/ecc@ai-regression-testing | 8.7k | **Directly matches the v1.1 AI regression test set in `assets/rules/quality-gates.md` §17.1** |
| usestrix/strix@owasp-top-10-testing | 5.7k | Security testing; the "security" item in the technical-feasibility check |
| wshobson/agents@e2e-testing-patterns | 22k | E2E test patterns |

### 10. Release & Operations Feedback
| Skill | Installs | Use |
|---|---|---|
| phuryn/pm-skills@release-notes | 2.6k | Release notes |
| posthog/ai-plugin@instrument-product-analytics | 0.4k | Instrument analytics; lands metric monitoring in `references/release-feedback.md` |
| posthog/ai-plugin@configuring-experiment-analytics | 0.3k | Experiment analytics; A/B testing |
| buildgreatproducts/builder-os@launch-checklist | 1.6k | Pre-launch checklist |
| buildgreatproducts/builder-os@idea-validator | 1.6k | Re-validate the requirement before launch |
| samber/cc-skills@press-release-writer | 2.2k | Launch press release |

### Cross-Cutting (All Stages)
| Skill | Installs | Use |
|---|---|---|
| refoundai/lenny-skills@shipping-products | 1.6k | Delivery discipline |
| refoundai/lenny-skills@product-operations | 1.7k | Product operations |
| refoundai/lenny-skills@measuring-product-market-fit | 1.7k | Product-market-fit measurement |
| refoundai/lenny-skills@prioritizing-roadmap | 1.9k | Roadmap prioritization |
| refoundai/lenny-skills@technical-roadmaps | 1.9k | Technical roadmap |
| refoundai/lenny-skills@defining-product-vision | 1.8k | Define product vision |
| github/awesome-copilot@create-github-issues-for-unmet-specification-requirements | 9k | Turn unmet requirements into issues; feeds the feedback loop in §18.2 |
| kostja94/marketing-skills@competitor-research | 1.2k | Competitor research |
| coreyhaines31/marketingskills@analytics | 64k | Data analysis |
| coreyhaines31/marketingskills@ab-testing | 59k | A/B testing |
| anthropics/knowledge-work-plugins@product-brainstorming | 5.1k | Product brainstorming |
| anthropics/knowledge-work-plugins@user-research-synthesis | 0.4k | User research synthesis |
| anthropics/knowledge-work-plugins@roadmap-update | 2.8k | Roadmap update |

## Recommended Minimal Adoption Set (10 Highest-Leverage)

Pick from the tables above to cover the v1.1 mainline with the smallest set:

1. `phuryn/pm-skills@prioritization-frameworks` — replaces P0–P3 with a systematic framework
2. `deanpeters/product-manager-skills@prd-development` — lands the tiered PRD
3. `wshobson/agents@architecture-decision-records` — lands the decision log
4. `arvindrk/extract-design-system/extract-design-system` — lands prototype constraints
5. `affaan-m/ecc@ai-regression-testing` — lands the AI quality gate
6. `anthropics/skills@webapp-testing` — lands testing
7. `posthog/ai-plugin@instrument-product-analytics` — lands metrics
8. `buildgreatproducts/builder-os@launch-checklist` — lands release
9. `coreyhaines31/marketingskills@customer-research` — lands user research
10. `mattpocock/skills@improve-codebase-architecture` — lands context layers

## Integration Notes

- This file is a **mapping reference only**. No skill is installed or invoked by the workflow.
- A team that adopts a skill records it in `assets/templates/skill-integration-plan.md` (if present), noting: the skill, the v1.1 stage it assists, and where its output lands in the directory structure.
- Adopted skills default to permission level **L1** per `assets/rules/agent-permissions.md`. Escalating requires the audit rules there.
- Skill outputs are treated as **drafts / analyses** until confirmed by a human, consistent with the stage-gate protocol and `assets/rules/quality-gates.md`.
- If a skill's output would modify a formal product baseline (rules, billing, permissions), it must pass the change-management flow in `assets/rules/change-management.md` before being written to a permanent file.
