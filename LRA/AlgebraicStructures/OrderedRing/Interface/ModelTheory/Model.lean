import LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory.Theory
import LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory.LStructure
import LRA.AlgebraicStructures.Ring.Interface.ModelTheory.Model
import LRA.Operation.Addition.Interface.ModelTheory.Model
import LRA.Operation.Multiplication.Interface.ModelTheory.Model

namespace LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory

open LRA.Operation.Addition.Interface.ModelTheory (AdditionModel)
open LRA.Operation.Multiplication.Interface.ModelTheory (MultiplicationModel)

universe u

/-- Promoted ordered-ring model packaging the additive and multiplicative
operator interfaces, order surface, and ordered-ring law bundle. -/
structure OrderedRingModel (Carrier : Type u) where
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [negInst : Neg Carrier]
  [ltInst : LT Carrier]
  [leInst : LE Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  [laws : LRA.AlgebraicStructures.OrderedRingLaws Carrier]

/-- The ordered-ring signature induced by a promoted ordered-ring model. -/
def OrderedRingModel.signature {Carrier : Type u}
    (model : OrderedRingModel Carrier) :
    OrderedRingSignature :=
  letI := model.addInst
  letI := model.mulInst
  letI := model.negInst
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
    le := (· ≤ ·)
    StrictOrder := (· < ·) }

/-- The first-order model induced by a promoted ordered-ring model. -/
def OrderedRingModel.firstOrderModel {Carrier : Type u}
    (model : OrderedRingModel Carrier) :
    LRA.Logic.FirstOrder.Model
      LRA.AlgebraicStructures.OrderedRing.Interface.Signature.OrderedRingFirstOrderSignature :=
  BuildOrderedRingModel model.signature

/-- Forget an ordered-ring model down to its ring reduct. -/
def OrderedRingModel.toRingModel {Carrier : Type u}
    (model : OrderedRingModel Carrier) :
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

end LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory
