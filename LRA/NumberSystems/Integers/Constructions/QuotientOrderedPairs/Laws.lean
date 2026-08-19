-- LRA/NumberSystems/Integers/Constructions/QuotientOrderedPairs/Laws.lean
-- The interface's law classes, discharged for the quotient operations.

import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs.WellDefinedness

namespace LRA.NumberSystems.Integers.QuotientOrderedPairs

/-- The quotient addition is associative.

*Proof status:* proof pending

Logical form:

```lean
theorem quotient_addition_is_associative
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (addition : Carrier whole_data → Carrier whole_data → Carrier whole_data)
    (addition_computes :
      ∀ first second,
        addition (Quotient.mk _ first) (Quotient.mk _ second) =
          Quotient.mk _ (representative_addition whole_data first second)) :
    ∀ first second third,
      addition (addition first second) third =
        addition first (addition second third)
```
-/
theorem quotient_addition_is_associative
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (addition : Carrier whole_data → Carrier whole_data → Carrier whole_data)
    (addition_computes :
      ∀ first second,
        addition (Quotient.mk _ first) (Quotient.mk _ second) =
          Quotient.mk _ (representative_addition whole_data first second)) :
    ∀ first second third,
      addition (addition first second) third =
        addition first (addition second third) := by
  sorry


/-- The quotient addition is commutative.

*Proof status:* proof pending

Logical form:

```lean
theorem quotient_addition_is_commutative
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (addition : Carrier whole_data → Carrier whole_data → Carrier whole_data)
    (addition_computes :
      ∀ first second,
        addition (Quotient.mk _ first) (Quotient.mk _ second) =
          Quotient.mk _ (representative_addition whole_data first second)) :
    ∀ first second,
      addition first second = addition second first
```
-/
theorem quotient_addition_is_commutative
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (addition : Carrier whole_data → Carrier whole_data → Carrier whole_data)
    (addition_computes :
      ∀ first second,
        addition (Quotient.mk _ first) (Quotient.mk _ second) =
          Quotient.mk _ (representative_addition whole_data first second)) :
    ∀ first second,
      addition first second = addition second first := by
  sorry


/-- Negation supplies additive inverses in the quotient.

*Proof status:* proof pending

Logical form:

```lean
theorem quotient_negation_is_additive_inverse
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (addition : Carrier whole_data → Carrier whole_data → Carrier whole_data)
    (negation : Carrier whole_data → Carrier whole_data)
    (addition_computes :
      ∀ first second,
        addition (Quotient.mk _ first) (Quotient.mk _ second) =
          Quotient.mk _ (representative_addition whole_data first second))
    (negation_computes :
      ∀ value,
        negation (Quotient.mk _ value) =
          Quotient.mk _ (representative_negation whole_data value)) :
    ∀ value,
      addition value (negation value) =
        Quotient.mk _ (zero_representative whole_data)
```
-/
theorem quotient_negation_is_additive_inverse
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (addition : Carrier whole_data → Carrier whole_data → Carrier whole_data)
    (negation : Carrier whole_data → Carrier whole_data)
    (addition_computes :
      ∀ first second,
        addition (Quotient.mk _ first) (Quotient.mk _ second) =
          Quotient.mk _ (representative_addition whole_data first second))
    (negation_computes :
      ∀ value,
        negation (Quotient.mk _ value) =
          Quotient.mk _ (representative_negation whole_data value)) :
    ∀ value,
      addition value (negation value) =
        Quotient.mk _ (zero_representative whole_data) := by
  sorry


/-- Multiplication distributes over addition in the quotient.

*Proof status:* proof pending

Logical form:

```lean
theorem quotient_multiplication_distributes_over_addition
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (addition multiplication : Carrier whole_data → Carrier whole_data → Carrier whole_data)
    (addition_computes :
      ∀ first second,
        addition (Quotient.mk _ first) (Quotient.mk _ second) =
          Quotient.mk _ (representative_addition whole_data first second))
    (multiplication_computes :
      ∀ first second,
        multiplication (Quotient.mk _ first) (Quotient.mk _ second) =
          Quotient.mk _ (representative_multiplication whole_data first second)) :
    ∀ first second third,
      multiplication first (addition second third) =
        addition (multiplication first second) (multiplication first third)
```
-/
theorem quotient_multiplication_distributes_over_addition
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (addition multiplication : Carrier whole_data → Carrier whole_data → Carrier whole_data)
    (addition_computes :
      ∀ first second,
        addition (Quotient.mk _ first) (Quotient.mk _ second) =
          Quotient.mk _ (representative_addition whole_data first second))
    (multiplication_computes :
      ∀ first second,
        multiplication (Quotient.mk _ first) (Quotient.mk _ second) =
          Quotient.mk _ (representative_multiplication whole_data first second)) :
    ∀ first second third,
      multiplication first (addition second third) =
        addition (multiplication first second) (multiplication first third) := by
  sorry

end LRA.NumberSystems.Integers.QuotientOrderedPairs
