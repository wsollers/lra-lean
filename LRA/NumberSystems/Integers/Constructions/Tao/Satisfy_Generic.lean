import LRA.NumberSystems.Integers.Constructions.Tao.Instances

namespace LRA.NumberSystems.Integers.Tao

open LRA.NumberSystems.Integers.Interface.ModelTheory

/-- The Tao (formal-differences) construction satisfies the generic ℤ
interface: for any whole-number arithmetic data,
`TaoRealizesIntegerNumberSystem` gives an integer number system whose model
has the right carrier — this backend does not yet build that model
concretely (the existence proof is `sorry`-bodied), so `satisfiesGeneric` is
only as good as that proof.

Logical form:

```lean
noncomputable def genericModel
    (wholeData : WholeNumberArithmeticForTaoFormalDifferences) :
    IntegerModel :=
  (TaoRealizesIntegerNumberSystem wholeData).choose.Model
```
-/
noncomputable def genericModel
    (wholeData : WholeNumberArithmeticForTaoFormalDifferences) :
    IntegerModel :=
  (TaoRealizesIntegerNumberSystem wholeData).choose.Model

noncomputable abbrev satisfiesGeneric
    (wholeData : WholeNumberArithmeticForTaoFormalDifferences) :
    IntegerModel :=
  genericModel wholeData

end LRA.NumberSystems.Integers.Tao
