# Project conventions

## What this book is and who it is for

*Prompt to Decision* teaches the judgement needed to act — or not act — on
a recommendation an agent produced, for people who now get well-argued
recommendations on request but never had reason to learn the discipline of
deciding under uncertainty. Should we hire six people and expand into a
new market. Should we ship the feature the data favours. Should we take
the round at this valuation. The reader has, or can get, a recommendation
for any of these in a minute. What this book teaches is what to do with it.

Fourth in the series, and the odd one out in a specific, deliberate way:
[*Prompt to Production*](https://github.com/alpibrusl/prompt-to-production),
[*Prompt to Evidence*](https://github.com/alpibrusl/prompt-to-evidence) and
[*Prompt to Ledger*](https://github.com/alpibrusl/prompt-to-ledger) each
teach how to verify one kind of agent output — code, an analysis, a
financial model — before trusting it. This book assumes that work has
already happened, or that it hasn't and the reader knows to ask, and asks
the question sitting one level above all three: **the code runs, the
analysis is sound, the model checks out — the agent recommends acting.
Should you?** That is not a verification question with a checkable answer.
It is a judgement question, and this book does not pretend otherwise —
it teaches the discipline of asking it well, not a formula that answers it
for you.

## The central distinction

A **recommendation** is an optimization result: the best option among the
ones considered, against the objective the agent understood, given the
evidence it had. A **decision** is a commitment made under uncertainty,
with consequences that land on people — a recommendation someone has
actually chosen to act on, including the choice to do nothing.

An agent can produce a genuinely excellent recommendation and the decision
built on it can still be wrong, because the two are not the same act. Every
chapter in this book is, in one way or another, about the gap between them.

## The decision chain

Six links, stated in Chapter 1 and unpacked one at a time through the rest
of the book: an objective, then the alternatives actually considered, then
the evidence and assumptions behind each one, then the trade-offs made
explicit, then a recommendation, then a decision. The book does not
organise around four rules the way the other three do — deciding well is
not a procedure in the same sense computing correctly or testing a model
is — but the chain plays the same role their six-link and five-word chains
play: the shape of where things quietly go wrong, chapter by chapter.

## Author identity — do not guess

The author is:

    Alfonso Sastre <alfonso@alpibru.com>

Same person, same convention as the companion volumes. Use exactly this for
`book.yaml`, git commit authorship, and anywhere an author is named. If a
field about a real person is unknown, leave it blank and ask — do not infer.

## The manuscript is source

Markdown in `chapters/` is the source; everything in `build/` is derived and
gitignored, as is `GLOSSARY.md`. Never edit `GLOSSARY.md` by hand — it is
generated from `glossary.yaml` by `make glossary`.

## The concept ledger and the gate

`glossary.yaml` is the canon: every term the book teaches, with one
definition, one committed analogy, the defining chapter, and prerequisite
terms.

`make check` lints the manuscript against it and exits 8 on error. It runs
in CI on every push and pull request. When adding prose:

- Define a term before using it, or signpost the forward reference
  explicitly with "(Chapter N)" — the linter allows a signposted one and
  rejects a bare one.
- Add any new term to `glossary.yaml` rather than defining it only in prose.
- Keep an analogy consistent with the one the ledger commits to.
- Chapter numbers in the rendered book come from `book.yaml`'s per-chapter
  `title` override (`"Chapter N — Title"`), not from the Markdown H1.
- `counterfactual` is reused from *Prompt to Evidence*'s glossary with the
  same definition — a deliberate cross-book thread, not a coincidence. It
  still needs its own entry in this book's `glossary.yaml`, since each
  book's ledger is self-contained.

## The running example

Ledgerly — the same fictional company from *Prompt to Production* and
*Prompt to Ledger* — carries this book's worked example too: post-seed,
weighing whether to hire and expand into a new market on an agent's
recommendation. Numbers introduced in Chapter 1 have to stay consistent
everywhere they recur, the same standard the other two Ledgerly books hold
themselves to.

## Absolutes

Distinguish a prescription from an assertion. "Name what would change your
mind before you act, not after" is a rule of practice and its force is the
point — keep it. A claim about the world takes a softer edge, so a reader
absorbs the lesson instead of arguing with the sentence. Check `never`,
`always`, `only`, `every`, `exactly`, `not negotiable` when editing: keep
them in rules, soften them in claims. This book in particular is prone to
one specific overclaim worth watching for: implying there is a single
correct decision-theoretic answer to a genuinely value-laden question.
There usually isn't, and the book should say so rather than paper over it.

## Build

    make check    # the gate
    make epub / make html / make pdf
    make all      # check + epub + html (pdf needs Pango, see README)

## Audio

`make audiobook` emits a podcastkit project under `build/audiobook/` —
derived, gitignored, one episode per chapter. Rendering it to MP3 needs a
TTS backend and is not wired into CI, because it costs money per character
on the paid backends and hours of CPU on the free ones.

## Licences

Manuscript CC BY-NC 4.0; code EUPL-1.2. New files under `scripts/` need an
`SPDX-License-Identifier: EUPL-1.2` header. See `COPYING.md`.
