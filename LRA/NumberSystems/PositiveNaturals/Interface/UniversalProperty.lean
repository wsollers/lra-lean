import LRA.NumberSystems.PositiveNaturals.Interface.ModelTheory.Theory
import LRA.NumberSystems.PositiveNaturals.Interface.ModelTheory.LStructure
import LRA.NumberSystems.PositiveNaturals.Interface.Satisfy_ModelTheory
import LRA.AlgebraicStructures.CommutativeSemiringWithoutZero.Interface.Definitions.ConceptSignature
import LRA.UniversalAlgebra.Homomorphism.Definition
import LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObjects

namespace LRA.NumberSystems.PositiveNaturals.Interface

open LRA.AlgebraicStructures (CommutativeSemiringWithoutZeroConceptSignature)
open LRA.NumberSystems.PositiveNaturals.Interface.ModelTheory

abbrev PositiveCommutativeSemiring :=
  {signature : CommutativeSemiringWithoutZeroConceptSignature //
    PositiveNaturalsTheory signature}

abbrev PositiveCommutativeSemiringArrow
    (source target : PositiveCommutativeSemiring) :=
  LRA.UniversalAlgebra.Homomorphism
    (positiveNaturalsModel source.val) (positiveNaturalsModel target.val)

theorem PositiveNaturalsInitial :
    LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObject
      PositiveCommutativeSemiring
      PositiveCommutativeSemiringArrow
      ⟨mathlibPositiveNaturalsModel.signature,
        satisfiesModelTheory mathlibPositiveNaturalsModel⟩ := by
  sorry

end LRA.NumberSystems.PositiveNaturals.Interface
