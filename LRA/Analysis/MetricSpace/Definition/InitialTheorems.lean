import Mathlib.Topology.MetricSpace.Basic
import Mathlib.Analysis.Complex.Basic
import LRA.Analysis.MetricSpace.Definition.Metric
import LRA.Analysis.MetricSpace.Definition.Metrics

namespace LRA.Analysis.MetricSpace

universe u

/--
`EuclideanDistanceIsAMetric` TODO

Predicate logic:

  Exists fun metric => ∀ (a b : Real), metric.distance a b = abs (instHSub.hSub a b)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun metric => ∀ (a b : Real), metric.1 a b = abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub a b)

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

  ∀ {X : Type u}, Nonempty (LRA.Analysis.MetricSpace.MetricDefinition Set.instEmptyCollection.emptyCollection.Elem)

Predicate logic (unfolded):

  Ambient
    (X)
  Objects
    (none)
  Prove
    Nonempty (LRA.Analysis.MetricSpace.MetricDefinition (Subtype fun x => x)) ∈ Set.instEmptyCollection.1

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

  ∀ {X : Type u} (point : X), Nonempty (LRA.Analysis.MetricSpace.MetricDefinition (Set.instSingletonSet.singleton point).Elem)

Predicate logic (unfolded):

  Ambient
    (X)
  Objects
    point : X
  Prove
    Nonempty (LRA.Analysis.MetricSpace.MetricDefinition (Subtype fun x => x)) ∈ Set.instSingletonSet.1 point

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

  Exists fun metric => ∀ (a b : Complex), metric.distance a b = Complex.instNorm.norm (instHSub.hSub a b)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun metric => ∀ (a b : Complex), metric.1 a b = Complex.instNorm.1 ({ hSub := fun a b => Complex.instSub.sub a b }.hSub a b)

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

  ∀ (center : Complex) (radius : Real), Real.instLT.lt 0 radius → Exists fun metric => ∀ (a b : Subtype fun z => Complex.instNorm.norm (instHSub.hSub z center) = radius), metric.distance a b = Complex.instNorm.norm (instHSub.hSub a.val b.val)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 radius → Exists fun metric => ∀ (a b : Subtype fun z => Complex.instNorm.1 ({ hSub := fun a b => Complex.instSub.sub a b }.hSub z center) = radius), metric.1 a b = Complex.instNorm.1 ({ hSub := fun a b => Complex.instSub.sub a b }.hSub a.1 b.1)

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

  ∀ {X : Type u} (metric : LRA.Analysis.MetricSpace.MetricDefinition X) (x : X), metric.distance x x = 0

Predicate logic (unfolded):

  Ambient
    (X)
  Objects
    metric : MetricDefinition X
    x : X
  Prove
    metric.1 x x = 0

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

  ∀ {X : Type u} (metric : LRA.Analysis.MetricSpace.MetricDefinition X) (x y : X), Real.instLE.le 0 (metric.distance x y)

Predicate logic (unfolded):

  Ambient
    (X)
  Objects
    metric : MetricDefinition X
    x y : X
  Prove
    Real.instLE.le 0 (metric.1 x y)

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

  ∀ {X : Type u} (metric : LRA.Analysis.MetricSpace.MetricDefinition X) (x y : X), metric.distance x y = 0 ↔ x = y

Predicate logic (unfolded):

  Ambient
    (X)
  Objects
    metric : MetricDefinition X
    x y : X
  Prove
    metric.distance x y = 0 ↔ x = y

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

  ∀ {X : Type u} (metric : LRA.Analysis.MetricSpace.MetricDefinition X) (x y : X), metric.distance x y = metric.distance y x

Predicate logic (unfolded):

  Ambient
    (X)
  Objects
    metric : MetricDefinition X
    x y : X
  Prove
    metric.1 x y = metric.1 y x

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

  ∀ {X : Type u} (metric : LRA.Analysis.MetricSpace.MetricDefinition X) (x y z : X), Real.instLE.le (metric.distance x z) (instHAdd.hAdd (metric.distance x y) (metric.distance y z))

Predicate logic (unfolded):

  Ambient
    (X)
  Objects
    metric : MetricDefinition X
    x y z : X
  Prove
    Real.instLE.le (metric.1 x z) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (metric.1 x y) (metric.1 y z))

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

  ∀ {X : Type u} (metric : LRA.Analysis.MetricSpace.MetricDefinition X) (x y z : X), Real.instLE.le (abs (instHSub.hSub (metric.distance x z) (metric.distance y z))) (metric.distance x y)

Predicate logic (unfolded):

  Ambient
    (X)
  Objects
    metric : MetricDefinition X
    x y z : X
  Prove
    Real.instLE.le (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (metric.1 x z) (metric.1 y z))) (metric.1 x y)

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

  ∀ {X : Type u} (metric : LRA.Analysis.MetricSpace.MetricDefinition X) (a b c : X), Real.instLE.le (abs (instHSub.hSub (metric.distance a b) (metric.distance b c))) (metric.distance a c)

Predicate logic (unfolded):

  Ambient
    (X)
  Objects
    metric : MetricDefinition X
    a b c : X
  Prove
    Real.instLE.le (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (metric.1 a b) (metric.1 b c))) (metric.1 a c)

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

  ∀ {X : Type u} [inst : MetricSpace X] (a b c : X), Real.instLE.le (abs (instHSub.hSub (inst.dist a b) (inst.dist b c))) (inst.dist a c)

Predicate logic (unfolded):

  Ambient
    (X)
  Objects
    a b c : X
  Prove
    Real.instLE.le (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (inst.toDist.1 a b) (inst.toDist.1 b c))) (inst.toDist.1 a c)

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
