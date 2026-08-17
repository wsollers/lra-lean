import LRA.Function.Canonical.Identity.Definition
import LRA.VolumeI.Map.Typed.Definition

namespace LRA.Map.Identity

open LRA.Map.Typed
universe u

/-- Historical typed-map spelling of the canonical identity function. -/
abbrev IdentityMap (Domain : Type u) : Endomap Domain :=
  LRA.Function.IdentityTypedFunction Domain

end LRA.Map.Identity
