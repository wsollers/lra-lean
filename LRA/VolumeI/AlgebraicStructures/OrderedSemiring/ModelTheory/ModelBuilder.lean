import LRA.VolumeI.AlgebraicStructures.OrderedSemiring.ModelTheory.FirstOrderSignature
import LRA.Operation
import LRA.Relation

namespace LRA.AlgebraicStructures.OrderedSemiring.ModelTheory

/-!
Model builders for the ordered-semiring first-order signature.

Law certificates are intentionally separate: these builders only interpret the
non-logical vocabulary of the language.
-/

structure OrderedSemiringSignature where
  carrier : Type u
  zero : LRA.Operation.NullaryOperation carrier
  one : LRA.Operation.NullaryOperation carrier
  addition : LRA.Operation.BinaryOperation carrier
  multiplication : LRA.Operation.BinaryOperation carrier
  StrictOrder : LRA.Relation.Endorelation carrier
  NonstrictOrder : LRA.Relation.Endorelation carrier

def BuildOrderedSemiringModel
    (signature : OrderedSemiringSignature) :
    LRA.Logic.FirstOrder.Model OrderedSemiringFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.addition (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul, args =>
        signature.multiplication (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation
    | .lt, args =>
        signature.StrictOrder (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

def orderedSemiringFirstOrderModel (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] :
    LRA.Logic.FirstOrder.Model OrderedSemiringFirstOrderSignature :=
  BuildOrderedSemiringModel
    { carrier := R, zero := 0, one := 1, addition := (· + ·),
      multiplication := (· * ·),
      StrictOrder := (· < ·), NonstrictOrder := (· ≤ ·) }

end LRA.AlgebraicStructures.OrderedSemiring.ModelTheory
