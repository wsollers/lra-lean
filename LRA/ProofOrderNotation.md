# `ProofOrder.md` ledger notation

Shared style note for the per-theorem completion ledger required by
`subject-architecture-prompt.md` §5.1 in every subject's `ProofOrder.md`.
Linked from each subject's file rather than repeated in full there.

## Connectives and notation

Ledger entries state each theorem in raw predicate-calculus notation, not
Lean syntax:

| Symbol | Meaning |
| --- | --- |
| `∀`, `∃` | universal / existential quantification, with the bound variable's type noted inline the first time it is used in an entry (`∀ A : Type, …`) |
| `¬` | negation |
| `∧`, `∨` | conjunction, disjunction |
| `→`, `↔` | implication, biconditional |
| `=` | equality |
| `f(x)` | function application, written prefix-with-parentheses rather than Lean's juxtaposition `f x` |

## Predicates

A subject's own predicates and relations (`Equinumerous(A, B)`,
`IsFinite(A)`, `Dominates(A, B)`, …) appear as opaque predicate symbols
applied to their arguments — the ledger does not re-unfold a predicate's
definition inline. A predicate's own defining condition belongs in the
ledger entry for the declaration that introduces it, if that declaration
is itself tracked (a `Prop`-valued `def`), not repeated at every call site.

## Hypotheses

A theorem with hypotheses is written as an implication chain or a single
`∀`-quantified conditional, matching the order the hypotheses appear in
the Lean signature:

```
∀ A : Type, ∀ B : Type, Equinumerous(A, B) → Dominates(A, B)
```

not as a bulleted list of side conditions.

## Status

Every entry ends with exactly one status line:

- **Status: COMPLETE** — the declaration's axiom closure does not include
  `sorryAx` (Lean's own axiom-dependency check, the programmatic
  equivalent of `#print axioms`).
- **Status: PENDING** — it does. This includes a proof that only reaches
  `sorry` indirectly, through a helper it calls.

Status is never inferred from doc comments, from a textual search for the
word `sorry`, or from any other proxy — only from the axiom-closure check
(automated in bulk via `scripts/GenerateProofOrderManifest.lean`'s
`sorryStatus`, once a Lean toolchain is available to run it; the same
check by hand, `#print axioms <name>`, remains valid for a single
declaration when the automated manifest is not at hand).

## Ordering

Entries appear in dependency order — a theorem after everything its own
proof (or, for a `PENDING` entry, its intended proof) relies on — computed
by topologically sorting the subject's dependency graph. Where the graph
leaves ties, entries default to source-file order, per
`subject-architecture-prompt.md` §1.6.1's staged-construction convention.
