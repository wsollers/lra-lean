import LRA.NumberSystems.PositiveNaturals.Interface.ModelTheory.Model
import LRA.NumberSystems.PositiveNaturals.Interface.ModelTheory.Theory

namespace LRA.NumberSystems.PositiveNaturals.Interface.ModelTheory

def genericTheory (M : PositiveNaturalsModel) : Prop :=
  PositiveNaturalsTheory M.signature

theorem satisfiesModelTheory (M : PositiveNaturalsModel) : genericTheory M := by
  sorry

end LRA.NumberSystems.PositiveNaturals.Interface.ModelTheory
