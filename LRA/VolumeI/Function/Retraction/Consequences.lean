import LRA.VolumeI.Function.Retraction.Definition
import LRA.VolumeI.Function.Inverse.Definition
import LRA.VolumeI.Function.Surjective.Definition

namespace LRA.Function.Retraction

open LRA.Function

universe u v

/-- A retraction of `inclusion` is exactly a left inverse of `inclusion`. -/
theorem RetractionOfIffLeftInverse
    {Small : Type u} {Large : Type v}
    (retraction : Function Large Small)
    (inclusion : Function Small Large) :
    RetractionOf retraction inclusion <->
      LRA.Function.Inverse.LeftInverse inclusion retraction := by
  sorry

/-- Every retraction map is surjective onto the smaller type. -/
theorem RetractionIsSurjective
    {Small : Type u} {Large : Type v}
    {retraction : Function Large Small}
    {inclusion : Function Small Large}
    (retractionOf : RetractionOf retraction inclusion) :
    LRA.Function.Surjective.Surjective retraction := by
  sorry

end LRA.Function.Retraction
