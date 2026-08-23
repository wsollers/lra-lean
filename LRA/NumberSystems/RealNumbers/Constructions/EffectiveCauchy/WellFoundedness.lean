import LRA.NumberSystems.RealNumbers.Constructions.EffectiveCauchy.Equivalence

namespace LRA.NumberSystems.RealNumbers.EffectiveCauchy

open LRA.NumberSystems.RationalNumbers

universe u

                                                                               
theorem InductionOnRepresentatives
    (rationalSystem : RationalNumberSystem.{u})
    (motive : EffectiveCauchyReal rationalSystem → Prop)
    (onRepresentative :
      ∀ representative : EffectiveCauchyApproximation rationalSystem,
        motive (Quotient.mk (ApproximationSetoid rationalSystem) representative)) :
    ∀ value : EffectiveCauchyReal rationalSystem, motive value := by
  sorry

end LRA.NumberSystems.RealNumbers.EffectiveCauchy
