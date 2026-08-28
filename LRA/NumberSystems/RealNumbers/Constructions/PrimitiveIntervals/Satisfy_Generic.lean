import LRA.NumberSystems.RealNumbers.Constructions.PrimitiveIntervals.Instances

namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervals

open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

/-- The primitive-nested-intervals construction satisfies the generic ℝ
interface: for any rational field model, the interval-quotient carrier is a
`RealModel`.

Logical form:

```lean
noncomputable abbrev satisfiesGeneric (rational_model : RationalModel) :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  PrimitiveIntervalsRealizesRealModel rational_model
```
-/
noncomputable abbrev satisfiesGeneric (rational_model : RationalModel) :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  PrimitiveIntervalsRealizesRealModel rational_model

end LRA.NumberSystems.RealNumbers.PrimitiveIntervals
