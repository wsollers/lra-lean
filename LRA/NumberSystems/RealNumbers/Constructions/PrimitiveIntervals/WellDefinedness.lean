-- LRA/NumberSystems/RealNumbers/Constructions/PrimitiveIntervals/WellDefinedness.lean
-- Existence/uniqueness of the Minkowski sum, interval negation, and
-- interval product, and the resulting interval-level operations; that
-- termwise addition/negation/multiplication preserve admissibility, and
-- the resulting representative-level operations; uniform boundedness of
-- admissible representatives; that the representative-level operations
-- respect persistent overlap; the induced quotient addition/negation/
-- multiplication; and that eventual strict separation is
-- representative-independent, with the induced quotient strict order.
--
-- Distribution note: `interval_addition`, `interval_negation`,
-- `interval_multiplication`, `representative_addition`,
-- `representative_negation`, and `representative_multiplication` are
-- defined here (rather than in `Operations.lean`) because each is a
-- `Classical.choose` applied to the existence theorem immediately
-- preceding it; see the note in `Operations.lean`.

import LRA.NumberSystems.RealNumbers.Constructions.PrimitiveIntervals.Operations

namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervals
open LRA.NumberSystems.Models

variable (rational_model : RationalModel)

/-- The Minkowski sum interval exists uniquely.

Mathematical statement (Lean): `theorem interval_sum_exists_uniquely (first second : RationalInterval rational_model) : ∃ result, IsIntervalSum rational_model first second result ∧ ∀ other, IsIntervalSum rational_model first second other → other = result`.

*Proof status:* proof pending


Logical form:

```lean
theorem interval_sum_exists_uniquely
    (first second : RationalInterval rational_model) :
    ∃ result,
      IsIntervalSum rational_model first second result ∧
      ∀ other,
        IsIntervalSum rational_model first second other →
        other = result
```
-/
theorem interval_sum_exists_uniquely
    (first second : RationalInterval rational_model) :
    ∃ result,
      IsIntervalSum rational_model first second result ∧
      ∀ other,
        IsIntervalSum rational_model first second other →
        other = result := by
  sorry


/-- Definition 3.1: Minkowski interval addition.

Mathematical statement (Lean): `noncomputable def interval_addition (first second : RationalInterval rational_model) : RationalInterval rational_model`.


Logical form:

```lean
noncomputable def interval_addition
    (first second : RationalInterval rational_model) :
    RationalInterval rational_model :=
  Classical.choose (interval_sum_exists_uniquely rational_model first second)
```
-/
noncomputable def interval_addition
    (first second : RationalInterval rational_model) :
    RationalInterval rational_model :=
  Classical.choose (interval_sum_exists_uniquely rational_model first second)


/-- The negated interval exists uniquely.

Mathematical statement (Lean): `theorem interval_negation_exists_uniquely (interval : RationalInterval rational_model) : ∃ result, IsIntervalNegation rational_model interval result ∧ ∀ other, IsIntervalNegation rational_model interval other → other = result`.

*Proof status:* proof pending


Logical form:

```lean
theorem interval_negation_exists_uniquely
    (interval : RationalInterval rational_model) :
    ∃ result,
      IsIntervalNegation rational_model interval result ∧
      ∀ other,
        IsIntervalNegation rational_model interval other →
        other = result
```
-/
theorem interval_negation_exists_uniquely
    (interval : RationalInterval rational_model) :
    ∃ result,
      IsIntervalNegation rational_model interval result ∧
      ∀ other,
        IsIntervalNegation rational_model interval other →
        other = result := by
  sorry


/-- Definition 3.2: interval negation.

Mathematical statement (Lean): `noncomputable def interval_negation (interval : RationalInterval rational_model) : RationalInterval rational_model`.


Logical form:

```lean
noncomputable def interval_negation
    (interval : RationalInterval rational_model) :
    RationalInterval rational_model :=
  Classical.choose
    (interval_negation_exists_uniquely rational_model interval)
```
-/
noncomputable def interval_negation
    (interval : RationalInterval rational_model) :
    RationalInterval rational_model :=
  Classical.choose
    (interval_negation_exists_uniquely rational_model interval)


