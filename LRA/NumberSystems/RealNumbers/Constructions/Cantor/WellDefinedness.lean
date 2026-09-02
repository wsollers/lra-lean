import LRA.NumberSystems.RealNumbers.Constructions.Cantor.Operations

namespace LRA.NumberSystems.RealNumbers.Cantor
open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

variable (fieldModel : RationalModel)

/--
`endpoint_sum_exists_uniquely` TODO

Predicate logic:

  ∃ result, IsEndpointSum fieldModel first second result ∧ ∀ other, IsEndpointSum fieldModel first second other → other = result

Predicate logic (unfolded):

  ∀ (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (first second : LRA.NumberSystems.RealNumbers.Cantor.EndpointInterval fieldModel), Exists fun result => ((result.1 = fieldModel.signature.toBooleanRingOperationBundle.2 first.1 second.1 ∧ result.2 = fieldModel.signature.toBooleanRingOperationBundle.2 first.2 second.2) ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Cantor.EndpointInterval fieldModel), (other.1 = fieldModel.signature.toBooleanRingOperationBundle.2 first.1 second.1 ∧ other.2 = fieldModel.signature.toBooleanRingOperationBundle.2 first.2 second.2) → other = result)

Logical form (Lean):

```lean
theorem endpoint_sum_exists_uniquely (first second : EndpointInterval fieldModel) :
    ∃ result, IsEndpointSum fieldModel first second result ∧
      ∀ other, IsEndpointSum fieldModel first second other → other = result
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem endpoint_sum_exists_uniquely (first second : EndpointInterval fieldModel) :
    ∃ result, IsEndpointSum fieldModel first second result ∧
      ∀ other, IsEndpointSum fieldModel first second other → other = result := by
  sorry
/--
`endpoint_addition` TODO

Predicate logic:

  noncomputable def endpoint_addition
    (first second : EndpointInterval fieldModel) : EndpointInterval fieldModel :=
  Classical.choose (endpoint_sum_exists_uniquely fieldModel first second)

Predicate logic (unfolded):

  noncomputable def endpoint_addition
    (first second : EndpointInterval fieldModel) : EndpointInterval fieldModel :=
  Classical.choose (endpoint_sum_exists_uniquely fieldModel first second) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def endpoint_addition
    (first second : EndpointInterval fieldModel) : EndpointInterval fieldModel :=
  Classical.choose (endpoint_sum_exists_uniquely fieldModel first second)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
noncomputable def endpoint_addition
    (first second : EndpointInterval fieldModel) : EndpointInterval fieldModel :=
  Classical.choose (endpoint_sum_exists_uniquely fieldModel first second)

/--
`endpoint_negation_exists_uniquely` TODO

Predicate logic:

  ∃ result, IsEndpointNegation fieldModel interval result ∧ ∀ other, IsEndpointNegation fieldModel interval other → other = result

Predicate logic (unfolded):

  ∀ (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (interval : LRA.NumberSystems.RealNumbers.Cantor.EndpointInterval fieldModel), Exists fun result => ((result.1 = fieldModel.signature.toRingConceptSignature.2 interval.2 ∧ result.2 = fieldModel.signature.toRingConceptSignature.2 interval.1) ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Cantor.EndpointInterval fieldModel), (other.1 = fieldModel.signature.toRingConceptSignature.2 interval.2 ∧ other.2 = fieldModel.signature.toRingConceptSignature.2 interval.1) → other = result)

Logical form (Lean):

```lean
theorem endpoint_negation_exists_uniquely (interval : EndpointInterval fieldModel) :
    ∃ result, IsEndpointNegation fieldModel interval result ∧
      ∀ other, IsEndpointNegation fieldModel interval other → other = result
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem endpoint_negation_exists_uniquely (interval : EndpointInterval fieldModel) :
    ∃ result, IsEndpointNegation fieldModel interval result ∧
      ∀ other, IsEndpointNegation fieldModel interval other → other = result := by
  sorry
/--
`endpoint_negation` TODO

