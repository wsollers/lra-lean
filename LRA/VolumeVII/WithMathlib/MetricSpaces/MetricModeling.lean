import Mathlib.Topology.MetricSpace.Basic

namespace LRA.VolumeVII.WithMathlib

/-!
Scratch metric-space modeling.

These definitions are kept as a learning model for the raw proof obligations
behind a metric. The main development should use Mathlib's `[MetricSpace X]`
typeclass API.
-/

/-- A scratch metric on a type of points.

This is a pedagogical bundled structure, not the main metric-space interface for
Volume VII. -/
structure ScratchMetric (Point : Type u) where
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

/-- A scratch metric space is a type of points equipped with a scratch metric. -/
structure ScratchMetricSpace (Point : Type u) where
  /-- The scratch metric carried by this pedagogical metric space. -/
  metric : ScratchMetric Point

namespace ScratchMetricSpace

variable {Point : Type u} (M : ScratchMetricSpace Point)

/-- The distance function of a scratch metric space. -/
def distance (x y : Point) : Real :=
  M.metric.distance x y

/-- The distance from a point to itself is zero in a scratch metric space. -/
theorem distance_self (x : Point) : M.distance x x = 0 :=
  (M.metric.distance_eq_zero_iff_equal x x).mpr rfl

/-- Points at zero distance are equal in a scratch metric space. -/
theorem equal_of_distance_eq_zero
    {x y : Point} (hypothesis : M.distance x y = 0) : x = y :=
  (M.metric.distance_eq_zero_iff_equal x y).mp hypothesis

/-- Equal points have zero distance in a scratch metric space. -/
theorem distance_eq_zero_of_equal
    {x y : Point} (hypothesis : x = y) : M.distance x y = 0 :=
  (M.metric.distance_eq_zero_iff_equal x y).mpr hypothesis

/-- Bridge a scratch metric space into Mathlib's metric-space hierarchy, once a
compatible topology has been supplied.

Mathlib's `MetricSpace` carries topology/uniformity data as part of the
typeclass. Therefore a completely arbitrary scratch metric cannot be converted
to a Mathlib `MetricSpace` without also saying that the ambient topology is the
one induced by the scratch distance. -/
noncomputable def toMathlibMetricSpace
    [TopologicalSpace Point]
    (topology_compatible :
      ∀ s : Set Point, IsOpen s ↔
        ∀ x ∈ s, ∃ ε > 0, ∀ y, M.distance x y < ε → y ∈ s) :
    _root_.MetricSpace Point :=
  _root_.MetricSpace.ofDistTopology
    M.distance
    (fun x => M.distance_self x)
    (fun x y => M.metric.distance_symmetric x y)
    (fun x y z => M.metric.distance_triangle x y z)
    topology_compatible
    (fun _ _ h => M.equal_of_distance_eq_zero h)

end ScratchMetricSpace

end LRA.VolumeVII.WithMathlib
