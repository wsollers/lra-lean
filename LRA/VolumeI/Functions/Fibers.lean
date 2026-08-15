import LRA.VolumeI.Functions.Preimages

namespace LRA.Function

open LRA.Set

universe u v w

/-- The fiber over one codomain value, separated from an ambient domain. -/
def Fiber {Element : Type u} {Codomain : Type v} {SetObject : Type w}
    [HasSeparation Element SetObject]
    (ambientDomain : SetObject)
    (map : LRA.Function Element Codomain)
    (output : Codomain) : SetObject :=
  HasSeparation.separation ambientDomain (fun input => map input = output)

end LRA.Function
