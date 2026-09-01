import LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.Theory
import LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.LStructure
import LRA.AlgebraicStructures.OrderedField.Interface.Laws.Definition
import LRA.AlgebraicStructures.Field.Interface.ModelTheory.Model
import LRA.Operation.Addition.Interface.ModelTheory.Model
import LRA.Operation.Multiplication.Interface.ModelTheory.Model

namespace LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory

open LRA.Operation.Addition.Interface.ModelTheory (AdditionModel)
open LRA.Operation.Multiplication.Interface.ModelTheory (MultiplicationModel)

universe u

/-- Promoted ordered-field model packaging the additive and multiplicative
operator interfaces, order surface, and ordered-field law bundle. -/
structure OrderedFieldModel (Carrier : Type u) where
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [negInst : Neg Carrier]
  [invInst : Inv Carrier]
  [ltInst : LT Carrier]
  [leInst : LE Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  [laws : LRA.AlgebraicStructures.OrderedFieldLaws Carrier]

/-- The ordered-field signature induced by a promoted ordered-field model. -/
def OrderedFieldModel.signature {Carrier : Type u}
    (model : OrderedFieldModel Carrier) :
    OrderedFieldSignature :=
  letI := model.addInst
  letI := model.mulInst
  letI := model.negInst
  letI := model.invInst
  letI := model.ltInst
  letI := model.leInst
  letI := model.zeroInst
  letI := model.oneInst
  letI := model.carrierNonempty
  { carrier := Carrier
    zero := 0
    one := 1
    add := model.addition.realization.spec.add
    neg := (- ·)
    multiply := model.multiplication.realization.spec.mul
    inv := (·⁻¹)
    le := (· ≤ ·)
    StrictOrder := (· < ·) }

/-- The first-order model induced by a promoted ordered-field model. -/
def OrderedFieldModel.firstOrderModel {Carrier : Type u}
    (model : OrderedFieldModel Carrier) :
    LRA.Logic.FirstOrder.Model
      LRA.AlgebraicStructures.OrderedField.Interface.Signature.OrderedFieldFirstOrderSignature :=
  BuildOrderedFieldModel model.signature

/-- Forget an ordered-field model down to its field reduct. -/
def OrderedFieldModel.toFieldModel {Carrier : Type u}
    (model : OrderedFieldModel Carrier) :
    LRA.AlgebraicStructures.Field.Interface.ModelTheory.FieldModel Carrier :=
  letI := model.addInst
  letI := model.mulInst
  letI := model.negInst
  letI := model.invInst
  letI := model.zeroInst
  letI := model.oneInst
  letI := model.carrierNonempty
  letI := model.laws
  letI : LRA.AlgebraicStructures.FieldLaws Carrier := inferInstance
  { addInst := model.addInst
    mulInst := model.mulInst
    negInst := model.negInst
    invInst := model.invInst
    zeroInst := model.zeroInst
    oneInst := model.oneInst
    carrierNonempty := model.carrierNonempty
    addition := model.addition
    multiplication := model.multiplication
    laws := inferInstance }

end LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory
