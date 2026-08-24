
import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs.Laws

namespace LRA.NumberSystems.Integers.QuotientOrderedPairs

/--
`embed_preserves_addition` TODO

Predicate logic:

  (∀ whole_data ∈ WholeNumberArithmeticForQuotientPairs), (Carrier whole_data → Carrier whole_data → Carrier whole_data ∧ ∀ first second, addition (Quotient.mk _ first) (Quotient.mk _ second) = Quotient.mk _ (representative_addition whole_data first second)) → ∀ first second : whole_data.carrier, embed whole_data (whole_data.addition first second) = addition (embed whole_data first) (embed whole_data second)

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs) (addition : Quot (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 → Quot (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 → Quot (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1), (∀ (first second : LRA.NumberSystems.Integers.QuotientOrderedPairs.Representative whole_data), addition (Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 first) (Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 second) = Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 { positive_coordinate := whole_data.4 first.1 second.1, negative_coordinate := whole_data.4 first.2 second.2 }) → ∀ (first second : whole_data.1), Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 { positive_coordinate := whole_data.4 first second, negative_coordinate := whole_data.2 } = addition (Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 { positive_coordinate := first, negative_coordinate := whole_data.2 }) (Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 { positive_coordinate := second, negative_coordinate := whole_data.2 })

Logical form (Lean):

```lean
theorem embed_preserves_addition
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (addition : Carrier whole_data → Carrier whole_data → Carrier whole_data)
    (addition_computes :
      ∀ first second,
        addition (Quotient.mk _ first) (Quotient.mk _ second) =
          Quotient.mk _ (representative_addition whole_data first second)) :
    ∀ first second : whole_data.carrier,
      embed whole_data (whole_data.addition first second) =
        addition (embed whole_data first) (embed whole_data second)
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
theorem embed_preserves_addition
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (addition : Carrier whole_data → Carrier whole_data → Carrier whole_data)
    (addition_computes :
      ∀ first second,
        addition (Quotient.mk _ first) (Quotient.mk _ second) =
          Quotient.mk _ (representative_addition whole_data first second)) :
    ∀ first second : whole_data.carrier,
      embed whole_data (whole_data.addition first second) =
        addition (embed whole_data first) (embed whole_data second) := by
  sorry

/--
`embed_one_eq_one_representative_class` TODO

Predicate logic:

  (∀ whole_data ∈ WholeNumberArithmeticForQuotientPairs), embed whole_data whole_data.one = Quotient.mk _ (one_representative whole_data)

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs), Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 { positive_coordinate := whole_data.3, negative_coordinate := whole_data.2 } = Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 { positive_coordinate := whole_data.3, negative_coordinate := whole_data.2 }

Logical form (Lean):

```lean
theorem embed_one_eq_one_representative_class
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    embed whole_data whole_data.one = Quotient.mk _ (one_representative whole_data)
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
theorem embed_one_eq_one_representative_class
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    embed whole_data whole_data.one = Quotient.mk _ (one_representative whole_data) := by
  sorry

/--
`embed_zero_eq_zero_representative_class` TODO

Predicate logic:

  (∀ whole_data ∈ WholeNumberArithmeticForQuotientPairs), embed whole_data whole_data.zero = Quotient.mk _ (zero_representative whole_data)

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs), Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 { positive_coordinate := whole_data.2, negative_coordinate := whole_data.2 } = Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 { positive_coordinate := whole_data.2, negative_coordinate := whole_data.2 }

Logical form (Lean):

```lean
theorem embed_zero_eq_zero_representative_class
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    embed whole_data whole_data.zero = Quotient.mk _ (zero_representative whole_data)
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
theorem embed_zero_eq_zero_representative_class
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    embed whole_data whole_data.zero = Quotient.mk _ (zero_representative whole_data) := by
  sorry

end LRA.NumberSystems.Integers.QuotientOrderedPairs
