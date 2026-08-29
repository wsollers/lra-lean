import LRA.NumberSystems.FirstOrderArithmetic.Interface.ModelTheory.Model
import LRA.NumberSystems.FirstOrderArithmetic.Interface.Satisfy_ModelTheory
import LRA.NumberSystems.FirstOrderArithmetic.Interface.ModelTheory.LStructure
import LRA.UniversalAlgebra.Homomorphism.Definition
import LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObjects

namespace LRA.NumberSystems.FirstOrderArithmetic.Interface

open LRA.NumberSystems.FirstOrderArithmetic.Interface.ModelTheory

abbrev FirstOrderArithmeticRealization :=
  {signature : FirstOrderArithmeticSignature // FirstOrderArithmeticTheory signature}

abbrev FirstOrderArithmeticArrow
    (source target : FirstOrderArithmeticRealization) :=
  LRA.UniversalAlgebra.Homomorphism
    (BuildFirstOrderArithmeticModel source.val)
    (BuildFirstOrderArithmeticModel target.val)

theorem FirstOrderArithmeticInitial :
    LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObject
      FirstOrderArithmeticRealization
      FirstOrderArithmeticArrow
      ⟨mathlibFirstOrderArithmeticModel.signature,
        satisfiesModelTheory mathlibFirstOrderArithmeticModel⟩ := by
  sorry

end LRA.NumberSystems.FirstOrderArithmetic.Interface

