#!/usr/bin/env bash
# Generates a fresh copy of the Session 2/3/5 teaching fixture — a one-page
# decision brief recommending the exact move Ledgerly's chapter-1 recommendation
# already describes ("hire six, expand into Germany"), written the way a real
# recommendation actually arrives: confident, well-organized, and quietly
# missing most of what this book asks a reader to check for.
#
# What's planted, mapped straight onto the book:
#
#   - "growth" is never stated as the objective — only implied (Chapter 2)
#   - the comparison is Germany vs. France only; no domestic-reinvestment
#     option, no smaller pilot (Chapters 3, 4)
#   - one point on the trade-off curve is shown (six hires, full speed), not
#     the curve itself, and nobody's weighting is named (Chapters 5, 6)
#   - no dated threshold, no reversible/irreversible split, a bare success
#     probability with no concrete downside, no mention of what waiting would
#     teach (Chapters 7, 8, 9, 10)
#   - no second-order effects, no named risk-bearer, no record of real
#     pushback, no named owner — just "the team" (Chapters 11, 12, 13, 14)
#
# It is deliberately fully present-tense and confident throughout — nothing
# in the memo itself flags what it's missing. Finding the gaps is the point.
#
# Usage: fixture/generate-brief.sh [output-path] [--force]
#        (default output: decision-brief.md next to this script, which
#        .gitignore already covers; --force overwrites an existing file)
#
# Run this fresh before each session that uses it. The generated file is
# disposable and gitignored; this script is the source.

set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
OUT="${HERE}/decision-brief.md"
FORCE=0
for arg in "$@"; do
  case "$arg" in
    --force|-f) FORCE=1 ;;
    *) OUT="$arg" ;;
  esac
done

if [ -e "$OUT" ] && [ "$FORCE" -ne 1 ]; then
  echo "error: $OUT already exists — pass --force to overwrite, or a different output path" >&2
  exit 1
fi

GENERATED_AT="$(date -u +"%Y-%m-%d")"

cat > "$OUT" <<EOF
# Ledgerly — Germany Expansion Recommendation

**Prepared for:** Marta Ruiz (CEO), Tomas Keller (CTO), Priya Nair (Northlane Capital, board)
**Prepared by:** Growth & Ops
**Date:** ${GENERATED_AT}

## Summary

Ledgerly has eleven months of runway. The invoicing-automation feature has
tested well, and the production system can handle ten times current traffic
without breaking a sweat. We recommend hiring six people and expanding into
Germany, starting next quarter.

## Why Germany

We compared Germany against France on market size, existing customer overlap
with the markets Ledgerly already serves, and localization cost. Germany
scores higher on all three, and the team's read of both markets gives us
confidence this is the stronger of the two.

## The Plan

Hire six people over six weeks — two sales, two engineering, one support, one
country lead. Sign a five-year office lease in Berlin (broker quote on file,
not attached here). Target launch is next quarter, all six roles filled and
the lease signed before the German go-live.

## Financial Model

Cash in the bank: €180,000. Current monthly costs €42,000 against €20,000
in monthly revenue, so current burn is €22,000/month. Revenue has been
growing about 4% a month. Projected costs once the six new hires are fully
ramped, at €7,000 fully loaded each: €84,000/month. Against current runway
of eleven months, this plan is fundable through roughly the next two
quarters, after which Ledgerly will need to raise its next round regardless
of how the German launch performs.

Projected German revenue with the full six-person team: €15,000 monthly
recurring by month four, €40,000 by month twelve.

We estimate roughly a 60% chance the German market performs in line with
projections within the first two quarters.

## Team Sentiment

Priya is enthusiastic about the growth trajectory this unlocks. Marta and
Tomas are somewhat more cautious about the pace, but no significant
objections were raised in the founders' meeting where this plan was reviewed.

## Next Steps

Pending approval, hiring begins immediately. The team will keep an eye on how
the German launch is going and will flag anything that looks off.
EOF

echo "generated fixture at $OUT"
echo "read it cold once, before checking anything against it — see fixture/README.md"
