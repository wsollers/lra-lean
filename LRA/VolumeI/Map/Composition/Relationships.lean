import LRA.VolumeI.Map.Composition.Theorems
import LRA.VolumeI.Map.Injective.Definition
import LRA.VolumeI.Map.Surjective.Definition
import LRA.VolumeI.Map.Bijective.Definition
import LRA.VolumeI.Map.Inverse.Definition

namespace LRA.Map.Composition

open LRA.Map.Typed

universe u v w

/--
The composition of injective maps is injective.
-/
theorem InjectiveCompose
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {second : TypedMap Middle Codomain}
    {first : TypedMap Domain Middle}
    (secondInjective : LRA.Map.Injective.Injective second)
    (firstInjective : LRA.Map.Injective.Injective first) :
    LRA.Map.Injective.Injective (Compose second first) := by
  intro input₁ input₂ equalOutputs
  exact firstInjective input₁ input₂
    (secondInjective (first input₁) (first input₂) equalOutputs)

/--
The composition of surjective maps is surjective.
-/
theorem SurjectiveCompose
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {second : TypedMap Middle Codomain}
    {first : TypedMap Domain Middle}
    (secondSurjective : LRA.Map.Surjective.Surjective second)
    (firstSurjective : LRA.Map.Surjective.Surjective first) :
    LRA.Map.Surjective.Surjective (Compose second first) := by
  intro output
  obtain ⟨middle, secondHits⟩ := secondSurjective output
  obtain ⟨input, firstHits⟩ := firstSurjective middle
  exact ⟨input, by
    calc
      second (first input) = second middle := by rw [firstHits]
      _ = output := secondHits⟩

/--
The composition of bijective maps is bijective.
-/
theorem BijectiveCompose
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {second : TypedMap Middle Codomain}
    {first : TypedMap Domain Middle}
    (secondBijective : LRA.Map.Bijective.Bijective second)
    (firstBijective : LRA.Map.Bijective.Bijective first) :
    LRA.Map.Bijective.Bijective (Compose second first) :=
  ⟨InjectiveCompose secondBijective.left firstBijective.left,
    SurjectiveCompose secondBijective.right firstBijective.right⟩

/--
Left inverses compose in reverse order.
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
  intro input
  calc
    firstInverse (secondInverse (second (first input))) =
        firstInverse (first input) := by rw [secondLeftInverse (first input)]
    _ = input := firstLeftInverse input

/--
Right inverses compose in reverse order.
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
  intro output
  calc
    second (first (firstInverse (secondInverse output))) =
        second (secondInverse output) := by rw [firstRightInverse (secondInverse output)]
    _ = output := secondRightInverse output

/--
Two-sided inverses compose in reverse order.
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
      (Compose firstInverse secondInverse) :=
  ⟨LeftInverseCompose secondTwoSided.left firstTwoSided.left,
    RightInverseCompose secondTwoSided.right firstTwoSided.right⟩

end LRA.Map.Composition
