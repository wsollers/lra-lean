import LRA.VolumeI.AlgebraicStructures.Monoid.ModelTheory.FirstOrderSignature
import LRA.VolumeI.Operations

namespace LRA.AlgebraicStructures.Monoid.ModelTheory

universe u

/-! Law-free model builders for the first-order monoid language. -/

structure MonoidSignature where
  carrier : Type u
  one : LRA.Operation.NullaryOperation carrier
  multiplication : LRA.Operation.BinaryOperation carrier

def BuildMonoidModel
    (signature : MonoidSignature) :
    LRA.Logic.FirstOrder.Model MonoidFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.one⟩
  interpretFunction
    | .mul, args =>
        signature.multiplication (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .one => signature.one

def monoidFirstOrderModel (R : Type u) [Mul R] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model MonoidFirstOrderSignature :=
  BuildMonoidModel
    { carrier := R, one := 1, multiplication := (· * ·) }

end LRA.AlgebraicStructures.Monoid.ModelTheory
