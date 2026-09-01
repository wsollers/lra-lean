import LRA.AlgebraicStructures.Field.Interface.ModelTheory.Theory
import LRA.AlgebraicStructures.Field.Interface.ModelTheory.LStructure
import LRA.AlgebraicStructures.DivisionRing.Interface.ModelTheory.Model
import LRA.Operation.Addition.Interface.ModelTheory.Model
import LRA.Operation.Multiplication.Interface.ModelTheory.Model

namespace LRA.AlgebraicStructures.Field.Interface.ModelTheory

open LRA.Operation.Addition.Interface.ModelTheory (AdditionModel)
open LRA.Operation.Multiplication.Interface.ModelTheory (MultiplicationModel)

universe u

/-- Promoted field model packaging the additive and multiplicative operator
interfaces together with the field law bundle. -/
structure FieldModel (Carrier : Type u) where
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [negInst : Neg Carrier]
  [invInst : Inv Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  [laws : LRA.AlgebraicStructures.FieldLaws Carrier]

/-- The field concept signature induced by a promoted model. -/
def FieldModel.signature {Carrier : Type u}
    (model : FieldModel Carrier) :
    LRA.AlgebraicStructures.FieldConceptSignature :=
  letI := model.addInst
  letI := model.mulInst
  letI := model.negInst
  letI := model.invInst
  letI := model.zeroInst
  letI := model.oneInst
  letI := model.carrierNonempty
  { carrier := Carrier
    zero := 0
    one := 1
    add := model.addition.realization.spec.add
    neg := (- ·)
    multiply := model.multiplication.realization.spec.mul
    inv := (·⁻¹) }

/-- The first-order model induced by a promoted field model. -/
def FieldModel.firstOrderModel {Carrier : Type u}
    (model : FieldModel Carrier) :
    LRA.Logic.FirstOrder.Model
      LRA.AlgebraicStructures.Field.Interface.Signature.FieldFirstOrderSignature :=
  BuildFieldModel model.signature

/-- Forget a field model down to its division-ring reduct. -/
def FieldModel.toDivisionRingModel {Carrier : Type u}
    (model : FieldModel Carrier) :
    LRA.AlgebraicStructures.DivisionRing.Interface.ModelTheory.DivisionRingModel Carrier :=
  letI := model.addInst
  letI := model.mulInst
  letI := model.negInst
  letI := model.invInst
  letI := model.zeroInst
  letI := model.oneInst
  letI := model.carrierNonempty
  letI := model.laws
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

end LRA.AlgebraicStructures.Field.Interface.ModelTheory
