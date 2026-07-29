import LRA.VolumeI.Functions.Functions

namespace LRA.VolumeI.Functions

universe u

/-- Preimage of a subset under a function. -/
def Preimage {Domain Codomain : Type u}
    (map : Function Domain Codomain)
    (subset : LRA.VolumeI.Set.LRASet Codomain) :
    LRA.VolumeI.Set.LRASet Domain :=
  fun input => subset (map input)

/-- Alias emphasizing inverse image notation. -/
def InverseImage {Domain Codomain : Type u}
    (map : Function Domain Codomain)
    (subset : LRA.VolumeI.Set.LRASet Codomain) :
    LRA.VolumeI.Set.LRASet Domain :=
  Preimage map subset

end LRA.VolumeI.Functions
