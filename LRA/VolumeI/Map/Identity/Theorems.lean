import LRA.VolumeI.Map.Identity.Definition
import LRA.VolumeI.Map.Bijective.Definition

namespace LRA.Map.Identity

open LRA.Map.Typed

universe u

/--
**[Theorem — IdentityMapApply]**

Evaluation of the identity map.

Logical form:

```lean
theorem IdentityMapApply
    {Domain : Type u}
    (input : Domain) :
    IdentityMap Domain input = input
```
-/
theorem IdentityMapApply
    {Domain : Type u}
    (input : Domain) :
    IdentityMap Domain input = input := by
  sorry
/--
**[Theorem — IdentityMapInjective]**

The identity map is injective.

Logical form:

```lean
theorem IdentityMapInjective
    (Domain : Type u) :
    LRA.Map.Injective.Injective (IdentityMap Domain)
```
-/
theorem IdentityMapInjective
    (Domain : Type u) :
    LRA.Map.Injective.Injective (IdentityMap Domain) := by
  sorry
/--
**[Theorem — IdentityMapSurjective]**

The identity map is surjective.

Logical form:

```lean
theorem IdentityMapSurjective
    (Domain : Type u) :
    LRA.Map.Surjective.Surjective (IdentityMap Domain)
```
-/
theorem IdentityMapSurjective
    (Domain : Type u) :
    LRA.Map.Surjective.Surjective (IdentityMap Domain) := by
  sorry
/--
**[Theorem — IdentityMapBijective]**

The identity map is bijective.

Logical form:

```lean
theorem IdentityMapBijective
    (Domain : Type u) :
    LRA.Map.Bijective.Bijective (IdentityMap Domain)
```
-/
theorem IdentityMapBijective
    (Domain : Type u) :
    LRA.Map.Bijective.Bijective (IdentityMap Domain) := by
  sorry
end LRA.Map.Identity
