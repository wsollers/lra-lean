import LRA.VolumeI.AlgebraicStructures.OrderedRing.ModelTheory.FirstOrderSignature
import LRA.Operation
import LRA.Relation

namespace LRA.AlgebraicStructures.OrderedRing.ModelTheory

universe u

/-!
Model builders for the first-order ordered-ring language.

The signature here is a law-free operation/relation bundle. Order and ring laws
remain separate certificates under `Order` and `AlgebraicStructures`.
-/

structure OrderedRingSignature where
  carrier : Type u
  zero : LRA.Operation.NullaryOperation carrier
  one : LRA.Operation.NullaryOperation carrier
  addition : LRA.Operation.BinaryOperation carrier
  negation : LRA.Operation.UnaryOperation carrier
  multiplication : LRA.Operation.BinaryOperation carrier
  StrictOrder : LRA.Relation.Endorelation carrier
  NonstrictOrder : LRA.Relation.Endorelation carrier

namespace OrderedRingSignature

abbrev Subtraction
    (signature : OrderedRingSignature) :
    LRA.Operation.BinaryOperation signature.carrier :=
  fun first second =>
    signature.addition first (signature.negation second)

end OrderedRingSignature

def BuildOrderedRingModel
    (signature : OrderedRingSignature) :
    LRA.Logic.FirstOrder.Model OrderedRingFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.addition (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul, args =>
        signature.multiplication (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .neg, args => signature.negation (args ⟨0, by decide⟩)
  interpretRelation
    | .lt, args =>
        signature.StrictOrder (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

def orderedRingFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] :
    LRA.Logic.FirstOrder.Model OrderedRingFirstOrderSignature :=
  BuildOrderedRingModel
    { carrier := R, zero := 0, one := 1, addition := (· + ·),
      negation := (- ·), multiplication := (· * ·),
      StrictOrder := (· < ·), NonstrictOrder := (· ≤ ·) }

end LRA.AlgebraicStructures.OrderedRing.ModelTheory
