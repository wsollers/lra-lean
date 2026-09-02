
import LRA.NumberSystems.RealNumbers.Constructions.PrimitiveIntervals.Operations

namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervals
open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

variable (rational_model : RationalModel)

/--
`interval_sum_exists_uniquely` TODO

Predicate logic:

  ∃ result, IsIntervalSum rational_model first second result ∧ ∀ other, IsIntervalSum rational_model first second other → other = result

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (first second : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.RationalInterval rational_model), Exists fun result => ((result.1 = rational_model.signature.toBooleanRingOperationBundle.2 first.1 second.1 ∧ result.2 = rational_model.signature.toBooleanRingOperationBundle.2 first.2 second.2) ∧ ∀ (other : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.RationalInterval rational_model), (other.1 = rational_model.signature.toBooleanRingOperationBundle.2 first.1 second.1 ∧ other.2 = rational_model.signature.toBooleanRingOperationBundle.2 first.2 second.2) → other = result)

Logical form (Lean):

```lean
theorem interval_sum_exists_uniquely
    (first second : RationalInterval rational_model) :
    ∃ result,
      IsIntervalSum rational_model first second result ∧
      ∀ other,
        IsIntervalSum rational_model first second other →
        other = result
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
theorem interval_sum_exists_uniquely
    (first second : RationalInterval rational_model) :
    ∃ result,
      IsIntervalSum rational_model first second result ∧
      ∀ other,
        IsIntervalSum rational_model first second other →
        other = result := by
  sorry
/--
`interval_addition` TODO

Predicate logic:

  noncomputable def interval_addition
    (first second : RationalInterval rational_model) :
    RationalInterval rational_model :=
  Classical.choose (interval_sum_exists_uniquely rational_model first second)

Predicate logic (unfolded):

  noncomputable def interval_addition
    (first second : RationalInterval rational_model) :
    RationalInterval rational_model :=
  Classical.choose (interval_sum_exists_uniquely rational_model first second) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def interval_addition
    (first second : RationalInterval rational_model) :
    RationalInterval rational_model :=
  Classical.choose (interval_sum_exists_uniquely rational_model first second)
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
noncomputable def interval_addition
    (first second : RationalInterval rational_model) :
    RationalInterval rational_model :=
  Classical.choose (interval_sum_exists_uniquely rational_model first second)

/--
`interval_negation_exists_uniquely` TODO

Predicate logic:

  ∃ result, IsIntervalNegation rational_model interval result ∧ ∀ other, IsIntervalNegation rational_model interval other → other = result

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (interval : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.RationalInterval rational_model), Exists fun result => ((result.1 = rational_model.signature.toRingConceptSignature.2 interval.2 ∧ result.2 = rational_model.signature.toRingConceptSignature.2 interval.1) ∧ ∀ (other : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.RationalInterval rational_model), (other.1 = rational_model.signature.toRingConceptSignature.2 interval.2 ∧ other.2 = rational_model.signature.toRingConceptSignature.2 interval.1) → other = result)

Logical form (Lean):

```lean
theorem interval_negation_exists_uniquely
    (interval : RationalInterval rational_model) :
    ∃ result,
      IsIntervalNegation rational_model interval result ∧
      ∀ other,
        IsIntervalNegation rational_model interval other →
        other = result
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
theorem interval_negation_exists_uniquely
    (interval : RationalInterval rational_model) :
    ∃ result,
      IsIntervalNegation rational_model interval result ∧
      ∀ other,
        IsIntervalNegation rational_model interval other →
        other = result := by
  sorry
/--
`interval_negation` TODO

Predicate logic:

  noncomputable def interval_negation
    (interval : RationalInterval rational_model) :
    RationalInterval rational_model :=
  Classical.choose
    (interval_negation_exists_uniquely rational_model interval)

Predicate logic (unfolded):

  noncomputable def interval_negation
    (interval : RationalInterval rational_model) :
    RationalInterval rational_model :=
  Classical.choose
    (interval_negation_exists_uniquely rational_model interval) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def interval_negation
    (interval : RationalInterval rational_model) :
    RationalInterval rational_model :=
  Classical.choose
    (interval_negation_exists_uniquely rational_model interval)
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
noncomputable def interval_negation
    (interval : RationalInterval rational_model) :
    RationalInterval rational_model :=
  Classical.choose
    (interval_negation_exists_uniquely rational_model interval)

