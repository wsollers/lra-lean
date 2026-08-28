import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.Instances

namespace LRA.NumberSystems.RealNumbers.Dedekind

open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

/-- The Dedekind-cut construction satisfies the generic ℝ interface: for any
rational field model, the cut carrier is a `RealModel`.

Logical form:

```lean
noncomputable abbrev satisfiesGeneric (rational_model : RationalModel) :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  DedekindRealizesRealModel rational_model
```
-/
noncomputable abbrev satisfiesGeneric (rational_model : RationalModel) :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  DedekindRealizesRealModel rational_model

end LRA.NumberSystems.RealNumbers.Dedekind
