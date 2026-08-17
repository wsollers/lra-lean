import LRA.VolumeI.AlgebraicStructures.Field.ModelTheory.FirstOrderSignature
import LRA.VolumeI.Operations

namespace LRA.AlgebraicStructures.Field.ModelTheory

universe u

/-!
Model builders for the first-order field language.

The operation bundle is law-free. Field laws are certified by
`AlgebraicStructures/Field/Laws`, while this module only interprets the
first-order symbols on a carrier.
-/

structure FieldSignature where
  carrier : Type u
  zero : LRA.Operation.NullaryOperation carrier
  one : LRA.Operation.NullaryOperation carrier
  addition : LRA.Operation.BinaryOperation carrier
  negation : LRA.Operation.UnaryOperation carrier
  multiplication : LRA.Operation.BinaryOperation carrier
  inverse : LRA.Operation.UnaryOperation carrier

def BuildFieldModel
    (signature : FieldSignature) :
    LRA.Logic.FirstOrder.Model FieldFirstOrderSignature where
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

def fieldFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model FieldFirstOrderSignature :=
  BuildFieldModel
    { carrier := R, zero := 0, one := 1, addition := (· + ·),
      negation := (- ·), multiplication := (· * ·), inverse := (·⁻¹) }

end LRA.AlgebraicStructures.Field.ModelTheory
