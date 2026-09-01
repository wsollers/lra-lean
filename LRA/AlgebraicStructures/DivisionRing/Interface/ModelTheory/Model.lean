import LRA.AlgebraicStructures.DivisionRing.Interface.ModelTheory.Theory
import LRA.AlgebraicStructures.DivisionRing.Interface.ModelTheory.LStructure
import LRA.AlgebraicStructures.Ring.Interface.ModelTheory.Model
import LRA.Operation.Addition.Interface.ModelTheory.Model
import LRA.Operation.Multiplication.Interface.ModelTheory.Model

namespace LRA.AlgebraicStructures.DivisionRing.Interface.ModelTheory

open LRA.Operation.Addition.Interface.ModelTheory (AdditionModel)
open LRA.Operation.Multiplication.Interface.ModelTheory (MultiplicationModel)

universe u

/-- Promoted division-ring model packaging the additive and multiplicative
operator interfaces together with the division-ring law bundle. -/
structure DivisionRingModel (Carrier : Type u) where
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [negInst : Neg Carrier]
  [invInst : Inv Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  [laws : LRA.AlgebraicStructures.DivisionRingLaws Carrier]

/-- The division-ring concept signature induced by a promoted model. -/
def DivisionRingModel.signature {Carrier : Type u}
    (model : DivisionRingModel Carrier) :
    LRA.AlgebraicStructures.DivisionRingConceptSignature :=
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

/-- The first-order model induced by a promoted division-ring model. -/
def DivisionRingModel.firstOrderModel {Carrier : Type u}
    (model : DivisionRingModel Carrier) :
    LRA.Logic.FirstOrder.Model
      LRA.AlgebraicStructures.DivisionRing.Interface.Signature.DivisionRingFirstOrderSignature :=
  BuildDivisionRingModel model.signature

/-- Forget a division-ring model down to its ring reduct. -/
def DivisionRingModel.toRingModel {Carrier : Type u}
    (model : DivisionRingModel Carrier) :
    LRA.AlgebraicStructures.Ring.Interface.ModelTheory.RingModel Carrier :=
  letI := model.addInst
  letI := model.mulInst
  letI := model.negInst
  letI := model.zeroInst
  letI := model.oneInst
  letI := model.carrierNonempty
  letI := model.laws
  { addInst := model.addInst
    mulInst := model.mulInst
    negInst := model.negInst
    zeroInst := model.zeroInst
    oneInst := model.oneInst
    carrierNonempty := model.carrierNonempty
    addition := model.addition
    multiplication := model.multiplication
    laws := inferInstance }

end LRA.AlgebraicStructures.DivisionRing.Interface.ModelTheory
