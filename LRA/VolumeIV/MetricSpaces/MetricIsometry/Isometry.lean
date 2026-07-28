import Mathlib.Topology.MetricSpace.Basic

/-!
Metric isometries.
-/

namespace LRA.VolumeIV.MetricSpaces.MetricIsometry

universe u v

/-- Source: Ó Searcóid, `Metric Spaces`, Definition 1.4.1.

A map between metric spaces is an isometry, or isometric map, when it preserves
all pairwise distances.

Mathematical statement (Lean): `def IsMetricIsometry {X : Type u} {Y : Type v} [MetricSpace X] [MetricSpace Y] (φ : X → Y) : Prop`.
-/
def IsMetricIsometry
    {X : Type u}
    {Y : Type v}
    [MetricSpace X]
    [MetricSpace Y]
    (φ : X → Y) :
    Prop :=
  ∀ a b : X, dist (φ a) (φ b) = dist a b


/-- A map is injective when equal outputs force equal inputs.

Mathematical statement (Lean): `def IsInjectiveMap {X : Type u} {Y : Type v} (φ : X → Y) : Prop`.
-/
def IsInjectiveMap
    {X : Type u}
    {Y : Type v}
    (φ : X → Y) :
    Prop :=
  ∀ a b : X, φ a = φ b → a = b

/-- Not a separate theorem from Ó Searcóid.

This is the natural consequence of Definition 1.4.1 and the identity of
indiscernibles for metrics: distance preservation forces an isometry to be
injective.

Mathematical statement (Lean): `theorem isMetricIsometry_injective {X : Type u} {Y : Type v} [MetricSpace X] [MetricSpace Y] {isometricMap : X → Y} (isometry_preserves_distance : IsMetricIsometry isometricMap) : IsInjectiveMap isometricMap`.
-/
theorem isMetricIsometry_injective
    {X : Type u}
    {Y : Type v}
    [MetricSpace X]
    [MetricSpace Y]
    {isometricMap : X → Y}
    (isometry_preserves_distance : IsMetricIsometry isometricMap) :
    IsInjectiveMap isometricMap := by
  intro firstPoint secondPoint images_equal
  apply dist_eq_zero.mp
  rw [← isometry_preserves_distance firstPoint secondPoint, images_equal]
  exact dist_self (isometricMap secondPoint)

/-- The negation map is an isometry from the positive open ray `(0, ∞)` onto

Mathematical statement (Lean): `theorem positiveOpenRay_isMetricIsometry_negativeOpenRay : IsMetricIsometry (fun positivePoint : Set.Ioi (0 : Real) => (⟨-(positivePoint : Real), by exact neg_lt_zero.mpr (show 0 < (positivePoint : Real) from positivePoint.property)⟩ : Set.Iio (0 : Real)))`.
the negative open ray `(-∞, 0)`. -/
theorem positiveOpenRay_isMetricIsometry_negativeOpenRay :
    IsMetricIsometry
      (fun positivePoint : Set.Ioi (0 : Real) =>
        (⟨-(positivePoint : Real), by
          exact neg_lt_zero.mpr (show 0 < (positivePoint : Real) from positivePoint.property)⟩ :
          Set.Iio (0 : Real))) := by
  intro firstPositivePoint secondPositivePoint
  change
    dist (-(firstPositivePoint : Real)) (-(secondPositivePoint : Real)) =
      dist (firstPositivePoint : Real) (secondPositivePoint : Real)
  rw [Real.dist_eq, Real.dist_eq]
  rw [show
      -(firstPositivePoint : Real) - -(secondPositivePoint : Real) =
        -((firstPositivePoint : Real) - (secondPositivePoint : Real)) by ring]
  exact abs_neg ((firstPositivePoint : Real) - (secondPositivePoint : Real))

/-- Source: Ó Searcóid, `Metric Spaces`, Definition 1.4.1.

A subset of a metric space is an isometric copy of `X` when it is the range of
an isometry from `X`.

Mathematical statement (Lean): `def IsometricCopy (X : Type u) {Y : Type v} [MetricSpace X] [MetricSpace Y] (Z : Set Y) : Prop`.
-/
def IsometricCopy
    (X : Type u)
    {Y : Type v}
    [MetricSpace X]
    [MetricSpace Y]
    (Z : Set Y) :
    Prop :=
  ∃ φ : X → Y, IsMetricIsometry φ ∧ Set.range φ = Z

end LRA.VolumeIV.MetricSpaces.MetricIsometry
