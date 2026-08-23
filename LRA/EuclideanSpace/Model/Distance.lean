import LRA.EuclideanSpace.Model.EuclideanN

namespace LRA.EuclideanSpace

open LRA.NumberSystems.Models

/-!
Distance (length): the actual, unsquared length of a segment, built from
`squaredDistance` (`Model.EuclideanN`) and the real model's own `Sqrt`
operation (`LRA.NumberSystems.Models.Sqrt`). Kept as its own definition
rather than folded into `squaredDistance` precisely because it is the one
that needs a square root, not just field and order operations.
-/

/-- The distance between two points: the nonnegative square root of
their squared distance. -/
noncomputable def Length (real_model : RealModel) {n : ℕ}
    (x y : Rn real_model n) : RealCoordinate real_model :=
  Sqrt.sqrt (squaredDistance real_model x y)

/-- Distance is never negative -- immediate from `SqrtLaws`, since
`Length` is nothing but a square root. -/
theorem Length_nonneg (real_model : RealModel) {n : ℕ} (x y : Rn real_model n) :
    0 ≤ Length real_model x y :=
  SqrtLaws.sqrt_nonneg (squaredDistance real_model x y)

/-- The distance from a point to itself is `0`. -/
theorem Length_self (real_model : RealModel) {n : ℕ} (x : Rn real_model n) :
    Length real_model x x = 0 := by
  sorry

/-- Distance squares back to `squaredDistance`. -/
theorem Length_sq (real_model : RealModel) {n : ℕ} (x y : Rn real_model n) :
    Length real_model x y * Length real_model x y = squaredDistance real_model x y := by
  sorry

end LRA.EuclideanSpace
