import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.Instances

namespace LRA.NumberSystems.RealNumbers.Dyadic

open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

/--
`genericModel` The dyadic-expansion construction satisfies the generic ℝ interface: for any rational-dyadic-approximation data, `DyadicRealizesRationalRealExtension` gives a real extension whose model is the one built from `Expansion` — this backend does not yet build that extension concretely (the existence proof is `sorry`-bodied), so `satisfiesGeneric` is only as good as that proof.

Predicate logic:

  noncomputable def genericModel (dyadicData : RationalDyadicApproximationData) :
      RealModel :=
    (DyadicRealizesRationalRealExtension dyadicData).choose.RealModel

Predicate logic (unfolded):

  noncomputable def genericModel (dyadicData : RationalDyadicApproximationData) :
      RealModel :=
    (DyadicRealizesRationalRealExtension dyadicData).choose.RealModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def genericModel (dyadicData : RationalDyadicApproximationData) :
    RealModel :=
  (DyadicRealizesRationalRealExtension dyadicData).choose.RealModel
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
noncomputable def genericModel (dyadicData : RationalDyadicApproximationData) :
    RealModel :=
  (DyadicRealizesRationalRealExtension dyadicData).choose.RealModel

/--
`satisfiesGeneric` TODO

Predicate logic:

  noncomputable abbrev satisfiesGeneric
      (dyadicData : RationalDyadicApproximationData) : RealModel :=
    genericModel dyadicData

Predicate logic (unfolded):

  noncomputable abbrev satisfiesGeneric
      (dyadicData : RationalDyadicApproximationData) : RealModel :=
    genericModel dyadicData (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable abbrev satisfiesGeneric
    (dyadicData : RationalDyadicApproximationData) : RealModel :=
  genericModel dyadicData
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
noncomputable abbrev satisfiesGeneric
    (dyadicData : RationalDyadicApproximationData) : RealModel :=
  genericModel dyadicData

end LRA.NumberSystems.RealNumbers.Dyadic
