import LRA.NumberSystems.RealNumbers.Constructions.Cauchy.Instances

namespace LRA.NumberSystems.RealNumbers.Cauchy

open LRA.NumberSystems.RealNumbers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers

/-- The Cauchy-sequence construction satisfies the generic ℝ interface: for
any rational number system and choice of absolute value data on it, the
quotient-of-Cauchy-sequences carrier is a `RealModel`.

Logical form:

```lean
noncomputable abbrev satisfiesGeneric
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  CauchyRealizesRealModel rationalSystem absolute_value_data
```
-/
noncomputable abbrev satisfiesGeneric
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  CauchyRealizesRealModel rationalSystem absolute_value_data

end LRA.NumberSystems.RealNumbers.Cauchy
