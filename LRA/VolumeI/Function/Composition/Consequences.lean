import LRA.VolumeI.Function.Composition.Definition
import LRA.VolumeI.Function.Injective.Definition
import LRA.VolumeI.Function.Surjective.Definition

namespace LRA.Function.Composition

open LRA.Function

universe u v w

/-- If a composite is injective, then its first factor is injective. -/
theorem CompositeInjectiveImpliesFirstInjective
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {first : Function Domain Middle}
    {second : Function Middle Codomain}
    (compositeInjective :
      LRA.Function.Injective.Injective (Composition second first)) :
    LRA.Function.Injective.Injective first := by
  sorry

/-- If a composite is surjective, then its second factor is surjective. -/
theorem CompositeSurjectiveImpliesSecondSurjective
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    {first : Function Domain Middle}
    {second : Function Middle Codomain}
    (compositeSurjective :
      LRA.Function.Surjective.Surjective (Composition second first)) :
    LRA.Function.Surjective.Surjective second := by
  sorry

end LRA.Function.Composition
