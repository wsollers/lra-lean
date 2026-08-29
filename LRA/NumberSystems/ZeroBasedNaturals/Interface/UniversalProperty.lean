import LRA.NumberSystems.ZeroBasedNaturals.Interface.ModelTheory.Theory
import LRA.NumberSystems.ZeroBasedNaturals.Interface.ModelTheory.LStructure
import LRA.NumberSystems.ZeroBasedNaturals.Interface.Satisfy_ModelTheory
import LRA.UniversalAlgebra.Homomorphism.Definition
import LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObjects

namespace LRA.NumberSystems.ZeroBasedNaturals.Interface

open LRA.AlgebraicStructures.OrderedSemiring.Interface.ModelTheory (OrderedSemiringSignature)
open LRA.NumberSystems.ZeroBasedNaturals.Interface.ModelTheory

abbrev CommutativeSemiring :=
  {signature : OrderedSemiringSignature // ZeroBasedNaturalsTheory signature}

abbrev CommutativeSemiringArrow (source target : CommutativeSemiring) :=
  LRA.UniversalAlgebra.Homomorphism
    (zeroBasedNaturalsModel source.val) (zeroBasedNaturalsModel target.val)

theorem ZeroBasedNaturalsInitial :
    LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObject
      CommutativeSemiring
      CommutativeSemiringArrow
      ⟨mathlibZeroBasedNaturalsModel.signature,
        satisfiesModelTheory mathlibZeroBasedNaturalsModel⟩ := by
  sorry

end LRA.NumberSystems.ZeroBasedNaturals.Interface
