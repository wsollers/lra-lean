import Mathlib.Topology.MetricSpace.Basic

/-!
Reference definitions for metrics and metric spaces, following Ó Searcóid
`Metric Spaces`, Definition 1.1.1.

This module records the textbook-level objects for Volume IV orientation. It is
not intended as the proof foundation for later metric-space files; formal proofs
should use Mathlib's `MetricSpace` API directly.
-/

namespace LRA.VolumeIV.MetricSpaces

universe u

/-- Source: Ó Searcóid, `Metric Spaces`, Definition 1.1.1.

Reference data for a metric on a carrier type.

This follows Ó Searcóid's Definition 1.1.1: a metric is a real-valued function
on `X × X` satisfying positivity with equality exactly on the diagonal,
symmetry, and the triangle inequality.

Mathematical statement (Lean): `structure MetricDefinition (X : Type u)`.
-/
structure MetricDefinition (X : Type u) where
  /-- The distance function. -/
  dist : X → X → Real
  /-- Distances are nonnegative, with equality if and only if the two points
  are equal. -/
  positive : ∀ x y : X, 0 ≤ dist x y ∧ (dist x y = 0 ↔ x = y)
  /-- Distance is symmetric. -/
  symmetric : ∀ x y : X, dist x y = dist y x
  /-- The triangle inequality. -/
  triangle : ∀ x y z : X, dist x z ≤ dist x y + dist y z

/-- Source: Ó Searcóid, `Metric Spaces`, Definition 1.1.1.

Reference data for a metric space.

This packages a carrier with a metric, matching Ó Searcóid's convention that
`(X, d)` is a metric space when the metric needs to be named.

Mathematical statement (Lean): `structure MetricSpaceDefinition`.
-/
structure MetricSpaceDefinition where
  /-- The underlying carrier of the space. -/
  Carrier : Type u
  /-- The metric on the carrier. -/
  metric : MetricDefinition Carrier

/-- Source: Ó Searcóid, `Metric Spaces`, Theorem 1.1.2.

Rearrangement of the triangle inequality. Stated using Mathlib's metric-space
API: in a metric space, `|dist a b - dist b c| ≤ dist a c`.

Mathematical statement (Lean): `theorem rearrangement_of_triangle_inequality {X : Type u} [MetricSpace X] (a b c : X) : |dist a b - dist b c| ≤ dist a c`.

*Proof status:* proof pending
-/
theorem rearrangement_of_triangle_inequality
    {X : Type u}
    [MetricSpace X]
    (a b c : X) :
    |dist a b - dist b c| ≤ dist a c := by
  sorry

end LRA.VolumeIV.MetricSpaces
