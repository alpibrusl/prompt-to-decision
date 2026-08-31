---
name: verify-decision
description: >-
  Use this skill before a recommendation (from this agent or referenced by
  the user) gets treated as a decision ready to act on — when the user says
  things like "should we do this," "are we ready to decide," "I'm about to
  greenlight this," "let's move forward with the recommendation," or asks
  "is this decision-ready," "what am I missing before I commit to this."
  Runs the pre-decision checklist from the book *Prompt to Decision*,
  checking only whether each element (objective, alternatives, threshold,
  ownership, and so on) has actually been stated somewhere explicit — never
  whether it's the *right* one, which stays a human call by design. Do not
  use it to evaluate whether a recommendation's underlying analysis, code,
  or financial model is sound — that's the job of this series' other
  verification skills (verify-production, verify-evidence, verify-ledger).
  This skill assumes the recommendation itself is trustworthy and checks
  only the layer above it — whether it's actually ready to be decided on.
---

# Verify Decision

This skill is the odd one out in this series, on purpose, and understanding
why matters more than the checklist mechanics.

The other three verification skills in this series (`verify-production`,
`verify-evidence`, `verify-ledger`) check things an agent can actually
settle by looking — does the test suite pass, was the comparison randomly
assigned, does the formula match the standard definition. Those are
verification questions, and verification is exactly the kind of thing that
generalizes well to an agent checking its own work.

*Prompt to Decision* (this repo's own manuscript, under `chapters/`) is
about the layer above all of that: even a recommendation that has passed
every one of those checks is not yet a decision, because a decision needs
an objective somebody stood behind, a threshold somebody committed to
before knowing how crossing it would feel, and an owner somebody specific
agreed to be. None of that is checkable from an artifact, because none of
it is a fact about code or a model — it's a fact about what a person
actually decided, and the only way to know is to ask.

## The one rule that overrides everything else in this skill

**Never resolve a checklist item yourself, even when you could write a
plausible-sounding answer.** If the objective wasn't stated explicitly, do
not infer one from the shape of the recommendation and report it as found.
If no threshold was set, do not propose a reasonable-sounding number and
mark the item satisfied. The moment this skill starts filling in the
judgment calls it's supposed to be surfacing, it has become exactly the
thing the book argues against — a well-computed guess with nobody
attached to it, dressed up as a decision that was actually made.

This is stricter than it might feel natural to be. An agent that's good at
this kind of reasoning can often produce a very reasonable-sounding
objective statement, threshold, or owner on the spot — and that is
precisely the failure mode to avoid, because a fluent guess is more
dangerous than an obvious gap. Report the gap. Ask the question. Do not
fill it in, even provisionally, even labeled as a suggestion, unless the
human explicitly asks you to draft one for them to accept or reject as
their own.

## Workflow

1. **Decide the scope.** A recommendation actually about to be acted on —
   hiring, spending, signing something, a real "are we ready to decide"
   question — warrants the full 13-item checklist. A quick gut-check mid-
   conversation can use the 5-item short version in
   `references/minimum-bar-checklist.md`. Default to the short version when
   nothing in the request signals a real commitment is imminent; use the
   full version once it does. If it's genuinely unclear which, ask.

2. **Confirm this is the right layer to check.** If what's actually in
   question is whether the recommendation's underlying analysis, code, or
   model is trustworthy — not whether it's ready to decide on — point to
   the relevant sibling skill instead (verify-production for code,
   verify-evidence for an analysis, verify-ledger for a financial model).
   This skill assumes that work is already sound and checks only what sits
   above it.

2. **Read `references/minimum-bar-checklist.md`.** Every item there splits
   into a presence question (was this actually stated, anywhere, by
   someone?) and a soundness question (is it right?) — read that file's
   framing before doing anything else, because it explains why those two
   questions get handled completely differently.

3. **For the presence half of each item, actually search** the
   recommendation document, memo, or conversation history you have access
   to. This part is genuinely checkable — either an explicit objective
   sentence exists somewhere or it doesn't. Quote or point to what you
   found; if you find nothing, say so plainly rather than assuming it must
   exist somewhere unseen.

4. **For the soundness half, always ask** — every time, for every item,
   even ones where presence was confirmed. A stated objective can still be
   wrong for the people it affects; a stated threshold can still be
   picked to be safely unreachable. Presence being confirmed is not a
   reason to skip the soundness question — it's what makes asking it
   possible at all.

5. **Report using the format below**, then close with the book's own
   framing question, addressed to a specific human, not left open.

## Output format

One table per checklist section, one row per item — but note the Status
column here means something different from the other verification skills:
it reports whether the element was **stated**, never whether it's right.

| Item | Stated? | Where / What's missing | Soundness question — ask the human |
|---|---|---|---|
| Objective | ❌ Not found | No document or message states what this recommendation is optimizing for | Would the people this affects recognise this objective as theirs? |
| Threshold | ✅ Found | "Revisit if churn exceeds 8% by Q3" — memo, paragraph 3 | Would you actually revisit if it hit 7.9%, or does this number not really bind? |
| Owner | ❓ Ambiguous | "The team will monitor this" — no specific person or small named group | Who specifically has the authority to act on this, and do they bear real weight if it's wrong? |
| ... | | | |

Three "Stated?" values, used honestly:

- **✅ Found** — an explicit statement exists; quote or cite it.
- **❌ Not found** — no explicit statement exists anywhere available. This
  is a real, reportable gap, not a minor omission — say so as plainly as a
  missing test or a missing backup would be said in the other books'
  skills.
- **❓ Ambiguous** — something exists but doesn't clearly satisfy the item
  (e.g. "the team" instead of a named owner). Don't round this up to
  Found.

The Soundness column is never filled in by this skill — it is always a
question, addressed to the human, even for items marked Found. Do not
collapse it into the Status column or imply an answer by how the question
is phrased.

Close every report with:

> **What would have to be true for this to be the right call — and what
> happens if it isn't?**
>
> The gaps above are what's missing to answer that with a name attached,
> not a hope. A recommendation can be completely sound — well-verified
> code, honest evidence, a defensible model — and still not be a decision
> until somebody specific has stated the objective, set the threshold, and
> agreed to own what happens next.

If every item comes back Found, say so — but still hand back every
soundness question. A checklist that's fully present is not the same
claim as a checklist that's been soundly answered, and this skill should
never let the first stand in for the second.
