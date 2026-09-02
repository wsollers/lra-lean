
import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs.Operations

namespace LRA.NumberSystems.Integers.QuotientOrderedPairs

/--
`representative_addition_respects_equivalence` TODO

Predicate logic:

  (∀ whole_data ∈ WholeNumberArithmeticForQuotientPairs), LRA.UniversalAlgebra.Quotient.binary_operation_respects (representative_setoid whole_data) (representative_addition whole_data)

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs) (first_representative first_replacement second_representative second_replacement : LRA.NumberSystems.Integers.QuotientOrderedPairs.Representative whole_data), ((LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 first_representative first_replacement ∧ (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 second_representative second_replacement) → (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 { positive_coordinate := whole_data.4 first_representative.1 second_representative.1, negative_coordinate := whole_data.4 first_representative.2 second_representative.2 } { positive_coordinate := whole_data.4 first_replacement.1 second_replacement.1, negative_coordinate := whole_data.4 first_replacement.2 second_replacement.2 }

Logical form (Lean):

```lean
theorem representative_addition_respects_equivalence
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      (representative_setoid whole_data)
      (representative_addition whole_data)
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
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      (representative_setoid whole_data)
      (representative_addition whole_data) := by
  sorry
/--
`representative_negation_respects_equivalence` TODO

Predicate logic:

  (∀ whole_data ∈ WholeNumberArithmeticForQuotientPairs), LRA.UniversalAlgebra.Quotient.unary_operation_respects (representative_setoid whole_data) (representative_negation whole_data)

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs) (first_representative second_representative : LRA.NumberSystems.Integers.QuotientOrderedPairs.Representative whole_data), (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 first_representative second_representative → (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 { positive_coordinate := first_representative.2, negative_coordinate := first_representative.1 } { positive_coordinate := second_representative.2, negative_coordinate := second_representative.1 }

Logical form (Lean):

```lean
theorem representative_negation_respects_equivalence
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LRA.UniversalAlgebra.Quotient.unary_operation_respects
      (representative_setoid whole_data)
      (representative_negation whole_data)
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
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LRA.UniversalAlgebra.Quotient.unary_operation_respects
      (representative_setoid whole_data)
      (representative_negation whole_data) := by
  sorry
/--
`representative_multiplication_respects_equivalence` TODO

Predicate logic:

  (∀ whole_data ∈ WholeNumberArithmeticForQuotientPairs), LRA.UniversalAlgebra.Quotient.binary_operation_respects (representative_setoid whole_data) (representative_multiplication whole_data)

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs) (first_representative first_replacement second_representative second_replacement : LRA.NumberSystems.Integers.QuotientOrderedPairs.Representative whole_data), ((LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 first_representative first_replacement ∧ (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 second_representative second_replacement) → (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 { positive_coordinate := whole_data.4 (whole_data.5 first_representative.1 second_representative.1) (whole_data.5 first_representative.2 second_representative.2), negative_coordinate := whole_data.4 (whole_data.5 first_representative.1 second_representative.2) (whole_data.5 first_representative.2 second_representative.1) } { positive_coordinate := whole_data.4 (whole_data.5 first_replacement.1 second_replacement.1) (whole_data.5 first_replacement.2 second_replacement.2), negative_coordinate := whole_data.4 (whole_data.5 first_replacement.1 second_replacement.2) (whole_data.5 first_replacement.2 second_replacement.1) }

Logical form (Lean):

```lean
theorem representative_multiplication_respects_equivalence
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      (representative_setoid whole_data)
      (representative_multiplication whole_data)
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
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      (representative_setoid whole_data)
      (representative_multiplication whole_data) := by
  sorry
/--
`representative_order_respects_equivalence` TODO

Predicate logic:

  (∀ whole_data ∈ WholeNumberArithmeticForQuotientPairs), LRA.UniversalAlgebra.Quotient.relation_respects (representative_setoid whole_data) (representative_nonstrict_order whole_data)

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs) (first_representative first_replacement second_representative second_replacement : LRA.NumberSystems.Integers.QuotientOrderedPairs.Representative whole_data), ((LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 first_representative first_replacement ∧ (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 second_representative second_replacement) → whole_data.6 (whole_data.4 first_representative.1 second_representative.2) (whole_data.4 second_representative.1 first_representative.2) ↔ whole_data.6 (whole_data.4 first_replacement.1 second_replacement.2) (whole_data.4 second_replacement.1 first_replacement.2)

Logical form (Lean):

```lean
theorem representative_order_respects_equivalence
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LRA.UniversalAlgebra.Quotient.relation_respects
      (representative_setoid whole_data)
      (representative_nonstrict_order whole_data)
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
theorem representative_order_respects_equivalence
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LRA.UniversalAlgebra.Quotient.relation_respects
      (representative_setoid whole_data)
      (representative_nonstrict_order whole_data) := by
  sorry
/--
`quotient_addition_exists` TODO

Predicate logic:

  (∀ whole_data ∈ WholeNumberArithmeticForQuotientPairs), ∃ addition ∈ Carrier whole_data → Carrier whole_data → Carrier whole_data, ∀ first second, addition (Quotient.mk _ first) (Quotient.mk _ second) = Quotient.mk _ (representative_addition whole_data first second)

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs), Exists fun addition => ∀ (first second : LRA.NumberSystems.Integers.QuotientOrderedPairs.Representative whole_data), addition (Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 first) (Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 second) = Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 { positive_coordinate := whole_data.4 first.1 second.1, negative_coordinate := whole_data.4 first.2 second.2 }

Logical form (Lean):

```lean
theorem quotient_addition_exists
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    ∃ addition : Carrier whole_data → Carrier whole_data → Carrier whole_data,
      ∀ first second,
        addition (Quotient.mk _ first) (Quotient.mk _ second) =
          Quotient.mk _ (representative_addition whole_data first second)
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
theorem quotient_addition_exists
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    ∃ addition : Carrier whole_data → Carrier whole_data → Carrier whole_data,
      ∀ first second,
        addition (Quotient.mk _ first) (Quotient.mk _ second) =
          Quotient.mk _ (representative_addition whole_data first second) := by
  sorry
/--
`quotient_multiplication_exists` TODO

Predicate logic:

  (∀ whole_data ∈ WholeNumberArithmeticForQuotientPairs), ∃ multiplication ∈ Carrier whole_data → Carrier whole_data → Carrier whole_data, ∀ first second, multiplication (Quotient.mk _ first) (Quotient.mk _ second) = Quotient.mk _ (representative_multiplication whole_data first second)

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs), Exists fun multiplication => ∀ (first second : LRA.NumberSystems.Integers.QuotientOrderedPairs.Representative whole_data), multiplication (Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 first) (Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 second) = Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 { positive_coordinate := whole_data.4 (whole_data.5 first.1 second.1) (whole_data.5 first.2 second.2), negative_coordinate := whole_data.4 (whole_data.5 first.1 second.2) (whole_data.5 first.2 second.1) }

Logical form (Lean):

```lean
theorem quotient_multiplication_exists
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    ∃ multiplication : Carrier whole_data → Carrier whole_data → Carrier whole_data,
      ∀ first second,
        multiplication (Quotient.mk _ first) (Quotient.mk _ second) =
          Quotient.mk _ (representative_multiplication whole_data first second)
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
theorem quotient_multiplication_exists
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    ∃ multiplication : Carrier whole_data → Carrier whole_data → Carrier whole_data,
      ∀ first second,
        multiplication (Quotient.mk _ first) (Quotient.mk _ second) =
          Quotient.mk _ (representative_multiplication whole_data first second) := by
  sorry
/--
`quotient_order_exists` TODO

Predicate logic:

  (∀ whole_data ∈ WholeNumberArithmeticForQuotientPairs), ∃ nonstrict_order ∈ Carrier whole_data → Carrier whole_data → Prop, ∀ first second, nonstrict_order (Quotient.mk _ first) (Quotient.mk _ second) ↔ representative_nonstrict_order whole_data first second

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs), Exists fun nonstrict_order => ∀ (first second : LRA.NumberSystems.Integers.QuotientOrderedPairs.Representative whole_data), nonstrict_order (Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 first) (Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 second) ↔ whole_data.6 (whole_data.4 first.1 second.2) (whole_data.4 second.1 first.2)

Logical form (Lean):

```lean
theorem quotient_order_exists
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    ∃ nonstrict_order : Carrier whole_data → Carrier whole_data → Prop,
      ∀ first second,
        nonstrict_order (Quotient.mk _ first) (Quotient.mk _ second) ↔
          representative_nonstrict_order whole_data first second
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, use, rcases

-/
theorem quotient_order_exists
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    ∃ nonstrict_order : Carrier whole_data → Carrier whole_data → Prop,
      ∀ first second,
        nonstrict_order (Quotient.mk _ first) (Quotient.mk _ second) ↔
          representative_nonstrict_order whole_data first second := by
  sorry
end LRA.NumberSystems.Integers.QuotientOrderedPairs
