import LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory.LStructure
import LRA.NumberSystems.PeanoSystem.Definition

namespace LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory

def SuccessorArithmeticTheory
    (signature : SuccessorArithmeticSignature) : Prop :=
  ∃ peanoSystem :
      LRA.NumberSystems.PeanoSystem.PeanoSystem signature.carrier
        (Set signature.carrier),
    signature.zero = peanoSystem.base ∧
      signature.successor = peanoSystem.successor

abbrev SuccessorArithmeticAxioms := SuccessorArithmeticTheory

end LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory
