import Mathlib.Topology.MetricSpace.Basic
import Mathlib.Analysis.Complex.Basic
import LRA.Analysis.MetricSpace.Definition.Metric
import LRA.Analysis.MetricSpace.Definition.Metrics

namespace LRA.Analysis.MetricSpace

universe u

/--
`EuclideanDistanceIsAMetric` TODO

Predicate logic:

  ∃ metric ∈ MetricDefinition ℝ, ∀ a b : ℝ, metric.distance a b = |a - b|

Predicate logic (unfolded):

  Exists fun metric => ∀ (a b : Real), metric.1 a b = SemilatticeSup.toMax.1 (instHSub.1 a b) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 a b))

Logical form (Lean):

```lean
theorem EuclideanDistanceIsAMetric :
    ∃ metric : MetricDefinition ℝ,
      ∀ a b : ℝ, metric.distance a b = |a - b|
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem EuclideanDistanceIsAMetric :
    ∃ metric : MetricDefinition ℝ,
      ∀ a b : ℝ, metric.distance a b = |a - b| := by
  sorry
/--
`EmptySetIsAMetricSpace` TODO

Predicate logic:

  Nonempty (MetricDefinition ∅ ∈ Set X)

Predicate logic (unfolded):

  ∀ {X : Type u}, Nonempty (LRA.Analysis.MetricSpace.MetricDefinition (Subtype fun x => Set.instMembership.1 Set.instEmptyCollection.1 x))

Logical form (Lean):

```lean
theorem EmptySetIsAMetricSpace {X : Type u} :
    Nonempty (MetricDefinition (∅ : Set X))
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
theorem EmptySetIsAMetricSpace {X : Type u} :
    Nonempty (MetricDefinition (∅ : Set X)) := by
  sorry
/--
`SingletonSetIsAMetricSpace` TODO

Predicate logic:

  (∀ point ∈ X), Nonempty (MetricDefinition {point} ∈ Set X)

Predicate logic (unfolded):

  ∀ {X : Type u} (point : X), Nonempty (LRA.Analysis.MetricSpace.MetricDefinition (Subtype fun x => Set.instMembership.1 (Set.instSingletonSet.1 point) x))

Logical form (Lean):

```lean
theorem SingletonSetIsAMetricSpace {X : Type u} (point : X) :
    Nonempty (MetricDefinition ({point} : Set X))
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
theorem SingletonSetIsAMetricSpace {X : Type u} (point : X) :
    Nonempty (MetricDefinition ({point} : Set X)) := by
  sorry
/--
`ModulusIsAMetricOnTheComplexNumbers` TODO

Predicate logic:

  ∃ metric ∈ MetricDefinition ℂ, ∀ a b : ℂ, metric.distance a b = ‖a - b‖

Predicate logic (unfolded):

  Exists fun metric => ∀ (a b : Complex), metric.1 a b = Complex.instNorm.1 (instHSub.1 a b)

Logical form (Lean):

```lean
theorem ModulusIsAMetricOnTheComplexNumbers :
    ∃ metric : MetricDefinition ℂ,
      ∀ a b : ℂ, metric.distance a b = ‖a - b‖
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem ModulusIsAMetricOnTheComplexNumbers :
    ∃ metric : MetricDefinition ℂ,
      ∀ a b : ℂ, metric.distance a b = ‖a - b‖ := by
  sorry
/--
`CircleAdmitsChordAsMetric` TODO

