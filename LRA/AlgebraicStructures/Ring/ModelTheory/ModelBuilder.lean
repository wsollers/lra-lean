import LRA.AlgebraicStructures.Ring.ModelTheory.FirstOrderSignature
import LRA.Operation

namespace LRA.AlgebraicStructures.Ring.ModelTheory

universe u

/-! Law-free model builders for the first-order ring language. -/

structure RingSignature where
  carrier : Type u
  zero : LRA.Operation.NullaryOperation carrier
  one : LRA.Operation.NullaryOperation carrier
  addition : LRA.Operation.BinaryOperation carrier
  negation : LRA.Operation.UnaryOperation carrier
  multiplication : LRA.Operation.BinaryOperation carrier

def BuildRingModel
    (signature : RingSignature) :
    LRA.Logic.FirstOrder.Model RingFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.addition (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul, args =>
        signature.multiplication (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .neg, args => signature.negation (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

def ringFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model RingFirstOrderSignature :=
  BuildRingModel
    { carrier := R, zero := 0, one := 1, addition := (· + ·),
      negation := (- ·), multiplication := (· * ·) }

end LRA.AlgebraicStructures.Ring.ModelTheory
