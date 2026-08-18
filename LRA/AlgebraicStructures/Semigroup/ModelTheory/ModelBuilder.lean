import LRA.AlgebraicStructures.Semigroup.ModelTheory.FirstOrderSignature
import LRA.Operation

namespace LRA.AlgebraicStructures.Semigroup.ModelTheory

universe u

/-! Law-free model builders for the first-order semigroup language. -/

structure SemigroupSignature where
  carrier : Type u
  witness : carrier
  multiplication : LRA.Operation.BinaryOperation carrier

def BuildSemigroupModel
    (signature : SemigroupSignature) :
    LRA.Logic.FirstOrder.Model SemigroupFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.witness⟩
  interpretFunction
    | .mul, args =>
        signature.multiplication (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant := fun ConstantSymbol => nomatch ConstantSymbol

def semigroupFirstOrderModel (R : Type u) [Inhabited R] [Mul R] :
    LRA.Logic.FirstOrder.Model SemigroupFirstOrderSignature :=
  BuildSemigroupModel
    { carrier := R, witness := default, multiplication := (· * ·) }

end LRA.AlgebraicStructures.Semigroup.ModelTheory
