import LRA.AlgebraicStructures.OrderedGroup.Interface.ModelTheory.Theory
import LRA.AlgebraicStructures.OrderedGroup.Interface.ModelTheory.LStructure
import LRA.AlgebraicStructures.OrderedGroup.Interface.Laws.Definition
import LRA.Operation.Multiplication.Interface.ModelTheory.Model

namespace LRA.AlgebraicStructures.OrderedGroup.Interface.ModelTheory

open LRA.Operation.Multiplication.Interface.ModelTheory (MultiplicationModel)

universe u

/-- Promoted ordered-group model packaging the multiplicative operator
interface, order surface, and ordered-group law bundle. -/
structure OrderedGroupModel (Carrier : Type u) where
  [mulInst : Mul Carrier]
  [invInst : Inv Carrier]
  [ltInst : LT Carrier]
  [leInst : LE Carrier]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  multiplication : MultiplicationModel Carrier
  [laws : LRA.AlgebraicStructures.OrderedGroupLaws Carrier]

/-- The ordered-group signature induced by a promoted ordered-group model. -/
def OrderedGroupModel.signature {Carrier : Type u}
    (model : OrderedGroupModel Carrier) :
    OrderedGroupSignature :=
  letI := model.mulInst
  letI := model.invInst
  letI := model.ltInst
  letI := model.leInst
  letI := model.oneInst
  letI := model.carrierNonempty
  { carrier := Carrier
    one := 1
    multiply := model.multiplication.realization.spec.mul
    inverse := (·⁻¹)
    StrictOrder := (· < ·)
    NonstrictOrder := (· ≤ ·) }

/-- The first-order model induced by a promoted ordered-group model. -/
def OrderedGroupModel.firstOrderModel {Carrier : Type u}
    (model : OrderedGroupModel Carrier) :
    LRA.Logic.FirstOrder.Model
      LRA.AlgebraicStructures.OrderedGroup.Interface.Signature.OrderedGroupFirstOrderSignature :=
  BuildOrderedGroupModel model.signature

end LRA.AlgebraicStructures.OrderedGroup.Interface.ModelTheory
