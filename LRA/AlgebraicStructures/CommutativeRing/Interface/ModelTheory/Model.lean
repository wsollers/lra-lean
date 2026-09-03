import LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory.Theory
import LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory.LStructure
import LRA.AlgebraicStructures.Ring.Interface.ModelTheory.Model
import LRA.Operation.Addition.Interface.ModelTheory.Model
import LRA.Operation.Multiplication.Interface.ModelTheory.Model

namespace LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory

open LRA.Operation.Addition.Interface.ModelTheory (AdditionModel)
open LRA.Operation.Multiplication.Interface.ModelTheory (MultiplicationModel)

universe u

/-- Promoted commutative-ring model packaging the additive and multiplicative
operator interfaces together with the commutative-ring law bundle. -/
structure CommutativeRingModel (Carrier : Type u) where
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [negInst : Neg Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  [laws : LRA.AlgebraicStructures.CommutativeRingLaws Carrier]

/-- The commutative-ring concept signature induced by a promoted model. -/
def CommutativeRingModel.signature {Carrier : Type u}
    (model : CommutativeRingModel Carrier) :
    CommutativeRingSignature :=
  letI := model.addInst
  letI := model.mulInst
  letI := model.negInst
  letI := model.zeroInst
  letI := model.oneInst
  letI := model.carrierNonempty
  { carrier := Carrier
    zero := 0
    one := 1
    add := model.addition.realization.spec.add
    neg := (- ·)
    multiply := model.multiplication.realization.spec.mul }

/-- The first-order model induced by a promoted commutative-ring model. -/
def CommutativeRingModel.firstOrderModel {Carrier : Type u}
    (model : CommutativeRingModel Carrier) :
    LRA.ModelTheory.FirstOrder.Model
      LRA.AlgebraicStructures.CommutativeRing.Interface.Signature.CommutativeRingFirstOrderSignature :=
  BuildCommutativeRingModel model.signature

/-- Forget a commutative-ring model down to its ring reduct. -/
def CommutativeRingModel.toRingModel {Carrier : Type u}
    (model : CommutativeRingModel Carrier) :
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

end LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory
