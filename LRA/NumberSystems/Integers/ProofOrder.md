# Integers Proof Order

Tracks the proofs needed to land all five integer constructions as working
realizations of the generic interfaces they each satisfy (`IntegerStructure`
for successor-first constructions, `LRA.NumberSystems.Models.DiscretelyOrderedIntegralDomainModel`
for ring-first ones), in the order they should be discharged. Every item
marked `[ ]` is currently `sorry`; nothing is filled in until it's checked
off.

## Backends

Unlike the four natural-number constructions, which all realize one shared
interface (`PeanoSystem Element SetObject`), the five integer constructions
split into two families depending on how they present the carrier:

| System | Carrier | Interface realized | How discharged |
|---|---|---|---|
| `Polish.TwoSidedSuccessor` | `Z` (native `inductive`, zero + positive/negative rays) | `IntegerStructure Z (PredicateSet Z)` | Successor/predecessor laws mostly **proved** (`pred_succ`, `succ_pred`, `twoSidedInduction`, ring/order laws); `aperiodic` and the realization assembly itself are `sorry` |
| `QuotientOrderedPairs` | `Quotient (representative_setoid whole_data)`, generic over any `WholeNumberArithmeticForQuotientPairs` | `LRA.NumberSystems.Models.DiscretelyOrderedIntegralDomainModel` | Quotient operations **proved to exist** (`quotient_addition_exists` etc, via `LRA.UniversalAlgebra.Quotient`); well-definedness and the ring/order laws themselves are `sorry`. Canonical whole-number carriers can now enter through `NaturalNumbers.Constructions.WholeNumbers.quotientOrderedPairsInput`, so the strengthened translation-reflecting order contract is no longer detached from the active whole-number owner surface. |
| `Mendelson` | `Quotient (setoid positive_data)` of positive-natural pairs | `DiscretelyOrderedIntegralDomainModel`, plus recovers a `PeanoSystem` model from its positive classes | All `sorry` past the raw definitions |
| `Tao` | `Quotient (setoid whole_data)` of formal differences `a -- b` | `DiscretelyOrderedIntegralDomainModel` | All `sorry` past the raw definitions |
| `Pfefer` | none yet | none yet | Placeholder only (`ConstructionPlan`/`plan`), no mathematics |

`Polish` is the odd one out structurally: it is the only construction that
defines its own `succ`/`pred` from scratch rather than quotienting pairs of
whole numbers, so it is the only one that can realize `IntegerStructure`
directly. The other three (`QuotientOrderedPairs`, `Mendelson`, `Tao`) are
ring-first: their "successor" is only ever `+ one`, never a primitive
operation, so they realize `DiscretelyOrderedIntegralDomainModel` instead. Reconciling the two
families — showing every `DiscretelyOrderedIntegralDomainModel` with a discrete order also yields an
`IntegerStructure`, or vice versa — is itself a categoricity-adjacent gap,
tracked below.

---

# Part 0 — the generic `IntegerStructure` layer

Promoted from `LRA.VolumeII.Integers.Polish.DiscreteIntegerStructure` to
`LRA.NumberSystems.IntegerStructure`, per the two-sided Peano axiomatization
worked out in this migration: signature `(Z, S, P, 0, 1, -1)`, with `S`/`P`
mutually inverse, `S 0 = 1`, `P 0 = -1`, no positive number of forward steps
from `0` returns to `0`, and two-sided induction. Mirrors
`LRA.NumberSystems.PeanoSystem`'s three-layer shape (`Definition.lean`,
`Interface/{Signature,ModelTheory}/`, `Categoricity.lean`).

- [x] `IntegerStructure.Definition` — the `Element`/`SetObject`-generic
      working type (`structure IntegerStructure`), written, no proof
      obligations (a record type).
- [x] `IntegerStructure.Interface.Signature.Definition` — the FO vocabulary
      (`successor`, `predecessor`, `zero`, `one`, `negativeOne`), written.
- [x] `IntegerStructure.Interface.ModelTheory.LStructure` — law-free
      `L_int`-structure builders
      (`BuildIntegerStructureLStructure`/`BuildIntegerStructureModel`,
      `integerStructureFirstOrderModel`), written.
