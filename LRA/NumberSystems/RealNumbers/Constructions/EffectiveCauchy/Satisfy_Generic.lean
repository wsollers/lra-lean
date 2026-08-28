import LRA.NumberSystems.RealNumbers.Constructions.EffectiveCauchy.Instances

namespace LRA.NumberSystems.RealNumbers.EffectiveCauchy

open LRA.NumberSystems.RealNumbers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers

/-- The effective-Cauchy-sequence construction satisfies the generic ℝ
interface: for any rational number system, the quotient-of-effective-Cauchy-
sequences carrier is a `RealModel`.

Logical form:

```lean
noncomputable abbrev satisfiesGeneric (rationalSystem : RationalNumberSystem) :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  EffectiveCauchyRealizesRealModel rationalSystem
```
-/
noncomputable abbrev satisfiesGeneric (rationalSystem : RationalNumberSystem) :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  EffectiveCauchyRealizesRealModel rationalSystem

end LRA.NumberSystems.RealNumbers.EffectiveCauchy
