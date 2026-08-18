import LRA.VolumeI.Function.Retraction.Theorems
import LRA.VolumeI.Function.Retraction.Definition
import LRA.VolumeI.Function.Injective.Definition

namespace LRA.Function.Retraction

open LRA.Function

universe u v

/--
**[Theorem — InjectiveOfRetraction]**

If `retraction` retracts an inclusion-like map, then the inclusion-like map is
injective.

Logical form:

```lean
theorem InjectiveOfRetraction
    {Small : Type u} {Large : Type v}
    {retraction : Function Large Small}
    {inclusion : Function Small Large}
    (isRetraction : RetractionOf retraction inclusion) :
    LRA.Function.Injective.Injective inclusion
```
-/
theorem InjectiveOfRetraction
    {Small : Type u} {Large : Type v}
    {retraction : Function Large Small}
    {inclusion : Function Small Large}
    (isRetraction : RetractionOf retraction inclusion) :
    LRA.Function.Injective.Injective inclusion := by
  sorry
end LRA.Function.Retraction
