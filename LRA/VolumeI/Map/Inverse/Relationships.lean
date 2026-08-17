import LRA.VolumeI.Map.Inverse.Theorems
import LRA.VolumeI.Map.Inverse.Definition
import LRA.VolumeI.Map.Injective.Definition
import LRA.VolumeI.Map.Surjective.Definition

namespace LRA.Map.Inverse

open LRA.Map.Typed

universe u v

/--
**[Theorem — InjectiveOfLeftInverse]**

Having a left inverse forces the original map to be injective.

Logical form:

```lean
theorem InjectiveOfLeftInverse
    {Domain : Type u} {Codomain : Type v}
    {map : TypedMap Domain Codomain}
    {inverse : TypedMap Codomain Domain}
    (leftInverse : LeftInverse map inverse) :
    LRA.Map.Injective.Injective map
```
-/
theorem InjectiveOfLeftInverse
    {Domain : Type u} {Codomain : Type v}
    {map : TypedMap Domain Codomain}
    {inverse : TypedMap Codomain Domain}
    (leftInverse : LeftInverse map inverse) :
    LRA.Map.Injective.Injective map := by
  intro first second sameOutput
  calc
    first = inverse (map first) := (leftInverse first).symm
    _ = inverse (map second) := congrArg inverse sameOutput
    _ = second := leftInverse second
/--
**[Theorem — SurjectiveOfRightInverse]**

Having a right inverse forces the original map to be surjective.

Logical form:

```lean
theorem SurjectiveOfRightInverse
    {Domain : Type u} {Codomain : Type v}
    {map : TypedMap Domain Codomain}
    {inverse : TypedMap Codomain Domain}
    (rightInverse : RightInverse map inverse) :
    LRA.Map.Surjective.Surjective map
```
-/
theorem SurjectiveOfRightInverse
    {Domain : Type u} {Codomain : Type v}
    {map : TypedMap Domain Codomain}
    {inverse : TypedMap Codomain Domain}
    (rightInverse : RightInverse map inverse) :
    LRA.Map.Surjective.Surjective map := by
  intro output
  exact ⟨inverse output, rightInverse output⟩
/--
**[Theorem — InjectiveAndSurjectiveOfTwoSidedInverse]**

A two-sided inverse gives injectivity and surjectivity.

Logical form:

```lean
theorem InjectiveAndSurjectiveOfTwoSidedInverse
    {Domain : Type u} {Codomain : Type v}
    {map : TypedMap Domain Codomain}
    {inverse : TypedMap Codomain Domain}
    (twoSided : TwoSidedInverse map inverse) :
    LRA.Map.Injective.Injective map /\ LRA.Map.Surjective.Surjective map
```
-/
theorem InjectiveAndSurjectiveOfTwoSidedInverse
    {Domain : Type u} {Codomain : Type v}
    {map : TypedMap Domain Codomain}
    {inverse : TypedMap Codomain Domain}
    (twoSided : TwoSidedInverse map inverse) :
    LRA.Map.Injective.Injective map /\ LRA.Map.Surjective.Surjective map := by
  exact
    ⟨InjectiveOfLeftInverse twoSided.1,
      SurjectiveOfRightInverse twoSided.2⟩
end LRA.Map.Inverse
