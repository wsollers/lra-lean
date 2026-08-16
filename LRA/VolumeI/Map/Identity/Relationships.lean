import LRA.VolumeI.Map.Identity.Theorems
import LRA.VolumeI.Map.Composition.Definition
import LRA.VolumeI.Map.Inverse.Definition

namespace LRA.Map.Identity

open LRA.Map.Typed

universe u

/--
The identity map is its own two-sided inverse.
-/
theorem IdentityMapTwoSidedInverse
    (Domain : Type u) :
    LRA.Map.Inverse.TwoSidedInverse
      (IdentityMap Domain)
      (IdentityMap Domain) :=
  ⟨fun _ => rfl, fun _ => rfl⟩

end LRA.Map.Identity
