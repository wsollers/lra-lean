import LRA.AlgebraicStructures.Group.Definition
import LRA.AlgebraicStructures.Group.Interface.Signature.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures.Group.Interface.ModelTheory

universe u

                                                                          

open LRA.AlgebraicStructures.Group.Interface.Signature

def BuildGroupModel
    (signature : LRA.AlgebraicStructures.GroupConceptSignature) :
    LRA.Logic.FirstOrder.Model GroupFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.one⟩
  interpretFunction
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .inv, args => signature.inverse (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .one => signature.one

def groupFirstOrderModel (R : Type u) [Mul R] [Inv R] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model GroupFirstOrderSignature :=
  BuildGroupModel
    { carrier := R, one := 1, multiply := (· * ·), inverse := (·⁻¹) }

end LRA.AlgebraicStructures.Group.Interface.ModelTheory