/-- The minimum/maximum corner enclosure exists uniquely.

Mathematical statement (Lean): `theorem interval_product_exists_uniquely (first second : RationalInterval rational_model) : ∃ result, IsIntervalProduct rational_model first second result ∧ ∀ other, IsIntervalProduct rational_model first second other → other = result`.

*Proof status:* proof pending


Logical form:

```lean
theorem interval_product_exists_uniquely
    (first second : RationalInterval rational_model) :
    ∃ result,
      IsIntervalProduct rational_model first second result ∧
      ∀ other,
        IsIntervalProduct rational_model first second other →
        other = result
```
-/
theorem interval_product_exists_uniquely
    (first second : RationalInterval rational_model) :
    ∃ result,
      IsIntervalProduct rational_model first second result ∧
      ∀ other,
        IsIntervalProduct rational_model first second other →
        other = result := by
  sorry


/-- Definition 3.3: interval multiplication.

Mathematical statement (Lean): `noncomputable def interval_multiplication (first second : RationalInterval rational_model) : RationalInterval rational_model`.


Logical form:

```lean
noncomputable def interval_multiplication
    (first second : RationalInterval rational_model) :
    RationalInterval rational_model :=
  Classical.choose
    (interval_product_exists_uniquely rational_model first second)
```
-/
noncomputable def interval_multiplication
    (first second : RationalInterval rational_model) :
    RationalInterval rational_model :=
  Classical.choose
    (interval_product_exists_uniquely rational_model first second)


/-- Theorem 3.4: termwise addition preserves admissibility.

Mathematical statement (Lean): `theorem addition_preserves_admissibility (first second : Representative rational_model) : ∃ result : Representative rational_model, ∀ index, result.interval index = interval_addition rational_model (first.interval index) (second.interval index)`.

*Proof status:* proof pending


Logical form:

```lean
theorem addition_preserves_admissibility
    (first second : Representative rational_model) :
    ∃ result : Representative rational_model,
      ∀ index,
        result.interval index =
          interval_addition rational_model
            (first.interval index) (second.interval index)
```
-/
theorem addition_preserves_admissibility
    (first second : Representative rational_model) :
    ∃ result : Representative rational_model,
      ∀ index,
        result.interval index =
          interval_addition rational_model
            (first.interval index) (second.interval index) := by
  sorry


/-- Theorem 3.4: termwise negation preserves admissibility.

Mathematical statement (Lean): `theorem negation_preserves_admissibility (representative : Representative rational_model) : ∃ result : Representative rational_model, ∀ index, result.interval index = interval_negation rational_model (representative.interval index)`.

*Proof status:* proof pending


Logical form:

```lean
theorem negation_preserves_admissibility
    (representative : Representative rational_model) :
    ∃ result : Representative rational_model,
      ∀ index,
        result.interval index =
          interval_negation rational_model
            (representative.interval index)
```
-/
theorem negation_preserves_admissibility
    (representative : Representative rational_model) :
    ∃ result : Representative rational_model,
      ∀ index,
        result.interval index =
          interval_negation rational_model
            (representative.interval index) := by
  sorry


/-- Admissible representatives are uniformly rationally bounded.

Mathematical statement (Lean): `theorem admissible_representatives_are_uniformly_bounded (representative : Representative rational_model) : ∃ lower upper, ∀ index value, contains rational_model (representative.interval index) value → rational_model.signature.le lower value ∧...`.

*Proof status:* proof pending


Logical form:

```lean
theorem admissible_representatives_are_uniformly_bounded
    (representative : Representative rational_model) :
    ∃ lower upper,
      ∀ index value,
        contains rational_model (representative.interval index) value →
        rational_model.signature.le lower value ∧
        rational_model.signature.le value upper
```
-/
theorem admissible_representatives_are_uniformly_bounded
    (representative : Representative rational_model) :
    ∃ lower upper,
      ∀ index value,
        contains rational_model (representative.interval index) value →
        rational_model.signature.le lower value ∧
        rational_model.signature.le value upper := by
  sorry


