import LRA.VolumeI.Functions.Preimages

namespace LRA.VolumeI.Functions

open LRA.VolumeI.Set

universe u v

/-- The fiber over one codomain value: the members of the ambient domain
that the function sends to `output`.

Needs only separation from an explicit ambient set -- no universal set --
so unlike `Preimage` this is available for every backend, Enderton
included. -/
def Fiber {Element : Type u} {SetObject : Type v} {Codomain : Type u}
    [HasSeparation Element SetObject]
    (ambientDomain : SetObject)
    (map : Function Element Codomain)
    (output : Codomain) : SetObject :=
  HasSeparation.separation ambientDomain (fun input => map input = output)

end LRA.VolumeI.Functions
