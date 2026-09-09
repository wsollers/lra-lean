import LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.Model
import LRA.NumberSystems.RationalNumbers.Interface.Signature.Definition
import LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.Model

namespace LRA.NumberSystems.RationalNumbers.Interface.ModelTheory

open LRA.NumberSystems.RationalNumbers.Interface.Signature
open LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory

/--
`rationalNumbersModel` The first-order model of `RationalNumbersFirstOrderSignature` induced by a `RationalModel`'s own signature.

Predicate logic:

  def rationalNumbersModel (rational_model : RationalModel) :
      LRA.ModelTheory.FirstOrder.Model RationalNumbersFirstOrderSignature :=
    BuildOrderedFieldModel rational_model.signature

Predicate logic (unfolded):

  def rationalNumbersModel (rational_model : RationalModel) :
      LRA.ModelTheory.FirstOrder.Model RationalNumbersFirstOrderSignature :=
    BuildOrderedFieldModel rational_model.signature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def rationalNumbersModel (rational_model : RationalModel) :
    LRA.ModelTheory.FirstOrder.Model RationalNumbersFirstOrderSignature :=
  BuildOrderedFieldModel rational_model.signature
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
def rationalNumbersModel (rational_model : RationalModel) :
    LRA.ModelTheory.FirstOrder.Model RationalNumbersFirstOrderSignature :=
  BuildOrderedFieldModel rational_model.signature

end LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
