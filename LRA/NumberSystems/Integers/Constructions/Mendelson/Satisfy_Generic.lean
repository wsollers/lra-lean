import LRA.NumberSystems.Integers.Constructions.Mendelson.Instances

namespace LRA.NumberSystems.Integers.Mendelson

open LRA.NumberSystems.Integers.Interface.ModelTheory

/--
`genericModel` The Mendelson (positive-natural-pair) construction satisfies the generic ℤ interface: for any positive-natural-pair data, `MendelsonRealizesIntegerNumberSystem` gives an integer number system whose model has the right carrier — this backend does not yet build that model concretely (the existence proof is `sorry`-bodied), so `satisfiesGeneric` is only as good as that proof.

Predicate logic:

  noncomputable def genericModel (positiveData : PositiveNaturalPairData) :
      IntegerModel :=
    (MendelsonRealizesIntegerNumberSystem positiveData).choose.Model

Predicate logic (unfolded):

  noncomputable def genericModel (positiveData : PositiveNaturalPairData) :
      IntegerModel :=
    (MendelsonRealizesIntegerNumberSystem positiveData).choose.Model (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def genericModel (positiveData : PositiveNaturalPairData) :
    IntegerModel :=
  (MendelsonRealizesIntegerNumberSystem positiveData).choose.Model
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
noncomputable def genericModel (positiveData : PositiveNaturalPairData) :
    IntegerModel :=
  (MendelsonRealizesIntegerNumberSystem positiveData).choose.Model

/--
`satisfiesGeneric` TODO

Predicate logic:

  noncomputable abbrev satisfiesGeneric
      (positiveData : PositiveNaturalPairData) : IntegerModel :=
    genericModel positiveData

Predicate logic (unfolded):

  noncomputable abbrev satisfiesGeneric
      (positiveData : PositiveNaturalPairData) : IntegerModel :=
    genericModel positiveData (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable abbrev satisfiesGeneric
    (positiveData : PositiveNaturalPairData) : IntegerModel :=
  genericModel positiveData
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
    (positiveData : PositiveNaturalPairData) : IntegerModel :=
  genericModel positiveData

end LRA.NumberSystems.Integers.Mendelson
