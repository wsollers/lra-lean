import LRA.VolumeI.Functions.Functions

namespace LRA.VolumeI.Functions

universe u

/-- Direct image of a subset under a function. -/
def Image {Domain Codomain : Type u}
    (map : Function Domain Codomain)
    (subset : LRA.VolumeI.Set.LRASet Domain) :
    LRA.VolumeI.Set.LRASet Codomain :=
  fun output => exists input, subset input /\ map input = output

/-- Alias emphasizing the forward direction of image. -/
def DirectImage {Domain Codomain : Type u}
    (map : Function Domain Codomain)
    (subset : LRA.VolumeI.Set.LRASet Domain) :
    LRA.VolumeI.Set.LRASet Codomain :=
  Image map subset

end LRA.VolumeI.Functions
