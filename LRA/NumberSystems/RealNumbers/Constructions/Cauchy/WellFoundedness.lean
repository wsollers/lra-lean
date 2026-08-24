
import LRA.NumberSystems.RealNumbers.Constructions.Cauchy.Equivalence

namespace LRA.NumberSystems.RealNumbers.Cauchy
open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers

/--
`InductionOnRepresentatives` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), (Carrier rationalSystem absolute_value_data → Prop ∧ ∀ representative : Representative rationalSystem absolute_value_data, motive (Quotient.mk _ representative)) → ∀ value : Carrier rationalSystem absolute_value_data, motive value

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (motive : Quot (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data).1 → Prop), (∀ (representative : LRA.NumberSystems.RealNumbers.Cauchy.Representative rationalSystem absolute_value_data), motive (Quot.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data).1 representative)) → ∀ (value : Quot (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data).1), motive value

Logical form (Lean):

```lean
theorem InductionOnRepresentatives
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (motive : Carrier rationalSystem absolute_value_data → Prop)
    (onRepresentative :
      ∀ representative : Representative rationalSystem absolute_value_data,
        motive (Quotient.mk _ representative)) :
    ∀ value : Carrier rationalSystem absolute_value_data, motive value
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
theorem InductionOnRepresentatives
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (motive : Carrier rationalSystem absolute_value_data → Prop)
    (onRepresentative :
      ∀ representative : Representative rationalSystem absolute_value_data,
        motive (Quotient.mk _ representative)) :
    ∀ value : Carrier rationalSystem absolute_value_data, motive value := by
  sorry

end LRA.NumberSystems.RealNumbers.Cauchy
