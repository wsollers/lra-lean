import Mathlib.Data.Real.Basic

/-!
Reference definition for metrics, following Ó Searcóid `Metric Spaces`,
Definition 1.1.1.
-/

namespace LRA.Analysis.MetricSpaces

universe u

/-- Source: Ó Searcóid, `Metric Spaces`, Definition 1.1.1.

Reference data for a metric on a carrier type.

Logical form:

```lean
  /-- The distance function. -/
  distance : X → X → Real
  /-- Positive definite. -/
  positive : ∀ x y : X, 0 ≤ distance x y ∧ (distance x y = 0 ↔ x = y)
  /-- Distance is symmetric. -/
  symmetric : ∀ x y : X, distance x y = distance y x
  /-- The triangle inequality. -/
  triangle : ∀ x y z : X, distance x z ≤ distance x y + distance y z
```

This follows Ó Searcóid's Definition 1.1.1: a metric is a real-valued function
on `X × X` satisfying positivity with equality exactly on the diagonal,
symmetry, and the triangle inequality.

Mathematical statement (Lean): `structure MetricDefinition (X : Type u)`.
-/
structure MetricDefinition (X : Type u) where
  /-- The distance function. -/
  distance : X → X → Real
  /-- Positive definite. -/
  positive : ∀ x y : X, 0 ≤ distance x y ∧ (distance x y = 0 ↔ x = y)
  /-- Distance is symmetric. -/
  symmetric : ∀ x y : X, distance x y = distance y x
  /-- The triangle inequality. -/
  triangle : ∀ x y z : X, distance x z ≤ distance x y + distance y z

end LRA.Analysis.MetricSpaces
