import LRA.NumberSystems.RealNumbers.Constructions.EffectiveCauchy.Instances

namespace LRA.NumberSystems.RealNumbers.EffectiveCauchy

open LRA.NumberSystems.RealNumbers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers

/--
`satisfiesGeneric` The effective-Cauchy-sequence construction satisfies the generic ℝ interface: for any rational number system, the quotient-of-effective-Cauchy- sequences carrier is a `RealModel`.

Predicate logic:

  noncomputable abbrev satisfiesGeneric (rationalSystem : RationalNumberSystem) :
      LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
    EffectiveCauchyRealizesRealModel rationalSystem

Predicate logic (unfolded):

  noncomputable abbrev satisfiesGeneric (rationalSystem : RationalNumberSystem) :
      LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
    EffectiveCauchyRealizesRealModel rationalSystem (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable abbrev satisfiesGeneric (rationalSystem : RationalNumberSystem) :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  EffectiveCauchyRealizesRealModel rationalSystem
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
noncomputable abbrev satisfiesGeneric (rationalSystem : RationalNumberSystem) :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  EffectiveCauchyRealizesRealModel rationalSystem

end LRA.NumberSystems.RealNumbers.EffectiveCauchy