/-- Theorem 3.4: termwise multiplication preserves admissibility.

Mathematical statement (Lean): `theorem multiplication_preserves_admissibility (first second : Representative rational_model) : ∃ result : Representative rational_model, ∀ index, result.interval index = interval_multiplication rational_model (first.interval index) (second.interval index)`.

*Proof status:* proof pending


Logical form:

```lean
theorem multiplication_preserves_admissibility
    (first second : Representative rational_model) :
    ∃ result : Representative rational_model,
      ∀ index,
        result.interval index =
          interval_multiplication rational_model
            (first.interval index) (second.interval index)
```
-/
theorem multiplication_preserves_admissibility
    (first second : Representative rational_model) :
    ∃ result : Representative rational_model,
      ∀ index,
        result.interval index =
          interval_multiplication rational_model
            (first.interval index) (second.interval index) := by
  sorry


/-- Chosen representative operations.

Mathematical statement (Lean): `noncomputable def representative_addition (first second : Representative rational_model) : Representative rational_model`.


Logical form:

```lean
noncomputable def representative_addition
    (first second : Representative rational_model) :
    Representative rational_model :=
  Classical.choose
    (addition_preserves_admissibility rational_model first second)
```
-/
noncomputable def representative_addition
    (first second : Representative rational_model) :
    Representative rational_model :=
  Classical.choose
    (addition_preserves_admissibility rational_model first second)

/--
**[Def — representative_negation]**

Mathematical statement (Lean): `noncomputable def representative_negation (representative : Representative rational_model) : Representative rational_model`.


Logical form:

```lean
noncomputable def representative_negation
    (representative : Representative rational_model) :
    Representative rational_model :=
  Classical.choose
    (negation_preserves_admissibility rational_model representative)
```
-/
noncomputable def representative_negation
    (representative : Representative rational_model) :
    Representative rational_model :=
  Classical.choose
    (negation_preserves_admissibility rational_model representative)

/--
**[Def — representative_multiplication]**

Mathematical statement (Lean): `noncomputable def representative_multiplication (first second : Representative rational_model) : Representative rational_model`.


Logical form:

```lean
noncomputable def representative_multiplication
    (first second : Representative rational_model) :
    Representative rational_model :=
  Classical.choose
    (multiplication_preserves_admissibility rational_model first second)
```
-/
noncomputable def representative_multiplication
    (first second : Representative rational_model) :
    Representative rational_model :=
  Classical.choose
    (multiplication_preserves_admissibility rational_model first second)


/-- Theorem 3.5: representative operations respect persistent overlap.

Mathematical statement (Lean): `theorem representative_operations_respect_equivalence : LRA.UniversalAlgebra.Quotient.binary_operation_respects (representative_setoid rational_model) (representative_addition rational_model) ∧ LRA.UniversalAlgebra.Quotient.unary_operation_respects (representative_setoid r...`.

*Proof status:* proof pending


Logical form:

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


/-- Definition 3.6: quotient arithmetic.

Mathematical statement (Lean): `noncomputable def addition : Carrier rational_model → Carrier rational_model → Carrier rational_model`.


Logical form:

```lean
noncomputable def addition :
    Carrier rational_model → Carrier rational_model → Carrier rational_model :=
  Classical.choose
    (LRA.UniversalAlgebra.Quotient.induced_binary_operation_exists
      (representative_setoid rational_model)
      (representative_addition rational_model)
      (representative_operations_respect_equivalence rational_model).1)
```
-/
noncomputable def addition :
    Carrier rational_model → Carrier rational_model → Carrier rational_model :=
  Classical.choose
    (LRA.UniversalAlgebra.Quotient.induced_binary_operation_exists
      (representative_setoid rational_model)
      (representative_addition rational_model)
      (representative_operations_respect_equivalence rational_model).1)


