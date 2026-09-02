import LRA.NumberSystems.VonNeumann.Interface.ModelTheory.Theory
import LRA.NumberSystems.VonNeumann.Interface.ModelTheory.Model

namespace LRA.NumberSystems.VonNeumann.Interface.ModelTheory

def genericTheory (M : VonNeumannModel) : Prop :=
  VonNeumannTheory M.signature

theorem satisfiesModelTheory (M : VonNeumannModel) : genericTheory M := by
  sorry
end LRA.NumberSystems.VonNeumann.Interface.ModelTheory