Predicate logic:

  ∀ center ∈ ℂ radius ∈ ℝ, 0 < radius → ∃ metric ∈ MetricDefinition {z ∈ ℂ // ‖z - center‖ = radius}, ∀ a b, metric.distance a b = ‖a.1 - b.1‖

Predicate logic (unfolded):

  ∀ (center : Complex) (radius : Real), Real.instLT.1 Zero.toOfNat0.1 radius → Exists fun metric => ∀ (a b : Subtype fun z => Complex.instNorm.1 (instHSub.1 z center) = radius), metric.1 a b = Complex.instNorm.1 (instHSub.1 a.1 b.1)

Logical form (Lean):

```lean
theorem CircleAdmitsChordAsMetric :
    ∀ (center : ℂ) (radius : ℝ), 0 < radius →
      ∃ metric : MetricDefinition {z : ℂ // ‖z - center‖ = radius},
        ∀ a b, metric.distance a b = ‖a.1 - b.1‖
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem CircleAdmitsChordAsMetric :
    ∀ (center : ℂ) (radius : ℝ), 0 < radius →
      ∃ metric : MetricDefinition {z : ℂ // ‖z - center‖ = radius},
        ∀ a b, metric.distance a b = ‖a.1 - b.1‖ := by
  sorry
namespace MetricDefinition

/--
`DistanceSelf` TODO

Predicate logic:

  (∀ x ∈ X), metric.distance x x = 0

Predicate logic (unfolded):

  ∀ {X : Type u} (metric : LRA.Analysis.MetricSpace.MetricDefinition X) (x : X), metric.1 x x = Zero.toOfNat0.1

Logical form (Lean):

```lean
theorem DistanceSelf {X : Type u} (metric : MetricDefinition X) (x : X) :
    metric.distance x x = 0
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
theorem DistanceSelf {X : Type u} (metric : MetricDefinition X) (x : X) :
    metric.distance x x = 0 := by
  sorry
/--
`DistanceNonnegative` TODO

Predicate logic:

  (∀ x y ∈ X), 0 ≤ metric.distance x y

Predicate logic (unfolded):

  ∀ {X : Type u} (metric : LRA.Analysis.MetricSpace.MetricDefinition X) (x y : X), Real.instLE.1 Zero.toOfNat0.1 (metric.1 x y)

Logical form (Lean):

```lean
theorem DistanceNonnegative {X : Type u} (metric : MetricDefinition X) (x y : X) :
    0 ≤ metric.distance x y
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
theorem DistanceNonnegative {X : Type u} (metric : MetricDefinition X) (x y : X) :
    0 ≤ metric.distance x y := by
  sorry
/--
`DistanceEqZeroIff` TODO

Predicate logic:

  (∀ x y ∈ X), metric.distance x y = 0 ↔ x = y

Predicate logic (unfolded):

  ∀ {X : Type u} (metric : LRA.Analysis.MetricSpace.MetricDefinition X) (x y : X), metric.1 x y = Zero.toOfNat0.1 ↔ x = y

Logical form (Lean):

```lean
theorem DistanceEqZeroIff {X : Type u} (metric : MetricDefinition X) (x y : X) :
    metric.distance x y = 0 ↔ x = y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem DistanceEqZeroIff {X : Type u} (metric : MetricDefinition X) (x y : X) :
    metric.distance x y = 0 ↔ x = y := by
  sorry
/--
`DistanceSymmetric` TODO

Predicate logic:

  (∀ x y ∈ X), metric.distance x y = metric.distance y x

Predicate logic (unfolded):

  ∀ {X : Type u} (metric : LRA.Analysis.MetricSpace.MetricDefinition X) (x y : X), metric.1 x y = metric.1 y x

Logical form (Lean):

```lean
theorem DistanceSymmetric {X : Type u} (metric : MetricDefinition X) (x y : X) :
    metric.distance x y = metric.distance y x
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
theorem DistanceSymmetric {X : Type u} (metric : MetricDefinition X) (x y : X) :
    metric.distance x y = metric.distance y x := by
  sorry
/--
`TriangleInequality` TODO

Predicate logic:

  (∀ x y z ∈ X), metric.distance x z ≤ metric.distance x y + metric.distance y z

Predicate logic (unfolded):

  ∀ {X : Type u} (metric : LRA.Analysis.MetricSpace.MetricDefinition X) (x y z : X), Real.instLE.1 (metric.1 x z) (instHAdd.1 (metric.1 x y) (metric.1 y z))

Logical form (Lean):

```lean
theorem TriangleInequality {X : Type u} (metric : MetricDefinition X) (x y z : X) :
    metric.distance x z ≤ metric.distance x y + metric.distance y z
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
theorem TriangleInequality {X : Type u} (metric : MetricDefinition X) (x y z : X) :
    metric.distance x z ≤ metric.distance x y + metric.distance y z := by
  sorry
/--
`ReverseTriangleInequality` TODO

Predicate logic:

  (∀ x y z ∈ X), |metric.distance x z - metric.distance y z| ≤ metric.distance x y

Predicate logic (unfolded):

  ∀ {X : Type u} (metric : LRA.Analysis.MetricSpace.MetricDefinition X) (x y z : X), Real.instLE.1 (SemilatticeSup.toMax.1 (instHSub.1 (metric.1 x z) (metric.1 y z)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (metric.1 x z) (metric.1 y z)))) (metric.1 x y)

Logical form (Lean):

```lean
theorem ReverseTriangleInequality {X : Type u} (metric : MetricDefinition X) (x y z : X) :
    |metric.distance x z - metric.distance y z| ≤ metric.distance x y
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
theorem ReverseTriangleInequality {X : Type u} (metric : MetricDefinition X) (x y z : X) :
    |metric.distance x z - metric.distance y z| ≤ metric.distance x y := by
  sorry
end MetricDefinition

/--
`RearrangementOfTriangleInequalityFromMetricDefinition` TODO

Predicate logic:

  (∀ a b c ∈ X), |metric.distance a b - metric.distance b c| ≤ metric.distance a c

Predicate logic (unfolded):

  ∀ {X : Type u} (metric : LRA.Analysis.MetricSpace.MetricDefinition X) (a b c : X), Real.instLE.1 (SemilatticeSup.toMax.1 (instHSub.1 (metric.1 a b) (metric.1 b c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (metric.1 a b) (metric.1 b c)))) (metric.1 a c)

Logical form (Lean):

```lean
theorem RearrangementOfTriangleInequalityFromMetricDefinition
    {X : Type u}
    (metric : MetricDefinition X)
    (a b c : X) :
    |metric.distance a b - metric.distance b c| ≤ metric.distance a c
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
theorem RearrangementOfTriangleInequalityFromMetricDefinition
    {X : Type u}
    (metric : MetricDefinition X)
    (a b c : X) :
    |metric.distance a b - metric.distance b c| ≤ metric.distance a c := by
  sorry
/--
`rearrangement_of_triangle_inequality` TODO

Predicate logic:

  (∀ a b c ∈ X), |dist a b - dist b c| ≤ dist a c

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : MetricSpace X] (a b c : X), Real.instLE.1 (SemilatticeSup.toMax.1 (instHSub.1 (inst.toDist.1 a b) (inst.toDist.1 b c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (inst.toDist.1 a b) (inst.toDist.1 b c)))) (inst.toDist.1 a c)

Logical form (Lean):

```lean
theorem rearrangement_of_triangle_inequality
    {X : Type u}
    [MetricSpace X]
    (a b c : X) :
    |dist a b - dist b c| ≤ dist a c
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
theorem rearrangement_of_triangle_inequality
    {X : Type u}
    [MetricSpace X]
    (a b c : X) :
    |dist a b - dist b c| ≤ dist a c := by
  sorry
end LRA.Analysis.MetricSpace
