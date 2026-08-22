-- LRA/NumberSystems/RealNumbers/Constructions/Dyadic/Equivalence.lean
-- The dyadic rationals as an ordered subring of the rational carrier, and
-- their density in it -- this construction's stage for identity-of-value
-- facts about the rational data it approximates from.

import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.Carrier

namespace LRA.NumberSystems.RealNumbers.Dyadic

/-!
Judgment call: the source also states `canonical_fractional_uniqueness` and
`binary_tail_ambiguity` in this vicinity -- both are this construction's
genuine canonical-form-uniqueness facts, the closest analogue to an
equivalence-relation stage. Both are stated in terms of `fractional_value`,
which the source builds from `fractional_partial_sums_are_cauchy`; neither
is available until the `WellDefinedness` stage. Stating them here would
violate the pipeline's strict dependency order (each stage imports only the
one immediately before it), so both are moved unchanged to `Behavior.lean`,
which imports transitively past `WellDefinedness` and `Laws`. See
`RealNumbers/ProofOrder.md`.
-/

variable (dyadic_data : RationalDyadicApproximationData)

/-- Theorem 1.2: dyadic rationals form an ordered subring of Q.

Mathematical statement (Lean): `theorem dyadic_subring : IsDyadicRational dyadic_data dyadic_data.rational_model.signature.zero ∧ IsDyadicRational dyadic_data dyadic_data.rational_model.signature.one ∧ (∀ first second : Rational dyadic_data, IsDyadicRational dyadic_data first → IsDyadicRa...`.

*Proof status:* proof pending


Logical form:

```lean
theorem dyadic_subring :
    IsDyadicRational dyadic_data dyadic_data.rational_model.signature.zero ∧
    IsDyadicRational dyadic_data dyadic_data.rational_model.signature.one ∧
    (∀ first second : Rational dyadic_data,
      IsDyadicRational dyadic_data first →
      IsDyadicRational dyadic_data second →
      IsDyadicRational dyadic_data
        (dyadic_data.rational_model.signature.add first second)) ∧
    (∀ value : Rational dyadic_data,
      IsDyadicRational dyadic_data value →
      IsDyadicRational dyadic_data
        (dyadic_data.rational_model.signature.neg value)) ∧
    (∀ first second : Rational dyadic_data,
      IsDyadicRational dyadic_data first →
      IsDyadicRational dyadic_data second →
      IsDyadicRational dyadic_data
        (dyadic_data.rational_model.signature.multiply first second))
```
-/
theorem dyadic_subring :
    IsDyadicRational dyadic_data dyadic_data.RationalSystem.FieldModel.signature.zero ∧
    IsDyadicRational dyadic_data dyadic_data.RationalSystem.FieldModel.signature.one ∧
    (∀ first second : Rational dyadic_data,
      IsDyadicRational dyadic_data first →
      IsDyadicRational dyadic_data second →
      IsDyadicRational dyadic_data
        (dyadic_data.RationalSystem.FieldModel.signature.add first second)) ∧
    (∀ value : Rational dyadic_data,
      IsDyadicRational dyadic_data value →
      IsDyadicRational dyadic_data
        (dyadic_data.RationalSystem.FieldModel.signature.neg value)) ∧
    (∀ first second : Rational dyadic_data,
      IsDyadicRational dyadic_data first →
      IsDyadicRational dyadic_data second →
      IsDyadicRational dyadic_data
        (dyadic_data.RationalSystem.FieldModel.signature.multiply first second)) := by
  sorry

/-- Theorem 1.3: dyadic rationals are dense in Q.

Mathematical statement (Lean): `theorem dyadic_rationals_are_dense (first second : Rational dyadic_data) (first_lt_second : dyadic_data.rational_model.signature.StrictOrder first second) : ∃ dyadic : Rational dyadic_data, IsDyadicRational dyadic_data dyadic ∧ dyadic_data.rational_model.s...`.

*Proof status:* proof pending


Logical form:

```lean
theorem dyadic_rationals_are_dense
    (first second : Rational dyadic_data)
    (first_lt_second :
      dyadic_data.rational_model.signature.StrictOrder first second) :
    ∃ dyadic : Rational dyadic_data,
      IsDyadicRational dyadic_data dyadic ∧
      dyadic_data.rational_model.signature.StrictOrder first dyadic ∧
      dyadic_data.rational_model.signature.StrictOrder dyadic second
```
-/
theorem dyadic_rationals_are_dense
    (first second : Rational dyadic_data)
    (first_lt_second :
      dyadic_data.RationalSystem.FieldModel.signature.StrictOrder first second) :
    ∃ dyadic : Rational dyadic_data,
      IsDyadicRational dyadic_data dyadic ∧
      dyadic_data.RationalSystem.FieldModel.signature.StrictOrder first dyadic ∧
      dyadic_data.RationalSystem.FieldModel.signature.StrictOrder dyadic second := by
  sorry

end LRA.NumberSystems.RealNumbers.Dyadic
