import LRA.VolumeI.AlgebraicStructures.Group.ModelTheory.FirstOrderSignature
import LRA.VolumeI.Operations

namespace LRA.AlgebraicStructures.Group.ModelTheory

universe u

/-! Law-free model builders for the first-order group language. -/

structure GroupSignature where
  carrier : Type u
  one : LRA.Operation.NullaryOperation carrier
  multiplication : LRA.Operation.BinaryOperation carrier
  inverse : LRA.Operation.UnaryOperation carrier

def BuildGroupModel
    (signature : GroupSignature) :
    LRA.Logic.FirstOrder.Model GroupFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.one⟩
  interpretFunction
    | .mul, args =>
        signature.multiplication (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .inv, args => signature.inverse (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .one => signature.one

def groupFirstOrderModel (R : Type u) [Mul R] [Inv R] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model GroupFirstOrderSignature :=
  BuildGroupModel
    { carrier := R, one := 1, multiplication := (· * ·), inverse := (·⁻¹) }

end LRA.AlgebraicStructures.Group.ModelTheory
