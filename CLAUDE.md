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
- "Chapters 6 and 7" and "Chapters 7 through 10" count as signposts too.
- A single-word term that is unambiguous jargon opts into prose scanning
  with `scan: true`. Do not opt in an ordinary English word — the gate is
  only worth having while it is quiet enough to be believed. If a term's
  *alias* is the ordinary word, scan the distinctive name alone:
  `scan: ["known-answer test"]`.
- A chapter that deliberately introduces no term belongs in
  `teaches_no_terms`, with a comment saying why. Do not invent a term to
  silence that warning.
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

## Ledgerly is shared canon

Ledgerly appears in *Production*, *Ledger* and *Decision*. It is one company,
not three companies with the same name, and a reader who buys two books will
notice. **Prompt to Ledger owns the fixture**; the other books consume it and
must not invent figures that contradict it.

| | |
|---|---|
| what it is | an invoicing tool for freelancers |
| cash in the bank | €180,000 |
| monthly costs | €35,000, or €42,000 once the already-committed hire lands |
| monthly revenue | €20,000, growing 4% a month |
| burn | costs *minus* revenue — €15,000 before that hire, €22,000 after |
| runway | **eleven months** |
| a fully loaded engineer | €7,000 a month |
| the seed round | €500,000 at a €2,000,000 pre-money valuation |

Two traps, both of which the series has already fallen into once:

**Runway is eleven, not twelve and not eighteen.** *Ledger* Chapter 9 walks
through all three: eighteen is what the agent *reported*, twelve is the naive
cash-divided-by-burn arithmetic, and eleven is the honest figure once 4% growth
and the committed hire are in the model. Quoting twelve as Ledgerly's runway
states the number that book exists to correct.

**Burn means costs minus revenue.** *Ledger* defines it that way and computes
with it. Using "burn" for gross monthly costs gives the same word two meanings
across the series, which is the one thing a concept ledger is meant to prevent.

Any new figure must be *computable* from the table above. Ledger's Chapter 9
recomputes correctly from these inputs, and so should anything added later.

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

## Voice

The house voice, written down because "sound like the other chapters" is not
something anyone — a person or an agent — can act on.

It is deliberately *not* an imitation of a named writer. A reader suggested one
as a reference and the register she was pointing at is right: practical,
concrete, unpretentious, example-first. But "is this Osmani enough?" has no
answer, so it cannot be checked, taught, or handed to an agent, and an agent
told to imitate a person produces pastiche. What follows is the same target,
stated as rules that can actually be applied.

**Explain the thing; do not announce that you are about to.** This is the one
that matters most, and the one this manuscript gets wrong most often. "This
chapter is that path." "Now the shape." "Here is what they are for." "The last
idea here is what turns all this from data into decisions." Every one of these
is the narrator stepping out from behind the material to describe the material.
Cut the announcement and start with the content — the reader can see a new
section beginning; they do not need to be told that one is beginning. A
transition earns its place only when it carries information the next paragraph
does not, which is rare.

**One metaphor, stated once, and never explained.** An analogy that has to be
unpacked over the following three sentences was not doing its job in the first
one. The ledger already commits each concept to a single analogy; using it means
dropping it in and moving on, not returning to admire it. Where an image has a
famous source, either credit it or do not use it — an unattributed allusion
reads as borrowed profundity to every reader who recognises it.

**Concrete before abstract, always.** Name the file, the command, the number,
the amount of time. "The budget alert takes four minutes" beats any sentence
about the importance of cost awareness. Ledgerly exists so that every claim in
the book has somewhere specific to land; use it rather than reaching for a
hypothetical.

**Prescriptions may be absolute; claims about the world may not.** See
[Absolutes](#absolutes) above — the distinction is load-bearing and predates
this section.

**Jargon is compression, not decoration.** A word that saves a sentence earns
its place. Define it once, in the chapter the ledger assigns it, and then use it
plainly without re-explaining or apologising for it.

**Write to a capable reader who happens not to know this yet.** Not a beginner
to be protected, not a peer to be impressed. No flattery, no "as we all know",
no warnings that a topic is about to get difficult. Say the thing.

**Sentence rhythm.** Vary it, and let the short sentence be a real one rather
than a drum-beat. A one-line paragraph is a strong instrument with a small
budget: it is right for a definition, for the gloss under a suggested prompt,
and occasionally for a line the chapter genuinely turns on. It is wrong as a
way to make an ordinary transition sound consequential.

### The mechanical part

`make prose` checks what a machine can honestly check, and reports warnings
only — prose is not a build failure. `make prose-fix` applies the corrections
that need no judgement.

- **No comma before a restrictive because-clause.** "Worth knowing by name
  because it is the answer" — not "by name, because". The comma belongs only
  when the main clause is negative (where it changes the meaning) or when the
  clause is a genuine afterthought. This one is a Spanish habit carried into
  English, and a reader spotted it before the linter did.
- **No "because … is not because."** Two because-clauses in a sentence are fine
  when they are a pair ("not because X, but because Y"); they are hard to follow
  when the second is the predicate of the first.

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

Manuscript CC BY-NC 4.0; code EUPL-1.2. New code files in this repository (the
`Makefile`, `style.css`, CI workflows) need an `SPDX-License-Identifier:
EUPL-1.2` header. See `COPYING.md`.
