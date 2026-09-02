
import LRA.NumberSystems.RealNumbers.Constructions.PrimitiveIntervals.Equivalence

namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervals
open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

/--
`InductionOnRepresentatives` TODO

Predicate logic:

  (∀ rational_model ∈ RationalModel), (Carrier rational_model → Prop ∧ ∀ representative : Representative rational_model, motive (Quotient.mk _ representative)) → ∀ value : Carrier rational_model, motive value

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (motive : Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1 → Prop), (∀ (representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), motive (Quot.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1 representative)) → ∀ (value : Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1), motive value

Logical form (Lean):

```lean
theorem InductionOnRepresentatives
    (rational_model : RationalModel)
    (motive : Carrier rational_model → Prop)
    (onRepresentative :
      ∀ representative : Representative rational_model,
        motive (Quotient.mk _ representative)) :
    ∀ value : Carrier rational_model, motive value
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
    (rational_model : RationalModel)
    (motive : Carrier rational_model → Prop)
    (onRepresentative :
      ∀ representative : Representative rational_model,
        motive (Quotient.mk _ representative)) :
    ∀ value : Carrier rational_model, motive value := by
  sorry
end LRA.NumberSystems.RealNumbers.PrimitiveIntervals
