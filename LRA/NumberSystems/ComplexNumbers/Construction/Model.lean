-- LRA/NumberSystems/ComplexNumbers/Construction/Model.lean
-- Complex numbers as a Volume I first-order algebraic model.

import LRA.AlgebraicStructures.Field.Interface.Signature.Definition
import LRA.AlgebraicStructures.Field.Interface.ModelTheory.Model
import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs

namespace LRA.NumberSystems.ComplexNumbers.Construction

open LRA.AlgebraicStructures.Field.Interface.Signature
open LRA.AlgebraicStructures.Field.Interface.ModelTheory
open LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs

universe u

/-!
Volume II label: complex-number-model
Lean module: LRA.NumberSystems.ComplexNumbers.Construction.Model
Verification status: checked definitions

Moved from `LRA.VolumeII.ComplexNumbers.Construction.Model`, content
unchanged except that `ComplexNumber` now resolves via
`LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs` (the
migrated pipeline) rather than the old
`LRA.VolumeII.ComplexNumbers.Construction.Construction`/nested
`ComplexNumber` namespace. Like Rational's and Real's
`Construction/Model.lean`, there is no switch here -- `complexNumbersModel`
takes its carrier `R` as an explicit parameter.

`ComplexNumber R` carries `Add`, `Mul`, `Neg`, `Inv`, and numerals as
instances, so the generic field builder applies directly — no
hand-assembled operation bundle, and the totalized inverse is the `Inv`
instance itself.
-/

/-- The complex numbers over any field-ready carrier as a first-order
model of the field language.

Logical form:

```lean
def complexNumbersModel (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model FieldFirstOrderSignature :=
  fieldFirstOrderModel (ComplexNumber R)
```
-/
def complexNumbersModel (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model FieldFirstOrderSignature :=
  fieldFirstOrderModel (ComplexNumber R)

/-- The complex numbers over Mathlib's reals, as the default complex
first-order model.

Logical form:

```lean
noncomputable def complexNumbersOverMathlibReals :
    LRA.Logic.FirstOrder.Model FieldFirstOrderSignature :=
  complexNumbersModel Real
```
-/
noncomputable def complexNumbersOverMathlibReals :
    LRA.Logic.FirstOrder.Model FieldFirstOrderSignature :=
  complexNumbersModel Real

end LRA.NumberSystems.ComplexNumbers.Construction
