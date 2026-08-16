import LRA.VolumeI.Map.Section.Definition
import LRA.VolumeI.Map.Inverse.Definition
import LRA.VolumeI.Map.Injective.Definition

namespace LRA.Map.Section

open LRA.Map.Typed

universe u v

/-- A section of `map` is exactly a right inverse of `map`. -/
theorem SectionOfIffRightInverse
    {Domain : Type u} {Codomain : Type v}
    (sectionMap : TypedMap Codomain Domain)
    (map : TypedMap Domain Codomain) :
    SectionOf sectionMap map <->
      LRA.Map.Inverse.RightInverse map sectionMap := by
  rfl

/-- Every section is injective. -/
theorem SectionIsInjective
    {Domain : Type u} {Codomain : Type v}
    {sectionMap : TypedMap Codomain Domain}
    {map : TypedMap Domain Codomain}
    (sectionOf : SectionOf sectionMap map) :
    LRA.Map.Injective.Injective sectionMap := by
  intro left right sectionsEqual
  have mappedEqual : map (sectionMap left) = map (sectionMap right) := by
    rw [sectionsEqual]
  rw [sectionOf left, sectionOf right] at mappedEqual
  exact mappedEqual

end LRA.Map.Section
