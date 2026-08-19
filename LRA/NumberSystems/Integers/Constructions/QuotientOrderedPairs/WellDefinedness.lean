-- LRA/NumberSystems/Integers/Constructions/QuotientOrderedPairs/WellDefinedness.lean
-- Each representative-level operation respects formal-difference equality
-- and lifts to the quotient.

import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs.Operations

namespace LRA.NumberSystems.Integers.QuotientOrderedPairs

/-- Addition respects formal-difference equality.

*Proof status:* proof pending

Logical form:

```lean
theorem representative_addition_respects_equivalence
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      (representative_setoid whole_data)
      (representative_addition whole_data)
```
-/
theorem representative_addition_respects_equivalence
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      (representative_setoid whole_data)
      (representative_addition whole_data) := by
  sorry


/-- Negation respects formal-difference equality.

*Proof status:* proof pending

Logical form:

```lean
theorem representative_negation_respects_equivalence
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LRA.UniversalAlgebra.Quotient.unary_operation_respects
      (representative_setoid whole_data)
      (representative_negation whole_data)
```
-/
theorem representative_negation_respects_equivalence
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LRA.UniversalAlgebra.Quotient.unary_operation_respects
      (representative_setoid whole_data)
      (representative_negation whole_data) := by
  sorry


/-- Multiplication respects formal-difference equality.

*Proof status:* proof pending

Logical form:

```lean
theorem representative_multiplication_respects_equivalence
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      (representative_setoid whole_data)
      (representative_multiplication whole_data)
```
-/
theorem representative_multiplication_respects_equivalence
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      (representative_setoid whole_data)
      (representative_multiplication whole_data) := by
  sorry


/-- Order is representative-independent.

*Proof status:* proof pending

Logical form:

```lean
theorem representative_order_respects_equivalence
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LRA.UniversalAlgebra.Quotient.relation_respects
      (representative_setoid whole_data)
      (representative_nonstrict_order whole_data)
```
-/
theorem representative_order_respects_equivalence
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LRA.UniversalAlgebra.Quotient.relation_respects
      (representative_setoid whole_data)
      (representative_nonstrict_order whole_data) := by
  sorry


/-- Quotient addition exists with the expected representative computation rule.

Logical form:

```lean
theorem quotient_addition_exists
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    ∃ addition : Carrier whole_data → Carrier whole_data → Carrier whole_data,
      ∀ first second,
        addition (Quotient.mk _ first) (Quotient.mk _ second) =
          Quotient.mk _ (representative_addition whole_data first second)
```
-/
theorem quotient_addition_exists
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    ∃ addition : Carrier whole_data → Carrier whole_data → Carrier whole_data,
      ∀ first second,
        addition (Quotient.mk _ first) (Quotient.mk _ second) =
          Quotient.mk _ (representative_addition whole_data first second) := by
  exact LRA.UniversalAlgebra.Quotient.induced_binary_operation_exists
    (representative_setoid whole_data)
    (representative_addition whole_data)
    (representative_addition_respects_equivalence whole_data)


/-- Quotient multiplication exists with the expected representative computation rule.

Logical form:

```lean
theorem quotient_multiplication_exists
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    ∃ multiplication : Carrier whole_data → Carrier whole_data → Carrier whole_data,
      ∀ first second,
        multiplication (Quotient.mk _ first) (Quotient.mk _ second) =
          Quotient.mk _ (representative_multiplication whole_data first second)
```
-/
theorem quotient_multiplication_exists
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    ∃ multiplication : Carrier whole_data → Carrier whole_data → Carrier whole_data,
      ∀ first second,
        multiplication (Quotient.mk _ first) (Quotient.mk _ second) =
          Quotient.mk _ (representative_multiplication whole_data first second) := by
  exact LRA.UniversalAlgebra.Quotient.induced_binary_operation_exists
    (representative_setoid whole_data)
    (representative_multiplication whole_data)
    (representative_multiplication_respects_equivalence whole_data)


/-- Quotient order exists with the expected representative characterization.

Logical form:

```lean
theorem quotient_order_exists
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    ∃ nonstrict_order : Carrier whole_data → Carrier whole_data → Prop,
      ∀ first second,
        nonstrict_order (Quotient.mk _ first) (Quotient.mk _ second) ↔
          representative_nonstrict_order whole_data first second
```
-/
theorem quotient_order_exists
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    ∃ nonstrict_order : Carrier whole_data → Carrier whole_data → Prop,
      ∀ first second,
        nonstrict_order (Quotient.mk _ first) (Quotient.mk _ second) ↔
          representative_nonstrict_order whole_data first second := by
  exact LRA.UniversalAlgebra.Quotient.induced_relation_exists
    (representative_setoid whole_data)
    (representative_nonstrict_order whole_data)
    (representative_order_respects_equivalence whole_data)

end LRA.NumberSystems.Integers.QuotientOrderedPairs
