import LRA.VolumeI.Functions.Fibers

namespace LRA.VolumeI.Functions

universe u

/-- Injectivity of a function. -/
def Injective {Domain Codomain : Type u} (map : Domain -> Codomain) : Prop :=
  forall left right, map left = map right -> left = right

/-- Fiber formulation of injectivity. -/
def InjectiveByFibers {Domain Codomain : Type u}
    (map : Function Domain Codomain) : Prop :=
  forall output left right,
    Fiber map output left -> Fiber map output right -> left = right

end LRA.VolumeI.Functions
