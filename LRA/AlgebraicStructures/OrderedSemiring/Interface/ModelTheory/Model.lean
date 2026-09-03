import LRA.AlgebraicStructures.OrderedSemiring.Interface.ModelTheory.Theory
import LRA.AlgebraicStructures.OrderedSemiring.Interface.ModelTheory.LStructure
import LRA.Operation.Addition.Interface.ModelTheory.Model
import LRA.Operation.Multiplication.Interface.ModelTheory.Model

namespace LRA.AlgebraicStructures.OrderedSemiring.Interface.ModelTheory

open LRA.Operation.Addition.Interface.ModelTheory (AdditionModel)
open LRA.Operation.Multiplication.Interface.ModelTheory (MultiplicationModel)

universe u

/-- Promoted ordered-semiring model packaging the operator interfaces, order
surface, and ordered-semiring law bundle. -/
structure OrderedSemiringModel (Carrier : Type u) where
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [ltInst : LT Carrier]
  [leInst : LE Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  [laws : LRA.AlgebraicStructures.OrderedSemiringLaws Carrier]

/-- The ordered-semiring signature induced by a promoted ordered-semiring
model. -/
def OrderedSemiringModel.signature {Carrier : Type u}
    (model : OrderedSemiringModel Carrier) :
    OrderedSemiringSignature :=
  letI := model.addInst
  letI := model.mulInst
  letI := model.ltInst
  letI := model.leInst
  letI := model.zeroInst
  letI := model.oneInst
  letI := model.carrierNonempty
  { carrier := Carrier
    zero := 0
    one := 1
    add := model.addition.realization.spec.add
    multiply := model.multiplication.realization.spec.mul
    le := (· ≤ ·)
    StrictOrder := (· < ·) }

/-- The first-order model induced by a promoted ordered-semiring model. -/
def OrderedSemiringModel.firstOrderModel {Carrier : Type u}
    (model : OrderedSemiringModel Carrier) :
    LRA.ModelTheory.FirstOrder.Model
      LRA.AlgebraicStructures.OrderedSemiring.Interface.Signature.OrderedSemiringFirstOrderSignature :=
  BuildOrderedSemiringModel model.signature

end LRA.AlgebraicStructures.OrderedSemiring.Interface.ModelTheory
