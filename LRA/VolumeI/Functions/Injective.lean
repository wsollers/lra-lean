import LRA.VolumeI.Functions.Fibers

namespace LRA.VolumeI.Functions

open LRA.VolumeI.Set

universe u v

/-- Injectivity of a function. -/
def Injective {Domain Codomain : Type u} (map : Domain -> Codomain) : Prop :=
  forall left right, map left = map right -> left = right

/-- Fiber formulation of injectivity: every fiber over the ambient domain
has at most one member. -/
def InjectiveByFibers {Element : Type u} {SetObject : Type v}
    {Codomain : Type u}
    [Membership Element SetObject] [HasSeparation Element SetObject]
    (ambientDomain : SetObject)
    (map : Function Element Codomain) : Prop :=
  forall (output : Codomain) (left right : Element),
    left ∈ Fiber ambientDomain map output ->
      right ∈ Fiber ambientDomain map output ->
        left = right

end LRA.VolumeI.Functions