Predicate logic:

  noncomputable def endpoint_negation
    (interval : EndpointInterval fieldModel) : EndpointInterval fieldModel :=
  Classical.choose (endpoint_negation_exists_uniquely fieldModel interval)

Predicate logic (unfolded):

  noncomputable def endpoint_negation
    (interval : EndpointInterval fieldModel) : EndpointInterval fieldModel :=
  Classical.choose (endpoint_negation_exists_uniquely fieldModel interval) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def endpoint_negation
    (interval : EndpointInterval fieldModel) : EndpointInterval fieldModel :=
  Classical.choose (endpoint_negation_exists_uniquely fieldModel interval)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
noncomputable def endpoint_negation
    (interval : EndpointInterval fieldModel) : EndpointInterval fieldModel :=
  Classical.choose (endpoint_negation_exists_uniquely fieldModel interval)

/--
`endpoint_product_exists_uniquely` TODO

Predicate logic:

  ∃ result, IsEndpointProduct fieldModel first second result ∧ ∀ other, IsEndpointProduct fieldModel first second other → other = result

Predicate logic (unfolded):

  ∀ (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (first second : LRA.NumberSystems.RealNumbers.Cantor.EndpointInterval fieldModel), Exists fun result => ((∀ (corner : fieldModel.signature.toCarrierBundle.1), Or (corner = fieldModel.signature.toBooleanRingOperationBundle.3 first.1 second.1) (Or (corner = fieldModel.signature.toBooleanRingOperationBundle.3 first.1 second.2) (Or (corner = fieldModel.signature.toBooleanRingOperationBundle.3 first.2 second.1) (corner = fieldModel.signature.toBooleanRingOperationBundle.3 first.2 second.2))) → fieldModel.signature.toOrderedRingConceptSignature.2 result.1 corner ∧ (∀ (corner : fieldModel.signature.toCarrierBundle.1), Or (corner = fieldModel.signature.toBooleanRingOperationBundle.3 first.1 second.1) (Or (corner = fieldModel.signature.toBooleanRingOperationBundle.3 first.1 second.2) (Or (corner = fieldModel.signature.toBooleanRingOperationBundle.3 first.2 second.1) (corner = fieldModel.signature.toBooleanRingOperationBundle.3 first.2 second.2))) → fieldModel.signature.toOrderedRingConceptSignature.2 corner result.2 ∧ (Or (result.1 = fieldModel.signature.toBooleanRingOperationBundle.3 first.1 second.1) (Or (result.1 = fieldModel.signature.toBooleanRingOperationBundle.3 first.1 second.2) (Or (result.1 = fieldModel.signature.toBooleanRingOperationBundle.3 first.2 second.1) (result.1 = fieldModel.signature.toBooleanRingOperationBundle.3 first.2 second.2))) ∧ Or (result.2 = fieldModel.signature.toBooleanRingOperationBundle.3 first.1 second.1) (Or (result.2 = fieldModel.signature.toBooleanRingOperationBundle.3 first.1 second.2) (Or (result.2 = fieldModel.signature.toBooleanRingOperationBundle.3 first.2 second.1) (result.2 = fieldModel.signature.toBooleanRingOperationBundle.3 first.2 second.2)))))) ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Cantor.EndpointInterval fieldModel), (∀ (corner : fieldModel.signature.toCarrierBundle.1), Or (corner = fieldModel.signature.toBooleanRingOperationBundle.3 first.1 second.1) (Or (corner = fieldModel.signature.toBooleanRingOperationBundle.3 first.1 second.2) (Or (corner = fieldModel.signature.toBooleanRingOperationBundle.3 first.2 second.1) (corner = fieldModel.signature.toBooleanRingOperationBundle.3 first.2 second.2))) → fieldModel.signature.toOrderedRingConceptSignature.2 other.1 corner ∧ (∀ (corner : fieldModel.signature.toCarrierBundle.1), Or (corner = fieldModel.signature.toBooleanRingOperationBundle.3 first.1 second.1) (Or (corner = fieldModel.signature.toBooleanRingOperationBundle.3 first.1 second.2) (Or (corner = fieldModel.signature.toBooleanRingOperationBundle.3 first.2 second.1) (corner = fieldModel.signature.toBooleanRingOperationBundle.3 first.2 second.2))) → fieldModel.signature.toOrderedRingConceptSignature.2 corner other.2 ∧ (Or (other.1 = fieldModel.signature.toBooleanRingOperationBundle.3 first.1 second.1) (Or (other.1 = fieldModel.signature.toBooleanRingOperationBundle.3 first.1 second.2) (Or (other.1 = fieldModel.signature.toBooleanRingOperationBundle.3 first.2 second.1) (other.1 = fieldModel.signature.toBooleanRingOperationBundle.3 first.2 second.2))) ∧ Or (other.2 = fieldModel.signature.toBooleanRingOperationBundle.3 first.1 second.1) (Or (other.2 = fieldModel.signature.toBooleanRingOperationBundle.3 first.1 second.2) (Or (other.2 = fieldModel.signature.toBooleanRingOperationBundle.3 first.2 second.1) (other.2 = fieldModel.signature.toBooleanRingOperationBundle.3 first.2 second.2)))))) → other = result)

