import LRA.NumberSystems.RealNumbers.Constructions.EffectiveCauchy.Equivalence

namespace LRA.NumberSystems.RealNumbers.EffectiveCauchy

open LRA.NumberSystems.RationalNumbers

universe u

/--
`InductionOnRepresentatives` TODO

Predicate logic:

  (EffectiveCauchyReal rationalSystem → Prop ∧ ∀ representative : EffectiveCauchyApproximation rationalSystem, motive (Quotient.mk (ApproximationSetoid rationalSystem) representative)) → ∀ value : EffectiveCauchyReal rationalSystem, motive value

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (motive : Quot (LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem).1 → Prop), (∀ (representative : LRA.NumberSystems.RealNumbers.EffectiveCauchy.EffectiveCauchyApproximation rationalSystem), motive (Quot.mk (LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem).1 representative)) → ∀ (value : Quot (LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem).1), motive value

Logical form (Lean):

```lean
theorem InductionOnRepresentatives
    (rationalSystem : RationalNumberSystem.{u})
    (motive : EffectiveCauchyReal rationalSystem → Prop)
    (onRepresentative :
      ∀ representative : EffectiveCauchyApproximation rationalSystem,
        motive (Quotient.mk (ApproximationSetoid rationalSystem) representative)) :
    ∀ value : EffectiveCauchyReal rationalSystem, motive value
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
    (rationalSystem : RationalNumberSystem.{u})
    (motive : EffectiveCauchyReal rationalSystem → Prop)
    (onRepresentative :
      ∀ representative : EffectiveCauchyApproximation rationalSystem,
        motive (Quotient.mk (ApproximationSetoid rationalSystem) representative)) :
    ∀ value : EffectiveCauchyReal rationalSystem, motive value := by
  sorry

end LRA.NumberSystems.RealNumbers.EffectiveCauchy
