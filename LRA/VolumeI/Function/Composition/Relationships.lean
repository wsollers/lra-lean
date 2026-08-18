import LRA.VolumeI.Function.Composition.Theorems
import LRA.VolumeI.Function.Injective.Definition
import LRA.VolumeI.Function.Surjective.Definition
import LRA.VolumeI.Function.Bijective.Definition
import LRA.VolumeI.Function.Inverse.Definition

namespace LRA.Function.Composition

open LRA.Function

universe u v w

/--
**[Theorem — InjectiveComposition]**

The composition of injective maps is injective.

Logical form:

```lean
theorem InjectiveComposition
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {second : Function Middle Codomain}
    {first : Function Domain Middle}
    (secondInjective : LRA.Function.Injective.Injective second)
    (firstInjective : LRA.Function.Injective.Injective first) :
    LRA.Function.Injective.Injective (Composition second first)
```
-/
theorem InjectiveComposition
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {second : Function Middle Codomain}
    {first : Function Domain Middle}
    (secondInjective : LRA.Function.Injective.Injective second)
    (firstInjective : LRA.Function.Injective.Injective first) :
    LRA.Function.Injective.Injective (Composition second first) := by
  sorry
/--
**[Theorem — SurjectiveComposition]**

The composition of surjective maps is surjective.

Logical form:

```lean
theorem SurjectiveComposition
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {second : Function Middle Codomain}
    {first : Function Domain Middle}
    (secondSurjective : LRA.Function.Surjective.Surjective second)
    (firstSurjective : LRA.Function.Surjective.Surjective first) :
    LRA.Function.Surjective.Surjective (Composition second first)
```
-/
theorem SurjectiveComposition
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {second : Function Middle Codomain}
    {first : Function Domain Middle}
    (secondSurjective : LRA.Function.Surjective.Surjective second)
    (firstSurjective : LRA.Function.Surjective.Surjective first) :
    LRA.Function.Surjective.Surjective (Composition second first) := by
  sorry
/--
**[Theorem — BijectiveComposition]**

The composition of bijective maps is bijective.

Logical form:

```lean
theorem BijectiveComposition
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {second : Function Middle Codomain}
    {first : Function Domain Middle}
    (secondBijective : LRA.Function.Bijective.Bijective second)
    (firstBijective : LRA.Function.Bijective.Bijective first) :
    LRA.Function.Bijective.Bijective (Composition second first)
```
-/
theorem BijectiveComposition
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {second : Function Middle Codomain}
    {first : Function Domain Middle}
    (secondBijective : LRA.Function.Bijective.Bijective second)
    (firstBijective : LRA.Function.Bijective.Bijective first) :
    LRA.Function.Bijective.Bijective (Composition second first) := by
  sorry
/--
**[Theorem — LeftInverseComposition]**

Left inverses compose in reverse order.

Logical form:

```lean
theorem LeftInverseComposition
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {second : Function Middle Codomain}
    {first : Function Domain Middle}
    {secondInverse : Function Codomain Middle}
    {firstInverse : Function Middle Domain}
    (secondLeftInverse :
      LRA.Function.Inverse.LeftInverse second secondInverse)
    (firstLeftInverse :
      LRA.Function.Inverse.LeftInverse first firstInverse) :
    LRA.Function.Inverse.LeftInverse
      (Composition second first)
      (Composition firstInverse secondInverse)
```
-/
theorem LeftInverseComposition
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {second : Function Middle Codomain}
    {first : Function Domain Middle}
    {secondInverse : Function Codomain Middle}
    {firstInverse : Function Middle Domain}
    (secondLeftInverse :
      LRA.Function.Inverse.LeftInverse second secondInverse)
    (firstLeftInverse :
      LRA.Function.Inverse.LeftInverse first firstInverse) :
    LRA.Function.Inverse.LeftInverse
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
    {second : Function Middle Codomain}
    {first : Function Domain Middle}
    {secondInverse : Function Codomain Middle}
    {firstInverse : Function Middle Domain}
    (secondRightInverse :
      LRA.Function.Inverse.RightInverse second secondInverse)
    (firstRightInverse :
      LRA.Function.Inverse.RightInverse first firstInverse) :
    LRA.Function.Inverse.RightInverse
      (Composition second first)
      (Composition firstInverse secondInverse)
```
-/
theorem RightInverseComposition
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {second : Function Middle Codomain}
    {first : Function Domain Middle}
    {secondInverse : Function Codomain Middle}
    {firstInverse : Function Middle Domain}
    (secondRightInverse :
      LRA.Function.Inverse.RightInverse second secondInverse)
    (firstRightInverse :
      LRA.Function.Inverse.RightInverse first firstInverse) :
    LRA.Function.Inverse.RightInverse
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
    {second : Function Middle Codomain}
    {first : Function Domain Middle}
    {secondInverse : Function Codomain Middle}
    {firstInverse : Function Middle Domain}
    (secondTwoSided :
      LRA.Function.Inverse.TwoSidedInverse second secondInverse)
    (firstTwoSided :
      LRA.Function.Inverse.TwoSidedInverse first firstInverse) :
    LRA.Function.Inverse.TwoSidedInverse
      (Composition second first)
      (Composition firstInverse secondInverse)
```
-/
theorem TwoSidedInverseComposition
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {second : Function Middle Codomain}
    {first : Function Domain Middle}
    {secondInverse : Function Codomain Middle}
    {firstInverse : Function Middle Domain}
    (secondTwoSided :
      LRA.Function.Inverse.TwoSidedInverse second secondInverse)
    (firstTwoSided :
      LRA.Function.Inverse.TwoSidedInverse first firstInverse) :
    LRA.Function.Inverse.TwoSidedInverse
      (Composition second first)
      (Composition firstInverse secondInverse) := by
  sorry
end LRA.Function.Composition
