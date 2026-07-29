import LRA.VolumeI.Functions.Fibers

namespace LRA.VolumeI.Functions

universe u

/-- Surjectivity of a function. -/
def Surjective {Domain Codomain : Type u} (map : Domain -> Codomain) : Prop :=
  forall output, exists input, map input = output

/-- Fiber formulation of surjectivity. -/
def SurjectiveByFibers {Domain Codomain : Type u}
    (map : Function Domain Codomain) : Prop :=
  forall output, LRA.VolumeI.Set.LRASet.nonempty (Fiber map output)

end LRA.VolumeI.Functions
