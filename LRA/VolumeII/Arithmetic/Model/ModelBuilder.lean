import LRA.VolumeII.Arithmetic.Model.FirstOrderSignature
import LRA.Operation

namespace LRA.NumberSystems.Arithmetic.Model

universe u

/-!
Model builders for the first-order arithmetic-ring language used by concrete
Volume II number-system constructions.
-/

structure ArithmeticRingSignature where
  carrier : Type u
  zero : LRA.Operation.NullaryOperation carrier
  one : LRA.Operation.NullaryOperation carrier
  addition : LRA.Operation.BinaryOperation carrier
  multiplication : LRA.Operation.BinaryOperation carrier

def BuildArithmeticRingModel
    (signature : ArithmeticRingSignature) :
    LRA.Logic.FirstOrder.Model ArithmeticRingFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.addition (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul, args =>
        signature.multiplication (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

def arithmeticRingFirstOrderModel (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model ArithmeticRingFirstOrderSignature :=
  BuildArithmeticRingModel
    { carrier := R, zero := 0, one := 1, addition := (· + ·),
      multiplication := (· * ·) }

end LRA.NumberSystems.Arithmetic.Model
