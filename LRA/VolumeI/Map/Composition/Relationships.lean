import LRA.VolumeI.Map.Composition.Theorems
import LRA.VolumeI.Map.Injective.Definition
import LRA.VolumeI.Map.Surjective.Definition
import LRA.VolumeI.Map.Bijective.Definition
import LRA.VolumeI.Map.Inverse.Definition

namespace LRA.Map.Composition

open LRA.Map.Typed

universe u v w

/--
**[Theorem — InjectiveCompose]**

The composition of injective maps is injective.

Logical form:

```lean
theorem InjectiveCompose
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {second : TypedMap Middle Codomain}
    {first : TypedMap Domain Middle}
    (secondInjective : LRA.Map.Injective.Injective second)
    (firstInjective : LRA.Map.Injective.Injective first) :
    LRA.Map.Injective.Injective (Compose second first)
```
-/
theorem InjectiveCompose
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {second : TypedMap Middle Codomain}
    {first : TypedMap Domain Middle}
    (secondInjective : LRA.Map.Injective.Injective second)
    (firstInjective : LRA.Map.Injective.Injective first) :
    LRA.Map.Injective.Injective (Compose second first) := by
  sorry
/--
**[Theorem — SurjectiveCompose]**

The composition of surjective maps is surjective.

Logical form:

```lean
theorem SurjectiveCompose
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {second : TypedMap Middle Codomain}
    {first : TypedMap Domain Middle}
    (secondSurjective : LRA.Map.Surjective.Surjective second)
    (firstSurjective : LRA.Map.Surjective.Surjective first) :
    LRA.Map.Surjective.Surjective (Compose second first)
```
-/
theorem SurjectiveCompose
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {second : TypedMap Middle Codomain}
    {first : TypedMap Domain Middle}
    (secondSurjective : LRA.Map.Surjective.Surjective second)
    (firstSurjective : LRA.Map.Surjective.Surjective first) :
    LRA.Map.Surjective.Surjective (Compose second first) := by
  sorry
/--
**[Theorem — BijectiveCompose]**

The composition of bijective maps is bijective.

Logical form:

```lean
theorem BijectiveCompose
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {second : TypedMap Middle Codomain}
    {first : TypedMap Domain Middle}
    (secondBijective : LRA.Map.Bijective.Bijective second)
    (firstBijective : LRA.Map.Bijective.Bijective first) :
    LRA.Map.Bijective.Bijective (Compose second first)
```
-/
theorem BijectiveCompose
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {second : TypedMap Middle Codomain}
    {first : TypedMap Domain Middle}
    (secondBijective : LRA.Map.Bijective.Bijective second)
    (firstBijective : LRA.Map.Bijective.Bijective first) :
    LRA.Map.Bijective.Bijective (Compose second first) := by
  sorry
/--
**[Theorem — LeftInverseCompose]**

Left inverses compose in reverse order.

Logical form:

```lean
theorem LeftInverseCompose
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {second : TypedMap Middle Codomain}
    {first : TypedMap Domain Middle}
    {secondInverse : TypedMap Codomain Middle}
    {firstInverse : TypedMap Middle Domain}
    (secondLeftInverse :
      LRA.Map.Inverse.LeftInverse second secondInverse)
    (firstLeftInverse :
      LRA.Map.Inverse.LeftInverse first firstInverse) :
    LRA.Map.Inverse.LeftInverse
      (Compose second first)
      (Compose firstInverse secondInverse)
```
-/
theorem LeftInverseCompose
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {second : TypedMap Middle Codomain}
    {first : TypedMap Domain Middle}
    {secondInverse : TypedMap Codomain Middle}
    {firstInverse : TypedMap Middle Domain}
    (secondLeftInverse :
      LRA.Map.Inverse.LeftInverse second secondInverse)
    (firstLeftInverse :
      LRA.Map.Inverse.LeftInverse first firstInverse) :
    LRA.Map.Inverse.LeftInverse
      (Compose second first)
      (Compose firstInverse secondInverse) := by
  sorry
/--
**[Theorem — RightInverseCompose]**

Right inverses compose in reverse order.

Logical form:

```lean
theorem RightInverseCompose
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {second : TypedMap Middle Codomain}
    {first : TypedMap Domain Middle}
    {secondInverse : TypedMap Codomain Middle}
    {firstInverse : TypedMap Middle Domain}
    (secondRightInverse :
      LRA.Map.Inverse.RightInverse second secondInverse)
    (firstRightInverse :
      LRA.Map.Inverse.RightInverse first firstInverse) :
    LRA.Map.Inverse.RightInverse
      (Compose second first)
      (Compose firstInverse secondInverse)
```
-/
theorem RightInverseCompose
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {second : TypedMap Middle Codomain}
    {first : TypedMap Domain Middle}
    {secondInverse : TypedMap Codomain Middle}
    {firstInverse : TypedMap Middle Domain}
    (secondRightInverse :
      LRA.Map.Inverse.RightInverse second secondInverse)
    (firstRightInverse :
      LRA.Map.Inverse.RightInverse first firstInverse) :
    LRA.Map.Inverse.RightInverse
      (Compose second first)
      (Compose firstInverse secondInverse) := by
  sorry
/--
**[Theorem — TwoSidedInverseCompose]**

Two-sided inverses compose in reverse order.

Logical form:

```lean
theorem TwoSidedInverseCompose
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {second : TypedMap Middle Codomain}
    {first : TypedMap Domain Middle}
    {secondInverse : TypedMap Codomain Middle}
    {firstInverse : TypedMap Middle Domain}
    (secondTwoSided :
      LRA.Map.Inverse.TwoSidedInverse second secondInverse)
    (firstTwoSided :
      LRA.Map.Inverse.TwoSidedInverse first firstInverse) :
    LRA.Map.Inverse.TwoSidedInverse
      (Compose second first)
      (Compose firstInverse secondInverse)
```
-/
theorem TwoSidedInverseCompose
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {second : TypedMap Middle Codomain}
    {first : TypedMap Domain Middle}
    {secondInverse : TypedMap Codomain Middle}
    {firstInverse : TypedMap Middle Domain}
    (secondTwoSided :
      LRA.Map.Inverse.TwoSidedInverse second secondInverse)
    (firstTwoSided :
      LRA.Map.Inverse.TwoSidedInverse first firstInverse) :
    LRA.Map.Inverse.TwoSidedInverse
      (Compose second first)
      (Compose firstInverse secondInverse) := by
  sorry
end LRA.Map.Composition
