import LRA.VolumeI.AlgebraicStructures.AbelianGroup.ModelTheory.FirstOrderSignature
import LRA.VolumeI.Operations

namespace LRA.AlgebraicStructures.AbelianGroup.ModelTheory

universe u

/-! Law-free model builders for the first-order abelian-group language. -/

structure AbelianGroupSignature where
  carrier : Type u
  zero : LRA.Operation.NullaryOperation carrier
  addition : LRA.Operation.BinaryOperation carrier
  negation : LRA.Operation.UnaryOperation carrier

def BuildAbelianGroupModel
    (signature : AbelianGroupSignature) :
    LRA.Logic.FirstOrder.Model AbelianGroupFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.addition (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .neg, args => signature.negation (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .zero => signature.zero

def abelianGroupFirstOrderModel (R : Type u) [Add R] [Neg R] [OfNat R 0] :
    LRA.Logic.FirstOrder.Model AbelianGroupFirstOrderSignature :=
  BuildAbelianGroupModel
    { carrier := R, zero := 0, addition := (· + ·), negation := (- ·) }

end LRA.AlgebraicStructures.AbelianGroup.ModelTheory
