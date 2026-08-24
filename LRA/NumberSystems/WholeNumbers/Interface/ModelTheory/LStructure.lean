import LRA.NumberSystems.WholeNumbers.Interface.Signature.Definition
import LRA.AlgebraicStructures.OrderedSemiring.Interface.ModelTheory.Model
import LRA.NumberSystems.WholeNumbers.Constructions.Landau.Instances

namespace LRA.NumberSystems.WholeNumbers.Interface.ModelTheory

open LRA.NumberSystems.WholeNumbers.Interface.Signature
open LRA.AlgebraicStructures.OrderedSemiring.Interface.ModelTheory
open LRA.NumberSystems.WholeNumbers.Constructions.Landau

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`wholeNumbersModel` TODO

Predicate logic:

  noncomputable def wholeNumbersModel
    (natural_data : NaturalArithmeticForWholeNumbers Element SetObject) :
    LRA.Logic.FirstOrder.Model WholeNumbersFirstOrderSignature :=
  letI := zeroOn natural_data
  letI := oneOn natural_data
  letI := addOn natural_data
  letI := mulOn natural_data
  letI := ltOn natural_data
  letI := leOn natural_data
  orderedSemiringFirstOrderModel (Carrier natural_data)

Predicate logic (unfolded):

  noncomputable def wholeNumbersModel
    (natural_data : NaturalArithmeticForWholeNumbers Element SetObject) :
    LRA.Logic.FirstOrder.Model WholeNumbersFirstOrderSignature :=
  letI := zeroOn natural_data
  letI := oneOn natural_data
  letI := addOn natural_data
  letI := mulOn natural_data
  letI := ltOn natural_data
  letI := leOn natural_data
  orderedSemiringFirstOrderModel (Carrier natural_data) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def wholeNumbersModel
    (natural_data : NaturalArithmeticForWholeNumbers Element SetObject) :
    LRA.Logic.FirstOrder.Model WholeNumbersFirstOrderSignature :=
  letI := zeroOn natural_data
  letI := oneOn natural_data
  letI := addOn natural_data
  letI := mulOn natural_data
  letI := ltOn natural_data
  letI := leOn natural_data
  orderedSemiringFirstOrderModel (Carrier natural_data)
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
noncomputable def wholeNumbersModel
    (natural_data : NaturalArithmeticForWholeNumbers Element SetObject) :
    LRA.Logic.FirstOrder.Model WholeNumbersFirstOrderSignature :=
  letI := zeroOn natural_data
  letI := oneOn natural_data
  letI := addOn natural_data
  letI := mulOn natural_data
  letI := ltOn natural_data
  letI := leOn natural_data
  orderedSemiringFirstOrderModel (Carrier natural_data)

end LRA.NumberSystems.WholeNumbers.Interface.ModelTheory
