import LRA.VolumeI.Function.Section.Definition
import LRA.VolumeI.Function.Inverse.Definition
import LRA.VolumeI.Function.Injective.Definition

namespace LRA.Function.Section

open LRA.Function

universe u v

/-- A section of `map` is exactly a right inverse of `map`. -/
theorem SectionOfIffRightInverse
    {Domain : Type u} {Codomain : Type v}
    (sectionMap : Function Codomain Domain)
    (map : Function Domain Codomain) :
    SectionOf sectionMap map <->
      LRA.Function.Inverse.RightInverse map sectionMap := by
  sorry

/-- Every section is injective. -/
theorem SectionIsInjective
    {Domain : Type u} {Codomain : Type v}
    {sectionMap : Function Codomain Domain}
    {map : Function Domain Codomain}
    (sectionOf : SectionOf sectionMap map) :
    LRA.Function.Injective.Injective sectionMap := by
  sorry

end LRA.Function.Section
