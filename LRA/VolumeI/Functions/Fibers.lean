import LRA.VolumeI.Functions.Preimages

namespace LRA.VolumeI.Functions

universe u

/-- The fiber over one codomain value. -/
def Fiber {Domain Codomain : Type u}
    (map : Function Domain Codomain)
    (output : Codomain) : LRA.VolumeI.Set.LRASet Domain :=
  fun input => map input = output

end LRA.VolumeI.Functions
