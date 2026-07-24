import LRA.VolumeVII.WithMathlib.MetricSpaces.MetricSpace
import Mathlib.Data.Real.Archimedean

namespace LRA.VolumeVII.WithMathlib

/-! Set distance in metric spaces. -/

/-- The set of distances from a point to the points of a set. -/
def distanceSet
    {Point : Type u}
    (M : MetricSpace Point)
    (x : Point)
    (S : Set Point) : Set Real :=
  (fun y : Point => M.distance x y) '' S

/-- The distance from a point to a set in an ambient metric space. -/
noncomputable def distanceToSet
    {Point : Type u}
    (M : MetricSpace Point)
    (x : Point)
    (S : Set Point) : Real :=
  sInf (distanceSet M x S)

/-- If the original set is nonempty, then its distance set is nonempty. -/
theorem distanceSet_nonempty
    {Point : Type u}
    (M : MetricSpace Point)
    (x : Point)
    {S : Set Point}
    (set_nonempty : S.Nonempty) :
    (distanceSet M x S).Nonempty := by
  sorry

/-- The distance set is bounded below by zero. -/
theorem distanceSet_bddBelow
    {Point : Type u}
    (M : MetricSpace Point)
    (x : Point)
    (S : Set Point) :
    BddBelow (distanceSet M x S) := by
  exact M.distance_image_bddBelow x S

/-- The point-to-set distance is the infimum of all distances from the point to
points in the set. -/
theorem distanceToSet_isGLB
    {Point : Type u}
    (M : MetricSpace Point)
    (x : Point)
    {S : Set Point}
    (set_nonempty : S.Nonempty) :
    IsGLB (distanceSet M x S) (distanceToSet M x S) := by
  sorry

/-- The point-to-set distance is bounded above by the distance to any witness
point in the set. -/
theorem distanceToSet_le_distance_to_point_of_mem
    {Point : Type u}
    (M : MetricSpace Point)
    (x : Point)
    {A : Set Point}
    {a : Point}
    (point_in_set : a ∈ A) :
    distanceToSet M x A ≤ M.distance x a := by
  have A_nonempty : A.Nonempty := ⟨a, point_in_set⟩
  have distance_value_in_set :
      M.distance x a ∈ distanceSet M x A := by
    exact ⟨a, point_in_set, rfl⟩
  have infimum_property :
      IsGLB (distanceSet M x A) (distanceToSet M x A) := by
    exact distanceToSet_isGLB M x A_nonempty
  exact infimum_property.1 distance_value_in_set

/-- The distance from a point to a set is zero when the point belongs to the
set. -/
theorem distanceToSet_eq_zero_of_mem
    {Point : Type u}
    (M : MetricSpace Point)
    {A : Set Point}
    {x : Point}
    (point_in_set : x ∈ A) :
    distanceToSet M x A = 0 := by
  have distanceToSet_nonnegative : 0 ≤ distanceToSet M x A := by
    have A_nonempty : A.Nonempty := ⟨x, point_in_set⟩
    have infimum_property :
        IsGLB (distanceSet M x A) (distanceToSet M x A) := by
      exact distanceToSet_isGLB M x A_nonempty
    have zero_lower_bound : 0 ∈ lowerBounds (distanceSet M x A) := by
      intro r distance_value_in_set
      rcases distance_value_in_set with ⟨y, _point_in_set, rfl⟩
      exact M.metric.distance_nonnegative x y
    exact infimum_property.2 zero_lower_bound
  have distanceToSet_nonpositive : distanceToSet M x A ≤ 0 := by
    calc
      distanceToSet M x A ≤ M.distance x x := by
        exact distanceToSet_le_distance_to_point_of_mem M x point_in_set
      _ = 0 := by
        exact M.distance_self x
  exact le_antisymm distanceToSet_nonpositive distanceToSet_nonnegative

end LRA.VolumeVII.WithMathlib
