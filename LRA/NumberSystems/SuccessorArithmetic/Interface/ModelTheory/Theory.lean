import LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory.LStructure

namespace LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory

structure SuccessorArithmeticTheory
    (signature : SuccessorArithmeticSignature) : Prop where
  baseNotSuccessor :
    ∀ element : signature.carrier,
      signature.successor element ≠ signature.base
  successorInjective :
    ∀ first second : signature.carrier,
      signature.successor first = signature.successor second → first = second

end LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory

