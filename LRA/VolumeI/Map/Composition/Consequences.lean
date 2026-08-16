import LRA.VolumeI.Map.Composition.Definition
import LRA.VolumeI.Map.Injective.Definition
import LRA.VolumeI.Map.Surjective.Definition

namespace LRA.Map.Composition

open LRA.Map.Typed

universe u v w

/-- If a composite is injective, then its first factor is injective. -/
theorem CompositeInjectiveImpliesFirstInjective
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {first : TypedMap Domain Middle}
    {second : TypedMap Middle Codomain}
    (compositeInjective :
      LRA.Map.Injective.Injective (Compose second first)) :
    LRA.Map.Injective.Injective first := by
  intro left right firstValuesEqual
  apply compositeInjective
  unfold Compose Composition
  rw [firstValuesEqual]

/-- If a composite is surjective, then its second factor is surjective. -/
theorem CompositeSurjectiveImpliesSecondSurjective
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {first : TypedMap Domain Middle}
    {second : TypedMap Middle Codomain}
    (compositeSurjective :
      LRA.Map.Surjective.Surjective (Compose second first)) :
    LRA.Map.Surjective.Surjective second := by
  intro output
  rcases compositeSurjective output with ⟨input, mapsToOutput⟩
  exact ⟨first input, mapsToOutput⟩

end LRA.Map.Composition