/--
`interval_product_exists_uniquely` TODO

Predicate logic:

  ∃ result, IsIntervalProduct rational_model first second result ∧ ∀ other, IsIntervalProduct rational_model first second other → other = result

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (first second : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.RationalInterval rational_model), Exists fun result => ((∀ (corner : rational_model.signature.toCarrierBundle.1), Or (corner = rational_model.signature.toBooleanRingOperationBundle.3 first.1 second.1) (Or (corner = rational_model.signature.toBooleanRingOperationBundle.3 first.1 second.2) (Or (corner = rational_model.signature.toBooleanRingOperationBundle.3 first.2 second.1) (corner = rational_model.signature.toBooleanRingOperationBundle.3 first.2 second.2))) → rational_model.signature.toOrderedRingConceptSignature.2 result.1 corner ∧ (∀ (corner : rational_model.signature.toCarrierBundle.1), Or (corner = rational_model.signature.toBooleanRingOperationBundle.3 first.1 second.1) (Or (corner = rational_model.signature.toBooleanRingOperationBundle.3 first.1 second.2) (Or (corner = rational_model.signature.toBooleanRingOperationBundle.3 first.2 second.1) (corner = rational_model.signature.toBooleanRingOperationBundle.3 first.2 second.2))) → rational_model.signature.toOrderedRingConceptSignature.2 corner result.2 ∧ (Or (result.1 = rational_model.signature.toBooleanRingOperationBundle.3 first.1 second.1) (Or (result.1 = rational_model.signature.toBooleanRingOperationBundle.3 first.1 second.2) (Or (result.1 = rational_model.signature.toBooleanRingOperationBundle.3 first.2 second.1) (result.1 = rational_model.signature.toBooleanRingOperationBundle.3 first.2 second.2))) ∧ Or (result.2 = rational_model.signature.toBooleanRingOperationBundle.3 first.1 second.1) (Or (result.2 = rational_model.signature.toBooleanRingOperationBundle.3 first.1 second.2) (Or (result.2 = rational_model.signature.toBooleanRingOperationBundle.3 first.2 second.1) (result.2 = rational_model.signature.toBooleanRingOperationBundle.3 first.2 second.2)))))) ∧ ∀ (other : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.RationalInterval rational_model), (∀ (corner : rational_model.signature.toCarrierBundle.1), Or (corner = rational_model.signature.toBooleanRingOperationBundle.3 first.1 second.1) (Or (corner = rational_model.signature.toBooleanRingOperationBundle.3 first.1 second.2) (Or (corner = rational_model.signature.toBooleanRingOperationBundle.3 first.2 second.1) (corner = rational_model.signature.toBooleanRingOperationBundle.3 first.2 second.2))) → rational_model.signature.toOrderedRingConceptSignature.2 other.1 corner ∧ (∀ (corner : rational_model.signature.toCarrierBundle.1), Or (corner = rational_model.signature.toBooleanRingOperationBundle.3 first.1 second.1) (Or (corner = rational_model.signature.toBooleanRingOperationBundle.3 first.1 second.2) (Or (corner = rational_model.signature.toBooleanRingOperationBundle.3 first.2 second.1) (corner = rational_model.signature.toBooleanRingOperationBundle.3 first.2 second.2))) → rational_model.signature.toOrderedRingConceptSignature.2 corner other.2 ∧ (Or (other.1 = rational_model.signature.toBooleanRingOperationBundle.3 first.1 second.1) (Or (other.1 = rational_model.signature.toBooleanRingOperationBundle.3 first.1 second.2) (Or (other.1 = rational_model.signature.toBooleanRingOperationBundle.3 first.2 second.1) (other.1 = rational_model.signature.toBooleanRingOperationBundle.3 first.2 second.2))) ∧ Or (other.2 = rational_model.signature.toBooleanRingOperationBundle.3 first.1 second.1) (Or (other.2 = rational_model.signature.toBooleanRingOperationBundle.3 first.1 second.2) (Or (other.2 = rational_model.signature.toBooleanRingOperationBundle.3 first.2 second.1) (other.2 = rational_model.signature.toBooleanRingOperationBundle.3 first.2 second.2)))))) → other = result)

Logical form (Lean):

