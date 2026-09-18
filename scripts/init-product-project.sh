#!/usr/bin/env bash
# Initialize a product project scaffold for long-term AI Agent collaboration.
# Usage:
#   bash scripts/init-product-project.sh [target-directory]          # full setup (default)
#   bash scripts/init-product-project.sh --minimal [target-directory] # minimal setup
#
# Full setup creates the complete v1.1 directory set with 8 core rule files.
# Minimal setup creates 00-rules/, 01-inputs/, 02-product/, 05-requirements/
# with the 4 core rule files and basic status tracking.

set -euo pipefail

MODE="full"
TARGET=""
for arg in "$@"; do
  case "$arg" in
    --minimal) MODE="minimal" ;;
    *) TARGET="$arg" ;;
  esac
done
TARGET="${TARGET:-.}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "==> Initializing AI Product Workflow project ($MODE) at: $TARGET"

mkdir -p "$TARGET"
cd "$TARGET"

if [[ "$MODE" == "full" ]]; then
  DIRS=(
    "00-rules"
    "01-inputs"
    "01-inputs/interviews"
    "01-inputs/meeting-notes"
    "01-inputs/competitor"
    "01-inputs/research"
    "01-inputs/screenshots"
    "01-inputs/feedback"
    "02-product"
    "03-planning"
    "04-requirement-pool"
    "05-requirements"
    "06-versions"
    "07-reviews"
    "90-assets"
    "99-archive"
  )
else
  DIRS=(
    "00-rules"
    "01-inputs"
    "02-product"
    "05-requirements"
  )
fi

for d in "${DIRS[@]}"; do
  mkdir -p "$d"
  echo "Created $d/"
done

