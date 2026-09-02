import Mathlib.Topology.MetricSpace.Basic

namespace LRA.Analysis.MetricSpace.MetricIsometry

universe u v

/--
`IsMetricIsometry` TODO

Predicate logic:

  ∀ {X : Type u} {Y : Type v} [inst : MetricSpace X] [inst_1 : MetricSpace Y] (φ : X → Y) (a b : X), inst_1.dist (φ a) (φ b) = inst.dist a b

Predicate logic (unfolded):

  ∀ {X : Type u} {Y : Type v} [inst : MetricSpace X] [inst_1 : MetricSpace Y] (φ : X → Y) (a b : X), inst_1.toDist.1 (φ a) (φ b) = inst.toDist.1 a b

Logical form (Lean):

```lean
def IsMetricIsometry
    {X : Type u}
    {Y : Type v}
    [MetricSpace X]
    [MetricSpace Y]
    (φ : X → Y) :
    Prop :=
  ∀ a b : X, dist (φ a) (φ b) = dist a b
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def IsMetricIsometry
    {X : Type u}
    {Y : Type v}
    [MetricSpace X]
    [MetricSpace Y]
    (φ : X → Y) :
    Prop :=
  ∀ a b : X, dist (φ a) (φ b) = dist a b

/--
`IsInjectiveMap` TODO

Predicate logic:

  ∀ {X : Type u} {Y : Type v} (φ : X → Y) (a b : X), φ a = φ b → a = b

Predicate logic (unfolded):

  ∀ {X : Type u} {Y : Type v} (φ : X → Y) (a b : X), φ a = φ b → a = b

Logical form (Lean):

```lean
def IsInjectiveMap
    {X : Type u}
    {Y : Type v}
    (φ : X → Y) :
    Prop :=
  ∀ a b : X, φ a = φ b → a = b
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def IsInjectiveMap
    {X : Type u}
    {Y : Type v}
    (φ : X → Y) :
    Prop :=
  ∀ a b : X, φ a = φ b → a = b

/--
`isMetricIsometry_injective` TODO

Predicate logic:

  (IsMetricIsometry isometricMap) → IsInjectiveMap isometricMap

Predicate logic (unfolded):

  ∀ {X : Type u} {Y : Type v} [inst : MetricSpace X] [inst_1 : MetricSpace Y] {isometricMap : X → Y}, (∀ (a b : X), inst_1.toDist.1 (isometricMap a) (isometricMap b) = inst.toDist.1 a b) → ∀ (a b : X), isometricMap a = isometricMap b → a = b

Logical form (Lean):

```lean
theorem isMetricIsometry_injective
    {X : Type u}
    {Y : Type v}
    [MetricSpace X]
    [MetricSpace Y]
    {isometricMap : X → Y}
    (isometry_preserves_distance : IsMetricIsometry isometricMap) :
    IsInjectiveMap isometricMap
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem isMetricIsometry_injective
    {X : Type u}
    {Y : Type v}
    [MetricSpace X]
    [MetricSpace Y]
    {isometricMap : X → Y}
    (isometry_preserves_distance : IsMetricIsometry isometricMap) :
    IsInjectiveMap isometricMap := by
  sorry
/--
`positiveOpenRay_isMetricIsometry_negativeOpenRay` TODO

Predicate logic:

  IsMetricIsometry fun positivePoint ∈ Set.Ioi 0 ∈ Real => (⟨-positivePoint ∈ Real, by exact neg_lt_zero.mpr show 0 < positivePoint ∈ Real from positivePoint.property⟩ ∈ Set.Iio 0 ∈ Real)

Predicate logic (unfolded):

  ∀ (a b : Subtype fun x => Set.instMembership.1 (fun x => Real.instPreorder.toLT.1 0 x) x), Subtype.metricSpace.toDist.1 ((fun positivePoint => ⟨Real.instNeg.1 positivePoint.1, ⋯⟩) a) ((fun positivePoint => ⟨Real.instNeg.1 positivePoint.1, ⋯⟩) b) = Subtype.metricSpace.toDist.1 a b

Logical form (Lean):

```lean
theorem positiveOpenRay_isMetricIsometry_negativeOpenRay :
    IsMetricIsometry
      (fun positivePoint : Set.Ioi (0 : Real) =>
        (⟨-(positivePoint : Real), by
          exact neg_lt_zero.mpr (show 0 < (positivePoint : Real) from positivePoint.property)⟩ :
          Set.Iio (0 : Real)))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem positiveOpenRay_isMetricIsometry_negativeOpenRay :
    IsMetricIsometry
      (fun positivePoint : Set.Ioi (0 : Real) =>
        (⟨-(positivePoint : Real), by
          exact neg_lt_zero.mpr (show 0 < (positivePoint : Real) from positivePoint.property)⟩ :
          Set.Iio (0 : Real))) := by
  sorry
/--
`IsometricCopy` TODO

Predicate logic:

  ∀ (X : Type u) {Y : Type v} [inst : MetricSpace X] [inst_1 : MetricSpace Y] (Z : Set Y), Exists fun φ => (LRA.Analysis.MetricSpace.MetricIsometry.IsMetricIsometry φ ∧ Set.range φ = Z)

Predicate logic (unfolded):

  ∀ (X : Type u) {Y : Type v} [inst : MetricSpace X] [inst_1 : MetricSpace Y] (Z : Y → Prop), Exists fun φ => (∀ (a b : X), inst_1.toDist.1 (φ a) (φ b) = inst.toDist.1 a b ∧ fun x => Exists fun y => φ y = x = Z)

Logical form (Lean):

```lean
def IsometricCopy
    (X : Type u)
    {Y : Type v}
    [MetricSpace X]
    [MetricSpace Y]
    (Z : Set Y) :
    Prop :=
  ∃ φ : X → Y, IsMetricIsometry φ ∧ Set.range φ = Z
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def IsometricCopy
    (X : Type u)
    {Y : Type v}
    [MetricSpace X]
    [MetricSpace Y]
    (Z : Set Y) :
    Prop :=
  ∃ φ : X → Y, IsMetricIsometry φ ∧ Set.range φ = Z

end LRA.Analysis.MetricSpace.MetricIsometry