```lean
theorem interval_product_exists_uniquely
    (first second : RationalInterval rational_model) :
    ∃ result,
      IsIntervalProduct rational_model first second result ∧
      ∀ other,
        IsIntervalProduct rational_model first second other →
        other = result
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
theorem interval_product_exists_uniquely
    (first second : RationalInterval rational_model) :
    ∃ result,
      IsIntervalProduct rational_model first second result ∧
      ∀ other,
        IsIntervalProduct rational_model first second other →
        other = result := by
  sorry
/--
`interval_multiplication` TODO

Predicate logic:

  noncomputable def interval_multiplication
    (first second : RationalInterval rational_model) :
    RationalInterval rational_model :=
  Classical.choose
    (interval_product_exists_uniquely rational_model first second)

Predicate logic (unfolded):

  noncomputable def interval_multiplication
    (first second : RationalInterval rational_model) :
    RationalInterval rational_model :=
  Classical.choose
    (interval_product_exists_uniquely rational_model first second) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def interval_multiplication
    (first second : RationalInterval rational_model) :
    RationalInterval rational_model :=
  Classical.choose
    (interval_product_exists_uniquely rational_model first second)
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
noncomputable def interval_multiplication
    (first second : RationalInterval rational_model) :
    RationalInterval rational_model :=
  Classical.choose
    (interval_product_exists_uniquely rational_model first second)

/--
`addition_preserves_admissibility` TODO

Predicate logic:

  ∃ result ∈ Representative rational_model, ∀ index, result.interval index = interval_addition rational_model (first.interval index) (second.interval index)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (first second : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), Exists fun result => ∀ (index : Nat), result.1 index = Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.IsIntervalSum rational_model (first.interval index) (second.interval index) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.RationalInterval rational_model), LRA.NumberSystems.RealNumbers.PrimitiveIntervals.IsIntervalSum rational_model (first.interval index) (second.interval index) other → other = x)) ⋯.1

Logical form (Lean):

```lean
theorem addition_preserves_admissibility
    (first second : Representative rational_model) :
    ∃ result : Representative rational_model,
      ∀ index,
        result.interval index =
          interval_addition rational_model
            (first.interval index) (second.interval index)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem addition_preserves_admissibility
    (first second : Representative rational_model) :
    ∃ result : Representative rational_model,
      ∀ index,
        result.interval index =
          interval_addition rational_model
            (first.interval index) (second.interval index) := by
  sorry
/--
`negation_preserves_admissibility` TODO

Predicate logic:

  ∃ result ∈ Representative rational_model, ∀ index, result.interval index = interval_negation rational_model (representative.interval index)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), Exists fun result => ∀ (index : Nat), result.1 index = Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.IsIntervalNegation rational_model (representative.interval index) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.RationalInterval rational_model), LRA.NumberSystems.RealNumbers.PrimitiveIntervals.IsIntervalNegation rational_model (representative.interval index) other → other = x)) ⋯.1

Logical form (Lean):

```lean
theorem negation_preserves_admissibility
    (representative : Representative rational_model) :
    ∃ result : Representative rational_model,
      ∀ index,
        result.interval index =
          interval_negation rational_model
            (representative.interval index)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem negation_preserves_admissibility
    (representative : Representative rational_model) :
    ∃ result : Representative rational_model,
      ∀ index,
        result.interval index =
          interval_negation rational_model
            (representative.interval index) := by
  sorry
/--
`admissible_representatives_are_uniformly_bounded` TODO

Predicate logic:

  ∃ lower upper, ∀ index value, contains rational_model (representative.interval index) value → rational_model.signature.le lower value ∧ rational_model.signature.le value upper

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), Exists fun lower => Exists fun upper => ∀ (index : Nat) (value : rational_model.signature.toCarrierBundle.1), (rational_model.signature.toOrderedRingConceptSignature.2 (representative.interval index).1 value ∧ rational_model.signature.toOrderedRingConceptSignature.2 value (representative.interval index).2) → (rational_model.signature.toOrderedRingConceptSignature.2 lower value ∧ rational_model.signature.toOrderedRingConceptSignature.2 value upper)

Logical form (Lean):

```lean
theorem admissible_representatives_are_uniformly_bounded
    (representative : Representative rational_model) :
    ∃ lower upper,
      ∀ index value,
        contains rational_model (representative.interval index) value →
        rational_model.signature.le lower value ∧
        rational_model.signature.le value upper
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
theorem admissible_representatives_are_uniformly_bounded
    (representative : Representative rational_model) :
    ∃ lower upper,
      ∀ index value,
        contains rational_model (representative.interval index) value →
        rational_model.signature.le lower value ∧
        rational_model.signature.le value upper := by
  sorry
