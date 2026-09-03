# Prompt to Decision

**The decision-making your AI agent assumes you already know.**

A short book for people who can now get a well-argued recommendation from
an agent in a minute, but never had reason to learn the discipline of
deciding under uncertainty. Should we hire six people and expand into a
new market. Should we ship the feature the data favours. Should we take
the round at this valuation. The reader has, or can get, a recommendation
for any of these on request. What to actually do with it is this book's
subject.

Fourth in the series, and the layer above the other three.
[*Prompt to Production*](https://github.com/alpibrusl/prompt-to-production),
[*Prompt to Evidence*](https://github.com/alpibrusl/prompt-to-evidence) and
[*Prompt to Ledger*](https://github.com/alpibrusl/prompt-to-ledger) each
teach you to verify one kind of agent output — code, an analysis, a
financial model — before trusting it. This book assumes that work has
already happened and asks the question sitting above all three: the agent
recommends acting. Should you?

> A recommendation is an optimization result. A decision is a commitment
> made under uncertainty, with consequences.

## Contents

| | Part | Chapters |
|---|---|---|
| **I** | The Ground | The handoff · what are you actually trying to achieve |
| **II** | Framing the Decision | What are the alternatives · what happens if you do nothing · what are you optimizing for · whose preferences are these |
| **III** | Sizing the Stakes | What would change your mind · reversible and irreversible · the cost of being wrong · what do you learn by waiting |
| **IV** | Beyond the Decision | The second-order effect · who bears the risk |
| **V** | Working With the Agent | When the agent disagrees with you · who owns the decision · the minimum bar |

**Status: complete draft**, plus a closing afterword. 16 chapters, ~13,900
words, 15 concepts, ~69 pages.

## The central distinction, and the chain underneath it

This book doesn't organise around four rules the way the other three do —
deciding well isn't a procedure in the same sense computing correctly or
testing a model is. It organises around one distinction and one chain,
both stated in Chapter 1 and unpacked one link at a time through the rest
of the book:

**A recommendation is an optimization result. A decision is a commitment
made under uncertainty, with consequences.** An agent can produce a
genuinely excellent recommendation and the decision built on it can still
be wrong, because the two are not the same act.

**The chain**: an objective, then the alternatives actually considered,
then the evidence and assumptions behind each one, then the trade-offs
made explicit, then a recommendation, then a decision. Six links, and the
book is a chapter for most of them — where they connect cleanly, and
where they quietly don't.

## The book is source

The manuscript is Markdown. The EPUB and PDF are build artifacts — derived
from the source, never committed, rebuilt on demand. This is
[bookkit](https://github.com/alpibrusl/content-kit)'s premise, shared with
this book's three companion volumes.

```bash
pip install "content-kit-core @ git+https://github.com/alpibrusl/content-kit@main#subdirectory=packages/core"
pip install "bookkit[epub] @ git+https://github.com/alpibrusl/content-kit@main#subdirectory=packages/bookkit"

make check     # lint the manuscript against the concept ledger
make epub      # → build/prompt-to-decision.epub
make html      # → build/prompt-to-decision.html
make pdf       # → build/prompt-to-decision.pdf   (needs Pango, see below)
make audiobook # → build/audiobook/chapter_NN/     (audio source)
make all       # check + epub + html
```

`make pdf` needs WeasyPrint's system libraries, which pip cannot install —
`libpango-1.0-0` and `libpangoft2-1.0-0` on Debian/Ubuntu, `pango` via
Homebrew on macOS. It is deliberately left out of `make all` so the default
build works without them; CI installs them and builds all three formats.

## The concept ledger and the gate

Same mechanism as the companion volumes: `glossary.yaml` is the canon,
`bookkit check terms` lints the manuscript against it and fails the build if
a term is used before its chapter defines it, and `GLOSSARY.md` is generated
by `bookkit glossary` rather than hand-written.

The gate used to be a `scripts/` directory copied byte for byte into each of
the four books. It now lives upstream in
[bookkit](https://github.com/alpibrusl/content-kit) — one implementation, four
books, no copies to keep in step — so this repository holds only what is
actually specific to this volume: the manuscript, its ledger, and its
`verify-*` skill. Full design:
[`docs/ledger.md`](https://github.com/alpibrusl/content-kit/blob/main/packages/bookkit/docs/ledger.md).

## What this book is not

A decision-theory textbook, and not a book that pretends every hard
decision has one provably correct answer. Most of the questions this book
teaches you to ask — what are you actually optimizing for, whose
preferences are encoded in that objective, who bears the risk if this goes
wrong — do not resolve to a formula. What they resolve to is a decision
someone can actually defend, out loud, to the people affected by it. That
is a lower bar than "provably optimal" and a much higher one than "the
agent recommended it."

## Installing the skill

`skills/verify-decision/` is this book's closing checklist, packaged so an agent runs
it. It is what Session 8 of the bootcamp asks students to run, and it works in
any agent that reads the `SKILL.md` format.

Copy the whole folder — `SKILL.md` and the `references/` directory beside it.
The checklist the skill actually works from lives in `references/`, so
`SKILL.md` on its own loads and then has nothing to read.

**Claude Code** — `~/.claude/skills/verify-decision/` for every project, or
`.claude/skills/verify-decision/` for one.

**opencode** — reads `~/.claude/skills/` as well, so the line above may be all
you need. Otherwise `~/.config/opencode/skills/verify-decision/`, or point at this
repository without copying anything:

```json
{
  "$schema": "https://opencode.ai/config.json",
  "skills": { "paths": ["/path/to/prompt-to-decision/skills"] }
}
```

`opencode debug skill` lists every skill it can see and where each came from.
Needs 1.17.12 or newer — `references/` path resolution was fixed in 1.17.10 and
1.17.12, and on older builds the skill loads but cannot read its own checklist.

The agent decides when the skill applies; you do not invoke it by name. The
same instructions are in the book itself, as *Appendix — Running the Skill*.

## Licence

Manuscript: [CC BY-NC 4.0](COPYING.md). Code: [EUPL-1.2](LICENSE), matching
content-kit and this book's companion volumes. See [COPYING.md](COPYING.md).
