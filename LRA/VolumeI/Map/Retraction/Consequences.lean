import LRA.VolumeI.Map.Retraction.Definition
import LRA.VolumeI.Map.Inverse.Definition
import LRA.VolumeI.Map.Surjective.Definition

namespace LRA.Map.Retraction

open LRA.Map.Typed

universe u v

/-- A retraction of `inclusion` is exactly a left inverse of `inclusion`. -/
theorem RetractionOfIffLeftInverse
    {Small : Type u} {Large : Type v}
    (retraction : TypedMap Large Small)
    (inclusion : TypedMap Small Large) :
    RetractionOf retraction inclusion <->
      LRA.Map.Inverse.LeftInverse inclusion retraction := by
  sorry

/-- Every retraction map is surjective onto the smaller type. -/
theorem RetractionIsSurjective
    {Small : Type u} {Large : Type v}
    {retraction : TypedMap Large Small}
    {inclusion : TypedMap Small Large}
    (retractionOf : RetractionOf retraction inclusion) :
    LRA.Map.Surjective.Surjective retraction := by
  sorry

end LRA.Map.Retraction
