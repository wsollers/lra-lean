import LRA.NumberSystems.ZeroBasedNaturals.Interface.ModelTheory.Model
import LRA.NumberSystems.ZeroBasedNaturals.Interface.ModelTheory.Theory

namespace LRA.NumberSystems.ZeroBasedNaturals.Interface.ModelTheory

def genericTheory (M : ZeroBasedNaturalsModel) : Prop :=
  ZeroBasedNaturalsTheory M.signature

theorem satisfiesModelTheory (M : ZeroBasedNaturalsModel) : genericTheory M := by
  sorry

end LRA.NumberSystems.ZeroBasedNaturals.Interface.ModelTheory
