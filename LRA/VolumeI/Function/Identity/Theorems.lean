import LRA.VolumeI.Function.Identity.Definition
import LRA.VolumeI.Function.Bijective.Definition

namespace LRA.Function.Identity

open LRA.Function

universe u

/--
**[Theorem — IdentityFunctionApply]**

Evaluation of the identity map.

Logical form:

```lean
theorem IdentityFunctionApply
    {Domain : Type u}
    (input : Domain) :
    IdentityFunction Domain input = input
```
-/
theorem IdentityFunctionApply
    {Domain : Type u}
    (input : Domain) :
    IdentityFunction Domain input = input := by
  sorry
/--
**[Theorem — IdentityFunctionInjective]**

The identity map is injective.

Logical form:

```lean
theorem IdentityFunctionInjective
    (Domain : Type u) :
    LRA.Function.Injective.Injective (IdentityFunction Domain)
```
-/
theorem IdentityFunctionInjective
    (Domain : Type u) :
    LRA.Function.Injective.Injective (IdentityFunction Domain) := by
  sorry
/--
**[Theorem — IdentityFunctionSurjective]**

The identity map is surjective.

Logical form:

```lean
theorem IdentityFunctionSurjective
    (Domain : Type u) :
    LRA.Function.Surjective.Surjective (IdentityFunction Domain)
```
-/
theorem IdentityFunctionSurjective
    (Domain : Type u) :
    LRA.Function.Surjective.Surjective (IdentityFunction Domain) := by
  sorry
/--
**[Theorem — IdentityFunctionBijective]**

The identity map is bijective.

Logical form:

```lean
theorem IdentityFunctionBijective
    (Domain : Type u) :
    LRA.Function.Bijective.Bijective (IdentityFunction Domain)
```
-/
theorem IdentityFunctionBijective
    (Domain : Type u) :
    LRA.Function.Bijective.Bijective (IdentityFunction Domain) := by
  sorry
end LRA.Function.Identity
