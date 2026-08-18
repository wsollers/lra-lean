import LRA.AlgebraicStructures.DivisionRing.ModelTheory.FirstOrderSignature
import LRA.Operation

namespace LRA.AlgebraicStructures.DivisionRing.ModelTheory

universe u

/-! Law-free model builders for the first-order division-ring language. -/

structure DivisionRingSignature where
  carrier : Type u
  zero : LRA.Operation.NullaryOperation carrier
  one : LRA.Operation.NullaryOperation carrier
  addition : LRA.Operation.BinaryOperation carrier
  negation : LRA.Operation.UnaryOperation carrier
  multiplication : LRA.Operation.BinaryOperation carrier
  inverse : LRA.Operation.UnaryOperation carrier

def BuildDivisionRingModel
    (signature : DivisionRingSignature) :
    LRA.Logic.FirstOrder.Model DivisionRingFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.addition (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul, args =>
        signature.multiplication (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .neg, args => signature.negation (args ⟨0, by decide⟩)
    | .inv, args => signature.inverse (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

def divisionRingFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model DivisionRingFirstOrderSignature :=
  BuildDivisionRingModel
    { carrier := R, zero := 0, one := 1, addition := (· + ·),
      negation := (- ·), multiplication := (· * ·), inverse := (·⁻¹) }

end LRA.AlgebraicStructures.DivisionRing.ModelTheory
