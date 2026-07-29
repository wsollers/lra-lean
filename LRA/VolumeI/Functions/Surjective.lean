import LRA.VolumeI.Functions.Functions

namespace LRA.VolumeI.Functions

universe u

/-- Surjectivity of a function. -/
def Surjective {Domain Codomain : Type u} (map : Domain -> Codomain) : Prop :=
  forall output, exists input, map input = output

end LRA.VolumeI.Functions
