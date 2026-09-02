
import LRA.NumberSystems.RealNumbers.Constructions.Cauchy.Operations

namespace LRA.NumberSystems.RealNumbers.Cauchy
open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers

/--
`representative_addition_is_cauchy` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), is_cauchy rationalSystem absolute_value_data (representative_addition rationalSystem absolute_value_data first second)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (first second : LRA.NumberSystems.RealNumbers.Cauchy.Representative rationalSystem absolute_value_data) (epsilon : rationalSystem.FieldModel.signature.toCarrierBundle.1), rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.toZeroOneBundle.2 epsilon → Exists fun threshold => ∀ (first_index second_index : Nat), instLENat.1 threshold first_index → instLENat.1 threshold second_index → rationalSystem.FieldModel.signature.toOrderedRingSignature.2 (absolute_value_data.1 (rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (LRA.NumberSystems.RealNumbers.Cauchy.representative_addition rationalSystem absolute_value_data first second first_index) (rationalSystem.FieldModel.signature.neg (LRA.NumberSystems.RealNumbers.Cauchy.representative_addition rationalSystem absolute_value_data first second second_index)))) epsilon

Logical form (Lean):

```lean
theorem representative_addition_is_cauchy
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) :
    is_cauchy rationalSystem absolute_value_data
      (representative_addition rationalSystem absolute_value_data first second)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem representative_addition_is_cauchy
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) :
    is_cauchy rationalSystem absolute_value_data
      (representative_addition rationalSystem absolute_value_data first second) := by
  sorry
/--
`representative_negation_is_cauchy` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), is_cauchy rationalSystem absolute_value_data (representative_negation rationalSystem absolute_value_data representative)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (representative : LRA.NumberSystems.RealNumbers.Cauchy.Representative rationalSystem absolute_value_data) (epsilon : rationalSystem.FieldModel.signature.toCarrierBundle.1), rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.toZeroOneBundle.2 epsilon → Exists fun threshold => ∀ (first_index second_index : Nat), instLENat.1 threshold first_index → instLENat.1 threshold second_index → rationalSystem.FieldModel.signature.toOrderedRingSignature.2 (absolute_value_data.1 (rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (LRA.NumberSystems.RealNumbers.Cauchy.representative_negation rationalSystem absolute_value_data representative first_index) (rationalSystem.FieldModel.signature.neg (LRA.NumberSystems.RealNumbers.Cauchy.representative_negation rationalSystem absolute_value_data representative second_index)))) epsilon

Logical form (Lean):

```lean
theorem representative_negation_is_cauchy
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (representative : Representative rationalSystem absolute_value_data) :
    is_cauchy rationalSystem absolute_value_data
      (representative_negation rationalSystem absolute_value_data representative)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem representative_negation_is_cauchy
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (representative : Representative rationalSystem absolute_value_data) :
    is_cauchy rationalSystem absolute_value_data
      (representative_negation rationalSystem absolute_value_data representative) := by
  sorry
/--
`representative_multiplication_is_cauchy` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), is_cauchy rationalSystem absolute_value_data (representative_multiplication rationalSystem absolute_value_data first second)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (first second : LRA.NumberSystems.RealNumbers.Cauchy.Representative rationalSystem absolute_value_data) (epsilon : rationalSystem.FieldModel.signature.toCarrierBundle.1), rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.toZeroOneBundle.2 epsilon → Exists fun threshold => ∀ (first_index second_index : Nat), instLENat.1 threshold first_index → instLENat.1 threshold second_index → rationalSystem.FieldModel.signature.toOrderedRingSignature.2 (absolute_value_data.1 (rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (LRA.NumberSystems.RealNumbers.Cauchy.representative_multiplication rationalSystem absolute_value_data first second first_index) (rationalSystem.FieldModel.signature.neg (LRA.NumberSystems.RealNumbers.Cauchy.representative_multiplication rationalSystem absolute_value_data first second second_index)))) epsilon

Logical form (Lean):