- [x] `IntegerStructure.Interface.ModelTheory.Theory` — the axioms as
      `Prop`s over an `L_int`-structure/`HenkinModel`, written.
- [ ] `IntegerStructure.Interface.ModelTheory.Model` — strict
      structure/theory/model packaging is present, but the bridge lemma
      ("every `IntegerStructure Element SetObject` yields a `HenkinModel`
      satisfying `IntegerStructureHenkinTheory`
      / `IntegerStructureTheory` / `IntegerStructureAxioms`") is not yet
      stated.
- [ ] `IntegerStructure.Categoricity.UniquenessOfIntegerStructuresUpToIsomorphism`
      — any two integer structures are isomorphic via the canonical map
      `0 ↦ 0`, `Sⁿ 0 ↦ Sⁿ 0`, `Pⁿ 0 ↦ Pⁿ 0`. Mirrors
      `PeanoSystem.Categoricity.UniquenessOfPeanoSystemsUpToIsomorphism`
      (itself still `sorry`). Both generic categoricity statements now
      explicitly require full predicate induction, either supplied directly or
      derived from a backend `PredicateSetComprehensionAdequacy` witness,
      rather than relying on backend-relative subset induction alone.
- [x] `IntegerStructure.Bundled` — the original, self-contained (non-generic,
      `carrier`-bundled) presentation, moved unchanged from
      `Polish.DiscreteIntegerStructure`: `iterate`, `Injective`/`Surjective`/
      `Bijective`, `structure IntegerStructure`, and a **fully proved**
      categoricity result (`rep`, `rep_bijective`, `categoricity`) against
      Lean's built-in `Int` specifically.

**Gap to research:** `IntegerStructure.Bundled.IntegerStructure` and
`IntegerStructure.IntegerStructure` (the `Definition.lean` one) are two
presentations of the same idea that have never been unified. The `Bundled`
one has a real, checked categoricity proof but only against `Int`, not
model-to-model; the `Definition.lean` one is `Element`/`SetObject`-generic
but its categoricity is `sorry`. Whether to derive one from the other, or
prove `Categoricity` by adapting `Bundled`'s `rep`/`iterate` technique
generically, is open.

- [ ] `Polish.TwoSidedSuccessor.Instances.PolishRealizesIntegerStructure` —
      `TwoSidedSuccessor.Z` realizing the generic interface. Every field has
      a proved (or, for `aperiodic`, already-`sorry`) component lemma
      elsewhere in `Polish.TwoSidedSuccessor`; only the *assembly* is new,
      hence `sorry` rather than composed without a toolchain to check it.

---

# Part A — Polish (`TwoSidedSuccessor`)

Split from the former single-file `Polish.{TwoSidedSuccessor,LandauWorkup,Instances}`
into the §1.6.1 pipeline.

- [x] `Carrier.lean` — `P`, `N`, `Z`, `succ`, `pred`, `one`, written.
- [x] `Equivalence.lean` — thin; no quotient is taken (native `inductive`).
- [x] `WellFoundedness.lean` — `pred_succ`, `succ_pred`, `recP`/`recN`/`recZ`
      and their computation rules, `recursion_exists`, `succ_injective`,
      `pred_injective`, `twoSidedInduction`, `recursion_unique` — all
      **proved**.
- [x] `Operations.lean` — `add`, `negZ`, `mul` and their `Add`/`Neg`/`Mul`
      instances, plus `add_succ`/`add_pred` — **proved**.
- [x] `WellDefinedness.lean` — thin; no quotient, so no respects-the-
      equivalence obligation.
- [x] `Laws.lean` — the full ring-and-order development (associativity,
      commutativity, distributivity, `Pos`/`IsNeg`/trichotomy, `<`/`≤` and
      their compatibility with `+`/`*`) — **proved**, moved unchanged from
      `LandauWorkup`.
- [ ] `Behavior.lean` — new: `succ_zero_eq_one`, `pred_zero_eq_neg_one`,
      `neg_one_lt_zero_lt_one`. The source never stated these; `sorry`.
- [ ] `Instances.lean` — algebraic-structure certificates: most **proved**
      by delegation (`AdditiveSemigroupLaws`, `MultiplicativeCommutativeLaws`,
      `SuccessorLaws`, …); `NontrivialityLaw`, `NoZeroDivisorsLaw`,
      `PartialOrderLaws.LeTrans`, `TotalOrderLaw`,
      `StrictOrderCompatibilityLaw`, `AdditionRespectsOrderLaws`,
      `MultiplicationRespectsOrderLaws`, `OrderDiscretenessLaw`,
      `DiscretenessLaw.SuccAperiodic` remain `sorry` (moved unchanged from
      the source's own proving queue). `PolishRealizesIntegerStructure` is
      new, `sorry` (see Part 0).

---

# Part B — QuotientOrderedPairs (default construction)

Split from the former single 765-line file.

- [x] `Carrier.lean` — `WholeNumberArithmeticForQuotientPairs`,
      `Representative`, written (record types, no proof obligations).
- [ ] `Equivalence.lean` — `equivalent`, `representative_setoid`, `Carrier`
      written; `equivalent_is_equivalence_relation` is `sorry`.
- [ ] `WellFoundedness.lean` — new: `induction_on_representatives`, `sorry`.
- [x] `Operations.lean` — `representative_addition`/`negation`/
      `multiplication`/`nonstrict_order`, `zero_representative`,
      `one_representative`, `embed`, written; `embedding_is_injective` is
      `sorry`.
- [ ] `WellDefinedness.lean` — `representative_*_respects_equivalence` (×4)
      are `sorry`; `quotient_addition_exists`, `quotient_multiplication_exists`,
      `quotient_order_exists` are **proved** (via
      `LRA.UniversalAlgebra.Quotient.induced_{binary_operation,relation}_exists`).
- [ ] `Laws.lean` — `quotient_addition_is_associative`/`is_commutative`,
      `quotient_negation_is_additive_inverse`,
      `quotient_multiplication_distributes_over_addition`, all `sorry`.
- [ ] `Behavior.lean` — new: `embed_preserves_addition`,
      `embed_one_eq_one_representative_class`,
      `embed_zero_eq_zero_representative_class`, all `sorry`.
- [ ] `Instances.lean` — new: `QuotientOrderedPairsRealizesIntegerModel`,
      `sorry`.

---

# Part C — Mendelson

- [x] `Carrier.lean` — `PositiveNaturalPairData`, `PositivePair`, written.
- [ ] `Equivalence.lean` — `equivalent`, `setoid`, `Carrier` written;
      `equivalent_is_equivalence_relation` is `sorry`.
- [ ] `WellFoundedness.lean` — new: `induction_on_representatives`, `sorry`.
- [x] `Operations.lean` — `representative_addition`/`negation`/
      `multiplication`, `positive_class`, `representative_strict_order`,
      written.
- [ ] `WellDefinedness.lean` — `representative_operations_respect_equivalence`,
      `sorry`.
- [ ] `Laws.lean` — thin; no per-law breakdown exists in the source (see
      gap below).
- [ ] `Behavior.lean` — new: `one_one_not_positive_class`, `sorry`.
- [ ] `Instances.lean` — `positive_classes_recover_natural_number_model`
      (recovers a `PeanoSystem` model — this construction's own realization
      obligation, not a comparison against another integer construction) and
      `mendelson_integers_form_ordered_ring` (realizes `DiscretelyOrderedIntegralDomainModel`), both
      `sorry`, moved unchanged.

**Deleted:** `mendelson_compares_with_quotient_ordered_pairs`. See the
research note below.

---

# Part D — Tao

- [x] `Carrier.lean` — `WholeNumberArithmeticForTaoFormalDifferences`,
      `FormalDifference`, written.
- [ ] `Equivalence.lean` — `equivalent`, `setoid`, `Carrier` written;
      `equivalent_is_equivalence_relation` is `sorry`.
- [ ] `WellFoundedness.lean` — new: `induction_on_representatives`, `sorry`.
- [x] `Operations.lean` — `zero_representative`,
      `whole_embedding_representative`, `whole_embedding`,
      `representative_addition`/`negation`/`multiplication`, `nonnegative`,
      `representative_strict_order`, written;
      `whole_embedding_is_injective` is `sorry`.
- [ ] `WellDefinedness.lean` — `representative_operations_respect_equivalence`,
      `sorry`.
- [ ] `Laws.lean` — thin; no per-law breakdown exists in the source (see
      gap below).
- [ ] `Behavior.lean` — new: `whole_embedding_preserves_addition`,
      `whole_embedding_zero_eq_zero_representative_class`, `sorry`.
- [ ] `Instances.lean` — `tao_integers_form_ordered_ring`, `sorry`, moved
      unchanged.

**Deleted:** `tao_compares_with_quotient_ordered_pairs`. See the research
note below.

---

# Part E — Pfefer

No mathematics yet: `ConstructionPlan`/`plan` is a placeholder recording
that the Pfefer canonical construction is pending formalization. Moved
unchanged; no pipeline split (nothing to split).

---

## Research note: deleted cross-construction comparison theorems

`Mendelson.mendelson_compares_with_quotient_ordered_pairs`,
`Tao.tao_compares_with_quotient_ordered_pairs`, and the entire (orphaned,
never-imported) `LRA.VolumeII.Integers.ConstructionModels` file — three
`Comparison` namespaces (`QuotientOrderedPairsComparison`, `TaoComparison`,
`MendelsonComparison`) each restating `Representative`/`equivalent` from
scratch, plus a shared `ModelIsomorphism` structure and pairwise isomorphism
theorems, all gated on `sorry` — were deleted rather than migrated.

Judgment call, made explicitly rather than silently: these theorems tried to
state "construction A and construction B produce the same integers" by
directly comparing carriers pairwise. That is exactly what "realizes" and
"satisfies" a shared interface already mean in this migration's
architecture — every construction proves it realizes `DiscretelyOrderedIntegralDomainModel` (or
`IntegerStructure`), and `IntegerStructure.Categoricity`/a still-to-be-written
`DiscretelyOrderedIntegralDomainModel` categoricity theorem is what ties all realizations together
as "the same," the way `PeanoSystem.Categoricity` does for the naturals.
Restating that pairwise, per pair of constructions, is the duplication this
architecture exists to avoid.

**To research before this is fully closed:**

1. Does `LRA.NumberSystems.Models.DiscretelyOrderedIntegralDomainModel` need its own categoricity
   theorem (mirroring `PeanoSystem.Categoricity` and
   `IntegerStructure.Categoricity`), so that "QuotientOrderedPairs, Mendelson,
   and Tao are all the same" follows from each realizing `DiscretelyOrderedIntegralDomainModel` plus
   one shared uniqueness proof, rather than needing to be stated at all?
2. Is `ConstructionModels.lean`'s abstract, from-scratch restatement of
   `Representative`/`equivalent` inside each `Comparison` namespace doing any
   work the real construction files (`QuotientOrderedPairs`, `Mendelson`,
   `Tao`) don't already do? If not, it was pure duplication and deleting it
   lost nothing; if it was probing a genuinely different abstraction, that
   should be re-derived deliberately, not resurrected from git history
   unread.
3. `RationalNumbers/ComparisonModels.lean` and `RealNumbers/ConstructionModels.lean`
   carry the same pattern one system up the embedding chain. Whether they
   should be resolved the same way is out of scope for this row but worth
   flagging before those systems migrate.

(The deleted content remains in git history if any of the above concludes it
should be resurrected.)

---

## Gap: per-law breakdown missing for Mendelson and Tao

`QuotientOrderedPairs.Laws` states four separate law theorems
(`quotient_addition_is_associative`, `_is_commutative`,
`quotient_negation_is_additive_inverse`,
`quotient_multiplication_distributes_over_addition`). Mendelson and Tao only
ever stated the aggregate `_integers_form_ordered_ring` existence claim, so
their `Laws.lean` files are currently thin notes rather than proof
obligations. Breaking `mendelson_integers_form_ordered_ring`/
`tao_integers_form_ordered_ring` into the same per-law shape as
`QuotientOrderedPairs` — so `Laws.lean` actually carries obligations for
these two constructions too — is deferred, not done in this pass.
