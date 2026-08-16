import LRA.VolumeI.Map.Retraction.Theorems
import LRA.VolumeI.Map.Retraction.Definition
import LRA.VolumeI.Map.Injective.Definition

namespace LRA.Map.Retraction

open LRA.Map.Typed

universe u v

/--
If `retraction` retracts an inclusion-like map, then the inclusion-like map is
injective.
-/
theorem InjectiveOfRetraction
    {Small : Type u} {Large : Type v}
    {retraction : TypedMap Large Small}
    {inclusion : TypedMap Small Large}
    (isRetraction : RetractionOf retraction inclusion) :
    LRA.Map.Injective.Injective inclusion := by
  intro first second equalValues
  calc
    first = retraction (inclusion first) := (isRetraction first).symm
    _ = retraction (inclusion second) := by rw [equalValues]
    _ = second := isRetraction second

end LRA.Map.Retraction