/-- Existence of quotient negation with its computation rule.

Mathematical statement (Lean): `theorem quotient_negation_exists : ∃ negation : Carrier rational_model → Carrier rational_model, ∀ representative, negation (Quotient.mk _ representative) = Quotient.mk _ (representative_negation rational_model representative)`.

*Proof status:* proof pending


Logical form:

```lean
theorem quotient_negation_exists :
    ∃ negation : Carrier rational_model → Carrier rational_model,
      ∀ representative,
        negation (Quotient.mk _ representative) =
          Quotient.mk _
            (representative_negation rational_model representative)
```
-/
theorem quotient_negation_exists :
    ∃ negation : Carrier rational_model → Carrier rational_model,
      ∀ representative,
        negation (Quotient.mk _ representative) =
          Quotient.mk _
            (representative_negation rational_model representative) := by
  sorry

/--
**[Def — negation]**

Mathematical statement (Lean): `noncomputable def negation : Carrier rational_model → Carrier rational_model`.


Logical form:

```lean
noncomputable def negation :
    Carrier rational_model → Carrier rational_model :=
  Classical.choose (quotient_negation_exists rational_model)
```
-/
noncomputable def negation :
    Carrier rational_model → Carrier rational_model :=
  Classical.choose (quotient_negation_exists rational_model)

/--
**[Def — multiplication]**

Mathematical statement (Lean): `noncomputable def multiplication : Carrier rational_model → Carrier rational_model → Carrier rational_model`.


Logical form:

```lean
noncomputable def multiplication :
    Carrier rational_model → Carrier rational_model → Carrier rational_model :=
  Classical.choose
    (LRA.UniversalAlgebra.Quotient.induced_binary_operation_exists
      (representative_setoid rational_model)
      (representative_multiplication rational_model)
      (representative_operations_respect_equivalence rational_model).2.2)
```
-/
noncomputable def multiplication :
    Carrier rational_model → Carrier rational_model → Carrier rational_model :=
  Classical.choose
    (LRA.UniversalAlgebra.Quotient.induced_binary_operation_exists
      (representative_setoid rational_model)
      (representative_multiplication rational_model)
      (representative_operations_respect_equivalence rational_model).2.2)


/-- Theorem 4.2: eventual separation is representative-independent.

Mathematical statement (Lean): `theorem representative_strict_order_respects_equivalence : LRA.UniversalAlgebra.Quotient.relation_respects (representative_setoid rational_model) (representative_strict_order rational_model)`.

*Proof status:* proof pending


Logical form:

```lean
theorem representative_strict_order_respects_equivalence :
    LRA.UniversalAlgebra.Quotient.relation_respects
      (representative_setoid rational_model)
      (representative_strict_order rational_model)
```
-/
theorem representative_strict_order_respects_equivalence :
    LRA.UniversalAlgebra.Quotient.relation_respects
      (representative_setoid rational_model)
      (representative_strict_order rational_model) := by
  sorry


/-- Definition 4.1: strict order on quotient classes.

Mathematical statement (Lean): `noncomputable def strict_order : Carrier rational_model → Carrier rational_model → Prop`.


Logical form:

```lean
noncomputable def strict_order :
    Carrier rational_model → Carrier rational_model → Prop :=
  Classical.choose
    (LRA.UniversalAlgebra.Quotient.induced_relation_exists
      (representative_setoid rational_model)
      (representative_strict_order rational_model)
      (representative_strict_order_respects_equivalence rational_model))
```
-/
noncomputable def strict_order :
    Carrier rational_model → Carrier rational_model → Prop :=
  Classical.choose
    (LRA.UniversalAlgebra.Quotient.induced_relation_exists
      (representative_setoid rational_model)
      (representative_strict_order rational_model)
      (representative_strict_order_respects_equivalence rational_model))

end LRA.NumberSystems.RealNumbers.PrimitiveIntervals