# Copy core rule templates if available
RULES_SRC="$SKILL_ROOT/assets/rules"
if [[ -d "$RULES_SRC" ]]; then
  cp -n "$RULES_SRC"/*.md "00-rules/" 2>/dev/null || true
  echo "Copied core rule templates into 00-rules/"
fi

# Create basic entry files if missing
if [[ ! -f README.md ]]; then
  cat > README.md << 'EOF'
# Product Project Workspace

This workspace is designed for long-term collaboration between Product Manager and AI Agents.

## Quick Start
1. Put existing materials into `01-inputs/` and register them in `01-inputs/source-register.md`.
2. Fill stable product facts into `02-product/`.
3. Review and adapt the rules in `00-rules/`.
4. Start adding candidate requirements into `04-requirement-pool/requirement-pool.md`.

## Directory Overview
- 00-rules/           Rules and templates (source of truth for how we work)
- 01-inputs/          Raw inputs (discussions, docs, screenshots, external materials)
- 02-product/         Stable product facts (glossary, background, baseline, design system)
- 03-planning/        Cross-requirement planning (problem space, module map, decision log)
- 04-requirement-pool/ Requirement pool and status tracking
- 05-requirements/    Individual requirement work packages
- 06-versions/        Version goals, scope, milestones
- 07-reviews/         Reviews, acceptance records, retrospectives
- 90-assets/          Shared assets (demos, prototype screenshots)
- 99-archive/         Closed or outdated materials
EOF
  echo "Created README.md"
fi

if [[ ! -f AGENTS.md ]]; then
  cat > AGENTS.md << 'EOF'
# Agent Collaboration Rules

You are working inside a long-lived product project workspace.

## Mandatory Behaviors
1. Always read the relevant files in 00-rules/ before making structural changes.
2. Treat files under 02-product/ and the requirement pool as source of truth. Do not duplicate facts elsewhere.
3. Never silently overwrite source-of-truth files. Produce a confirmation summary and wait for human approval when a stage conclusion is ready.
4. When a decision changes (especially after review or during development), record both the new decision AND its background (when, who, why).
5. Prefer updating existing structured files over creating new ad-hoc documents.
6. If context appears missing or outdated, explicitly ask for the missing information instead of guessing.
7. Distinguish verified facts from assumptions; mark unverified claims.
8. Stay within your assigned permission level (see 00-rules/agent-permissions.md).

## Preferred File Locations
- New candidate requirements → 04-requirement-pool/
- Detailed work on a single requirement → 05-requirements/req-XXXX-name/
- Cross-cutting decisions → 03-planning/decision-log.md
- Version scope → 06-versions/
EOF
  echo "Created AGENTS.md"
fi

# Create helper files
touch 01-inputs/source-register.md
if [[ "$MODE" == "full" ]]; then
  mkdir -p 04-requirement-pool
  if [[ ! -f 04-requirement-pool/requirement-pool.md ]]; then
    cp -n "$SKILL_ROOT/assets/templates/requirement-pool.md" "04-requirement-pool/requirement-pool.md" 2>/dev/null || touch 04-requirement-pool/requirement-pool.md
  fi
  # Completeness check engine: copy new rule + templates so the project has its own check baseline
  cp -n "$SKILL_ROOT/assets/rules/completeness-check.md" "00-rules/completeness-check.md" 2>/dev/null || true
  if [[ ! -f 03-planning/ai-regression-cases.md ]]; then
    cp -n "$SKILL_ROOT/assets/templates/ai-regression-cases.md" "03-planning/ai-regression-cases.md" 2>/dev/null || touch 03-planning/ai-regression-cases.md
  fi
  if [[ ! -f 03-planning/completeness-report-template.md ]]; then
    cp -n "$SKILL_ROOT/assets/templates/completeness-report.md" "03-planning/completeness-report-template.md" 2>/dev/null || true
  fi
fi

# Seed minimal entry files for stable product facts
for f in 02-product/product-overview.md 02-product/glossary.md; do
  if [[ ! -f "$f" ]]; then
    case "$f" in
      02-product/product-overview.md)
        printf '# Product Overview\n\n<positioning, user roles, platform baseline>\n' > "$f"
        ;;
      02-product/glossary.md)
        printf '# Glossary\n\n| Term | Definition |\n|------|------------|\n|      |            |\n' > "$f"
        ;;
    esac
    echo "Created $f"
  fi
done

# Add short README in key folders
for d in 01-inputs 02-product 03-planning 04-requirement-pool 05-requirements 06-versions 07-reviews; do
  [[ -d "$d" ]] || continue
  if [[ ! -f "$d/README.md" ]]; then
    case $d in
      01-inputs)
        echo "# Raw Inputs\n\nPlace original materials here (meeting notes, screenshots, external docs).\nRegister every item in source-register.md before treating it as formal input." > "$d/README.md"
        ;;
      02-product)
        echo "# Stable Product Facts\n\nGlossary, product background, platform baseline, design system, and other long-lived facts." > "$d/README.md"
        ;;
      03-planning)
        echo "# Cross-Requirement Planning\n\nProblem space, module map, and decision log that spans multiple requirements." > "$d/README.md"
        ;;
      04-requirement-pool)
        echo "# Requirement Pool\n\nSingle place to track all candidate and in-progress requirements with their status." > "$d/README.md"
        ;;
      05-requirements)
        echo "# Individual Requirements\n\nOne subdirectory per requirement: req-XXXX-short-name/" > "$d/README.md"
        ;;
      06-versions)
        echo "# Versions\n\nVersion goals, committed scope, and milestones." > "$d/README.md"
        ;;
      07-reviews)
        echo "# Reviews & Retrospectives\n\nReview notes, acceptance records, and version retrospectives." > "$d/README.md"
        ;;
    esac
  fi
done

echo ""
echo "==> Scaffold ready."
echo "Next steps:"
echo "  1. Review and adapt files in 00-rules/"
echo "  2. Register existing materials in 01-inputs/source-register.md"
echo "  3. Fill 02-product/ with current product facts"
echo "  4. Start adding requirements to the pool"
