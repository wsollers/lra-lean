import LRA.NumberSystems.Integers.Constructions.Tao.Instances

namespace LRA.NumberSystems.Integers.Tao

open LRA.NumberSystems.Integers.Interface.ModelTheory

/--
`genericModel` The Tao (formal-differences) construction satisfies the generic ℤ interface: for any whole-number arithmetic data, `TaoRealizesIntegerNumberSystem` gives an integer number system whose model has the right carrier — this backend does not yet build that model concretely (the existence proof is `sorry`-bodied), so `satisfiesGeneric` is only as good as that proof.

Predicate logic:

  noncomputable def genericModel
      (wholeData : WholeNumberArithmeticForTaoFormalDifferences) :
      IntegerModel :=
    (TaoRealizesIntegerNumberSystem wholeData).choose.Model

Predicate logic (unfolded):

  noncomputable def genericModel
      (wholeData : WholeNumberArithmeticForTaoFormalDifferences) :
      IntegerModel :=
    (TaoRealizesIntegerNumberSystem wholeData).choose.Model (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def genericModel
    (wholeData : WholeNumberArithmeticForTaoFormalDifferences) :
    IntegerModel :=
  (TaoRealizesIntegerNumberSystem wholeData).choose.Model
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
noncomputable def genericModel
    (wholeData : WholeNumberArithmeticForTaoFormalDifferences) :
    IntegerModel :=
  (TaoRealizesIntegerNumberSystem wholeData).choose.Model

/--
`satisfiesGeneric` TODO

Predicate logic:

  noncomputable abbrev satisfiesGeneric
      (wholeData : WholeNumberArithmeticForTaoFormalDifferences) :
      IntegerModel :=
    genericModel wholeData

Predicate logic (unfolded):

  noncomputable abbrev satisfiesGeneric
      (wholeData : WholeNumberArithmeticForTaoFormalDifferences) :
      IntegerModel :=
    genericModel wholeData (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable abbrev satisfiesGeneric
    (wholeData : WholeNumberArithmeticForTaoFormalDifferences) :
    IntegerModel :=
  genericModel wholeData
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
    (wholeData : WholeNumberArithmeticForTaoFormalDifferences) :
    IntegerModel :=
  genericModel wholeData

end LRA.NumberSystems.Integers.Tao
