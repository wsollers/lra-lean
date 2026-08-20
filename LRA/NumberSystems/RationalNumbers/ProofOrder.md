# LRA.NumberSystems.RationalNumbers — Proof Order

Ledger notation: see [`LRA/ProofOrderNotation.md`](../../ProofOrderNotation.md).

## Narrative order

Unlike `NaturalNumbers` (four constructions of one shared `PeanoSystem`
interface) and `Integers` (five constructions), `RationalNumbers` has
exactly one real construction: `RationalQuotientFractions`, quotient
fractions built generically over any `IntegerAndPositiveNaturalData` (an
integer model plus a positive-natural carrier with a `to_integer`
embedding). It realizes `LRA.NumberSystems.Models.RationalModel` — a
densely ordered field.

`RationalQuotientFractions`'s own proof order follows its file pipeline:
`Equivalence` (cross-multiplication equivalence) before `WellFoundedness`
(induction on representatives) before `WellDefinedness` (operations and
order respect the equivalence, so they lift to the quotient) before `Laws`
(the field and order axioms, stated as one theorem per law-bundle) before
`Behavior` (embedding properties, unique lowest terms, density,
Archimedean-ness, and the two irrationality corollaries — no rational
squares to two, so the rationals are not order-complete).

`ComparisonModels.lean` is separate, system-level content (not part of the
`RationalQuotientFractions` construction, and not deleted the way
`Integers/ConstructionModels.lean` was during that migration — this file
is actively imported via `RationalNumbers.lean`). Its three namespaces
(`QuotientFractionsComparison`, `Reduced`, `FractionField`) are thinner
alternate-model *existence* claims (`Nonempty RationalModel`), each only
asserting a model exists rather than being a full construction run
through the pipeline above; the file's closing section states two
pairwise `ModelIsomorphism` claims relating them. **Open research
question, not resolved by this pass:** whether this pairwise-comparison
shape is a genuinely useful categoricity result independent of which
construction realizes `RationalModel`, or is better superseded by each
construction proving it realizes `RationalModel` plus one shared
`RationalModel` categoricity theorem (the same question the `Integers`
migration's research note raised and left open there).

`ContinuedFractions.lean` was deferred during the original Rational
migration pass (it imports `RealNumbers.Irrationals`, a forward
dependency that hadn't been promoted yet) but has since been moved to
`LRA.NumberSystems.RationalNumbers.ContinuedFractions` — its own doc
comment still says "deferred" and "see ProofOrder.md", which this ledger
now supersedes: it is live, in-subject content, not a pending move.

## Per-theorem ledger

Status determined by direct inspection, with one caveat this subject
actually exercises (unlike the smaller subjects already audited): a
theorem's own proof body can be free of the literal word `sorry` while
still being incomplete, if it invokes a `noncomputable def` built via
`Classical.choice` over a `sorry`-proved existence theorem. Two entries
below (`rational_quotient_fractions_and_reduced_are_isomorphic` and
`..._and_fraction_field_are_isomorphic`) are exactly this case — flagged
individually. Re-derive via `scripts/GenerateProofOrderManifest.lean`
once a Lean toolchain is available (its `sorryStatus` walks the real
axiom closure rather than trusting a by-eye chain-trace like this one).

### `Constructions/RationalQuotientFractions/Equivalence.lean`

Context: let `d` be an `IntegerAndPositiveNaturalData`.

#### equivalent_is_equivalence_relation

Equivalence(equivalent(d))

**Status: PENDING**

### `Constructions/RationalQuotientFractions/WellFoundedness.lean`

#### induction_on_representatives

∀ d : IntegerAndPositiveNaturalData, ∀ motive : Carrier(d) → Prop, (∀ r : Representative(d), motive(Quotient.mk(r))) → ∀ v : Carrier(d), motive(v)

**Status: PENDING**

### `Constructions/RationalQuotientFractions/WellDefinedness.lean`

Context: let `d` be an `IntegerAndPositiveNaturalData`.

#### representative_operations_respect_equivalence

binary_operation_respects(representative_setoid(d), representative_addition(d)) ∧ binary_operation_respects(representative_setoid(d), representative_multiplication(d)) ∧ unary_operation_respects(representative_setoid(d), representative_negation(d))

**Status: PENDING**

#### negation_exists

∃ negation : Carrier(d) → Carrier(d), ∀ r : Representative(d), negation(Quotient.mk(r)) = Quotient.mk(representative_negation(d, r))

**Status: PENDING**

#### representative_strict_order_respects_equivalence

relation_respects(representative_setoid(d), representative_strict_order(d))

**Status: PENDING**

### `Constructions/RationalQuotientFractions/Laws.lean`

Context: let `d` be an `IntegerAndPositiveNaturalData`. `AdditiveGroupLaws`,
`MultiplicativeAndDistributiveLaws`, `IsReciprocal`, `FieldStructure`,
`StrictTotalOrder`, `OrderedFieldCompatibility`, and `OrderedFieldStructure`
are opaque predicates over `Carrier(d)` built from `addition`,
`multiplication`, `negation`, `zero`, `one`, and `strict_order`; see the
Lean source for their unfolded content.

#### additive_group_laws

AdditiveGroupLaws(d)

**Status: PENDING**

#### multiplicative_and_distributive_laws

MultiplicativeAndDistributiveLaws(d)

**Status: PENDING**

#### reciprocal_exists_uniquely

∀ value : Carrier(d), value ≠ zero(d) → ∃ reciprocal : Carrier(d), IsReciprocal(d, value, reciprocal) ∧ (∀ other : Carrier(d), IsReciprocal(d, value, other) → other = reciprocal)

**Status: PENDING**

#### inverse_is_two_sided

∀ value : Carrier(d), ∀ nonzero : value ≠ zero(d), IsReciprocal(d, value, inverse(d, value, nonzero))

**Status: PENDING**

#### field_structure

FieldStructure(d)

**Status: PENDING**

#### strict_total_order

StrictTotalOrder(d)

**Status: PENDING**

#### ordered_field_compatibility

OrderedFieldCompatibility(d)

**Status: PENDING**

#### ordered_field_structure

OrderedFieldStructure(d)

**Status: PENDING**

### `Constructions/RationalQuotientFractions/Behavior.lean`

Context: let `d` be an `IntegerAndPositiveNaturalData`. `IsReduced`,
`square_root_two_cut`, and `NotOrderComplete` are opaque predicates over
`Carrier(d)`/`Representative(d)`; `integer_embedding` is the canonical
integer-to-rational embedding.

#### integer_embedding_properties

∀ a b : IntegerCarrier(d), (integer_embedding(d, a) = integer_embedding(d, b) → a = b) ∧ integer_embedding(d, 0) = zero(d) ∧ integer_embedding(d, 1) = one(d) ∧ integer_embedding(d, a + b) = addition(d, integer_embedding(d, a), integer_embedding(d, b)) ∧ integer_embedding(d, a * b) = multiplication(d, integer_embedding(d, a), integer_embedding(d, b)) ∧ (strict_order(d, integer_embedding(d, a), integer_embedding(d, b)) ↔ StrictOrder(a, b))

**Status: PENDING**

#### reduced_representative_exists

∀ value : Carrier(d), ∃ r : Representative(d), IsReduced(d, r) ∧ Quotient.mk(r) = value

**Status: PENDING**

#### reduced_representative_unique

∀ first second : Representative(d), IsReduced(d, first) ∧ IsReduced(d, second) ∧ Quotient.mk(first) = Quotient.mk(second) → first.numerator = second.numerator ∧ first.denominator = second.denominator

**Status: PENDING**

#### unique_lowest_term_form

∀ value : Carrier(d), ∃ r : Representative(d), IsReduced(d, r) ∧ Quotient.mk(r) = value ∧ (∀ other : Representative(d), IsReduced(d, other) ∧ Quotient.mk(other) = value → other.numerator = r.numerator ∧ other.denominator = r.denominator)

**Status: PENDING**

#### density

∀ first second : Carrier(d), strict_order(d, first, second) → ∃ middle : Carrier(d), strict_order(d, first, middle) ∧ strict_order(d, middle, second)

**Status: PENDING**

#### archimedean_property

∀ value : Carrier(d), ∃ n : NaturalCarrier(d), strict_order(d, value, integer_embedding(d, to_integer(n)))

**Status: PENDING**

#### integer_part_bounds

∀ value : Carrier(d), ∃ integer : IntegerCarrier(d), nonstrict_order(d, integer_embedding(d, integer), value) ∧ strict_order(d, value, integer_embedding(d, integer + 1))

**Status: PENDING**

#### square_root_two_cut_nonempty_bounded

∀ two : Carrier(d), (∃ value : Carrier(d), square_root_two_cut(d, two, value)) ∧ (∃ upper : Carrier(d), ∀ value : Carrier(d), square_root_two_cut(d, two, value) → nonstrict_order(d, value, upper))

**Status: PENDING**

#### no_rational_square_root_two

∀ two : Carrier(d), ¬ ∃ value : Carrier(d), multiplication(d, value, value) = two

**Status: PENDING**

#### square_root_two_cut_has_no_supremum

∀ two : Carrier(d), ¬ ∃ supremum : Carrier(d), (∀ value : Carrier(d), square_root_two_cut(d, two, value) → nonstrict_order(d, value, supremum)) ∧ (∀ upper : Carrier(d), (∀ value : Carrier(d), square_root_two_cut(d, two, value) → nonstrict_order(d, value, upper)) → nonstrict_order(d, supremum, upper))

**Status: PENDING**

#### not_order_complete

NotOrderComplete(d)

**Status: PENDING**

#### structure_of_the_rationals

StructureOfTheRationals(d)

**Status: PENDING**

### `ComparisonModels.lean` — `QuotientFractionsComparison`

Context: `IntegerCarrier`, `NaturalCarrier` types; `integer_multiplication`,
`natural_to_integer` the given operations. `equivalent`,
`binary_operation_respects`, `is_order_complete` are opaque predicates.

#### equivalent_is_equivalence_relation

Equivalence(equivalent(integer_multiplication, natural_to_integer))

**Status: PENDING**

#### representative_addition_respects_equivalence

∀ setoid : Setoid(RepresentativeCarrier), ∀ add : RepresentativeCarrier → RepresentativeCarrier → RepresentativeCarrier, binary_operation_respects(setoid, add)

**Status: PENDING**

#### representative_multiplication_respects_equivalence

∀ setoid : Setoid(RepresentativeCarrier), ∀ mul : RepresentativeCarrier → RepresentativeCarrier → RepresentativeCarrier, binary_operation_respects(setoid, mul)

**Status: PENDING**

#### rational_model_exists

∀ integer_model : IntegerModel, ∃ model, RationalModel(model)

**Status: PENDING**

#### rational_extension_exists

∀ integer_model : IntegerModel, ∃ extension, RationalExtension(integer_model, extension)

**Status: PENDING**

#### is_not_order_complete

∀ integer_model : IntegerModel, ¬ is_order_complete(rational_model(integer_model))

**Status: PENDING**

### `ComparisonModels.lean` — `Reduced`

#### rational_model_exists

∀ integer_model : IntegerModel, ∃ model, RationalModel(model)

**Status: PENDING**

### `ComparisonModels.lean` — `FractionField`

#### rational_model_exists

∀ data : IntegralDomainFractionFieldData, ∃ model, RationalModel(model)

**Status: PENDING**

### `ComparisonModels.lean` — cross-model isomorphism

Context: `ModelIsomorphism(first, second)` is the (data-valued, not
`Prop`-valued) bundled-isomorphism type; a `Nonempty` claim over it is the
proposition actually being tracked.

#### rational_quotient_fractions_equiv_reduced_exists

∀ integer_model : IntegerModel, ∃ iso, ModelIsomorphism(QuotientFractionsComparison.rational_model(integer_model), Reduced.rational_model(integer_model), iso)

**Status: PENDING**

#### rational_quotient_fractions_and_reduced_are_isomorphic

∀ integer_model : IntegerModel, ∃ iso, ModelIsomorphism(QuotientFractionsComparison.rational_model(integer_model), Reduced.rational_model(integer_model), iso)

Its own proof term (`⟨rational_quotient_fractions_equiv_reduced integer_model⟩`)
has no literal `sorry`, but `rational_quotient_fractions_equiv_reduced` is
`Classical.choice` applied to `rational_quotient_fractions_equiv_reduced_exists`,
which *is* `sorry` — the axiom closure carries `sorryAx` transitively.

**Status: PENDING**

#### rational_quotient_fractions_equiv_fraction_field_exists

∀ integer_model : IntegerModel, ∃ iso, ModelIsomorphism(QuotientFractionsComparison.rational_model(integer_model), FractionField.rational_model(⟨integer_model⟩), iso)

**Status: PENDING**

#### rational_quotient_fractions_and_fraction_field_are_isomorphic

∀ integer_model : IntegerModel, ∃ iso, ModelIsomorphism(QuotientFractionsComparison.rational_model(integer_model), FractionField.rational_model(⟨integer_model⟩), iso)

Same transitive-`sorry` situation as
`rational_quotient_fractions_and_reduced_are_isomorphic`, via
`rational_quotient_fractions_equiv_fraction_field_exists`.

**Status: PENDING**

### `ContinuedFractions.lean`

Context: `integer_model : IntegerModel`, `rational_model : RationalModel`,
`integer_embedding : IntegerEmbeddingIntoRational(integer_model, rational_model)`.
`canonical`, `FiniteValue`, `eventually_periodic` are opaque predicates.

#### rational_has_unique_canonical_finite_expansion

∀ value : Carrier(rational_model), ∃ fraction : FiniteSimpleContinuedFraction(integer_model), canonical(integer_model, fraction) ∧ FiniteValue(integer_model, rational_model, integer_embedding, fraction, value) ∧ (∀ other : FiniteSimpleContinuedFraction(integer_model), canonical(integer_model, other) ∧ FiniteValue(integer_model, rational_model, integer_embedding, other, value) → other = fraction)

**Status: PENDING**

#### infinite_continued_fraction_converges

∀ fraction : InfiniteSimpleContinuedFraction(integer_model), ∃ value : Carrier(real_model), ∀ neighborhood : Carrier(real_model) → Prop, neighborhood(value) → ∃ index : Nat, neighborhood(value)

**Status: PENDING**

#### quadratic_irrational_iff_eventually_periodic

∀ fraction : InfiniteSimpleContinuedFraction(integer_model), ∀ value : Carrier(real_model), eventually_periodic(fraction) ↔ ∃ a b c : Carrier(real_model), a * value * value + b * value + c = 0

**Status: PENDING**
