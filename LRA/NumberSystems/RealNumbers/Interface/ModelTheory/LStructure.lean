import LRA.NumberSystems.Interface.ModelTheory.Model
import LRA.NumberSystems.RealNumbers.Interface.Signature.Definition
import LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.Model

namespace LRA.NumberSystems.RealNumbers.Interface.ModelTheory

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.Signature
open LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory

/--
`realNumbersModel` TODO

Predicate logic:

  def realNumbersModel
    (real_model : RealModel) :
    LRA.Logic.FirstOrder.Model RealNumbersFirstOrderSignature :=
  BuildOrderedFieldModel real_model.signature

Predicate logic (unfolded):

  def realNumbersModel
    (real_model : RealModel) :
    LRA.Logic.FirstOrder.Model RealNumbersFirstOrderSignature :=
  BuildOrderedFieldModel real_model.signature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def realNumbersModel
    (real_model : RealModel) :
    LRA.Logic.FirstOrder.Model RealNumbersFirstOrderSignature :=
  BuildOrderedFieldModel real_model.signature
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
def realNumbersModel
    (real_model : RealModel) :
    LRA.Logic.FirstOrder.Model RealNumbersFirstOrderSignature :=
  BuildOrderedFieldModel real_model.signature

end LRA.NumberSystems.RealNumbers.Interface.ModelTheory
