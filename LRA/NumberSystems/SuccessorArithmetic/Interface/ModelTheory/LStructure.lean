import LRA.NumberSystems.SuccessorArithmetic.Interface.Signature.Definition
import LRA.Operation

namespace LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory

open LRA.NumberSystems.SuccessorArithmetic.Interface.Signature

universe u

structure SuccessorArithmeticSignature where
  carrier : Type u
  base : LRA.Operation.NullaryOperation carrier
  successor : LRA.Operation.UnaryOperation carrier

abbrev SuccessorArithmeticLStructure :=
  LRA.Logic.FirstOrder.Model SuccessorArithmeticFirstOrderSignature

def BuildSuccessorArithmeticModel
    (signature : SuccessorArithmeticSignature) :
    SuccessorArithmeticLStructure where
  Domain := signature.carrier
  domainNonempty := ⟨signature.base⟩
  interpretFunction
    | .successor, args => signature.successor (args ⟨0, by decide⟩)
  interpretRelation := fun relation => nomatch relation
  interpretConstant
    | .base => signature.base

end LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory

