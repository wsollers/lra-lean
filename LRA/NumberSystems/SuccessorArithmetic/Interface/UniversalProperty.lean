import LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory.Model
import LRA.NumberSystems.SuccessorArithmetic.Interface.Satisfy_ModelTheory
import LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory.LStructure
import LRA.UniversalAlgebra.Homomorphism.Definition
import LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObjects

namespace LRA.NumberSystems.SuccessorArithmetic.Interface

open LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory

abbrev SuccessorArithmeticRealization :=
  {signature : SuccessorArithmeticSignature // SuccessorArithmeticTheory signature}

abbrev SuccessorArithmeticArrow
    (source target : SuccessorArithmeticRealization) :=
  LRA.UniversalAlgebra.Homomorphism
    (BuildSuccessorArithmeticModel source.val)
    (BuildSuccessorArithmeticModel target.val)

theorem SuccessorArithmeticInitial :
    LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObject
      SuccessorArithmeticRealization
      SuccessorArithmeticArrow
      ⟨mathlibSuccessorArithmeticModel.signature,
        satisfiesModelTheory mathlibSuccessorArithmeticModel⟩ := by
  sorry

end LRA.NumberSystems.SuccessorArithmetic.Interface

