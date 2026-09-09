
import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs.Equivalence

namespace LRA.NumberSystems.Integers.QuotientOrderedPairs

/--
`induction_on_representatives` TODO

Predicate logic:

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs) (motive : LRA.NumberSystems.Integers.QuotientOrderedPairs.Carrier whole_data → Prop), (∀ (representative : LRA.NumberSystems.Integers.QuotientOrderedPairs.Representative whole_data), motive (Quotient.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data) representative)) → ∀ (value : LRA.NumberSystems.Integers.QuotientOrderedPairs.Carrier whole_data), motive value

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    whole_data : WholeNumberArithmeticForQuotientPairs
    motive : Carrier whole_data → Prop
  Prove
    (∀ (representative : LRA.NumberSystems.Integers.QuotientOrderedPairs.Representative whole_data), motive (Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 representative)) → ∀ (value : Quot (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1), motive value

Logical form (Lean):

```lean
theorem induction_on_representatives
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (motive : Carrier whole_data → Prop)
    (onRepresentative :
      ∀ representative : Representative whole_data,
        motive (Quotient.mk _ representative)) :
    ∀ value : Carrier whole_data, motive value
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
theorem induction_on_representatives
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (motive : Carrier whole_data → Prop)
    (onRepresentative :
      ∀ representative : Representative whole_data,
        motive (Quotient.mk _ representative)) :
    ∀ value : Carrier whole_data, motive value := by
  sorry
end LRA.NumberSystems.Integers.QuotientOrderedPairs
