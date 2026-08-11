import LRA.VolumeI.Functions.Fibers

namespace LRA.VolumeI.Functions

open LRA.VolumeI.Set

universe u v

/-- Surjectivity of a function. -/
def Surjective {Domain Codomain : Type u} (map : Domain -> Codomain) : Prop :=
  forall output, exists input, map input = output

/-- Fiber formulation of surjectivity: every fiber over the ambient domain
is inhabited. -/
def SurjectiveByFibers {Element : Type u} {SetObject : Type v}
    {Codomain : Type u}
    [Membership Element SetObject] [HasSeparation Element SetObject]
    (ambientDomain : SetObject)
    (map : Function Element Codomain) : Prop :=
  forall output : Codomain,
    exists input : Element,
      input ∈ Fiber ambientDomain map output

end LRA.VolumeI.Functions
