import LRA.VolumeI.Map.Section.Theorems
import LRA.VolumeI.Map.Section.Definition
import LRA.VolumeI.Map.Surjective.Definition

namespace LRA.Map.Section

open LRA.Map.Typed

universe u v

/--
**[Theorem — SurjectiveOfSection]**

If a map has a section, then it is surjective.

Logical form:

```lean
theorem SurjectiveOfSection
    {Domain : Type u} {Codomain : Type v}
    {sectionMap : TypedMap Codomain Domain}
    {map : TypedMap Domain Codomain}
    (isSection : SectionOf sectionMap map) :
    LRA.Map.Surjective.Surjective map
```
-/
theorem SurjectiveOfSection
    {Domain : Type u} {Codomain : Type v}
    {sectionMap : TypedMap Codomain Domain}
    {map : TypedMap Domain Codomain}
    (isSection : SectionOf sectionMap map) :
    LRA.Map.Surjective.Surjective map := by
  sorry
end LRA.Map.Section
