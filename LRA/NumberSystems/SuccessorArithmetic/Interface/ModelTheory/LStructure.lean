import LRA.NumberSystems.SuccessorArithmetic.Interface.Signature.Definition
import LRA.AlgebraicStructures.DiscreteInteger.Interface.Laws.Definition
import LRA.Operation

namespace LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory

open LRA.NumberSystems.SuccessorArithmetic.Interface.Signature
open LRA.AlgebraicStructures

universe u

structure SuccessorArithmeticSignature where
  carrier : Type u
  zero : LRA.Operation.NullaryOperation carrier
  successor : LRA.Operation.UnaryOperation carrier

abbrev SuccessorArithmeticLStructure :=
  LRA.ModelTheory.FirstOrder.Model SuccessorArithmeticFirstOrderSignature

def BuildSuccessorArithmeticLStructure
    (signature : SuccessorArithmeticSignature) :
    SuccessorArithmeticLStructure where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .successor, args => signature.successor (args ⟨0, by decide⟩)
  interpretRelation := fun relation => nomatch relation
  interpretConstant
    | .zero => signature.zero

abbrev BuildSuccessorArithmeticModel := BuildSuccessorArithmeticLStructure

def successorArithmeticFirstOrderModel (R : Type u) [OfNat R 0]
    [HasSuccessor R] : SuccessorArithmeticLStructure :=
  BuildSuccessorArithmeticLStructure
    { carrier := R, zero := 0, successor := LRA.AlgebraicStructures.Succ }

end LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory
