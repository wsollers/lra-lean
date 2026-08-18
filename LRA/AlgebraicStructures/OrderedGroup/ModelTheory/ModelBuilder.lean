import LRA.AlgebraicStructures.OrderedGroup.ModelTheory.FirstOrderSignature
import LRA.Operation
import LRA.Relation

namespace LRA.AlgebraicStructures.OrderedGroup.ModelTheory

universe u

/-! Law-free model builders for the first-order ordered-group language. -/

structure OrderedGroupSignature where
  carrier : Type u
  one : LRA.Operation.NullaryOperation carrier
  multiplication : LRA.Operation.BinaryOperation carrier
  inverse : LRA.Operation.UnaryOperation carrier
  StrictOrder : LRA.Relation.Endorelation carrier
  NonstrictOrder : LRA.Relation.Endorelation carrier

def BuildOrderedGroupModel
    (signature : OrderedGroupSignature) :
    LRA.Logic.FirstOrder.Model OrderedGroupFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.one⟩
  interpretFunction
    | .mul, args =>
        signature.multiplication (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .inv, args => signature.inverse (args ⟨0, by decide⟩)
  interpretRelation
    | .lt, args =>
        signature.StrictOrder (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretConstant
    | .one => signature.one

def orderedGroupFirstOrderModel (R : Type u) [Mul R] [Inv R] [OfNat R 1] [LT R] [LE R] :
    LRA.Logic.FirstOrder.Model OrderedGroupFirstOrderSignature :=
  BuildOrderedGroupModel
    { carrier := R, one := 1, multiplication := (· * ·), inverse := (·⁻¹),
      StrictOrder := (· < ·), NonstrictOrder := (· ≤ ·) }

end LRA.AlgebraicStructures.OrderedGroup.ModelTheory
