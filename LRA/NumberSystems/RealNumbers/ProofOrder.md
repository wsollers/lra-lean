# Real Numbers Proof Order

Tracks the proofs needed to land the real-number constructions as working
realizations of `LRA.NumberSystems.Models.RealModel`, in the order they
should be discharged. Every item marked `[ ]` is currently `sorry`; nothing
is filled in until it's checked off.

## Backends

Unlike `RationalNumbers` (one construction), `RealNumbers` has **six**
constructions, migrated from six former `LRA.VolumeII.RealNumbers/*.lean`
files (plus a large `ConstructionModels.lean` of alternate-model existence
claims, and four top-level auxiliary files that build derived theory atop
any `RealModel`/`CofinalRealExtension` rather than constructing the reals
themselves):

- `Cauchy` -- Cauchy sequences of rationals modulo null-difference
  equivalence. The **foundational** construction: `Dyadic` transports a
  full ordered-field structure through a bijection to `Cauchy.Carrier`,
  and `Cantor`/`PrimitiveIntervals` each state one comparison theorem
  against it.
- `Cantor` -- nested rational-interval sequences modulo shared-endpoint
  equivalence.
- `Dedekind` -- Dedekind cuts (subtype of rational lower sets satisfying
  four axioms). The **reference construction** per its own source doc
  comment.
- `Dyadic` -- binary/dyadic digit expansions, with arithmetic transported
  through a bijection to `Cauchy.Carrier` rather than defined directly.
- `PrimitiveIntervals` -- nested rational intervals under "persistent
  cross-level overlap" equivalence; despite its own doc comment claiming
  independence from Cauchy and Cantor, it imports `Cauchy` and uses it in
  one theorem (`persistent_overlap_iff_endpoint_null`) -- preserved as-is,
  not "fixed", per this migration's content-preservation policy.
- `Computable` -- computable reals via effective rational approximations
  with a modulus function; the smallest and most self-contained
  construction (no cross-construction dependency).

Each realizes `LRA.NumberSystems.Models.RealModel` via its own
`Instances.lean`, all `sorry`. Cross-construction pairwise comparisons
(`ModelIsomorphism` theorems between Dedekind and each of the other four
-- Cantor, Cauchy, PrimitiveIntervals-as-`PrimitiveIntervalQuotient`, and
Dyadic-as-`DyadicExpansions`) live separately in `ConstructionModels.lean`,
as thinner abstract-existence claims rather than ties back to the six real
constructions above -- see that section below, mirroring the open research
question already on record for Rational's `ComparisonModels.lean`.

### Naming: PascalCase for new content

This migration pass resolved canonical `lra-governance` for the first time
(prior Integer/Rational passes ran without it available in-session). Its
`lra-lean` overlay requires PascalCase for LRA-authored public
declarations, reserving snake_case for pre-existing/legacy content. All
*moved* declarations below keep their original source names exactly
(preserving mathematical substance is explicit governance policy); all
*new* declarations added in this pass (`WellFoundedness.lean` induction
stubs, `Instances.lean` realization defs) use PascalCase --
e.g. `InductionOnRepresentatives`, `CauchyRealizesRationalRealExtension` -- unlike the
already-merged Rational pass's `induction_on_representatives` (snake_case,
predates this governance resolution, not retroactively renamed here since
that's out of scope for the Real migration).

### Fixed during this pass: missing `open` in generated stage files

