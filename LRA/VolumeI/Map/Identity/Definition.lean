import LRA.VolumeI.Map.Typed.Definition

namespace LRA.Map.Identity

open LRA.Map.Typed

universe u

/--
The identity map on a type.
-/
def IdentityMap (Domain : Type u) : Endomap Domain :=
  fun input => input

end LRA.Map.Identity
