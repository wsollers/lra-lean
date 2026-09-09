
import LRA.NumberSystems.Integers.Constructions.Mendelson.Equivalence

namespace LRA.NumberSystems.Integers.Mendelson

/--
`induction_on_representatives` TODO

Predicate logic:

  ∀ (positive_data : LRA.NumberSystems.Integers.Mendelson.PositiveNaturalPairData) (motive : LRA.NumberSystems.Integers.Mendelson.Carrier positive_data → Prop), (∀ (representative : LRA.NumberSystems.Integers.Mendelson.PositivePair positive_data), motive (Quotient.mk (LRA.NumberSystems.Integers.Mendelson.setoid positive_data) representative)) → ∀ (value : LRA.NumberSystems.Integers.Mendelson.Carrier positive_data), motive value

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    positive_data : PositiveNaturalPairData
    motive : Carrier positive_data → Prop
  Prove
    (∀ (representative : LRA.NumberSystems.Integers.Mendelson.PositivePair positive_data), motive (Quot.mk (LRA.NumberSystems.Integers.Mendelson.setoid positive_data).1 representative)) → ∀ (value : Quot (LRA.NumberSystems.Integers.Mendelson.setoid positive_data).1), motive value

Logical form (Lean):

```lean
theorem induction_on_representatives
    (positive_data : PositiveNaturalPairData)
    (motive : Carrier positive_data → Prop)
    (onRepresentative :
      ∀ representative : PositivePair positive_data,
        motive (Quotient.mk _ representative)) :
    ∀ value : Carrier positive_data, motive value
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
    (positive_data : PositiveNaturalPairData)
    (motive : Carrier positive_data → Prop)
    (onRepresentative :
      ∀ representative : PositivePair positive_data,
        motive (Quotient.mk _ representative)) :
    ∀ value : Carrier positive_data, motive value := by
  sorry
end LRA.NumberSystems.Integers.Mendelson
