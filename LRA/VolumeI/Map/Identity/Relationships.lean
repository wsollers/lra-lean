import LRA.VolumeI.Map.Identity.Theorems
import LRA.VolumeI.Map.Composition.Definition
import LRA.VolumeI.Map.Inverse.Definition

namespace LRA.Map.Identity

open LRA.Map.Typed

universe u

/--
**[Theorem — IdentityMapTwoSidedInverse]**

The identity map is its own two-sided inverse.

Logical form:

```lean
theorem IdentityMapTwoSidedInverse
    (Domain : Type u) :
    LRA.Map.Inverse.TwoSidedInverse
      (IdentityMap Domain)
      (IdentityMap Domain)
```
-/
theorem IdentityMapTwoSidedInverse
    (Domain : Type u) :
    LRA.Map.Inverse.TwoSidedInverse
      (IdentityMap Domain)
      (IdentityMap Domain) := by
  sorry
end LRA.Map.Identity
