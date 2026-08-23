import LRA.AlgebraicStructures.Ring.Interface.Signature.Definition
import LRA.AlgebraicStructures.Ring.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures.Ring.Interface.ModelTheory

universe u

                                                                         

open LRA.AlgebraicStructures.Ring.Interface.Signature

def BuildRingModel
    (signature : LRA.AlgebraicStructures.RingConceptSignature) :
    LRA.Logic.FirstOrder.Model RingFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.add (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .neg, args => signature.neg (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

def ringFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model RingFirstOrderSignature :=
  BuildRingModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      neg := (- ·), multiply := (· * ·) }

end LRA.AlgebraicStructures.Ring.Interface.ModelTheory
