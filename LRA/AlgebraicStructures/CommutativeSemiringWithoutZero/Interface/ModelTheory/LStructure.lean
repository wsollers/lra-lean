import LRA.AlgebraicStructures.CommutativeSemiringWithoutZero.Interface.Signature.Definition
import LRA.AlgebraicStructures.CommutativeSemiringWithoutZero.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures.CommutativeSemiringWithoutZero.Interface.ModelTheory

universe u

open LRA.AlgebraicStructures.CommutativeSemiringWithoutZero.Interface.Signature

def BuildCommutativeSemiringWithoutZeroModel
    (signature : LRA.AlgebraicStructures.CommutativeSemiringWithoutZeroConceptSignature) :
    LRA.Logic.FirstOrder.Model CommutativeSemiringWithoutZeroFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.one⟩
  interpretFunction
    | .add, args =>
        signature.add (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .one => signature.one

def commutativeSemiringWithoutZeroFirstOrderModel (R : Type u)
    [Add R] [Mul R] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model CommutativeSemiringWithoutZeroFirstOrderSignature :=
  BuildCommutativeSemiringWithoutZeroModel
    { carrier := R, one := 1, add := (· + ·), multiply := (· * ·) }

end LRA.AlgebraicStructures.CommutativeSemiringWithoutZero.Interface.ModelTheory
