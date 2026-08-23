import LRA.AlgebraicStructures.Semiring.Interface.Signature.Definition
import LRA.AlgebraicStructures.Semiring.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures.Semiring.Interface.ModelTheory

universe u

open LRA.AlgebraicStructures.Semiring.Interface.Signature

def BuildSemiringModel
    (signature : LRA.AlgebraicStructures.SemiringConceptSignature) :
    LRA.Logic.FirstOrder.Model SemiringFirstOrderSignature where
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

def semiringFirstOrderModel (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model SemiringFirstOrderSignature :=
  BuildSemiringModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      multiply := (· * ·) }

end LRA.AlgebraicStructures.Semiring.Interface.ModelTheory
