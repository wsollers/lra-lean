
import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs.WellDefinedness

namespace LRA.NumberSystems.Integers.QuotientOrderedPairs

/--
`quotient_addition_is_associative` TODO

Predicate logic:

  (∀ whole_data ∈ WholeNumberArithmeticForQuotientPairs), (Carrier whole_data → Carrier whole_data → Carrier whole_data ∧ ∀ first second, addition (Quotient.mk _ first) (Quotient.mk _ second) = Quotient.mk _ (representative_addition whole_data first second)) → ∀ first second third, addition (addition first second) third = addition first (addition second third)

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs) (addition : Quot (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 → Quot (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 → Quot (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1), (∀ (first second : LRA.NumberSystems.Integers.QuotientOrderedPairs.Representative whole_data), addition (Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 first) (Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 second) = Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 { positive_coordinate := whole_data.4 first.1 second.1, negative_coordinate := whole_data.4 first.2 second.2 }) → ∀ (first second third : Quot (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1), addition (addition first second) third = addition first (addition second third)

Logical form (Lean):

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

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

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

/--
`quotient_addition_is_commutative` TODO

Predicate logic:

  (∀ whole_data ∈ WholeNumberArithmeticForQuotientPairs), (Carrier whole_data → Carrier whole_data → Carrier whole_data ∧ ∀ first second, addition (Quotient.mk _ first) (Quotient.mk _ second) = Quotient.mk _ (representative_addition whole_data first second)) → ∀ first second, addition first second = addition second first

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs) (addition : Quot (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 → Quot (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 → Quot (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1), (∀ (first second : LRA.NumberSystems.Integers.QuotientOrderedPairs.Representative whole_data), addition (Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 first) (Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 second) = Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 { positive_coordinate := whole_data.4 first.1 second.1, negative_coordinate := whole_data.4 first.2 second.2 }) → ∀ (first second : Quot (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1), addition first second = addition second first

Logical form (Lean):

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

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

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

/--
`quotient_negation_is_additive_inverse` TODO

Predicate logic:

  (∀ whole_data ∈ WholeNumberArithmeticForQuotientPairs), (Carrier whole_data → Carrier whole_data → Carrier whole_data ∧ Carrier whole_data → Carrier whole_data ∧ ∀ first second, addition (Quotient.mk _ first) (Quotient.mk _ second) = Quotient.mk _ (representative_addition whole_data first second) ∧ ∀ value, negation (Quotient.mk _ value) = Quotient.mk _ (representative_negation whole_data value)) → ∀ value, addition value (negation value) = Quotient.mk _ (zero_representative whole_data)

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs) (addition : Quot (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 → Quot (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 → Quot (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1) (negation : Quot (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 → Quot (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1), (∀ (first second : LRA.NumberSystems.Integers.QuotientOrderedPairs.Representative whole_data), addition (Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 first) (Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 second) = Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 { positive_coordinate := whole_data.4 first.1 second.1, negative_coordinate := whole_data.4 first.2 second.2 } ∧ ∀ (value : LRA.NumberSystems.Integers.QuotientOrderedPairs.Representative whole_data), negation (Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 value) = Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 { positive_coordinate := value.2, negative_coordinate := value.1 }) → ∀ (value : Quot (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1), addition value (negation value) = Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 { positive_coordinate := whole_data.2, negative_coordinate := whole_data.2 }

Logical form (Lean):

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

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

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

/--
`quotient_multiplication_distributes_over_addition` TODO

Predicate logic:

  (∀ whole_data ∈ WholeNumberArithmeticForQuotientPairs), (∀ first second, addition (Quotient.mk _ first) (Quotient.mk _ second) = Quotient.mk _ (representative_addition whole_data first second) ∧ ∀ first second, multiplication (Quotient.mk _ first) (Quotient.mk _ second) = Quotient.mk _ (representative_multiplication whole_data first second)) → ∀ first second third, multiplication first (addition second third) = addition (multiplication first second) (multiplication first third)

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs) (addition multiplication : Quot (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 → Quot (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 → Quot (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1), (∀ (first second : LRA.NumberSystems.Integers.QuotientOrderedPairs.Representative whole_data), addition (Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 first) (Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 second) = Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 { positive_coordinate := whole_data.4 first.1 second.1, negative_coordinate := whole_data.4 first.2 second.2 } ∧ ∀ (first second : LRA.NumberSystems.Integers.QuotientOrderedPairs.Representative whole_data), multiplication (Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 first) (Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 second) = Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 { positive_coordinate := whole_data.4 (whole_data.5 first.1 second.1) (whole_data.5 first.2 second.2), negative_coordinate := whole_data.4 (whole_data.5 first.1 second.2) (whole_data.5 first.2 second.1) }) → ∀ (first second third : Quot (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1), multiplication first (addition second third) = addition (multiplication first second) (multiplication first third)

Logical form (Lean):

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

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

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
