import LRA.NumberSystems.RealNumbers.Constructions.Cantor.Instances

namespace LRA.NumberSystems.RealNumbers.Cantor

open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

/--
`satisfiesGeneric` The Cantor (Cauchy-sequences-of-rationals-modulo-null) construction satisfies the generic ℝ interface: for any rational field model, the quotient carrier is a `RealModel`.

Predicate logic:

  noncomputable abbrev satisfiesGeneric (fieldModel : RationalModel) :
      LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
    CantorRealizesRealModel fieldModel

Predicate logic (unfolded):

  noncomputable abbrev satisfiesGeneric (fieldModel : RationalModel) :
      LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
    CantorRealizesRealModel fieldModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable abbrev satisfiesGeneric (fieldModel : RationalModel) :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  CantorRealizesRealModel fieldModel
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
noncomputable abbrev satisfiesGeneric (fieldModel : RationalModel) :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  CantorRealizesRealModel fieldModel

end LRA.NumberSystems.RealNumbers.Cantor
