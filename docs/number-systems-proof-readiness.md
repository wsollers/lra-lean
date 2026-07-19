# Number-Systems Proof-Readiness Corrections

## Purpose

This document records the correction from a schematic statement layer to a proof-ready Lean development.

The authoritative mathematical source is the streamlined Markdown package whose files are listed in `CONTENTS.md`. Lean must mirror that mathematical content in dependency order. The Blueprint must be generated from the same Markdown and linked to the corresponding Lean declarations.

## Required final state

A module is proof-ready only when all of the following hold:

1. Every carrier, relation, operation, predicate, embedding, and quotient is mathematically defined.
2. Every theorem has its final intended hypotheses and conclusion.
3. `sorry` may occur in theorem, lemma, proposition, corollary, or proof-field bodies while proofs are pending.
4. `sorry` must not be used to manufacture a carrier, operation, relation, quotient, model, or other mathematical definition.
5. No named result may have the vacuous conclusion `True` unless the result is genuinely the proposition `True`.
6. No mathematical predicate may be defined as `True` merely to reserve a name.
7. Generic theorems must state every hypothesis required for validity; arbitrary operations do not automatically respect arbitrary equivalence relations.
8. The active Lean libraries must compile with pending theorem proofs represented only by `sorry`.
9. The dependency order in Lean, Markdown, TeX, and the proof queue must agree.

## Mistake: replacing definitions with placeholders

The following pattern is invalid for a proof-ready project:

```lean
def is_cauchy (sequence : Nat → RationalCarrier) : Prop :=
  True
```

It does not postpone a proof. It changes the definition and makes every sequence Cauchy.

The corrected pattern is a complete definition whose supporting algebraic and order data are explicit:

```lean
def IsCauchy
    (abs : RationalCarrier → RationalCarrier)
    (sub : RationalCarrier → RationalCarrier → RationalCarrier)
    (lt : RationalCarrier → RationalCarrier → Prop)
    (positive : RationalCarrier → Prop)
    (sequence : Nat → RationalCarrier) : Prop :=
  ∀ epsilon,
    positive epsilon →
    ∃ N,
      ∀ m n,
        N ≤ m →
        N ≤ n →
        lt (abs (sub (sequence m) (sequence n))) epsilon
```

The exact signature may be normalized through the project interfaces, but its semantics must match the Markdown.

## Mistake: replacing theorem statements with `True`

This pattern is invalid:

```lean
theorem quotient_multiplication_is_distributive : True := by
  sorry
```

The proof is postponed, but the theorem itself has not been stated.

The corrected theorem must quantify over the quotient elements and assert the actual equality:

```lean
theorem quotient_multiplication_is_distributive
    (x y z : RealCarrier) :
    mul x (add y z) = add (mul x y) (mul x z) := by
  sorry
```

## Mistake: overgeneralized quotient claims

This pattern is generally false:

```lean
theorem representative_addition_respects_equivalence
    (setoid : Setoid A)
    (add : A → A → A) :
    binary_operation_respects setoid add := by
  sorry
```

An arbitrary operation need not respect an arbitrary setoid. The corrected development must either:

- define the concrete representative operation and prove compatibility from its concrete algebraic laws; or
- accept compatibility as an explicit hypothesis in a generic descent theorem.

The generic descent theorem belongs in the quotient foundation layer. Concrete compatibility proofs belong with each construction.

## Mistake: opaque model fabrication

This pattern is not construction-ready:

```lean
noncomputable def real_model : RealModel := by
  sorry
```

It creates an opaque object without defining its carrier or operations. Downstream declarations can then depend on an object that has never been constructed.

The corrected order is:

1. representative carrier;
2. equivalence relation;
3. proof that it is an equivalence relation;
4. setoid;
5. quotient carrier;
6. representative operations;
7. well-definedness proofs;
8. quotient operations;
9. algebraic and order laws;
10. packaged model;
11. canonical embedding and universal/comparison results.

Only the proof steps may remain `sorry`.

## Source-of-truth order

The active proof queue is:

1. abstract laws, transport, quotient descent, embeddings, and universal properties;
2. one-based natural numbers `N`;
3. whole numbers `W`;
4. place value, divisibility, and Euclidean division;
5. canonical, Tao, and Mendelson integer constructions;
6. rationals and continued fractions;
7. Dedekind reals;
8. Cauchy reals;
9. Cantor nested-interval reals mediated through Cauchy endpoints;
10. primitive persistent-overlap interval quotient reals;
11. dyadic reals;
12. computable reals and comparison/isomorphism results;
13. real extensions, extended reals, and interval arithmetic over an existing real field;
14. complex numbers;
15. characteristic, cardinality, and the global comparison matrix.

The p-adic document is a sequel and is not part of the active proof gate unless explicitly enabled.

## The three interval documents must remain distinct

### Cantor nested intervals

This construction extracts rational endpoint sequences and deliberately uses the Cauchy-real machinery for equality and arithmetic.

### Primitive interval quotient

This is an independent construction of the reals. Its primitive equivalence is persistent cross-level overlap:

```text
I ~ J  iff  I_m intersects J_n for every m and n.
```

Same-index overlap is insufficient because it need not be transitive.

### Interval arithmetic over the reals

This is a later numerical enclosure calculus over an already-constructed real field. It is not a construction of the real numbers.

## Markdown-to-Lean manifest

A machine-readable manifest must map each mathematical block to:

- Markdown source file;
- stable block identifier;
- canonical title;
- Lean module;
- Lean declaration name;
- declaration kind;
- dependency identifiers;
- proof status;
- Blueprint label.

The manifest prevents Markdown, Lean, and TeX from silently diverging.

## Blueprint generation

The Blueprint must be assembled from the streamlined Markdown rather than from a separate handwritten mathematical outline.

Generation must:

1. preserve the Markdown construction order;
2. convert mathematical blocks to idiomatic TeX;
3. assign stable labels from the manifest;
4. add `\lean{...}` and `\uses{...}` metadata from the manifest;
5. include proof-status annotations without changing the mathematical statements;
6. generate both web and print forms;
7. link every declaration to the repository source page;
8. fail on unresolved labels, duplicate labels, missing Lean declarations, or missing Markdown blocks.

## CI acceptance gates

The branch is ready to merge only when CI verifies:

- every active Lean library builds;
- no `def`, `abbrev`, `structure`, `inductive`, `class`, or `instance` body contains `sorry` unless explicitly allowlisted as a temporary construction blocker;
- no construction predicate is definitionally `True` or `False` unless allowlisted and mathematically intended;
- no named theorem in the number-system tree has bare conclusion `True`;
- every manifest Lean declaration exists;
- every manifest Markdown block exists;
- every Blueprint label resolves;
- the Blueprint PDF and HTML build;
- generated Pages links do not return internal 404s;
- proof-status reports distinguish definitions, statements with pending proofs, and completed proofs.

## Status vocabulary

Use only these statuses:

- `definition-complete` — the mathematical object is genuinely defined;
- `statement-complete-proof-pending` — theorem statement is final and proof contains `sorry`;
- `proved` — no `sorryAx` dependency;
- `construction-blocked` — the definition is not yet formalized and must not be exposed as a completed declaration;
- `sequel` — outside the active proof queue.

Do not use `statement-accepted-proof-pending` for vacuous or schematic declarations.

## Governing lesson

A `sorry` postpones proof of a proposition already stated. It does not postpone deciding what the proposition or definition means.

The repository is ready for proving only when the mathematics is complete at the level of definitions and theorem signatures, the dependency order is fixed, and the remaining uncertainty is confined to proof bodies.