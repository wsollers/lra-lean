import Mathlib.Topology.MetricSpace.Basic
import Mathlib.Data.NNReal.Basic

/-!
Point functions and pointlike functions in metric spaces.
-/

namespace LRA.VolumeIV.MetricSpaces

universe u

variable {X : Type u} [MetricSpace X]

/-- Source: `def:metric-point-function`.

The point function determined by `z` sends `x` to the nonnegative real distance
`dist z x`.
-/
def pointFunction (z : X) : X → NNReal :=
  fun x => ⟨dist z x, dist_nonneg⟩

-- The source treats point functions as ℝ_{\ge 0}-valued. Mathlib's `dist`
-- is Real-valued, so `dist_nonneg` packages each distance as an `NNReal`.

/-- Source: `def:metric-point-function`.

The set of all point functions on a metric space.
-/
def pointFunctions (X : Type u) [MetricSpace X] : Set (X → NNReal) :=
  Set.range (pointFunction (X := X))

/-- Source: `def:metric-pointlike-function`.

A nonnegative-real-valued function is pointlike when it satisfies the two metric
inequalities from the source text. The subtraction and addition are interpreted
in `Real` after coercing from `NNReal`.
-/
def Pointlike (u : X → NNReal) : Prop :=
  ∀ a b : X,
    (u a : Real) - (u b : Real) ≤ dist a b ∧
      dist a b ≤ (u a : Real) + (u b : Real)

/-- A point function belongs to the set of point functions. -/
theorem pointFunction_mem_pointFunctions (z : X) :
    pointFunction z ∈ pointFunctions X :=
  sorry

/-- Source: `thm:metric-point-functions-identify-points`.

The assignment `z ↦ δ_z`, regarded as a map into the set of point functions, is
bijective.
-/
theorem point_functions_identify_points :
    Function.Bijective
      (fun z : X => (⟨pointFunction z, pointFunction_mem_pointFunctions z⟩ :
        {u : X → NNReal // u ∈ pointFunctions X})) := by
  constructor
  · -- Injective
    intro z₁ z₂ hypothesisFunctionValuesEqual
    have del_z1_eq_del_z2 :
        pointFunction z₁ = pointFunction z₂ :=
      congrArg Subtype.val hypothesisFunctionValuesEqual
    have del_z2_vanishes_at_z1 :
        pointFunction z₂ z₁ = 0 := by
      -- Step 1: δ_z₂(z₁) = 0 as an NNReal.
      -- Equal functions have equal values at z₁, and δ_z₁(z₁) is zero.
      simpa [pointFunction] using
        (congrFun del_z1_eq_del_z2 z₁).symm
    -- Step 2: δ_z₂(z₁) = 0 as a Real.
    have del_z2_vanishes_at_z1_as_real :
        ((pointFunction z₂ z₁ : NNReal) : Real) = 0 :=
      congrArg (fun r : NNReal => (r : Real)) del_z2_vanishes_at_z1
    -- Step 3: unfolding pointFunction gives dist z₂ z₁ = 0.
    have dist_z2_z1_eq_zero :
        dist z₂ z₁ = 0 := by
      simpa [pointFunction] using del_z2_vanishes_at_z1_as_real
    -- Step 4: zero distance implies equality.
    have z2_eq_z1 : z₂ = z₁ :=
      dist_eq_zero.mp dist_z2_z1_eq_zero
    -- Step 5: flip the equality to match the injectivity goal.
    exact z2_eq_z1.symm
  · -- Surjective
    intro point_function
    rcases point_function with ⟨u, u_mem_pointFunctions⟩
    rcases u_mem_pointFunctions with ⟨z, pointFunction_z_eq_u⟩
    exact ⟨z, Subtype.ext pointFunction_z_eq_u⟩

/-- Source: `thm:metric-point-function-inequalities`.

Point functions satisfy the defining pointlike inequalities and vanish at their
base point.
-/
theorem point_function_inequalities
    (z : X) :
    (∀ a b : X,
      (pointFunction z b : Real) - (pointFunction z a : Real) ≤ dist a b ∧
        dist a b ≤ (pointFunction z b : Real) + (pointFunction z a : Real)) ∧
      pointFunction z z = 0 := by
  constructor
  · -- (i) Point functions satisfy the pointlike inequalities.
    intro a b
    constructor
    · -- Left inequality: δ_z(b) - δ_z(a) ≤ d(a, b).
      -- The author's rearranged triangle inequality is represented here by
      -- mathlib's theorem `abs_dist_sub_le`.
      have rearranged_triangle :
          |dist z b - dist z a| ≤ dist a b := by
        simpa [dist_comm] using abs_dist_sub_le b a z
      have distance_difference_le_abs :
          dist z b - dist z a ≤ |dist z b - dist z a| :=
        le_abs_self (dist z b - dist z a)
      have distance_difference_le_dist_ab :
          dist z b - dist z a ≤ dist a b :=
        distance_difference_le_abs.trans rearranged_triangle
      simpa [pointFunction] using distance_difference_le_dist_ab
    · -- Right inequality: d(a, b) ≤ δ_z(b) + δ_z(a).
      simpa [pointFunction, add_comm] using dist_triangle_left a b z
  · -- (ii) Point functions vanish at their base point.
    simp [pointFunction]

/-- Every point function is pointlike. -/
theorem pointFunction_pointlike (z : X) :
    Pointlike (pointFunction z) := by
  sorry

/-- Source: `thm:metric-pointlike-zero-point-function`.

A nonnegative-real-valued function is a point function if and only if it is
pointlike and has zero in its range.
-/
theorem pointlike_zero_point_function
    (u : X → NNReal) :
    u ∈ pointFunctions X ↔ Pointlike u ∧ 0 ∈ Set.range u := by
  sorry

/-- Source: `thm:metric-pointlike-zero-point-function`.

If a pointlike function has a zero, that zero point is unique.
-/
theorem pointlike_zero_unique
    {u : X → NNReal}
    (u_pointlike : Pointlike u)
    {w₁ w₂ : X}
    (zero_at_w₁ : u w₁ = 0)
    (zero_at_w₂ : u w₂ = 0) :
    w₁ = w₂ := by
  sorry

/-- Source: `thm:metric-pointlike-zero-point-function`.

If a pointlike function has a zero at `w`, then it is the point function
determined by `w`.
-/
theorem pointlike_eq_pointFunction_of_zero
    {u : X → NNReal}
    (u_pointlike : Pointlike u)
    {w : X}
    (zero_at_w : u w = 0) :
    u = pointFunction w := by
  sorry

end LRA.VolumeIV.MetricSpaces
