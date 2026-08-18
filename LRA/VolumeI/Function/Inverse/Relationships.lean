import LRA.VolumeI.Function.Inverse.Theorems
import LRA.VolumeI.Function.Inverse.Definition
import LRA.VolumeI.Function.Injective.Definition
import LRA.VolumeI.Function.Surjective.Definition

namespace LRA.Function.Inverse

open LRA.Function

universe u v

/--
**[Theorem — InjectiveOfLeftInverse]**

Having a left inverse forces the original map to be injective.

Logical form:

```lean
theorem InjectiveOfLeftInverse
    {Domain : Type u} {Codomain : Type v}
    {map : Function Domain Codomain}
    {inverse : Function Codomain Domain}
    (leftInverse : LeftInverse map inverse) :
    LRA.Function.Injective.Injective map
```
-/
theorem InjectiveOfLeftInverse
    {Domain : Type u} {Codomain : Type v}
    {map : Function Domain Codomain}
    {inverse : Function Codomain Domain}
    (leftInverse : LeftInverse map inverse) :
    LRA.Function.Injective.Injective map := by
  sorry
/--
**[Theorem — SurjectiveOfRightInverse]**

Having a right inverse forces the original map to be surjective.

Logical form:

```lean
theorem SurjectiveOfRightInverse
    {Domain : Type u} {Codomain : Type v}
    {map : Function Domain Codomain}
    {inverse : Function Codomain Domain}
    (rightInverse : RightInverse map inverse) :
    LRA.Function.Surjective.Surjective map
```
-/
theorem SurjectiveOfRightInverse
    {Domain : Type u} {Codomain : Type v}
    {map : Function Domain Codomain}
    {inverse : Function Codomain Domain}
    (rightInverse : RightInverse map inverse) :
    LRA.Function.Surjective.Surjective map := by
  sorry
/--
**[Theorem — InjectiveAndSurjectiveOfTwoSidedInverse]**

A two-sided inverse gives injectivity and surjectivity.

Logical form:

```lean
theorem InjectiveAndSurjectiveOfTwoSidedInverse
    {Domain : Type u} {Codomain : Type v}
    {map : Function Domain Codomain}
    {inverse : Function Codomain Domain}
    (twoSided : TwoSidedInverse map inverse) :
    LRA.Function.Injective.Injective map /\ LRA.Function.Surjective.Surjective map
```
-/
theorem InjectiveAndSurjectiveOfTwoSidedInverse
    {Domain : Type u} {Codomain : Type v}
    {map : Function Domain Codomain}
    {inverse : Function Codomain Domain}
    (twoSided : TwoSidedInverse map inverse) :
    LRA.Function.Injective.Injective map /\ LRA.Function.Surjective.Surjective map := by
  sorry
end LRA.Function.Inverse
