
import LRA.NumberSystems.RealNumbers.Constructions.Cantor.Equivalence

namespace LRA.NumberSystems.RealNumbers.Cantor
open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

/--
`InductionOnRepresentatives` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (motive : LRA.NumberSystems.RealNumbers.Cantor.Carrier rational_model → Prop), (∀ (representative : LRA.NumberSystems.RealNumbers.Cantor.NestedIntervalSequence rational_model), motive (Quotient.mk (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid rational_model) representative)) → ∀ (value : LRA.NumberSystems.RealNumbers.Cantor.Carrier rational_model), motive value

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    rational_model : RationalModel
    motive : Carrier rational_model → Prop
  Prove
    (∀ (representative : LRA.NumberSystems.RealNumbers.Cantor.NestedIntervalSequence rational_model), motive (Quot.mk (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid rational_model).1 representative)) → ∀ (value : Quot (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid rational_model).1), motive value

Logical form (Lean):

```lean
theorem InductionOnRepresentatives
    (rational_model : RationalModel)
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
    (rational_model : RationalModel)
    (motive : Carrier rational_model → Prop)
    (onRepresentative :
      ∀ representative : NestedIntervalSequence rational_model,
        motive (Quotient.mk _ representative)) :
    ∀ value : Carrier rational_model, motive value := by
  sorry
end LRA.NumberSystems.RealNumbers.Cantor
