import LRA.AlgebraicStructures.OrderedField.ModelTheory.FirstOrderSignature
import LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory.Model

namespace LRA.AlgebraicStructures.OrderedField.ModelTheory

universe u

/-!
Model builders for the first-order ordered-field language.
-/

structure OrderedFieldSignature extends
    LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory.OrderedRingSignature where
  inverse : LRA.Operation.UnaryOperation carrier

namespace OrderedFieldSignature

def InverseDomain
    (signature : OrderedFieldSignature)
    (value : signature.carrier) : Prop :=
  value ≠ signature.zero

def PartialInverse
    (signature : OrderedFieldSignature) :
    LRA.Operation.PartialUnaryOperation signature.carrier where
  Domain := InverseDomain signature
  Value := fun value _ => signature.inverse value

def PartialDivision
    (signature : OrderedFieldSignature) :
    LRA.Operation.PartialBinaryOperation signature.carrier where
  Domain := fun _ divisor => divisor ≠ signature.zero
  Value := fun dividend divisor _ =>
    signature.multiply dividend (signature.inverse divisor)

end OrderedFieldSignature

def BuildOrderedFieldModel
    (signature : OrderedFieldSignature) :
    LRA.Logic.FirstOrder.Model OrderedFieldFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.add (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .neg, args => signature.neg (args ⟨0, by decide⟩)
    | .inv, args => signature.inverse (args ⟨0, by decide⟩)
  interpretRelation
    | .lt, args =>
        signature.StrictOrder (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

def orderedFieldFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] :
    LRA.Logic.FirstOrder.Model OrderedFieldFirstOrderSignature :=
  BuildOrderedFieldModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      neg := (- ·), multiply := (· * ·), inverse := (·⁻¹), le := (· ≤ ·),
      StrictOrder := (· < ·) }

end LRA.AlgebraicStructures.OrderedField.ModelTheory
