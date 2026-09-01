# The fixture

One generated decision brief, reused across Sessions 2, 3, and 5 rather than
inventing a new scenario each time — students meet the same recommendation
from different angles, the way a real one actually gets scrutinized over
time rather than judged once and forgotten.

It's the exact recommendation Chapter 1 opens the book with: Ledgerly, twelve
months of runway, a feature that already tested well — hire six people,
expand into Germany. The brief is written the way a real recommendation
actually arrives: confident, well-organized, a real financial model behind
it, and quietly missing most of what this book asks a reader to check before
treating it as a decision. Nothing in the document flags what it's missing —
finding the gaps, not being told about them, is the exercise.

## Generate it

```bash
./generate-brief.sh                    # → decision-brief.md next to the script
./generate-brief.sh /path/to/output.md  # or choose where
./generate-brief.sh --force             # overwrite last session's copy
```

Run this **fresh before each session** that uses it, not once at the start of
the cohort. Nothing about the brief is meant to persist between sessions or
cohorts — it's disposable, this script is the source, and `.gitignore` keeps
the generated file out of the repository the same way `build/` stays out of
the book's own.

## What's planted, and which session uses it

- **Session 2** (Chapters 3, 4 — alternatives, doing nothing) — the
  comparison is Germany versus France only. Staying domestic and reinvesting
  in the feature that already tested well, and a smaller pilot before the
  full commitment, are both real alternatives and neither is in the memo.
- **Session 3** (Chapters 5, 6 — trade-offs, whose preferences) — the memo
  shows exactly one point on the growth-versus-runway curve (six hires, full
  speed) and never states whose risk tolerance produced it, though "Team
  Sentiment" hints that the investor's and the founders' would differ.
- **Session 5** (Chapters 9, 10 — cost of being wrong, value of waiting) —
  the memo gives a bare 60% success probability with no description of what
  the other 40% actually looks like to live through, and never asks what a
  smaller, cheaper test would teach before the full six-hire, five-year-lease
  commitment.
- **Session 8 (capstone)** — a real target for the `verify-decision` skill,
  for anyone without a real recommendation of their own to point it at. Every
  chapter's gap is present somewhere in the memo, which is what makes it a
  complete enough document for the full checklist, not just the three
  sessions above.

The brief was never designed to be fixed by editing it. It's designed to be
interrogated with the questions each chapter teaches — the "what to ask for"
prompts at the end of Chapters 3 through 10 apply to it directly, close to
verbatim.
