import LRA.AlgebraicStructures.CompleteOrderedField.Interface.ModelTheory.Theory
import LRA.AlgebraicStructures.CompleteOrderedField.Interface.ModelTheory.LStructure
import LRA.AlgebraicStructures.CompleteOrderedField.Interface.Laws.Definition
import LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.Model
import LRA.Operation.Addition.Interface.ModelTheory.Model
import LRA.Operation.Multiplication.Interface.ModelTheory.Model

namespace LRA.AlgebraicStructures.CompleteOrderedField.Interface.ModelTheory

open LRA.Operation.Addition.Interface.ModelTheory (AdditionModel)
open LRA.Operation.Multiplication.Interface.ModelTheory (MultiplicationModel)

universe u v

/-- Promoted complete-ordered-field model packaging the additive and
multiplicative operator interfaces, order surface, and completeness witness
together with the complete-ordered-field law bundle. -/
structure CompleteOrderedFieldModel (Carrier : Type u) (SetObject : Type v) where
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [negInst : Neg Carrier]
  [invInst : Inv Carrier]
  [ltInst : LT Carrier]
  [leInst : LE Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [membershipInst : Membership Carrier SetObject]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  laws : LRA.AlgebraicStructures.CompleteOrderedFieldLaws Carrier SetObject

/-- The complete-ordered-field signature induced by a promoted model. -/
def CompleteOrderedFieldModel.signature {Carrier : Type u} {SetObject : Type v}
    (model : CompleteOrderedFieldModel Carrier SetObject) :
    CompleteOrderedFieldSignature :=
  letI := model.addInst
  letI := model.mulInst
  letI := model.negInst
  letI := model.invInst
  letI := model.ltInst
  letI := model.leInst
  letI := model.zeroInst
  letI := model.oneInst
  letI := model.membershipInst
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

/-- The first-order model induced by a promoted complete-ordered-field model. -/
def CompleteOrderedFieldModel.firstOrderModel
    {Carrier : Type u} {SetObject : Type v}
    (model : CompleteOrderedFieldModel Carrier SetObject) :
    LRA.ModelTheory.FirstOrder.Model
      LRA.AlgebraicStructures.CompleteOrderedField.Interface.Signature.CompleteOrderedFieldFirstOrderSignature :=
  BuildCompleteOrderedFieldFirstOrderReduct model.signature

/-- Forget a complete-ordered-field model down to its ordered-field reduct. -/
def CompleteOrderedFieldModel.toOrderedFieldModel
    {Carrier : Type u} {SetObject : Type v}
    (model : CompleteOrderedFieldModel Carrier SetObject) :
    LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.OrderedFieldModel Carrier :=
  letI := model.addInst
  letI := model.mulInst
  letI := model.negInst
  letI := model.invInst
  letI := model.ltInst
  letI := model.leInst
  letI := model.zeroInst
  letI := model.oneInst
  letI := model.carrierNonempty
  letI : LRA.AlgebraicStructures.OrderedFieldLaws Carrier := model.laws.1
  letI : LRA.AlgebraicStructures.OrderedFieldLaws Carrier := inferInstance
  { addInst := model.addInst
    mulInst := model.mulInst
    negInst := model.negInst
    invInst := model.invInst
    ltInst := model.ltInst
    leInst := model.leInst
    zeroInst := model.zeroInst
    oneInst := model.oneInst
    carrierNonempty := model.carrierNonempty
    addition := model.addition
    multiplication := model.multiplication
    laws := inferInstance }

end LRA.AlgebraicStructures.CompleteOrderedField.Interface.ModelTheory