Six parallel migration passes initially produced stage files (all but
each construction's `Carrier.lean`) that referenced `DenselyOrderedFieldModel`/
`RealModel`/etc. -- declared in `LRA.NumberSystems.Models`, a sibling
namespace, not an ancestor of `LRA.NumberSystems.RealNumbers.<Construction>`
-- unqualified, without their own `open LRA.NumberSystems.Models` line.
Lean 4's `open` does not propagate across file imports, so this would have
failed to elaborate. Fixed uniformly across all 27 affected files by adding
`open LRA.NumberSystems.Models` immediately after each file's `namespace`
line, matching the pattern each construction's own `Carrier.lean` already
used. Not caught by the (unavailable, no local toolchain) `lake build`
gate -- flagged instead by cross-referencing the generated files' import
graph against how `DenselyOrderedFieldModel` is actually declared.

---

# Part A -- Cauchy

Split from the former single 604-line file. Foundational: transported-into
by `Dyadic`, compared-against by `Cantor` and `PrimitiveIntervals`.

- [x] `Carrier.lean` -- `RationalMetricData` (over an actual
      `RationalNumberSystem`), `Sequence`, `distance`,
      `is_positive`, `is_cauchy`, `is_null`, `equivalent`, `Representative`,
      written (no proof obligations).
- [ ] `Equivalence.lean` -- `representative_equivalent`,
      `representative_equivalent_is_equivalence` (`sorry`),
      `representative_setoid`, `Carrier`.
- [ ] `WellFoundedness.lean` -- new: `InductionOnRepresentatives`, `sorry`.
- [x] `Operations.lean` -- `representative_addition`/`negation`/
      `multiplication`, written (raw defs, no proof obligations).
- [ ] `WellDefinedness.lean` -- `representative_addition_is_cauchy`/
      `negation_is_cauchy`/`multiplication_is_cauchy`,
      `representative_addition_respects_equivalence`/
      `multiplication_respects_equivalence` -- all `sorry`.
- [ ] `Laws.lean` -- placeholder: source states no additive-group,
      field, or order laws for this construction directly (those live in
      the generic `RealModel` interface, discharged once when this
      construction registers against it).
- [ ] `Behavior.lean` -- placeholder: source states no behavioral
      theorems (density, Archimedean property, etc.) for this
      construction directly.
- [ ] `Instances.lean` -- new: `CauchyRealizesRationalRealExtension`, `sorry`.

---

# Part B -- Cantor

Split from the former single 206-line file.

- [x] `Carrier.lean` -- `EndpointInterval`, `NestedIntervalSequence`,
      written.
- [ ] `Equivalence.lean` -- `endpoint_equivalent`,
      `endpoint_equivalent_is_equivalence` (`sorry`), `setoid`, `Carrier`.
- [ ] `WellFoundedness.lean` -- new: `InductionOnRepresentatives`, `sorry`
      (over `NestedIntervalSequence`, which doubles as this
      construction's representative type -- no separate `Representative`
      wrapper, unlike Cauchy).
- [ ] `Operations.lean`/`WellDefinedness.lean`/`Laws.lean` -- placeholders:
      source defines no arithmetic operations on `Carrier` at all, only
      pre-carrier data, equivalence, and one comparison theorem.
- [ ] `Behavior.lean` -- `cantor_reals_are_isomorphic_to_cauchy_reals`
      (`sorry`), repointed to `LRA.NumberSystems.RealNumbers.Cauchy`.
- [ ] `Instances.lean` -- new: `CantorRealizesRationalRealExtension`, `sorry`.

---

# Part C -- Dedekind

Split from the former single 1388-line file -- the **reference
construction** per its own doc comment, and the largest of the six.
Subtype-based (`Cut` is a structure of predicates satisfying four axioms),
not quotient-based, so `Equivalence.lean` is repurposed to hold the order
structure rather than a raw-representative equivalence relation.

- [x] `Carrier.lean` -- `Rational`, `RationalSet`, `IsCut`, `Cut`,
      `contains`, written; `cut_extensionality` `sorry`.
- [ ] `Equivalence.lean` (repurposed) -- `nonstrict_order`, `strict_order`,
      `StrictTotalOrder`, `strict_total_order` (`sorry`).
- [ ] `WellFoundedness.lean` -- new: `InductionOnCuts`, `sorry` (every cut
      is some `⟨lower_set, isCut-proof⟩` pair).
- [x] `Operations.lean` -- the raw, proof-free lower-set builders:
      `rational_lower_ray`, `addition_lower_set`, `negation_lower_set`,
      `nonnegative_product_lower_set`, `family_union`.
- [ ] `WellDefinedness.lean` -- everything that packages a lower set into a
      `Cut` (needs its `IsCut` proof at construction time) together with
      that proof: `rational_lower_ray_is_cut`, `rational_embedding`,
      `rational_embedding_is_order_embedding`, `addition_lower_set_is_cut`,
      `addition`, `zero`, `negation_lower_set_is_cut`, `negation`,
      `IsPositive`, `IsNonnegative`, `nonnegative_product_is_cut`,
      `nonnegative_multiplication`, `IsProduct`,
      `product_exists_uniquely`, `multiplication`, `one`, `IsReciprocal`,
      `reciprocal_exists_uniquely`, `inverse`, `inverse_correct`,
      `family_union_is_cut`, `family_supremum`, `family_union_is_supremum`
      -- all `sorry` except the raw packaging defs.
- [ ] `Laws.lean` -- `AdditiveGroupStructure`/`additive_group_structure`,
      `MultiplicativeAndDistributiveLaws`/`...laws`, `FieldStructure`/
      `field_structure`, `translation_invariance`,
      `positive_products_are_positive`, `OrderedFieldStructure`/
      `ordered_field_structure`, `LeastUpperBoundProperty`/
      `least_upper_bound_property`, `CompleteOrderedFieldStructure`/
      `complete_ordered_field_structure` -- all `sorry`.
- [ ] `Behavior.lean` -- `embedded_rationals_are_dense`,
      `archimedean_property`, `ReferenceRealNumberConstruction`/
      `reference_real_number_construction` (final summary) -- all `sorry`.
- [ ] `Instances.lean` -- new: `DedekindRealizesRationalRealExtension`, `sorry`.

---

# Part D -- Dyadic

Split from the former single 995-line file. Genuinely depends on `Cauchy`:
arithmetic is *transported* through a bijection to `Cauchy.Carrier`, not
defined directly.

- [x] `Carrier.lean` -- `Digit`, `FractionalDigits`, `IsBinaryDigitSequence`,
      `IsCanonical`, `CanonicalFraction`, `FiniteNumeral`,
      `UnsignedExpansion`, `Sign`, `Expansion`, `RationalDyadicApproximationData`
      (bundles a `Cauchy.RationalMetricData` over an actual
      `RationalNumberSystem` plus transported Cauchy
      arithmetic), `Rational`/`CauchyCarrier`, `IsDyadicRational`, written.
- [ ] `Equivalence.lean` -- `dyadic_subring`, `dyadic_rationals_are_dense`
      (both `sorry`; `binary_tail_ambiguity`/`canonical_fractional_uniqueness`
      relocated to `Behavior.lean` -- see judgment call below).
- [ ] `WellFoundedness.lean` -- placeholder: `Expansion` is a plain
      (non-quotient) inductive, so Lean's derived recursor already
      supplies the case-split principle this stage exists to provide.
- [x] `Operations.lean` -- `fractional_partial_sum` only (written).
- [ ] `WellDefinedness.lean` -- `fractional_partial_sums_are_cauchy`,
      `fractional_value`, `unsigned_value`, `value`,
      `representation_exists`, `value_is_injective`,
      `value_is_bijective`, `Bijection`, `binary_real_bijection_exists`,
      `binaryRealBijection` -- all `sorry` except the raw defs.
- [ ] `Laws.lean` -- transported `zero`/`one`/`addition`/`negation`/
      `multiplication`/`inverse`/`strict_order` (via the bijection),
      `OrderedFieldIsomorphism`/`ordered_field_isomorphism` (`sorry`).
- [ ] `Behavior.lean` -- `binary_tail_ambiguity`,
      `canonical_fractional_uniqueness`, `CompleteArchimedeanOrderedField`/
      `complete_archimedean_ordered_field` (final summary) -- all `sorry`.
- [ ] `Instances.lean` -- new: `DyadicRealizesRationalRealExtension`, `sorry`.

**Judgment call (dependency-order relocations, both flagged in-file):**
`fractional_value`/`unsigned_value`/`value` moved from their textual
source position (which the generic guidance mapped to `Operations.lean`)
into `WellDefinedness.lean`, since `fractional_value`'s body calls
`fractional_partial_sums_are_cauchy`, itself a `WellDefinedness`-stage
fact -- stating it earlier would reach forward past its own supplying
stage. `binary_tail_ambiguity`/`canonical_fractional_uniqueness` moved
from `Equivalence.lean` to `Behavior.lean` for the same reason (both
depend on `fractional_value`).

---

# Part E -- PrimitiveIntervals

Split from the former single 1676-line file, the largest of the six.
Despite its own doc comment claiming "definitional independence" from
Cantor and Cauchy, it imports `Cauchy` and uses it in
`persistent_overlap_iff_endpoint_null` -- preserved verbatim, not "fixed".
The earlier self-referential field-summary certificate and fake self-comparison
have been removed. Individual law theorems remain in `Laws.lean`; the
authoritative real-number certification is the carrier-tied
`PrimitiveIntervalsRealizesRationalRealExtension` theorem in `Instances.lean`.

- [x] `Carrier.lean` -- `Rational`, `RationalInterval`, `contains`,
      `subset`, `overlaps`, `width`, `IntervalSequence`, `Representative`,
      `degenerate_interval`, written; `nonstrict_order_reflexive` `sorry`.
- [ ] `Equivalence.lean` -- `equivalent`,
      `equivalent_is_equivalence_relation` (`sorry`),
      `representative_setoid`, `Carrier`,
      `constant_degenerate_sequence_is_admissible` (`sorry`),
      `rational_representative`, `rational_embedding`,
      `rational_embedding_is_injective` (`sorry`).
- [ ] `WellFoundedness.lean` -- new: `InductionOnRepresentatives`, `sorry`.
- [x] `Operations.lean` -- the choice-free predicates: `IsIntervalSum`,
      `IsIntervalNegation`, `IsCornerProduct`, `IsIntervalProduct`,
      `zero`, `one`, `representative_strict_order`.
- [ ] `WellDefinedness.lean` -- the `Classical.choose`-based operations
      together with the existence theorems each invokes (moved here as a
      unit since the operation calls its existence proof directly in its
      term, which cannot precede that proof in the pipeline):
      `interval_sum_exists_uniquely`/`interval_addition`,
      `interval_negation_exists_uniquely`/`interval_negation`,
      `interval_product_exists_uniquely`/`interval_multiplication`,
      `addition_preserves_admissibility`/`negation_preserves_admissibility`/
      `multiplication_preserves_admissibility`,
      `admissible_representatives_are_uniformly_bounded`,
      `representative_addition`/`negation`/`multiplication`,
      `representative_operations_respect_equivalence`, quotient
      `addition`/`quotient_negation_exists`/`negation`/`multiplication`,
      `representative_strict_order_respects_equivalence`, `strict_order`
      -- all `sorry` except the raw choice-based defs.
- [ ] `Laws.lean` -- `StrictTotalOrder`/`strict_total_order`,
      `OrderCompatibility`/`order_compatibility`,
      `raw_interval_subdistributivity`,
      `raw_interval_distributivity_can_fail`, `distributive_defect_vanishes`,
      `quotient_distributivity`, `nonzero_eventually_separated_from_zero`,
      `IsReciprocalInterval`, `reciprocal_exists_uniquely`, `inverse`,
      `LeastUpperBoundProperty`/`least_upper_bound_property` -- all `sorry`
      except raw defs. The former ad-hoc `OrderedFieldStructure` summary was
      removed in favor of the canonical carrier-tied `RationalRealExtension`
      certificate.
- [ ] `Behavior.lean` -- `persistent_overlap_iff_endpoint_null` (`sorry`,
      repointed to `LRA.NumberSystems.RealNumbers.Cauchy`),
      `canonical_comparison_isomorphism_exists` (`sorry`, self-referential,
      preserved), `PrimitiveIntervalConstructionOfReals`/
      `primitive_interval_construction_of_reals` (final summary, `sorry`).
- [ ] `Instances.lean` -- new: `PrimitiveIntervalsRealizesRationalRealExtension`, `sorry`.

---

# Part F -- Computable

Split from the former single 150-line file, the smallest and only
construction with no cross-construction dependency.

- [x] `Carrier.lean` -- `EffectiveApproximation`, `ComputableReal`, written.
- [x] `Equivalence.lean` -- `equivalent`, written (no equivalence-relation
      proof added: `ComputableReal` wraps a single `EffectiveApproximation`
      directly, not a `Setoid`/`Quotient` construction, so there is no
      quotient-carrier gap analogous to the other five constructions'
      `WellFoundedness.lean` stubs to fill here).
- [ ] `WellFoundedness.lean` -- placeholder: `ComputableReal` is a
      one-field structure with direct `.approximation` access, not a
      quotient, so no induction-on-representatives principle applies.
- [ ] `Operations.lean`/`WellDefinedness.lean`/`Laws.lean` -- placeholders:
      source never defines concrete arithmetic on `ComputableReal`, only
      asserts closure via the theorem in `Behavior.lean`.
- [ ] `Behavior.lean` -- `computable_reals_closed_under_arithmetic`,
      `computable_reals_are_countable` -- both `sorry`.
- [ ] `Instances.lean` -- new: `ComputableRealizesRealModel`, `sorry`.

---

## `ConstructionModels.lean` -- kept, not deleted

Moved unchanged from `LRA.VolumeII.RealNumbers.ConstructionModels` to
`LRA.NumberSystems.RealNumbers.ConstructionModels` (its imports already
pointed at the migrated `RationalQuotientFractions` path and its
declarations already used the `LRA.NumberSystems.RealNumbers` namespace,
so no repointing was needed on the move itself). Unlike Integer's
`ConstructionModels.lean` (deleted during that migration), this file is
**not** orphaned: it is actively imported via the aggregate router
`LRA.NumberSystems.RealNumbers`.

**Research question, not resolved in this pass** (same shape as the one
already on record for `RationalNumbers/ComparisonModels.lean`): this file
defines four *abstract* namespaces (`DedekindCuts`, `CauchySequences`,
`CantorNestedIntervals`, `PrimitiveIntervalQuotient` -- notably omitting
`Dyadic`) each only asserting `Nonempty RealModel`/`Nonempty
(CofinalRealExtension _)` existence, plus five pairwise `ModelIsomorphism`
theorems comparing `DedekindCuts` against each of the other three plus a
`DyadicExpansions` namespace that otherwise only appears here. None of
these four/five abstract namespaces is tied back by name to the six real
constructions built in `Constructions/` above. Whether this is a
genuinely useful categoricity-style result independent of which
construction realizes it, or duplicative of what each construction's own
`Instances.lean` `RealModel`-realization plus one shared `RealModel`
categoricity theorem would already give, is open.

---

## Top-level auxiliary files -- kept, not folded into any construction

`Extended.lean`, `Extensions.lean`, `IntervalArithmetic.lean`, and
`Irrationals.lean` moved unchanged to `LRA.NumberSystems.RealNumbers.*`
(only `Extended`'s and `IntervalArithmetic`'s imports of `Extensions`
needed repointing). Each builds derived theory (the extended real line,
integer powers/nth roots/categoricity, interval arithmetic, irrationality)
atop an already-existing `RealModel`/`CofinalRealExtension` parameter, rather
than constructing the reals itself -- analogous in role to Rational's
`ContinuedFractions.lean` (itself deferred pending this pass, now moved to
`LRA.NumberSystems.RationalNumbers.ContinuedFractions` with its
`Irrationals` import repointed here). Kept top-level rather than inside
any single construction's `Constructions/` pipeline, mirroring how
Rational's `ComparisonModels.lean` stayed top-level.

`NonNegative.lean` (new, this pass) joins them for the same reason: given
any `real_model : RealModel`, `NonNegativeReal`/`NonNegativeExtendedReal`
are canonically determined subtypes, not a competing construction of the
reals, so it gets no §1.6.1 pipeline of its own. See the section below.

---

## `NonNegative.lean` -- new, for distance/metric/norm use, not a construction

Requested to support future metric-space and norm work (`d x y ≥ 0`
needs a non-negative codomain; extended-valued metrics need a
non-negative-extended one). Modeled as two subtypes of an existing
`real_model : RealModel` / `ExtendedReal real_model`, mirroring the
existing `Dedekind.Cut` / `Irrationals.Carrier` subtype idiom rather than
introducing a fifth `NaturalNumbers`-style construction pipeline -- there
is no alternate axiomatization to reconcile the way Peano vs. Presburger
naturals, or Cauchy vs. Dedekind reals, compete over the same interface.

- [x] `NonNegativeReal`, `NonNegativeExtendedReal` -- subtype definitions,
      written (no proof obligation).
- [ ] `ZeroIsNonNegative`, `PositiveInfinityIsNonNegative`,
      `FiniteIsNonNegativeExtended`, `AdditionIsNonNegative`,
      `AddExtendedRawIsNonNegative` -- the five closure/witness lemmas the
      subtype constructors consume, all `sorry`. None looked "too trivial
      to sorry": this migration's standing policy is to never assert a
      proof it cannot verify compiles, including facts that look like a
      one-line unfold (matching the source's own `zero_is_rational`/
      `one_is_rational` precedent in `Irrationals.lean`).
- [x] `zero`, `infinity`, `toExtended`, `add`, `addExtendedRaw`,
      `addExtended`, `le`, `leExtended`, `toReal`, `toExtendedReal` --
      written (each either a pure projection/pattern-match with no proof
      obligation, or built directly from one of the `sorry`-stated lemmas
      above).

**Deliberately not included this pass:** multiplication on either type.
Its natural convention (`0 * positiveInfinity = 0`, the measure-theoretic
reading Mathlib's `ENNReal` uses rather than leaving the case undefined)
is an independent modeling choice, and neither a metric (`d x y = 0 ↔ x =
y`, symmetry, triangle inequality) nor a norm's scalar multiplication
(which acts by the base `RealModel`, not by another `NonNegativeReal`)
needs it. Left as a follow-up so this file stayed scoped to what was
asked.

**Mathlib bridge, kept out of the quarantine:**
`Interop/Mathlib/Extended.lean` and `Interop/Mathlib/NonNegative.lean`
state (both `sorry`) that `ExtendedReal mathlibRealModel`/`NonNegativeReal
mathlibRealModel`/`NonNegativeExtendedReal mathlibRealModel` are
order/addition-preserving-bijective with Mathlib's own `EReal`/`NNReal`/
`ENNReal`. Neither file is imported by the `RealNumbers` router or by
`NonNegative.lean` itself -- per `lakefile.lean`'s `Interop` carve-out,
they are compiled only by the `LRAAll` full-coverage target, keeping the
core route Mathlib-free. Their `Mathlib.Data.{EReal,NNReal,ENNReal}.Basic`
import paths are this session's best guess at the pinned Mathlib
version's module layout and may need correcting on first build; nothing
else in either file depends on the choice.

---

## Construction/Model.lean -- no switch to retire

Moved unchanged from `LRA.VolumeII.RealNumbers.Construction`/
`Construction.Model`. Like Rational's analog, there is no switch here:
`realNumbersModel` takes its `RealModel` as an explicit parameter rather
than selecting one globally, so §7.7 step 5 ("retire the switch last")
does not apply to Real any more than it did to Rational.
