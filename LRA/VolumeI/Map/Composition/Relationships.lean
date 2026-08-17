import LRA.VolumeI.Map.Composition.Theorems
import LRA.VolumeI.Map.Injective.Definition
import LRA.VolumeI.Map.Surjective.Definition
import LRA.VolumeI.Map.Bijective.Definition
import LRA.VolumeI.Map.Inverse.Definition

namespace LRA.Map.Composition

open LRA.Map.Typed

universe u v w

/--
**[Theorem — InjectiveComposition]**

The composition of injective maps is injective.

Logical form:

```lean
theorem InjectiveComposition
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {second : TypedMap Middle Codomain}
    {first : TypedMap Domain Middle}
    (secondInjective : LRA.Map.Injective.Injective second)
    (firstInjective : LRA.Map.Injective.Injective first) :
    LRA.Map.Injective.Injective (Composition second first)
```
-/
theorem InjectiveComposition
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {second : TypedMap Middle Codomain}
    {first : TypedMap Domain Middle}
    (secondInjective : LRA.Map.Injective.Injective second)
    (firstInjective : LRA.Map.Injective.Injective first) :
    LRA.Map.Injective.Injective (Composition second first) := by
  sorry
/--
**[Theorem — SurjectiveComposition]**

The composition of surjective maps is surjective.

Logical form:

```lean
theorem SurjectiveComposition
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {second : TypedMap Middle Codomain}
    {first : TypedMap Domain Middle}
    (secondSurjective : LRA.Map.Surjective.Surjective second)
    (firstSurjective : LRA.Map.Surjective.Surjective first) :
    LRA.Map.Surjective.Surjective (Composition second first)
```
-/
theorem SurjectiveComposition
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {second : TypedMap Middle Codomain}
    {first : TypedMap Domain Middle}
    (secondSurjective : LRA.Map.Surjective.Surjective second)
    (firstSurjective : LRA.Map.Surjective.Surjective first) :
    LRA.Map.Surjective.Surjective (Composition second first) := by
  sorry
/--
**[Theorem — BijectiveComposition]**

The composition of bijective maps is bijective.

Logical form:

```lean
theorem BijectiveComposition
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {second : TypedMap Middle Codomain}
    {first : TypedMap Domain Middle}
    (secondBijective : LRA.Map.Bijective.Bijective second)
    (firstBijective : LRA.Map.Bijective.Bijective first) :
    LRA.Map.Bijective.Bijective (Composition second first)
```
-/
theorem BijectiveComposition
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {second : TypedMap Middle Codomain}
    {first : TypedMap Domain Middle}
    (secondBijective : LRA.Map.Bijective.Bijective second)
    (firstBijective : LRA.Map.Bijective.Bijective first) :
    LRA.Map.Bijective.Bijective (Composition second first) := by
  sorry
/--
**[Theorem — LeftInverseComposition]**

Left inverses compose in reverse order.

Logical form:

```lean
theorem LeftInverseComposition
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
      (Composition second first)
      (Composition firstInverse secondInverse)
```
-/
theorem LeftInverseComposition
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
      (Composition second first)
      (Composition firstInverse secondInverse) := by
  sorry
/--
**[Theorem — RightInverseComposition]**

Right inverses compose in reverse order.

Logical form:

```lean
theorem RightInverseComposition
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
      (Composition second first)
      (Composition firstInverse secondInverse)
```
-/
theorem RightInverseComposition
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
      (Composition second first)
      (Composition firstInverse secondInverse) := by
  sorry
/--
**[Theorem — TwoSidedInverseComposition]**

Two-sided inverses compose in reverse order.

Logical form:

```lean
theorem TwoSidedInverseComposition
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
      (Composition second first)
      (Composition firstInverse secondInverse)
```
-/
theorem TwoSidedInverseComposition
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
      (Composition second first)
      (Composition firstInverse secondInverse) := by
  sorry
end LRA.Map.Composition
