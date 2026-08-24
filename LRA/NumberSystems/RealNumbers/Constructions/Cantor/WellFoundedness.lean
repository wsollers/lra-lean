
import LRA.NumberSystems.RealNumbers.Constructions.Cantor.Equivalence

namespace LRA.NumberSystems.RealNumbers.Cantor
open LRA.NumberSystems.Interface.ModelTheory

/--
`InductionOnRepresentatives` TODO

Predicate logic:

  (∀ rational_model ∈ DenselyOrderedFieldModel), (Carrier rational_model → Prop ∧ ∀ representative : NestedIntervalSequence rational_model, motive (Quotient.mk _ representative)) → ∀ value : Carrier rational_model, motive value

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (motive : Quot (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid rational_model).1 → Prop), (∀ (representative : LRA.NumberSystems.RealNumbers.Cantor.NestedIntervalSequence rational_model), motive (Quot.mk (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid rational_model).1 representative)) → ∀ (value : Quot (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid rational_model).1), motive value

Logical form (Lean):

```lean
theorem InductionOnRepresentatives
    (rational_model : DenselyOrderedFieldModel)
    (motive : Carrier rational_model → Prop)
    (onRepresentative :
      ∀ representative : NestedIntervalSequence rational_model,
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
    (rational_model : DenselyOrderedFieldModel)
    (motive : Carrier rational_model → Prop)
    (onRepresentative :
      ∀ representative : NestedIntervalSequence rational_model,
        motive (Quotient.mk _ representative)) :
    ∀ value : Carrier rational_model, motive value := by
  sorry

end LRA.NumberSystems.RealNumbers.Cantor
