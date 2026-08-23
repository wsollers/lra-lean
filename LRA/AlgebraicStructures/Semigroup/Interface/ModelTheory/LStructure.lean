import LRA.AlgebraicStructures.Semigroup.Definition
import LRA.AlgebraicStructures.Semigroup.Interface.Signature.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures.Semigroup.Interface.ModelTheory

universe u

                                                                              

open LRA.AlgebraicStructures.Semigroup.Interface.Signature

def BuildSemigroupModel
    (signature : LRA.AlgebraicStructures.SemigroupConceptSignature)
    (witness : signature.carrier) :
    LRA.Logic.FirstOrder.Model SemigroupFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨witness⟩
  interpretFunction
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant := fun ConstantSymbol => nomatch ConstantSymbol

def semigroupFirstOrderModel (R : Type u) [Inhabited R] [Mul R] :
    LRA.Logic.FirstOrder.Model SemigroupFirstOrderSignature :=
  BuildSemigroupModel { carrier := R, multiply := (· * ·) } default

end LRA.AlgebraicStructures.Semigroup.Interface.ModelTheory
