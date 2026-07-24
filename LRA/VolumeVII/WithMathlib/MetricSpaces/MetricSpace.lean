import Mathlib.Data.Real.Basic

namespace LRA.VolumeVII.WithMathlib

/-- A metric on a type of points, defined locally for Volume VII rather than
using Mathlib's metric-space interface.

The carrier type is an explicit parameter. The metric bundles the distance
function together with the proofs that it satisfies the metric axioms. -/
structure Metric (Point : Type u) where
  /-- The distance between two points. -/
  distance : Point -> Point -> Real
  /-- Distances are nonnegative. -/
  distance_nonnegative : ∀ x y : Point, 0 ≤ distance x y
  /-- Distance is zero exactly on equal points. -/
  distance_eq_zero_iff_equal : ∀ x y : Point, distance x y = 0 ↔ x = y
  /-- Distance is symmetric. -/
  distance_symmetric : ∀ x y : Point, distance x y = distance y x
  /-- Distance satisfies the triangle inequality. -/
  distance_triangle : ∀ x y z : Point, distance x z ≤ distance x y + distance y z

/-- A metric space is a type of points equipped with a metric. -/
structure MetricSpace (Point : Type u) where
  /-- The metric carried by this metric space. -/
  metric : Metric Point

namespace MetricSpace

variable {Point : Type u} (M : MetricSpace Point)

/-- The distance function of a metric space. -/
def distance (x y : Point) : Real :=
  M.metric.distance x y

/-- The distance from a point to itself is zero. -/
theorem distance_self (x : Point) : M.distance x x = 0 :=
  (M.metric.distance_eq_zero_iff_equal x x).mpr rfl

/-- Points at zero distance are equal. -/
theorem equal_of_distance_eq_zero
    {x y : Point} (hypothesis : M.distance x y = 0) : x = y :=
  (M.metric.distance_eq_zero_iff_equal x y).mp hypothesis

/-- Equal points have zero distance. -/
theorem distance_eq_zero_of_equal
    {x y : Point} (hypothesis : x = y) : M.distance x y = 0 :=
  (M.metric.distance_eq_zero_iff_equal x y).mpr hypothesis

/-- Distances from a fixed point to any set of points are bounded below. -/
theorem distance_image_bddBelow (x : Point) (S : Set Point) :
    BddBelow ((fun y : Point => M.distance x y) '' S) := by
  refine ⟨0, ?_⟩
  intro r distance_in_image
  rcases distance_in_image with ⟨y, _point_in_set, rfl⟩
  exact M.metric.distance_nonnegative x y

end MetricSpace

end LRA.VolumeVII.WithMathlib