Logical form (Lean):

```lean
theorem endpoint_product_exists_uniquely (first second : EndpointInterval fieldModel) :
    ∃ result, IsEndpointProduct fieldModel first second result ∧
      ∀ other, IsEndpointProduct fieldModel first second other → other = result
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem endpoint_product_exists_uniquely (first second : EndpointInterval fieldModel) :
    ∃ result, IsEndpointProduct fieldModel first second result ∧
      ∀ other, IsEndpointProduct fieldModel first second other → other = result := by
  sorry
/--
`endpoint_multiplication` TODO

Predicate logic:

  noncomputable def endpoint_multiplication
    (first second : EndpointInterval fieldModel) : EndpointInterval fieldModel :=
  Classical.choose (endpoint_product_exists_uniquely fieldModel first second)

Predicate logic (unfolded):

  noncomputable def endpoint_multiplication
    (first second : EndpointInterval fieldModel) : EndpointInterval fieldModel :=
  Classical.choose (endpoint_product_exists_uniquely fieldModel first second) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def endpoint_multiplication
    (first second : EndpointInterval fieldModel) : EndpointInterval fieldModel :=
  Classical.choose (endpoint_product_exists_uniquely fieldModel first second)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
noncomputable def endpoint_multiplication
    (first second : EndpointInterval fieldModel) : EndpointInterval fieldModel :=
  Classical.choose (endpoint_product_exists_uniquely fieldModel first second)

/--
`representative_addition` TODO

Predicate logic:

  noncomputable def representative_addition
    (first second : NestedIntervalSequence fieldModel) :
    Nat → EndpointInterval fieldModel :=
  fun index =>
    endpoint_addition fieldModel (first.interval index) (second.interval index)

Predicate logic (unfolded):

  noncomputable def representative_addition
    (first second : NestedIntervalSequence fieldModel) :
    Nat → EndpointInterval fieldModel :=
  fun index =>
    endpoint_addition fieldModel (first.interval index) (second.interval index) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def representative_addition
    (first second : NestedIntervalSequence fieldModel) :
    Nat → EndpointInterval fieldModel :=
  fun index =>
    endpoint_addition fieldModel (first.interval index) (second.interval index)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
noncomputable def representative_addition
    (first second : NestedIntervalSequence fieldModel) :
    Nat → EndpointInterval fieldModel :=
  fun index =>
    endpoint_addition fieldModel (first.interval index) (second.interval index)

/--
`representative_negation` TODO

Predicate logic:

  noncomputable def representative_negation
    (sequence : NestedIntervalSequence fieldModel) :
    Nat → EndpointInterval fieldModel :=
  fun index => endpoint_negation fieldModel (sequence.interval index)

Predicate logic (unfolded):

  noncomputable def representative_negation
    (sequence : NestedIntervalSequence fieldModel) :
    Nat → EndpointInterval fieldModel :=
  fun index => endpoint_negation fieldModel (sequence.interval index) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def representative_negation
    (sequence : NestedIntervalSequence fieldModel) :
    Nat → EndpointInterval fieldModel :=
  fun index => endpoint_negation fieldModel (sequence.interval index)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
noncomputable def representative_negation
    (sequence : NestedIntervalSequence fieldModel) :
    Nat → EndpointInterval fieldModel :=
  fun index => endpoint_negation fieldModel (sequence.interval index)

/--
`representative_multiplication` TODO

Predicate logic:

  noncomputable def representative_multiplication
    (first second : NestedIntervalSequence fieldModel) :
    Nat → EndpointInterval fieldModel :=
  fun index =>
    endpoint_multiplication fieldModel (first.interval index) (second.interval index)

Predicate logic (unfolded):

  noncomputable def representative_multiplication
    (first second : NestedIntervalSequence fieldModel) :
    Nat → EndpointInterval fieldModel :=
  fun index =>
    endpoint_multiplication fieldModel (first.interval index) (second.interval index) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def representative_multiplication
    (first second : NestedIntervalSequence fieldModel) :
    Nat → EndpointInterval fieldModel :=
  fun index =>
    endpoint_multiplication fieldModel (first.interval index) (second.interval index)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
noncomputable def representative_multiplication
    (first second : NestedIntervalSequence fieldModel) :
    Nat → EndpointInterval fieldModel :=
  fun index =>
    endpoint_multiplication fieldModel (first.interval index) (second.interval index)

/--
`representative_addition_is_nested_and_shrinking` TODO

Predicate logic:

  IsNestedAndShrinking fieldModel (representative_addition fieldModel first second)

Predicate logic (unfolded):

  ∀ (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (first second : LRA.NumberSystems.RealNumbers.Cantor.NestedIntervalSequence fieldModel), (∀ (index : Nat), (fieldModel.signature.toOrderedRingConceptSignature.2 (LRA.NumberSystems.RealNumbers.Cantor.representative_addition fieldModel first second index).1 (LRA.NumberSystems.RealNumbers.Cantor.representative_addition fieldModel first second (instHAdd.hAdd index 1)).1 ∧ fieldModel.signature.toOrderedRingConceptSignature.2 (LRA.NumberSystems.RealNumbers.Cantor.representative_addition fieldModel first second (instHAdd.hAdd index 1)).2 (LRA.NumberSystems.RealNumbers.Cantor.representative_addition fieldModel first second index).2) ∧ ∀ (positive_tolerance : fieldModel.signature.toCarrierBundle.1), fieldModel.signature.toOrderedRingSignature.2 fieldModel.signature.toZeroOneBundle.2 positive_tolerance → Exists fun index => fieldModel.signature.toOrderedRingSignature.2 (fieldModel.signature.toBooleanRingOperationBundle.2 (LRA.NumberSystems.RealNumbers.Cantor.representative_addition fieldModel first second index).2 (fieldModel.signature.toRingConceptSignature.2 (LRA.NumberSystems.RealNumbers.Cantor.representative_addition fieldModel first second index).1)) positive_tolerance)

Logical form (Lean):

```lean
theorem representative_addition_is_nested_and_shrinking
    (first second : NestedIntervalSequence fieldModel) :
    IsNestedAndShrinking fieldModel
      (representative_addition fieldModel first second)
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
theorem representative_addition_is_nested_and_shrinking
    (first second : NestedIntervalSequence fieldModel) :
    IsNestedAndShrinking fieldModel
      (representative_addition fieldModel first second) := by
  sorry
