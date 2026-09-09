import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.Instances

namespace LRA.NumberSystems.RealNumbers.Dedekind

open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

/--
`satisfiesGeneric` The Dedekind-cut construction satisfies the generic ℝ interface: for any rational field model, the cut carrier is a `RealModel`.

Predicate logic:

  noncomputable abbrev satisfiesGeneric (rational_model : RationalModel) :
      LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
    DedekindRealizesRealModel rational_model

Predicate logic (unfolded):

  noncomputable abbrev satisfiesGeneric (rational_model : RationalModel) :
      LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
    DedekindRealizesRealModel rational_model (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable abbrev satisfiesGeneric (rational_model : RationalModel) :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  DedekindRealizesRealModel rational_model
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
noncomputable abbrev satisfiesGeneric (rational_model : RationalModel) :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  DedekindRealizesRealModel rational_model

end LRA.NumberSystems.RealNumbers.Dedekind
