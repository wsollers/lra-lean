import Mathlib.Topology.MetricSpace.Basic
import Mathlib.Data.NNReal.Basic
import Mathlib.Tactic

/-!
Point functions and pointlike functions in metric spaces.
-/

namespace LRA.Analysis.MetricSpaces

universe u

variable {X : Type u} [MetricSpace X]

/-- Source: `def:metric-point-function`.

The point function determined by `z` sends `x` to the nonnegative real distance
`dist z x`.

Mathematical statement (Lean): `def pointFunction (z : X) : X → NNReal`.


Logical form:

```lean
def pointFunction (z : X) : X → NNReal :=
  fun x => NNReal.mk (dist z x) dist_nonneg
```
-/
def pointFunction (z : X) : X → NNReal :=
  fun x => NNReal.mk (dist z x) dist_nonneg

-- The source treats point functions as ℝ_{\ge 0}-valued. Mathlib's `dist`
-- is Real-valued, so `dist_nonneg` packages each distance as an `NNReal`.

/--
**[Theorem — coe_pointFunction]**

Mathematical statement (Lean): `theorem coe_pointFunction (z x : X) : ((pointFunction z x : NNReal) : Real) = dist z x`.


Logical form:

```lean
theorem coe_pointFunction (z x : X) :
    ((pointFunction z x : NNReal) : Real) = dist z x
```
-/
@[simp]
theorem coe_pointFunction (z x : X) :
    ((pointFunction z x : NNReal) : Real) = dist z x := by
  rfl

/--
**[Theorem — pointFunction_self]**

Mathematical statement (Lean): `theorem pointFunction_self (z : X) : pointFunction z z = 0`.


Logical form:

```lean
theorem pointFunction_self (z : X) :
    pointFunction z z = 0
```
-/
@[simp]
theorem pointFunction_self (z : X) :
    pointFunction z z = 0 := by
  simp [pointFunction]

/-- Source: `def:metric-point-function`.

The set of all point functions on a metric space.

Mathematical statement (Lean): `def pointFunctions (X : Type u) [MetricSpace X] : Set (X → NNReal)`.


Logical form:

```lean
def pointFunctions (X : Type u) [MetricSpace X] : Set (X → NNReal) :=
  Set.range (pointFunction (X := X))
```
-/
def pointFunctions (X : Type u) [MetricSpace X] : Set (X → NNReal) :=
  Set.range (pointFunction (X := X))

/-- Source: `def:metric-pointlike-function`.

A nonnegative-real-valued function is pointlike when it satisfies the two metric
inequalities from the source text. The subtraction and addition are interpreted
in `Real` after coercing from `NNReal`.

Mathematical statement (Lean): `def Pointlike (u : X → NNReal) : Prop`.


Logical form:

```lean
def Pointlike (u : X → NNReal) : Prop :=
  ∀ a b : X,
    (u a : Real) - (u b : Real) ≤ dist a b ∧
      dist a b ≤ (u a : Real) + (u b : Real)
```
-/
def Pointlike (u : X → NNReal) : Prop :=
  ∀ a b : X,
    (u a : Real) - (u b : Real) ≤ dist a b ∧
      dist a b ≤ (u a : Real) + (u b : Real)


/-- A point function belongs to the set of point functions.

Mathematical statement (Lean): `theorem pointFunction_mem_pointFunctions (z : X) : pointFunction z ∈ pointFunctions X`.


Logical form:

```lean
theorem pointFunction_mem_pointFunctions (z : X) :
    pointFunction z ∈ pointFunctions X
```
-/
theorem pointFunction_mem_pointFunctions (z : X) :
    pointFunction z ∈ pointFunctions X :=
  ⟨z, rfl⟩

/-- Source: `thm:metric-point-functions-identify-points`.

The assignment `z ↦ δ_z`, regarded as a map into the set of point functions, is
bijective.

Mathematical statement (Lean): `theorem point_functions_identify_points : Function.Bijective (fun z : X => (⟨pointFunction z, pointFunction_mem_pointFunctions z⟩ : {u : X → NNReal // u ∈ pointFunctions X}))`.


Logical form:

```lean
theorem point_functions_identify_points :
    Function.Bijective
      (fun z : X => (⟨pointFunction z, pointFunction_mem_pointFunctions z⟩ :
        {u : X → NNReal // u ∈ pointFunctions X}))
```
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

Mathematical statement (Lean): `theorem point_function_inequalities (z : X) : (∀ a b : X, (pointFunction z b : Real) - (pointFunction z a : Real) ≤ dist a b ∧ dist a b ≤ (pointFunction z b : Real) + (pointFunction z a : Real)) ∧ pointFunction z z = 0`.


Logical form:

```lean
theorem point_function_inequalities
    (z : X) :
    (∀ a b : X,
      (pointFunction z b : Real) - (pointFunction z a : Real) ≤ dist a b ∧
        dist a b ≤ (pointFunction z b : Real) + (pointFunction z a : Real)) ∧
      pointFunction z z = 0
```
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


/-- Every point function is pointlike.

Mathematical statement (Lean): `theorem pointFunction_pointlike (z : X) : Pointlike (pointFunction z)`.


Logical form:

```lean
theorem pointFunction_pointlike (z : X) :
    Pointlike (pointFunction z)
```
-/
theorem pointFunction_pointlike (z : X) :
    Pointlike (pointFunction z) := by
  -- Leverage the concrete point-function inequalities proved above; this
  -- theorem only repackages them as the `Pointlike` predicate.
  intro a b
  simpa [dist_comm, add_comm] using
    (point_function_inequalities (X := X) z).1 b a

/-- Source: `thm:metric-pointlike-zero-point-function`.

