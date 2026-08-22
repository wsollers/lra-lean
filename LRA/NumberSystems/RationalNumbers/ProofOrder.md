# Rational Numbers Proof Order

Tracks the proofs needed to land the rational-number construction as a
working realization of `LRA.NumberSystems.Models.DenselyOrderedFieldModel`, in the
order they should be discharged. Every item marked `[ ]` is currently
`sorry`; nothing is filled in until it's checked off.

## Backends

Unlike `NaturalNumbers` (four constructions of one shared `PeanoSystem`
interface) and `Integers` (five constructions split across
`IntegerStructure`/`DiscretelyOrderedIntegralDomainModel`), `RationalNumbers` has exactly one real
construction here: `RationalQuotientFractions`, quotient fractions built
generically over any `IntegerAndPositiveNaturalData` (an integer model plus
a positive-natural carrier with a `to_integer` embedding). It realizes
`LRA.NumberSystems.Models.DenselyOrderedFieldModel` -- a densely ordered field.

`ComparisonModels.lean`'s three namespaces (`QuotientFractionsComparison`,
`Reduced`, `FractionField`) are thinner alternate-model *existence* claims
(`Nonempty DenselyOrderedFieldModel`), not full constructions run through the §1.6.1
pipeline -- see the note there and the research question below.

---

# Part A — RationalQuotientFractions

Split from the former single 1351-line file.

- [x] `Carrier.lean` — `IntegerAndPositiveNaturalData`, `Representative`,
      written (record types, no proof obligations).
- [ ] `Equivalence.lean` — `equivalent`, `representative_setoid`, `Carrier`
      written; `equivalent_is_equivalence_relation` is `sorry`.
- [ ] `WellFoundedness.lean` — new: `induction_on_representatives`, `sorry`
      (mirrors the same gap in Integer's quotient constructions).
- [x] `Operations.lean` — `representative_addition`/`multiplication`/
      `negation`, `zero_representative`, `one_representative`, `zero`,
      `one`, `representative_strict_order`, written.
- [ ] `WellDefinedness.lean` — `representative_operations_respect_equivalence`
      is `sorry`; `addition`/`multiplication` (`Classical.choose`-based,
      consuming that obligation) are written but depend on it;
      `negation_exists` is `sorry`, `negation` depends on it;
      `representative_strict_order_respects_equivalence` is `sorry`;
      `strict_order` (induced) and `nonstrict_order` (derived) are written.
- [ ] `Laws.lean` — `additive_group_laws`, `multiplicative_and_distributive_laws`,
      `reciprocal_exists_uniquely`, `inverse_is_two_sided`, `field_structure`,
      `strict_total_order`, `ordered_field_compatibility`,
      `ordered_field_structure` — all `sorry`.
- [ ] `Behavior.lean` — `integer_embedding_properties` (the embedding
      preserves/reflects ordered-ring structure), `reduced_representative_exists`,
      `reduced_representative_unique`, `unique_lowest_term_form`, `density`,
      `archimedean_property`, `integer_part_bounds`,
      `square_root_two_cut_nonempty_bounded`, `no_rational_square_root_two`,
      `square_root_two_cut_has_no_supremum`, `not_order_complete`,
      `structure_of_the_rationals` (final summary) — all `sorry`, moved
      unchanged.
- [ ] `Instances.lean` — new: `RationalQuotientFractionsRealizesDenselyOrderedFieldModel`,
      `sorry`.

---

## `ComparisonModels.lean` — kept, not deleted

Moved unchanged from `LRA.VolumeII.RationalNumbers.ComparisonModels` to
`LRA.NumberSystems.RationalNumbers.ComparisonModels`. Unlike Integer's
`ConstructionModels.lean` (deleted during that migration -- see
`Integers/ProofOrder.md`'s research note), this file is **not** orphaned:
it is actively imported via the old `RationalNumbers.lean` aggregate (now
`LRA.NumberSystems.RationalNumbers`'s), and `RealNumbers/ConstructionModels.lean`
imports `RationalQuotientFractions` directly (not through this file).

**Research question, not resolved in this pass:** `QuotientFractionsComparison`,
`Reduced`, and `FractionField` are three *abstract* ways a `DenselyOrderedFieldModel`
might arise (quotient fractions again, reduced fractions, or a generic
integral-domain fraction field), each only asserting existence
(`Nonempty DenselyOrderedFieldModel`) rather than being concrete constructions like
`RationalQuotientFractions` is. The three pairwise `ModelIsomorphism`
theorems at the bottom of the file argue these three abstract existence
claims agree with each other -- but none of them is tied back to the real
`RationalQuotientFractions` construction above by name. Whether this is:

1. genuinely useful (a categoricity-style "any reasonable way of building
   rationals from integers gives isomorphic fields" result, independent of
   which construction realizes it), or
2. the same kind of pairwise-comparison duplication the Integer migration's
   research note flagged (better superseded by each construction proving it
   realizes `DenselyOrderedFieldModel`, plus one shared `DenselyOrderedFieldModel` categoricity
   theorem)

is open. Kept as-is here since, unlike Integer's case, it is not orphaned
and deleting live, imported content without the same explicit judgment call
the user made for Integer would not be the same decision.

---

## Deferred: `ContinuedFractions.lean`

Left at `LRA.VolumeII.RationalNumbers.ContinuedFractions` (not moved).
It imports `LRA.VolumeII.RealNumbers.Irrationals` -- a forward dependency
on the Real system, which has not yet been migrated per the embedding-chain
order (§7.7 step 4: "...whole, integer, rational, real, ..."). Its own
import of `RationalQuotientFractions` was repointed to the new location so
it keeps building; the file itself moves once Real is promoted.

---

## Gap: no per-law breakdown beyond what the source already had

Unlike `QuotientOrderedPairs` (Integer), which needed new per-law sorry
stubs invented for this migration, `RationalQuotientFractions`'s source
already stated every law and structural theorem individually (additive
group, multiplicative/distributive, field, strict total order, ordered-field
compatibility) -- nothing new was invented in `Laws.lean` beyond the file
split itself. The only genuinely new content added in this pass is
`WellFoundedness.lean`'s induction principle and `Instances.lean`'s
`DenselyOrderedFieldModel` realization, both flagged above.
