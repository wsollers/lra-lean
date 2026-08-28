import LRA.NumberSystems.RealNumbers.Constructions.Cantor.Instances

namespace LRA.NumberSystems.RealNumbers.Cantor

open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

/-- The Cantor (Cauchy-sequences-of-rationals-modulo-null) construction
satisfies the generic ℝ interface: for any rational field model, the
quotient carrier is a `RealModel`.

Logical form:

```lean
noncomputable abbrev satisfiesGeneric (fieldModel : RationalModel) :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  CantorRealizesRealModel fieldModel
```
-/
noncomputable abbrev satisfiesGeneric (fieldModel : RationalModel) :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  CantorRealizesRealModel fieldModel

end LRA.NumberSystems.RealNumbers.Cantor
