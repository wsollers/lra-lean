import LRA.AlgebraicStructures.Monoid.Definition
import LRA.AlgebraicStructures.Monoid.Interface.Signature.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures.Monoid.Interface.ModelTheory

universe u

                                                                           

open LRA.AlgebraicStructures.Monoid.Interface.Signature

def BuildMonoidModel
    (signature : LRA.AlgebraicStructures.MonoidConceptSignature) :
    LRA.Logic.FirstOrder.Model MonoidFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.one⟩
  interpretFunction
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .one => signature.one

def monoidFirstOrderModel (R : Type u) [Mul R] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model MonoidFirstOrderSignature :=
  BuildMonoidModel
    { carrier := R, one := 1, multiply := (· * ·) }

end LRA.AlgebraicStructures.Monoid.Interface.ModelTheory
