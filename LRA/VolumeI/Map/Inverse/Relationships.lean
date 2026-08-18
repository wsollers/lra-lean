import LRA.VolumeI.Map.Inverse.Theorems
import LRA.VolumeI.Map.Inverse.Definition
import LRA.Function.Definition
import LRA.Function.Properties.Definition

namespace LRA.Map.Inverse


universe u v

/--
**[Theorem — InjectiveOfLeftInverse]**

Having a left inverse forces the original map to be injective.

Logical form:

```lean
theorem InjectiveOfLeftInverse
    {Domain : Type u} {Codomain : Type v}
    {map : LRA.Function Domain Codomain}
    {inverse : LRA.Function Codomain Domain}
    (leftInverse : LeftInverse map inverse) :
    LRA.Function.Injective map
```
-/
theorem InjectiveOfLeftInverse
    {Domain : Type u} {Codomain : Type v}
    {map : LRA.Function Domain Codomain}
    {inverse : LRA.Function Codomain Domain}
    (leftInverse : LeftInverse map inverse) :
    LRA.Function.Injective map := by
  sorry
/--
**[Theorem — SurjectiveOfRightInverse]**

Having a right inverse forces the original map to be surjective.

Logical form:

```lean
theorem SurjectiveOfRightInverse
    {Domain : Type u} {Codomain : Type v}
    {map : LRA.Function Domain Codomain}
    {inverse : LRA.Function Codomain Domain}
    (rightInverse : RightInverse map inverse) :
    LRA.Function.Surjective map
```
-/
theorem SurjectiveOfRightInverse
    {Domain : Type u} {Codomain : Type v}
    {map : LRA.Function Domain Codomain}
    {inverse : LRA.Function Codomain Domain}
    (rightInverse : RightInverse map inverse) :
    LRA.Function.Surjective map := by
  sorry
/--
**[Theorem — InjectiveAndSurjectiveOfTwoSidedInverse]**

A two-sided inverse gives injectivity and surjectivity.

Logical form:

```lean
theorem InjectiveAndSurjectiveOfTwoSidedInverse
    {Domain : Type u} {Codomain : Type v}
    {map : LRA.Function Domain Codomain}
    {inverse : LRA.Function Codomain Domain}
    (twoSided : TwoSidedInverse map inverse) :
    LRA.Function.Injective map /\ LRA.Function.Surjective map
```
-/
theorem InjectiveAndSurjectiveOfTwoSidedInverse
    {Domain : Type u} {Codomain : Type v}
    {map : LRA.Function Domain Codomain}
    {inverse : LRA.Function Codomain Domain}
    (twoSided : TwoSidedInverse map inverse) :
    LRA.Function.Injective map /\ LRA.Function.Surjective map := by
  sorry
end LRA.Map.Inverse
