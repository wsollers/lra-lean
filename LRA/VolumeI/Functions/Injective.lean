import LRA.VolumeI.Functions.Functions

namespace LRA.VolumeI.Functions

universe u

/-- Injectivity of a function. -/
def Injective {Domain Codomain : Type u} (map : Domain -> Codomain) : Prop :=
  forall left right, map left = map right -> left = right

end LRA.VolumeI.Functions