/--
`multiplication_preserves_admissibility` TODO

Predicate logic:

  ∃ result ∈ Representative rational_model, ∀ index, result.interval index = interval_multiplication rational_model (first.interval index) (second.interval index)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (first second : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), Exists fun result => ∀ (index : Nat), result.1 index = Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.IsIntervalProduct rational_model (first.interval index) (second.interval index) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.RationalInterval rational_model), LRA.NumberSystems.RealNumbers.PrimitiveIntervals.IsIntervalProduct rational_model (first.interval index) (second.interval index) other → other = x)) ⋯.1

Logical form (Lean):

```lean
theorem multiplication_preserves_admissibility
    (first second : Representative rational_model) :
    ∃ result : Representative rational_model,
      ∀ index,
        result.interval index =
          interval_multiplication rational_model
            (first.interval index) (second.interval index)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem multiplication_preserves_admissibility
    (first second : Representative rational_model) :
    ∃ result : Representative rational_model,
      ∀ index,
        result.interval index =
          interval_multiplication rational_model
            (first.interval index) (second.interval index) := by
  sorry
/--
`representative_addition` TODO

Predicate logic:

  noncomputable def representative_addition
    (first second : Representative rational_model) :
    Representative rational_model :=
  Classical.choose
    (addition_preserves_admissibility rational_model first second)

Predicate logic (unfolded):

  noncomputable def representative_addition
    (first second : Representative rational_model) :
    Representative rational_model :=
  Classical.choose
    (addition_preserves_admissibility rational_model first second) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def representative_addition
    (first second : Representative rational_model) :
    Representative rational_model :=
  Classical.choose
    (addition_preserves_admissibility rational_model first second)
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
noncomputable def representative_addition
    (first second : Representative rational_model) :
    Representative rational_model :=
  Classical.choose
    (addition_preserves_admissibility rational_model first second)

/--
`representative_negation` TODO

Predicate logic:

  noncomputable def representative_negation
    (representative : Representative rational_model) :
    Representative rational_model :=
  Classical.choose
    (negation_preserves_admissibility rational_model representative)

Predicate logic (unfolded):

  noncomputable def representative_negation
    (representative : Representative rational_model) :
    Representative rational_model :=
  Classical.choose
    (negation_preserves_admissibility rational_model representative) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def representative_negation
    (representative : Representative rational_model) :
    Representative rational_model :=
  Classical.choose
    (negation_preserves_admissibility rational_model representative)
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
noncomputable def representative_negation
    (representative : Representative rational_model) :
    Representative rational_model :=
  Classical.choose
    (negation_preserves_admissibility rational_model representative)

/--
`representative_multiplication` TODO

Predicate logic:

  noncomputable def representative_multiplication
    (first second : Representative rational_model) :
    Representative rational_model :=
  Classical.choose
    (multiplication_preserves_admissibility rational_model first second)

Predicate logic (unfolded):

  noncomputable def representative_multiplication
    (first second : Representative rational_model) :
    Representative rational_model :=
  Classical.choose
    (multiplication_preserves_admissibility rational_model first second) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def representative_multiplication
    (first second : Representative rational_model) :
    Representative rational_model :=
  Classical.choose
    (multiplication_preserves_admissibility rational_model first second)
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
noncomputable def representative_multiplication
    (first second : Representative rational_model) :
    Representative rational_model :=
  Classical.choose
    (multiplication_preserves_admissibility rational_model first second)

/--
`representative_operations_respect_equivalence` TODO

Predicate logic:

  LRA.UniversalAlgebra.Quotient.binary_operation_respects (representative_setoid rational_model) (representative_addition rational_model) ∧ LRA.UniversalAlgebra.Quotient.unary_operation_respects (representative_setoid rational_model) (representative_negation rational_model) ∧ LRA.UniversalAlgebra.Quotient.binary_operation_respects (representative_setoid rational_model) (representative_multiplication rational_model)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), (∀ (first_representative first_replacement second_representative second_replacement : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1 first_representative first_replacement → (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1 second_representative second_replacement → (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1 (Classical.indefiniteDescription (fun x => ∀ (index : Nat), x.interval index = LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_addition rational_model (first_representative.interval index) (second_representative.interval index)) ⋯).1 (Classical.indefiniteDescription (fun x => ∀ (index : Nat), x.interval index = LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_addition rational_model (first_replacement.interval index) (second_replacement.interval index)) ⋯).1 ∧ (∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1 first_representative second_representative → (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1 (Classical.indefiniteDescription (fun x => ∀ (index : Nat), x.interval index = LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_negation rational_model (first_representative.interval index)) ⋯).1 (Classical.indefiniteDescription (fun x => ∀ (index : Nat), x.interval index = LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_negation rational_model (second_representative.interval index)) ⋯).1 ∧ ∀ (first_representative first_replacement second_representative second_replacement : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1 first_representative first_replacement → (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1 second_representative second_replacement → (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1 (Classical.indefiniteDescription (fun x => ∀ (index : Nat), x.interval index = LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_multiplication rational_model (first_representative.interval index) (second_representative.interval index)) ⋯).1 (Classical.indefiniteDescription (fun x => ∀ (index : Nat), x.interval index = LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_multiplication rational_model (first_replacement.interval index) (second_replacement.interval index)) ⋯).1))

Logical form (Lean):

```lean
theorem representative_operations_respect_equivalence :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
        (representative_setoid rational_model)
        (representative_addition rational_model) ∧
    LRA.UniversalAlgebra.Quotient.unary_operation_respects
        (representative_setoid rational_model)
        (representative_negation rational_model) ∧
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
        (representative_setoid rational_model)
        (representative_multiplication rational_model)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem representative_operations_respect_equivalence :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
        (representative_setoid rational_model)
        (representative_addition rational_model) ∧
    LRA.UniversalAlgebra.Quotient.unary_operation_respects
        (representative_setoid rational_model)
        (representative_negation rational_model) ∧
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
        (representative_setoid rational_model)
        (representative_multiplication rational_model) := by
  sorry
