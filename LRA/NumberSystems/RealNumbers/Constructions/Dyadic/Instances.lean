
import LRA.NumberSystems.RealNumbers.Interface.Definition
import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.Behavior

namespace LRA.NumberSystems.RealNumbers.Dyadic

open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

/--
`DyadicRealizesRationalRealExtension` TODO

Predicate logic:

  ∀ (dyadicData : LRA.NumberSystems.RealNumbers.Dyadic.RationalDyadicApproximationData), Exists fun realExtension => realExtension.RealModel.Carrier = LRA.NumberSystems.RealNumbers.Dyadic.Expansion

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    dyadicData : RationalDyadicApproximationData
  Prove
    Exists fun realExtension => realExtension.RealModel.1 = LRA.NumberSystems.RealNumbers.Dyadic.Expansion

Logical form (Lean):

```lean
theorem DyadicRealizesRationalRealExtension
    (dyadicData : RationalDyadicApproximationData) :
    ∃ realExtension :
        LRA.NumberSystems.RealNumbers.RationalRealExtension
          dyadicData.RationalSystem,
      realExtension.RealModel.Carrier = Expansion
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem DyadicRealizesRationalRealExtension
    (dyadicData : RationalDyadicApproximationData) :
    ∃ realExtension :
        LRA.NumberSystems.RealNumbers.RationalRealExtension
          dyadicData.RationalSystem,
      realExtension.RealModel.Carrier = Expansion := by
  sorry
end LRA.NumberSystems.RealNumbers.Dyadic
