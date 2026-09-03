import LRA.AlgebraicStructures.Ring.Interface.ModelTheory.Theory
import LRA.AlgebraicStructures.Ring.Interface.ModelTheory.LStructure
import LRA.Operation.Addition.Interface.ModelTheory.Model
import LRA.Operation.Multiplication.Interface.ModelTheory.Model

namespace LRA.AlgebraicStructures.Ring.Interface.ModelTheory

open LRA.Operation.Addition.Interface.ModelTheory (AdditionModel)
open LRA.Operation.Multiplication.Interface.ModelTheory (MultiplicationModel)

universe u

/-- Promoted ring model packaging the additive and multiplicative operator
interfaces together with the ring law bundle. -/
structure RingModel (Carrier : Type u) where
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [negInst : Neg Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  [laws : LRA.AlgebraicStructures.RingLaws Carrier]

/-- The ring concept signature induced by a promoted ring model. -/
def RingModel.signature {Carrier : Type u}
    (model : RingModel Carrier) :
    LRA.AlgebraicStructures.RingConceptSignature :=
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

/-- The first-order model induced by a promoted ring model. -/
def RingModel.firstOrderModel {Carrier : Type u}
    (model : RingModel Carrier) :
    LRA.ModelTheory.FirstOrder.Model
      LRA.AlgebraicStructures.Ring.Interface.Signature.RingFirstOrderSignature :=
  BuildRingModel model.signature

end LRA.AlgebraicStructures.Ring.Interface.ModelTheory
