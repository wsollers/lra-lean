import LRA.VolumeI.Map.Retraction.Theorems
import LRA.VolumeI.Map.Retraction.Definition
import LRA.VolumeI.Map.Injective.Definition

namespace LRA.Map.Retraction

open LRA.Map.Typed

universe u v

/--
**[Theorem — InjectiveOfRetraction]**

If `retraction` retracts an inclusion-like map, then the inclusion-like map is
injective.

Logical form:

```lean
theorem InjectiveOfRetraction
    {Small : Type u} {Large : Type v}
    {retraction : TypedMap Large Small}
    {inclusion : TypedMap Small Large}
    (isRetraction : RetractionOf retraction inclusion) :
    LRA.Map.Injective.Injective inclusion
```
-/
theorem InjectiveOfRetraction
    {Small : Type u} {Large : Type v}
    {retraction : TypedMap Large Small}
    {inclusion : TypedMap Small Large}
    (isRetraction : RetractionOf retraction inclusion) :
    LRA.Map.Injective.Injective inclusion := by
  sorry
end LRA.Map.Retraction
