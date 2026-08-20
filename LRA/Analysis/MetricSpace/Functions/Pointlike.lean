import Mathlib.Topology.MetricSpace.Basic
import Mathlib.Data.NNReal.Basic
import Mathlib.Tactic

/-!
Point functions and pointlike functions in metric spaces.
-/

namespace LRA.Analysis.MetricSpace

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
  sorry

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
  sorry

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
    pointFunction z ∈ pointFunctions X := by
  sorry

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
  sorry

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
  sorry

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
  sorry

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
  sorry

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
  sorry

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
  sorry

end LRA.Analysis.MetricSpace
