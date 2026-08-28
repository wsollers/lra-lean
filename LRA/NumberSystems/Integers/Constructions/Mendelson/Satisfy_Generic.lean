import LRA.NumberSystems.Integers.Constructions.Mendelson.Instances

namespace LRA.NumberSystems.Integers.Mendelson

open LRA.NumberSystems.Integers.Interface.ModelTheory

/-- The Mendelson (positive-natural-pair) construction satisfies the generic
ℤ interface: for any positive-natural-pair data,
`MendelsonRealizesIntegerNumberSystem` gives an integer number system whose
model has the right carrier — this backend does not yet build that model
concretely (the existence proof is `sorry`-bodied), so `satisfiesGeneric` is
only as good as that proof.

Logical form:

```lean
noncomputable def genericModel (positiveData : PositiveNaturalPairData) :
    IntegerModel :=
  (MendelsonRealizesIntegerNumberSystem positiveData).choose.Model
```
-/
noncomputable def genericModel (positiveData : PositiveNaturalPairData) :
    IntegerModel :=
  (MendelsonRealizesIntegerNumberSystem positiveData).choose.Model

noncomputable abbrev satisfiesGeneric
    (positiveData : PositiveNaturalPairData) : IntegerModel :=
  genericModel positiveData

end LRA.NumberSystems.Integers.Mendelson