/--
`addition` TODO

Predicate logic:

  noncomputable def addition :
    Carrier rational_model → Carrier rational_model → Carrier rational_model :=
  Classical.choose
    (LRA.UniversalAlgebra.Quotient.induced_binary_operation_exists
      (representative_setoid rational_model)
      (representative_addition rational_model)
      (representative_operations_respect_equivalence rational_model).1)

Predicate logic (unfolded):

  noncomputable def addition :
    Carrier rational_model → Carrier rational_model → Carrier rational_model :=
  Classical.choose
    (LRA.UniversalAlgebra.Quotient.induced_binary_operation_exists
      (representative_setoid rational_model)
      (representative_addition rational_model)
      (representative_operations_respect_equivalence rational_model).1) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def addition :
    Carrier rational_model → Carrier rational_model → Carrier rational_model :=
  Classical.choose
    (LRA.UniversalAlgebra.Quotient.induced_binary_operation_exists
      (representative_setoid rational_model)
      (representative_addition rational_model)
      (representative_operations_respect_equivalence rational_model).1)
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
noncomputable def addition :
    Carrier rational_model → Carrier rational_model → Carrier rational_model :=
  Classical.choose
    (LRA.UniversalAlgebra.Quotient.induced_binary_operation_exists
      (representative_setoid rational_model)
      (representative_addition rational_model)
      (representative_operations_respect_equivalence rational_model).1)

/--
`quotient_negation_exists` TODO

Predicate logic:

  ∃ negation ∈ Carrier rational_model → Carrier rational_model, ∀ representative, negation (Quotient.mk _ representative) = Quotient.mk _ (representative_negation rational_model representative)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), Exists fun negation => ∀ (representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), negation (Quot.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1 representative) = Quot.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1 (Classical.indefiniteDescription (fun x => ∀ (index : Nat), x.interval index = LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_negation rational_model (representative.interval index)) ⋯).1

Logical form (Lean):

