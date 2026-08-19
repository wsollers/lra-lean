import LRA.AlgebraicStructures.AbelianGroup.Definition
import LRA.AlgebraicStructures.AbelianGroup.Interface.Signature.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures.AbelianGroup.Interface.ModelTheory

universe u

/-! Law-free model builders for the first-order abelian-group language. -/

open LRA.AlgebraicStructures.AbelianGroup.Interface.Signature

def BuildAbelianGroupModel
    (signature : LRA.AlgebraicStructures.AbelianGroupConceptSignature) :
    LRA.Logic.FirstOrder.Model AbelianGroupFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.add (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .neg, args => signature.neg (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .zero => signature.zero

def abelianGroupFirstOrderModel (R : Type u) [Add R] [Neg R] [OfNat R 0] :
    LRA.Logic.FirstOrder.Model AbelianGroupFirstOrderSignature :=
  BuildAbelianGroupModel
    { carrier := R, zero := 0, add := (· + ·), neg := (- ·) }

end LRA.AlgebraicStructures.AbelianGroup.Interface.ModelTheory
