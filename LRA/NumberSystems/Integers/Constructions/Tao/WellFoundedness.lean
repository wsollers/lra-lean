
import LRA.NumberSystems.Integers.Constructions.Tao.Equivalence

namespace LRA.NumberSystems.Integers.Tao

/--
`induction_on_representatives` TODO

Predicate logic:

  (∀ whole_data ∈ WholeNumberArithmeticForTaoFormalDifferences), (Carrier whole_data → Prop ∧ ∀ representative : FormalDifference whole_data, motive (Quotient.mk _ representative)) → ∀ value : Carrier whole_data, motive value

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.Tao.WholeNumberArithmeticForTaoFormalDifferences) (motive : Quot (LRA.NumberSystems.Integers.Tao.setoid whole_data).1 → Prop), (∀ (representative : LRA.NumberSystems.Integers.Tao.FormalDifference whole_data), motive (Quot.mk (LRA.NumberSystems.Integers.Tao.setoid whole_data).1 representative)) → ∀ (value : Quot (LRA.NumberSystems.Integers.Tao.setoid whole_data).1), motive value

Logical form (Lean):

```lean
theorem induction_on_representatives
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (motive : Carrier whole_data → Prop)
    (onRepresentative :
      ∀ representative : FormalDifference whole_data,
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
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (motive : Carrier whole_data → Prop)
    (onRepresentative :
      ∀ representative : FormalDifference whole_data,
        motive (Quotient.mk _ representative)) :
    ∀ value : Carrier whole_data, motive value := by
  sorry
end LRA.NumberSystems.Integers.Tao
