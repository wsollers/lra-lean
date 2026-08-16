import LRA.VolumeI.Map.Inverse.Theorems
import LRA.VolumeI.Map.Inverse.Definition
import LRA.VolumeI.Map.Injective.Definition
import LRA.VolumeI.Map.Surjective.Definition

namespace LRA.Map.Inverse

open LRA.Map.Typed

universe u v

/--
Having a left inverse forces the original map to be injective.
-/
theorem InjectiveOfLeftInverse
    {Domain : Type u} {Codomain : Type v}
    {map : TypedMap Domain Codomain}
    {inverse : TypedMap Codomain Domain}
    (leftInverse : LeftInverse map inverse) :
    LRA.Map.Injective.Injective map := by
  intro first second equalValues
  calc
    first = inverse (map first) := (leftInverse first).symm
    _ = inverse (map second) := by rw [equalValues]
    _ = second := leftInverse second

/--
Having a right inverse forces the original map to be surjective.
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
A two-sided inverse gives injectivity and surjectivity.
-/
theorem InjectiveAndSurjectiveOfTwoSidedInverse
    {Domain : Type u} {Codomain : Type v}
    {map : TypedMap Domain Codomain}
    {inverse : TypedMap Codomain Domain}
    (twoSided : TwoSidedInverse map inverse) :
    LRA.Map.Injective.Injective map /\ LRA.Map.Surjective.Surjective map :=
  ⟨InjectiveOfLeftInverse twoSided.left,
    SurjectiveOfRightInverse twoSided.right⟩

end LRA.Map.Inverse