If a pointlike function has a zero at `w`, then it is the point function
determined by `w`.

Mathematical statement (Lean): `theorem pointlike_eq_pointFunction_of_zero {u : X → NNReal} (u_pointlike : Pointlike u) {w : X} (zero_at_w : u w = 0) : u = pointFunction w`.


Logical form:

```lean
theorem pointlike_eq_pointFunction_of_zero
    {u : X → NNReal}
    (u_pointlike : Pointlike u)
    {w : X}
    (zero_at_w : u w = 0) :
    u = pointFunction w
```
-/
theorem pointlike_eq_pointFunction_of_zero
    {u : X → NNReal}
    (u_pointlike : Pointlike u)
    {w : X}
    (zero_at_w : u w = 0) :
    u = pointFunction w := by
  funext x
  apply NNReal.eq
  change (u x : Real) = dist w x
  have zero_at_w_real : (u w : Real) = 0 := by
    exact congrArg (fun r : NNReal => (r : Real)) zero_at_w
  -- Pointlikeness and the zero at `w` squeeze `u x` between the two
  -- inequalities `u x ≤ dist w x` and `dist w x ≤ u x`, forcing equality.
  have upper_raw :
      (u x : Real) - (u w : Real) ≤ dist x w :=
    (u_pointlike x w).1
  have upper : (u x : Real) ≤ dist w x := by
    rw [zero_at_w_real] at upper_raw
    rw [dist_comm] at upper_raw
    linarith
  have lower_raw :
      dist w x ≤ (u w : Real) + (u x : Real) :=
    (u_pointlike w x).2
  have lower : dist w x ≤ (u x : Real) := by
    rw [zero_at_w_real] at lower_raw
    linarith
  exact le_antisymm upper lower

-- This helper is not a separate theorem from the book. It harvests a reusable
-- piece of `thm:metric-pointlike-zero-point-function` so that the identifying
-- equality is available directly in later formalizations.

/-- Source: `thm:metric-pointlike-zero-point-function`.

A nonnegative-real-valued function is a point function if and only if it is
pointlike and has zero in its range.

Mathematical statement (Lean): `theorem pointlike_zero_point_function (u : X → NNReal) : u ∈ pointFunctions X ↔ Pointlike u ∧ 0 ∈ Set.range u`.


Logical form:

```lean
theorem pointlike_zero_point_function
    (u : X → NNReal) :
    u ∈ pointFunctions X ↔ Pointlike u ∧ 0 ∈ Set.range u
```
-/
theorem pointlike_zero_point_function
    (u : X → NNReal) :
    u ∈ pointFunctions X ↔ Pointlike u ∧ 0 ∈ Set.range u := by
  constructor
  · -- Forward direction: every point function is pointlike and has a zero.
    intro u_mem_pointFunctions
    -- Unpack membership in the set of point functions as `u = δ_z`.
    rcases u_mem_pointFunctions with ⟨z, pointFunction_z_eq_u⟩
    constructor
    · rw [← pointFunction_z_eq_u]
      -- Reuse the already-proved fact that every point function is pointlike.
      exact pointFunction_pointlike z
    · refine ⟨z, ?_⟩
      -- Use the base point `z` as the witness that `u` has zero in its range.
      rw [← pointFunction_z_eq_u]
      -- The zero-at-base-point fact is the second part of the inequalities theorem.
      exact (point_function_inequalities (X := X) z).2
  · -- Reverse direction: a pointlike function with a zero is a point function.
    intro hypothesis_u_pointlike_and_has_zero
    rcases hypothesis_u_pointlike_and_has_zero with
      ⟨u_pointlike, zero_in_range⟩
    rcases zero_in_range with ⟨w, zero_at_w⟩
    refine ⟨w, ?_⟩
    exact (pointlike_eq_pointFunction_of_zero u_pointlike zero_at_w).symm

/-- Source: `thm:metric-pointlike-zero-point-function`.

If a pointlike function has a zero, that zero point is unique.

Mathematical statement (Lean): `theorem pointlike_zero_unique {u : X → NNReal} (u_pointlike : Pointlike u) {w₁ w₂ : X} (zero_at_w₁ : u w₁ = 0) (zero_at_w₂ : u w₂ = 0) : w₁ = w₂`.


Logical form:

```lean
theorem pointlike_zero_unique
    {u : X → NNReal}
    (u_pointlike : Pointlike u)
    {w₁ w₂ : X}
    (zero_at_w₁ : u w₁ = 0)
    (zero_at_w₂ : u w₂ = 0) :
    w₁ = w₂
```
-/
theorem pointlike_zero_unique
    {u : X → NNReal}
    (u_pointlike : Pointlike u)
    {w₁ w₂ : X}
    (zero_at_w₁ : u w₁ = 0)
    (zero_at_w₂ : u w₂ = 0) :
    w₁ = w₂ := by
  have u_eq_pointFunction_w₁ :
      u = pointFunction w₁ :=
    pointlike_eq_pointFunction_of_zero u_pointlike zero_at_w₁
  have pointFunction_w₁_zero_at_w₂ :
      pointFunction w₁ w₂ = 0 := by
    rw [← u_eq_pointFunction_w₁]
    exact zero_at_w₂
  have dist_w₁_w₂_eq_zero :
      dist w₁ w₂ = 0 := by
    have pointFunction_w₁_zero_at_w₂_real :
        ((pointFunction w₁ w₂ : NNReal) : Real) = 0 :=
      congrArg (fun r : NNReal => (r : Real)) pointFunction_w₁_zero_at_w₂
    simpa [pointFunction] using pointFunction_w₁_zero_at_w₂_real
  exact dist_eq_zero.mp dist_w₁_w₂_eq_zero

end LRA.Analysis.MetricSpaces
