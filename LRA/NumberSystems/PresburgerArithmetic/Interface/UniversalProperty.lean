import LRA.NumberSystems.PresburgerArithmetic.Interface.ModelTheory.Model
import LRA.NumberSystems.PresburgerArithmetic.Interface.Satisfy_ModelTheory
import LRA.NumberSystems.PresburgerArithmetic.Interface.ModelTheory.LStructure
import LRA.UniversalAlgebra.Homomorphism.Definition
import LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObjects

namespace LRA.NumberSystems.PresburgerArithmetic.Interface

open LRA.NumberSystems.PresburgerArithmetic.Interface.ModelTheory

abbrev PresburgerArithmeticRealization :=
  {signature : PresburgerArithmeticSignature // PresburgerArithmeticTheory signature}

abbrev PresburgerArithmeticArrow
    (source target : PresburgerArithmeticRealization) :=
  LRA.UniversalAlgebra.Homomorphism
    (BuildPresburgerArithmeticModel source.val)
    (BuildPresburgerArithmeticModel target.val)

theorem PresburgerArithmeticInitial :
    LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObject
      PresburgerArithmeticRealization
      PresburgerArithmeticArrow
      ⟨mathlibPresburgerArithmeticModel.signature,
        satisfiesModelTheory mathlibPresburgerArithmeticModel⟩ := by
  sorry

end LRA.NumberSystems.PresburgerArithmetic.Interface

