import LRA.NumberSystems.Presburger.Interface.ModelTheory.Theory
import LRA.NumberSystems.Presburger.Interface.ModelTheory.Model

namespace LRA.NumberSystems.Presburger.Interface.ModelTheory

def genericTheory (M : PresburgerModel) : Prop :=
  PresburgerTheory M.signature

theorem satisfiesModelTheory (M : PresburgerModel) : genericTheory M := by
  sorry
end LRA.NumberSystems.Presburger.Interface.ModelTheory