```lean
theorem representative_multiplication_is_cauchy
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) :
    is_cauchy rationalSystem absolute_value_data
      (representative_multiplication rationalSystem absolute_value_data first second)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem representative_multiplication_is_cauchy
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) :
    is_cauchy rationalSystem absolute_value_data
      (representative_multiplication rationalSystem absolute_value_data first second) := by
  sorry
/--
`representative_addition_respects_equivalence` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), LRA.UniversalAlgebra.Quotient.binary_operation_respects (representative_setoid rationalSystem absolute_value_data) (fun first second => ⟨representative_addition rationalSystem absolute_value_data first second, representative_addition_is_cauchy rationalSystem absolute_value_data first second⟩)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (first_representative first_replacement second_representative second_replacement : LRA.NumberSystems.RealNumbers.Cauchy.Representative rationalSystem absolute_value_data), ((LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data).1 first_representative first_replacement ∧ (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data).1 second_representative second_replacement) → (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data).1 ((fun first second => { sequence := fun index => rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (first.1 index) (second.1 index), sequence_is_cauchy := ⋯ }) first_representative second_representative) ((fun first second => { sequence := fun index => rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (first.1 index) (second.1 index), sequence_is_cauchy := ⋯ }) first_replacement second_replacement)

Logical form (Lean):

```lean
theorem representative_addition_respects_equivalence
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      (representative_setoid rationalSystem absolute_value_data)
      (fun first second =>
        ⟨representative_addition rationalSystem absolute_value_data first second,
          representative_addition_is_cauchy
            rationalSystem absolute_value_data first second⟩)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem representative_addition_respects_equivalence
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      (representative_setoid rationalSystem absolute_value_data)
      (fun first second =>
        ⟨representative_addition rationalSystem absolute_value_data first second,
          representative_addition_is_cauchy
            rationalSystem absolute_value_data first second⟩) := by
  sorry
/--
`representative_multiplication_respects_equivalence` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), LRA.UniversalAlgebra.Quotient.binary_operation_respects (representative_setoid rationalSystem absolute_value_data) (fun first second => ⟨representative_multiplication rationalSystem absolute_value_data first second, representative_multiplication_is_cauchy rationalSystem absolute_value_data first second⟩)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (first_representative first_replacement second_representative second_replacement : LRA.NumberSystems.RealNumbers.Cauchy.Representative rationalSystem absolute_value_data), ((LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data).1 first_representative first_replacement ∧ (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data).1 second_representative second_replacement) → (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data).1 ((fun first second => { sequence := fun index => rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.3 (first.1 index) (second.1 index), sequence_is_cauchy := ⋯ }) first_representative second_representative) ((fun first second => { sequence := fun index => rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.3 (first.1 index) (second.1 index), sequence_is_cauchy := ⋯ }) first_replacement second_replacement)

Logical form (Lean):

```lean
theorem representative_multiplication_respects_equivalence
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      (representative_setoid rationalSystem absolute_value_data)
      (fun first second =>
        ⟨representative_multiplication rationalSystem absolute_value_data first second,
          representative_multiplication_is_cauchy
            rationalSystem absolute_value_data first second⟩)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem representative_multiplication_respects_equivalence
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      (representative_setoid rationalSystem absolute_value_data)
      (fun first second =>
        ⟨representative_multiplication rationalSystem absolute_value_data first second,
          representative_multiplication_is_cauchy
            rationalSystem absolute_value_data first second⟩) := by
  sorry
/--
`representative_negation_respects_equivalence` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), LRA.UniversalAlgebra.Quotient.unary_operation_respects (representative_setoid rationalSystem absolute_value_data) (fun representative => ⟨representative_negation rationalSystem absolute_value_data representative, representative_negation_is_cauchy rationalSystem absolute_value_data representative⟩)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (first_representative second_representative : LRA.NumberSystems.RealNumbers.Cauchy.Representative rationalSystem absolute_value_data), (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data).1 first_representative second_representative → (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data).1 ((fun representative => { sequence := fun index => rationalSystem.FieldModel.signature.toRingConceptSignature.2 (representative.1 index), sequence_is_cauchy := ⋯ }) first_representative) ((fun representative => { sequence := fun index => rationalSystem.FieldModel.signature.toRingConceptSignature.2 (representative.1 index), sequence_is_cauchy := ⋯ }) second_representative)

Logical form (Lean):

```lean
theorem representative_negation_respects_equivalence
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.UniversalAlgebra.Quotient.unary_operation_respects
      (representative_setoid rationalSystem absolute_value_data)
      (fun representative =>
        ⟨representative_negation rationalSystem absolute_value_data representative,
          representative_negation_is_cauchy
            rationalSystem absolute_value_data representative⟩)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem representative_negation_respects_equivalence
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.UniversalAlgebra.Quotient.unary_operation_respects
      (representative_setoid rationalSystem absolute_value_data)
      (fun representative =>
        ⟨representative_negation rationalSystem absolute_value_data representative,
          representative_negation_is_cauchy
            rationalSystem absolute_value_data representative⟩) := by
  sorry
end LRA.NumberSystems.RealNumbers.Cauchy
