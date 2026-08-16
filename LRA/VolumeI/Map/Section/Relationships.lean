import LRA.VolumeI.Map.Section.Theorems
import LRA.VolumeI.Map.Section.Definition
import LRA.VolumeI.Map.Surjective.Definition

namespace LRA.Map.Section

open LRA.Map.Typed

universe u v

/--
If a map has a section, then it is surjective.
-/
theorem SurjectiveOfSection
    {Domain : Type u} {Codomain : Type v}
    {sectionMap : TypedMap Codomain Domain}
    {map : TypedMap Domain Codomain}
    (isSection : SectionOf sectionMap map) :
    LRA.Map.Surjective.Surjective map := by
  intro output
  exact ⟨sectionMap output, isSection output⟩

end LRA.Map.Section
