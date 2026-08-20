-- LRA/NumberSystems/RealNumbers/Constructions/Dyadic/Behavior.lean
-- Canonical-form uniqueness for binary fractional expansions (relocated
-- here from `Equivalence.lean` -- see the note below), and the final
-- summary theorem that binary expansions form a complete Archimedean
-- ordered field.

import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.Laws

namespace LRA.NumberSystems.RealNumbers.Dyadic

/-!
Judgment call: `binary_tail_ambiguity` and `canonical_fractional_uniqueness`
sit in the source immediately after `fractional_value`, i.e. in the
vicinity this migration's `Equivalence.lean` stage would naturally cover
(they are this construction's canonical-form-uniqueness facts, the closest
analogue to an equivalence-relation stage). Both are stated in terms of
`fractional_value`, which only becomes available at the `WellDefinedness`
stage (see the note in `Operations.lean`), so they cannot be stated as
early as `Equivalence.lean` without violating the pipeline's strict
dependency order. They are moved unchanged to this file, which imports
transitively past `WellDefinedness` and `Laws` and so has `fractional_value`
and `fractional_partial_sums_are_cauchy` in scope. Content, names, types,
and proof state are otherwise exactly as in the source. See
`RealNumbers/ProofOrder.md`.
-/

variable (dyadic_data : RationalDyadicApproximationData)

/-- Theorem 2.6: every eventually-one tail carries to a unique terminating expansion.

Mathematical statement (Lean): `theorem binary_tail_ambiguity (digits : FractionalDigits) (eventually_one : ∃ threshold, ∀ index, threshold ≤ index → digits index = Digit.one) : ∃ terminating : CanonicalFraction, fractional_value dyadic_data terminating = Quotient.mk _ ⟨fractional_partial...`.

*Proof status:* proof pending


Logical form:

```lean
theorem binary_tail_ambiguity
    (digits : FractionalDigits)
    (eventually_one :
      ∃ threshold,
        ∀ index,
          threshold ≤ index → digits index = Digit.one) :
    ∃ terminating : CanonicalFraction,
      fractional_value dyadic_data terminating =
        Quotient.mk _
          ⟨fractional_partial_sum dyadic_data digits,
            fractional_partial_sums_are_cauchy dyadic_data digits⟩ ∧
      ∀ other : CanonicalFraction,
        fractional_value dyadic_data other =
            Quotient.mk _
              ⟨fractional_partial_sum dyadic_data digits,
                fractional_partial_sums_are_cauchy dyadic_data digits⟩ →
        other = terminating
```
-/
theorem binary_tail_ambiguity
    (digits : FractionalDigits)
    (eventually_one :
      ∃ threshold,
        ∀ index,
          threshold ≤ index → digits index = Digit.one) :
    ∃ terminating : CanonicalFraction,
      fractional_value dyadic_data terminating =
        Quotient.mk _
          ⟨fractional_partial_sum dyadic_data digits,
            fractional_partial_sums_are_cauchy dyadic_data digits⟩ ∧
      ∀ other : CanonicalFraction,
        fractional_value dyadic_data other =
            Quotient.mk _
              ⟨fractional_partial_sum dyadic_data digits,
                fractional_partial_sums_are_cauchy dyadic_data digits⟩ →
        other = terminating := by
  sorry

/-- Theorem 2.7: canonical fractional expansions are unique.

Mathematical statement (Lean): `theorem canonical_fractional_uniqueness (first second : CanonicalFraction) : fractional_value dyadic_data first = fractional_value dyadic_data second ↔ first = second`.

*Proof status:* proof pending


Logical form:

```lean
theorem canonical_fractional_uniqueness
    (first second : CanonicalFraction) :
    fractional_value dyadic_data first = fractional_value dyadic_data second ↔
      first = second
```
-/
theorem canonical_fractional_uniqueness
    (first second : CanonicalFraction) :
    fractional_value dyadic_data first = fractional_value dyadic_data second ↔
      first = second := by
  sorry

/-- Proposition expressing complete Archimedean ordered-field structure.

Mathematical statement (Lean): `def CompleteArchimedeanOrderedField : Prop`.


Logical form:

```lean
def CompleteArchimedeanOrderedField : Prop :=
  OrderedFieldIsomorphism dyadic_data ∧
  dyadic_data.cauchy_complete_archimedean_ordered_field
```
-/
def CompleteArchimedeanOrderedField : Prop :=
  OrderedFieldIsomorphism dyadic_data ∧
  dyadic_data.cauchy_complete_archimedean_ordered_field


/-- Corollary 4.3: binary reals are a complete Archimedean ordered field.

Mathematical statement (Lean): `theorem complete_archimedean_ordered_field : CompleteArchimedeanOrderedField dyadic_data`.

*Proof status:* proof pending


Logical form:

```lean
theorem complete_archimedean_ordered_field :
    CompleteArchimedeanOrderedField dyadic_data
```
-/
theorem complete_archimedean_ordered_field :
    CompleteArchimedeanOrderedField dyadic_data := by
  sorry

end LRA.NumberSystems.RealNumbers.Dyadic
