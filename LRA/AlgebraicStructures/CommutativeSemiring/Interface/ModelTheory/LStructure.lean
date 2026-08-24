import LRA.AlgebraicStructures.CommutativeSemiring.Interface.Signature.Definition
import LRA.AlgebraicStructures.CommutativeSemiring.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures.CommutativeSemiring.Interface.ModelTheory

universe u

open LRA.AlgebraicStructures.CommutativeSemiring.Interface.Signature

def BuildCommutativeSemiringModel
    (signature : LRA.AlgebraicStructures.CommutativeSemiringConceptSignature) :
    LRA.Logic.FirstOrder.Model CommutativeSemiringFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.add (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

def commutativeSemiringFirstOrderModel (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model CommutativeSemiringFirstOrderSignature :=
  BuildCommutativeSemiringModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      multiply := (· * ·) }

end LRA.AlgebraicStructures.CommutativeSemiring.Interface.ModelTheory
