import Mathlib.Analysis.Complex.Basic
import LRA.VolumeIV.MetricSpaces.Compatibility.Metric

/-!
Reusable metric definitions for the textbook `MetricDefinition` record.
-/

namespace LRA.VolumeIV.MetricSpaces
namespace Metrics

universe u

/-- The vacuous zero metric on an empty type. Memberwise, there are no points
at which the metric axioms need to be checked.

Logical form:

```lean
MetricDefinition X
```
-/
def VacuousMetric (X : Type u) [IsEmpty X] : MetricDefinition X where
  distance := fun _ _ => 0
  positive := by
    intro x
    exact isEmptyElim x
  symmetric := by
    intro x
    exact isEmptyElim x
  triangle := by
    intro x
    exact isEmptyElim x

/-- The vacuous zero metric on the empty subtype of a type. Memberwise, every
axiom holds because the carrier has no elements.

Logical form:

```lean
MetricDefinition (∅ : Set X)
```
-/
def EmptyMetric (X : Type u) : MetricDefinition (∅ : Set X) where
  distance := fun _ _ => 0
  positive := by
    intro x
    exact x.property.elim
  symmetric := by
    intro x
    exact x.property.elim
  triangle := by
    intro x
    exact x.property.elim

/-- The Euclidean metric on the real line. Memberwise, the distance from `a`
to `b` is `|a - b|`.

Logical form:

```lean
∀ a b : ℝ, EuclideanRMetric.distance a b = |a - b|
```
-/
def EuclideanRMetric : MetricDefinition ℝ where
  distance := fun a b => |a - b|
  positive := by
    sorry
  symmetric := by
    sorry
  triangle := by
    sorry

/-- The zero metric on a singleton subtype. Memberwise, the only available
points are equal to the distinguished point, so zero distance is positive
definite on the subtype.

Logical form:

```lean
MetricDefinition ({point} : Set X)
```
-/
def SingletonMetric {X : Type u} (point : X) : MetricDefinition ({point} : Set X) where
  distance := fun _ _ => 0
  positive := by
    intro x y
    constructor
    · norm_num
    · constructor
      · intro _
        exact Subtype.ext (Eq.trans x.property (Eq.symm y.property))
      · intro _
        rfl
  symmetric := by
    intro x y
    rfl
  triangle := by
    intro x y z
    norm_num

/-- The modulus metric on the complex numbers. Memberwise, the distance from
`a` to `b` is `‖a - b‖`.

Logical form:

```lean
∀ a b : ℂ, ComplexModulusMetric.distance a b = ‖a - b‖
```
-/
noncomputable def ComplexModulusMetric : MetricDefinition ℂ where
  distance := fun a b => ‖a - b‖
  positive := by
    sorry
  symmetric := by
    sorry
  triangle := by
    sorry

/-- The chord metric on a positive-radius circle in the real line.
Memberwise, the distance is inherited from the Euclidean real metric.

Logical form:

```lean
∀ a b : {x : ℝ // |x - center| = radius},
  (RealCircleChordMetric center radius radiusPositive).distance a b = |a.1 - b.1|
```
-/
def RealCircleChordMetric (center : ℝ) (radius : ℝ) (radiusPositive : 0 < radius) :
    MetricDefinition {x : ℝ // |x - center| = radius} where
  distance := fun a b => |a.1 - b.1|
  positive := by
    intro a b
    constructor
    · exact abs_nonneg (a.1 - b.1)
    · constructor
      · intro hAbsEqZero
        have absEqZero : a.1 - b.1 = 0 := by
          exact abs_eq_zero.mp hAbsEqZero
        have underlyingEq : (a : ℝ) = (b : ℝ) := by
          exact sub_eq_zero.mp absEqZero
        exact Subtype.ext underlyingEq
      · intro hEqual
        have underlyingEq : (a : ℝ) = (b : ℝ) := by
          exact Subtype.ext_iff.mp hEqual
        have absEqZero : a.1 - b.1 = 0 := by
          exact sub_eq_zero.mpr underlyingEq
        exact abs_eq_zero.mpr absEqZero
  symmetric := by
    intro a b
    exact abs_sub_comm a.1 b.1
  triangle := by
    intro a b c
    exact abs_sub_le a.1 b.1 c.1

/-- The chord metric on a positive-radius circle in the complex plane.
Memberwise, the distance is inherited from complex modulus.

Logical form:

```lean
∀ a b : {z : ℂ // ‖z - center‖ = radius},
  (ComplexCircleChordMetric center radius radiusPositive).distance a b = ‖a.1 - b.1‖
```
-/
noncomputable def ComplexCircleChordMetric
    (center : ℂ) (radius : ℝ) (radiusPositive : 0 < radius) :
    MetricDefinition {z : ℂ // ‖z - center‖ = radius} where
  distance := fun a b => ‖a.1 - b.1‖
  positive := by
    sorry
  symmetric := by
    sorry
  triangle := by
    sorry

end Metrics
end LRA.VolumeIV.MetricSpaces