/--
`representative_negation_is_nested_and_shrinking` TODO

Predicate logic:

  IsNestedAndShrinking fieldModel (representative_negation fieldModel sequence)

Predicate logic (unfolded):

  ∀ (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (sequence : LRA.NumberSystems.RealNumbers.Cantor.NestedIntervalSequence fieldModel), (∀ (index : Nat), (fieldModel.signature.toOrderedRingConceptSignature.2 (LRA.NumberSystems.RealNumbers.Cantor.representative_negation fieldModel sequence index).1 (LRA.NumberSystems.RealNumbers.Cantor.representative_negation fieldModel sequence (instHAdd.hAdd index 1)).1 ∧ fieldModel.signature.toOrderedRingConceptSignature.2 (LRA.NumberSystems.RealNumbers.Cantor.representative_negation fieldModel sequence (instHAdd.hAdd index 1)).2 (LRA.NumberSystems.RealNumbers.Cantor.representative_negation fieldModel sequence index).2) ∧ ∀ (positive_tolerance : fieldModel.signature.toCarrierBundle.1), fieldModel.signature.toOrderedRingSignature.2 fieldModel.signature.toZeroOneBundle.2 positive_tolerance → Exists fun index => fieldModel.signature.toOrderedRingSignature.2 (fieldModel.signature.toBooleanRingOperationBundle.2 (LRA.NumberSystems.RealNumbers.Cantor.representative_negation fieldModel sequence index).2 (fieldModel.signature.toRingConceptSignature.2 (LRA.NumberSystems.RealNumbers.Cantor.representative_negation fieldModel sequence index).1)) positive_tolerance)

Logical form (Lean):

```lean
theorem representative_negation_is_nested_and_shrinking
    (sequence : NestedIntervalSequence fieldModel) :
    IsNestedAndShrinking fieldModel
      (representative_negation fieldModel sequence)
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
theorem representative_negation_is_nested_and_shrinking
    (sequence : NestedIntervalSequence fieldModel) :
    IsNestedAndShrinking fieldModel
      (representative_negation fieldModel sequence) := by
  sorry
/--
`representative_multiplication_is_nested_and_shrinking` TODO

Predicate logic:

  IsNestedAndShrinking fieldModel (representative_multiplication fieldModel first second)

Predicate logic (unfolded):

  ∀ (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (first second : LRA.NumberSystems.RealNumbers.Cantor.NestedIntervalSequence fieldModel), (∀ (index : Nat), (fieldModel.signature.toOrderedRingConceptSignature.2 (LRA.NumberSystems.RealNumbers.Cantor.representative_multiplication fieldModel first second index).1 (LRA.NumberSystems.RealNumbers.Cantor.representative_multiplication fieldModel first second (instHAdd.hAdd index 1)).1 ∧ fieldModel.signature.toOrderedRingConceptSignature.2 (LRA.NumberSystems.RealNumbers.Cantor.representative_multiplication fieldModel first second (instHAdd.hAdd index 1)).2 (LRA.NumberSystems.RealNumbers.Cantor.representative_multiplication fieldModel first second index).2) ∧ ∀ (positive_tolerance : fieldModel.signature.toCarrierBundle.1), fieldModel.signature.toOrderedRingSignature.2 fieldModel.signature.toZeroOneBundle.2 positive_tolerance → Exists fun index => fieldModel.signature.toOrderedRingSignature.2 (fieldModel.signature.toBooleanRingOperationBundle.2 (LRA.NumberSystems.RealNumbers.Cantor.representative_multiplication fieldModel first second index).2 (fieldModel.signature.toRingConceptSignature.2 (LRA.NumberSystems.RealNumbers.Cantor.representative_multiplication fieldModel first second index).1)) positive_tolerance)

Logical form (Lean):

```lean
theorem representative_multiplication_is_nested_and_shrinking
    (first second : NestedIntervalSequence fieldModel) :
    IsNestedAndShrinking fieldModel
      (representative_multiplication fieldModel first second)
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
theorem representative_multiplication_is_nested_and_shrinking
    (first second : NestedIntervalSequence fieldModel) :
    IsNestedAndShrinking fieldModel
      (representative_multiplication fieldModel first second) := by
  sorry
end LRA.NumberSystems.RealNumbers.Cantor
