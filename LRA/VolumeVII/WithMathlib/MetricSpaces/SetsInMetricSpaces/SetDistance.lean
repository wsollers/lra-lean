import Mathlib.Topology.MetricSpace.Basic
import Mathlib.Data.Real.Archimedean

namespace LRA.VolumeVII.WithMathlib

/-! Set distance in metric spaces. -/

/-- The set of distances from a point to the points of a set. -/
def distanceSet
    {X : Type u}
    [MetricSpace X]
    (x : X)
    (S : Set X) : Set Real :=
  (fun y : X => dist x y) '' S

/-- The distance from a point to a set in an ambient metric space. -/
noncomputable def distanceToSet
    {X : Type u}
    [MetricSpace X]
    (x : X)
    (S : Set X) : Real :=
  sInf (distanceSet x S)

/-- If the original set is nonempty, then its distance set is nonempty. -/
theorem distanceSet_nonempty
    {X : Type u}
    [MetricSpace X]
    (x : X)
    {S : Set X}
    (set_nonempty : S.Nonempty) :
    (distanceSet x S).Nonempty := by
  sorry

/-- The distance set is bounded below by zero. -/
theorem distanceSet_bddBelow
    {X : Type u}
    [MetricSpace X]
    (x : X)
    (S : Set X) :
    BddBelow (distanceSet x S) := by
  refine ⟨0, ?_⟩
  intro r distance_in_image
  rcases distance_in_image with ⟨y, _point_in_set, rfl⟩
  exact dist_nonneg

/-- The point-to-set distance is the infimum of all distances from the point to
points in the set. -/
theorem distanceToSet_isGLB
    {X : Type u}
    [MetricSpace X]
    (x : X)
    {S : Set X}
    (set_nonempty : S.Nonempty) :
    IsGLB (distanceSet x S) (distanceToSet x S) := by
  sorry

/-- The point-to-set distance is bounded above by the distance to any witness
point in the set. -/
theorem distanceToSet_le_distance_to_point_of_mem
    {X : Type u}
    [MetricSpace X]
    (x : X)
    {A : Set X}
    {a : X}
    (point_in_set : a ∈ A) :
    distanceToSet x A ≤ dist x a := by
  have A_nonempty : A.Nonempty := ⟨a, point_in_set⟩
  have distance_value_in_set :
      dist x a ∈ distanceSet x A := by
    exact ⟨a, point_in_set, rfl⟩
  have infimum_property :
      IsGLB (distanceSet x A) (distanceToSet x A) := by
    exact distanceToSet_isGLB x A_nonempty
  exact infimum_property.1 distance_value_in_set

/-- The distance from a point to a set is zero when the point belongs to the
set. -/
theorem distanceToSet_eq_zero_of_mem
    {X : Type u}
    [MetricSpace X]
    {A : Set X}
    {x : X}
    (point_in_set : x ∈ A) :
    distanceToSet x A = 0 := by
  have distanceToSet_nonnegative : 0 ≤ distanceToSet x A := by
    have A_nonempty : A.Nonempty := ⟨x, point_in_set⟩
    have infimum_property :
        IsGLB (distanceSet x A) (distanceToSet x A) := by
      exact distanceToSet_isGLB x A_nonempty
    have zero_lower_bound : 0 ∈ lowerBounds (distanceSet x A) := by
      intro r distance_value_in_set
      rcases distance_value_in_set with ⟨y, _point_in_set, rfl⟩
      exact dist_nonneg
    exact infimum_property.2 zero_lower_bound
  have distanceToSet_nonpositive : distanceToSet x A ≤ 0 := by
    calc
      distanceToSet x A ≤ dist x x := by
        exact distanceToSet_le_distance_to_point_of_mem x point_in_set
      _ = 0 := by
        exact dist_self x
  exact le_antisymm distanceToSet_nonpositive distanceToSet_nonnegative

end LRA.VolumeVII.WithMathlib
