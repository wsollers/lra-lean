import LRA.VolumeI.Function.Section.Theorems
import LRA.VolumeI.Function.Section.Definition
import LRA.VolumeI.Function.Surjective.Definition

namespace LRA.Function.Section

open LRA.Function

universe u v

/--
**[Theorem — SurjectiveOfSection]**

If a map has a section, then it is surjective.

Logical form:

```lean
theorem SurjectiveOfSection
    {Domain : Type u} {Codomain : Type v}
    {sectionMap : Function Codomain Domain}
    {map : Function Domain Codomain}
    (isSection : SectionOf sectionMap map) :
    LRA.Function.Surjective.Surjective map
```
-/
theorem SurjectiveOfSection
    {Domain : Type u} {Codomain : Type v}
    {sectionMap : Function Codomain Domain}
    {map : Function Domain Codomain}
    (isSection : SectionOf sectionMap map) :
    LRA.Function.Surjective.Surjective map := by
  sorry
end LRA.Function.Section
