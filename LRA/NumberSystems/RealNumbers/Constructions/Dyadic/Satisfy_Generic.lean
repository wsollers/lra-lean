import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.Instances

namespace LRA.NumberSystems.RealNumbers.Dyadic

open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

/-- The dyadic-expansion construction satisfies the generic ℝ interface: for
any rational-dyadic-approximation data, `DyadicRealizesRationalRealExtension`
gives a real extension whose model is the one built from `Expansion` — this
backend does not yet build that extension concretely (the existence proof is
`sorry`-bodied), so `satisfiesGeneric` is only as good as that proof.

Logical form:

```lean
noncomputable def genericModel (dyadicData : RationalDyadicApproximationData) :
    RealModel :=
  (DyadicRealizesRationalRealExtension dyadicData).choose.RealModel
```
-/
noncomputable def genericModel (dyadicData : RationalDyadicApproximationData) :
    RealModel :=
  (DyadicRealizesRationalRealExtension dyadicData).choose.RealModel

noncomputable abbrev satisfiesGeneric
    (dyadicData : RationalDyadicApproximationData) : RealModel :=
  genericModel dyadicData

end LRA.NumberSystems.RealNumbers.Dyadic