```lean
theorem quotient_negation_exists :
    ∃ negation : Carrier rational_model → Carrier rational_model,
      ∀ representative,
        negation (Quotient.mk _ representative) =
          Quotient.mk _
            (representative_negation rational_model representative)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem quotient_negation_exists :
    ∃ negation : Carrier rational_model → Carrier rational_model,
      ∀ representative,
        negation (Quotient.mk _ representative) =
          Quotient.mk _
            (representative_negation rational_model representative) := by
  sorry
/--
`negation` TODO

Predicate logic:

  noncomputable def negation :
    Carrier rational_model → Carrier rational_model :=
  Classical.choose (quotient_negation_exists rational_model)

Predicate logic (unfolded):

  noncomputable def negation :
    Carrier rational_model → Carrier rational_model :=
  Classical.choose (quotient_negation_exists rational_model) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def negation :
    Carrier rational_model → Carrier rational_model :=
  Classical.choose (quotient_negation_exists rational_model)
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
noncomputable def negation :
    Carrier rational_model → Carrier rational_model :=
  Classical.choose (quotient_negation_exists rational_model)

/--
`multiplication` TODO

Predicate logic:

  noncomputable def multiplication :
    Carrier rational_model → Carrier rational_model → Carrier rational_model :=
  Classical.choose
    (LRA.UniversalAlgebra.Quotient.induced_binary_operation_exists
      (representative_setoid rational_model)
      (representative_multiplication rational_model)
      (representative_operations_respect_equivalence rational_model).2.2)

Predicate logic (unfolded):

  noncomputable def multiplication :
    Carrier rational_model → Carrier rational_model → Carrier rational_model :=
  Classical.choose
    (LRA.UniversalAlgebra.Quotient.induced_binary_operation_exists
      (representative_setoid rational_model)
      (representative_multiplication rational_model)
      (representative_operations_respect_equivalence rational_model).2.2) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def multiplication :
    Carrier rational_model → Carrier rational_model → Carrier rational_model :=
  Classical.choose
    (LRA.UniversalAlgebra.Quotient.induced_binary_operation_exists
      (representative_setoid rational_model)
      (representative_multiplication rational_model)
      (representative_operations_respect_equivalence rational_model).2.2)
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
noncomputable def multiplication :
    Carrier rational_model → Carrier rational_model → Carrier rational_model :=
  Classical.choose
    (LRA.UniversalAlgebra.Quotient.induced_binary_operation_exists
      (representative_setoid rational_model)
      (representative_multiplication rational_model)
      (representative_operations_respect_equivalence rational_model).2.2)

/--
`representative_strict_order_respects_equivalence` TODO

Predicate logic:

  LRA.UniversalAlgebra.Quotient.relation_respects (representative_setoid rational_model) (representative_strict_order rational_model)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (first_representative first_replacement second_representative second_replacement : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), ((LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1 first_representative first_replacement ∧ (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1 second_representative second_replacement) → Exists fun first_index => Exists fun second_index => rational_model.signature.toOrderedRingSignature.2 (first_representative.interval first_index).2 (second_representative.interval second_index).1 ↔ Exists fun first_index => Exists fun second_index => rational_model.signature.toOrderedRingSignature.2 (first_replacement.interval first_index).2 (second_replacement.interval second_index).1

Logical form (Lean):

```lean
theorem representative_strict_order_respects_equivalence :
    LRA.UniversalAlgebra.Quotient.relation_respects
      (representative_setoid rational_model)
      (representative_strict_order rational_model)
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
theorem representative_strict_order_respects_equivalence :
    LRA.UniversalAlgebra.Quotient.relation_respects
      (representative_setoid rational_model)
      (representative_strict_order rational_model) := by
  sorry
/--
`strict_order` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (a a_1 : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Carrier rational_model), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 a a_1

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (a a_1 : Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 a a_1

Logical form (Lean):

```lean
noncomputable def strict_order :
    Carrier rational_model → Carrier rational_model → Prop :=
  Classical.choose
    (LRA.UniversalAlgebra.Quotient.induced_relation_exists
      (representative_setoid rational_model)
      (representative_strict_order rational_model)
      (representative_strict_order_respects_equivalence rational_model))
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
noncomputable def strict_order :
    Carrier rational_model → Carrier rational_model → Prop :=
  Classical.choose
    (LRA.UniversalAlgebra.Quotient.induced_relation_exists
      (representative_setoid rational_model)
      (representative_strict_order rational_model)
      (representative_strict_order_respects_equivalence rational_model))

end LRA.NumberSystems.RealNumbers.PrimitiveIntervals
