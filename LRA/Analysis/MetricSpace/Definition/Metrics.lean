import Mathlib.Analysis.Complex.Basic
import LRA.Analysis.MetricSpace.Definition.Metric

namespace LRA.Analysis.MetricSpace
namespace Metrics

universe u

/--
`VacuousMetric` TODO

Predicate logic:

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

Predicate logic (unfolded):

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
      exact isEmptyElim x (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
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
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

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

/--
`EmptyMetric` TODO

Predicate logic:

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

Predicate logic (unfolded):

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
      exact x.property.elim (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
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
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

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

/--
`EuclideanRMetricPositive` TODO

Predicate logic:

  ∀ (a b : Real), (Real.instLE.le 0 (abs (instHSub.hSub a b)) ∧ (abs (instHSub.hSub a b) = 0 ↔ a = b))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Real.instLE.le 0 (abs (instHSub.hSub a b)) ∧ (abs (instHSub.hSub a b) = 0 ↔ a = b))

Logical form (Lean):

```lean
theorem EuclideanRMetricPositive :
    ∀ a b : ℝ, 0 ≤ |a - b| ∧ (|a - b| = 0 ↔ a = b)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
theorem EuclideanRMetricPositive :
    ∀ a b : ℝ, 0 ≤ |a - b| ∧ (|a - b| = 0 ↔ a = b) := by
  sorry
/--
`EuclideanRMetricSymmetric` TODO

Predicate logic:

  ∀ (a b : Real), abs (instHSub.hSub a b) = abs (instHSub.hSub b a)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub a b) = abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub b a)

Logical form (Lean):

```lean
theorem EuclideanRMetricSymmetric :
    ∀ a b : ℝ, |a - b| = |b - a|
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
theorem EuclideanRMetricSymmetric :
    ∀ a b : ℝ, |a - b| = |b - a| := by
  sorry
/--
`EuclideanRMetricTriangle` TODO

Predicate logic:

  ∀ (a b c : Real), Real.instLE.le (abs (instHSub.hSub a c)) (instHAdd.hAdd (abs (instHSub.hSub a b)) (abs (instHSub.hSub b c)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLE.le (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub a c)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub a b)) (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub b c)))

Logical form (Lean):

```lean
theorem EuclideanRMetricTriangle :
    ∀ a b c : ℝ, |a - c| ≤ |a - b| + |b - c|
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
theorem EuclideanRMetricTriangle :
    ∀ a b c : ℝ, |a - c| ≤ |a - b| + |b - c| := by
  sorry
/--
`EuclideanRMetric` TODO

Predicate logic:

  def EuclideanRMetric : MetricDefinition ℝ where
    distance := fun a b => |a - b|
    positive := EuclideanRMetricPositive
    symmetric := EuclideanRMetricSymmetric
    triangle := EuclideanRMetricTriangle

Predicate logic (unfolded):

  def EuclideanRMetric : MetricDefinition ℝ where
    distance := fun a b => |a - b|
    positive := EuclideanRMetricPositive
    symmetric := EuclideanRMetricSymmetric
    triangle := EuclideanRMetricTriangle (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def EuclideanRMetric : MetricDefinition ℝ where
  distance := fun a b => |a - b|
  positive := EuclideanRMetricPositive
  symmetric := EuclideanRMetricSymmetric
  triangle := EuclideanRMetricTriangle
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def EuclideanRMetric : MetricDefinition ℝ where
  distance := fun a b => |a - b|
  positive := EuclideanRMetricPositive
  symmetric := EuclideanRMetricSymmetric
  triangle := EuclideanRMetricTriangle

/--
`SingletonMetric` TODO

Predicate logic:

  def SingletonMetric {X : Type u} (point : X) : MetricDefinition ({point} : Set X) where
    distance

Predicate logic (unfolded):

  def SingletonMetric {X : Type u} (point : X) : MetricDefinition ({point} : Set X) where
    distance (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SingletonMetric {X : Type u} (point : X) : MetricDefinition ({point} : Set X) where
  distance
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

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

/--
`ComplexModulusMetricPositive` TODO

Predicate logic:

  ∀ (a b : Complex), (Real.instLE.le 0 (Complex.instNorm.norm (instHSub.hSub a b)) ∧ (Complex.instNorm.norm (instHSub.hSub a b) = 0 ↔ a = b))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Real.instLE.le 0 (Complex.instNorm.norm (instHSub.hSub a b)) ∧ (Complex.instNorm.norm (instHSub.hSub a b) = 0 ↔ a = b))

Logical form (Lean):

```lean
theorem ComplexModulusMetricPositive :
    ∀ a b : ℂ, 0 ≤ ‖a - b‖ ∧ (‖a - b‖ = 0 ↔ a = b)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
theorem ComplexModulusMetricPositive :
    ∀ a b : ℂ, 0 ≤ ‖a - b‖ ∧ (‖a - b‖ = 0 ↔ a = b) := by
  sorry
/--
`ComplexModulusMetricSymmetric` TODO

Predicate logic:

  ∀ (a b : Complex), Complex.instNorm.norm (instHSub.hSub a b) = Complex.instNorm.norm (instHSub.hSub b a)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Complex.instNorm.1 ({ hSub := fun a b => Complex.instSub.sub a b }.hSub a b) = Complex.instNorm.1 ({ hSub := fun a b => Complex.instSub.sub a b }.hSub b a)

Logical form (Lean):

```lean
theorem ComplexModulusMetricSymmetric :
    ∀ a b : ℂ, ‖a - b‖ = ‖b - a‖
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
theorem ComplexModulusMetricSymmetric :
    ∀ a b : ℂ, ‖a - b‖ = ‖b - a‖ := by
  sorry
/--
`ComplexModulusMetricTriangle` TODO

Predicate logic:

  ∀ (a b c : Complex), Real.instLE.le (Complex.instNorm.norm (instHSub.hSub a c)) (instHAdd.hAdd (Complex.instNorm.norm (instHSub.hSub a b)) (Complex.instNorm.norm (instHSub.hSub b c)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLE.le (Complex.instNorm.1 ({ hSub := fun a b => Complex.instSub.sub a b }.hSub a c)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (Complex.instNorm.1 ({ hSub := fun a b => Complex.instSub.sub a b }.hSub a b)) (Complex.instNorm.1 ({ hSub := fun a b => Complex.instSub.sub a b }.hSub b c)))

Logical form (Lean):

```lean
theorem ComplexModulusMetricTriangle :
    ∀ a b c : ℂ, ‖a - c‖ ≤ ‖a - b‖ + ‖b - c‖
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
theorem ComplexModulusMetricTriangle :
    ∀ a b c : ℂ, ‖a - c‖ ≤ ‖a - b‖ + ‖b - c‖ := by
  sorry
/--
`ComplexModulusMetric` TODO

Predicate logic:

  noncomputable def ComplexModulusMetric : MetricDefinition ℂ where
    distance := fun a b => ‖a - b‖
    positive := ComplexModulusMetricPositive
    symmetric := ComplexModulusMetricSymmetric
    triangle := ComplexModulusMetricTriangle

Predicate logic (unfolded):

  noncomputable def ComplexModulusMetric : MetricDefinition ℂ where
    distance := fun a b => ‖a - b‖
    positive := ComplexModulusMetricPositive
    symmetric := ComplexModulusMetricSymmetric
    triangle := ComplexModulusMetricTriangle (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def ComplexModulusMetric : MetricDefinition ℂ where
  distance := fun a b => ‖a - b‖
  positive := ComplexModulusMetricPositive
  symmetric := ComplexModulusMetricSymmetric
  triangle := ComplexModulusMetricTriangle
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
noncomputable def ComplexModulusMetric : MetricDefinition ℂ where
  distance := fun a b => ‖a - b‖
  positive := ComplexModulusMetricPositive
  symmetric := ComplexModulusMetricSymmetric
  triangle := ComplexModulusMetricTriangle

/--
`RealCircleChordMetric` TODO

Predicate logic:

  def RealCircleChordMetric (center : ℝ) (radius : ℝ) (radiusPositive : 0 < radius) :
      MetricDefinition {x : ℝ // |x - center| = radius} where
    distance

Predicate logic (unfolded):

  def RealCircleChordMetric (center : ℝ) (radius : ℝ) (radiusPositive : 0 < radius) :
      MetricDefinition {x : ℝ // |x - center| = radius} where
    distance (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def RealCircleChordMetric (center : ℝ) (radius : ℝ) (radiusPositive : 0 < radius) :
    MetricDefinition {x : ℝ // |x - center| = radius} where
  distance
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

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

/--
`ComplexCircleChordMetricPositive` TODO

Predicate logic:

  ∀ (center : Complex) (radius : Real), Real.instLT.lt 0 radius → ∀ (a b : Subtype fun z => Complex.instNorm.norm (instHSub.hSub z center) = radius), (Real.instLE.le 0 (Complex.instNorm.norm (instHSub.hSub a.val b.val)) ∧ (Complex.instNorm.norm (instHSub.hSub a.val b.val) = 0 ↔ a = b))

Predicate logic (unfolded):

  Ambient
    (ℂ)
  Objects
    center : ℂ
    radius : ℝ
  Prove
    Real.instLT.lt 0 radius → ∀ (a b : Subtype fun z => Complex.instNorm.norm (instHSub.hSub z center) = radius), (Real.instLE.le 0 (Complex.instNorm.norm (instHSub.hSub a.val b.val)) ∧ (Complex.instNorm.norm (instHSub.hSub a.val b.val) = 0 ↔ a = b))

Logical form (Lean):

```lean
theorem ComplexCircleChordMetricPositive
    (center : ℂ) (radius : ℝ) (radiusPositive : 0 < radius) :
    ∀ a b : {z : ℂ // ‖z - center‖ = radius},
      0 ≤ ‖a.1 - b.1‖ ∧ (‖a.1 - b.1‖ = 0 ↔ a = b)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
theorem ComplexCircleChordMetricPositive
    (center : ℂ) (radius : ℝ) (radiusPositive : 0 < radius) :
    ∀ a b : {z : ℂ // ‖z - center‖ = radius},
      0 ≤ ‖a.1 - b.1‖ ∧ (‖a.1 - b.1‖ = 0 ↔ a = b) := by
  sorry
/--
`ComplexCircleChordMetricSymmetric` TODO

Predicate logic:

  ∀ (center : Complex) (radius : Real), Real.instLT.lt 0 radius → ∀ (a b : Subtype fun z => Complex.instNorm.norm (instHSub.hSub z center) = radius), Complex.instNorm.norm (instHSub.hSub a.val b.val) = Complex.instNorm.norm (instHSub.hSub b.val a.val)

Predicate logic (unfolded):

  Ambient
    (ℂ)
  Objects
    center : ℂ
    radius : ℝ
  Prove
    Real.instLT.lt 0 radius → ∀ (a b : Subtype fun z => Complex.instNorm.1 ({ hSub := fun a b => Complex.instSub.sub a b }.hSub z center) = radius), Complex.instNorm.1 ({ hSub := fun a b => Complex.instSub.sub a b }.hSub a.1 b.1) = Complex.instNorm.1 ({ hSub := fun a b => Complex.instSub.sub a b }.hSub b.1 a.1)

Logical form (Lean):

```lean
theorem ComplexCircleChordMetricSymmetric
    (center : ℂ) (radius : ℝ) (radiusPositive : 0 < radius) :
    ∀ a b : {z : ℂ // ‖z - center‖ = radius},
      ‖a.1 - b.1‖ = ‖b.1 - a.1‖
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
theorem ComplexCircleChordMetricSymmetric
    (center : ℂ) (radius : ℝ) (radiusPositive : 0 < radius) :
    ∀ a b : {z : ℂ // ‖z - center‖ = radius},
      ‖a.1 - b.1‖ = ‖b.1 - a.1‖ := by
  sorry
/--
`ComplexCircleChordMetricTriangle` TODO

Predicate logic:

  ∀ (center : Complex) (radius : Real), Real.instLT.lt 0 radius → ∀ (a b c : Subtype fun z => Complex.instNorm.norm (instHSub.hSub z center) = radius), Real.instLE.le (Complex.instNorm.norm (instHSub.hSub a.val c.val)) (instHAdd.hAdd (Complex.instNorm.norm (instHSub.hSub a.val b.val)) (Complex.instNorm.norm (instHSub.hSub b.val c.val)))

Predicate logic (unfolded):

  Ambient
    (ℂ)
  Objects
    center : ℂ
    radius : ℝ
  Prove
    Real.instLT.lt 0 radius → ∀ (a b c : Subtype fun z => Complex.instNorm.1 ({ hSub := fun a b => Complex.instSub.sub a b }.hSub z center) = radius), Real.instLE.le (Complex.instNorm.1 ({ hSub := fun a b => Complex.instSub.sub a b }.hSub a.1 c.1)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (Complex.instNorm.1 ({ hSub := fun a b => Complex.instSub.sub a b }.hSub a.1 b.1)) (Complex.instNorm.1 ({ hSub := fun a b => Complex.instSub.sub a b }.hSub b.1 c.1)))

Logical form (Lean):

```lean
theorem ComplexCircleChordMetricTriangle
    (center : ℂ) (radius : ℝ) (radiusPositive : 0 < radius) :
    ∀ a b c : {z : ℂ // ‖z - center‖ = radius},
      ‖a.1 - c.1‖ ≤ ‖a.1 - b.1‖ + ‖b.1 - c.1‖
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
theorem ComplexCircleChordMetricTriangle
    (center : ℂ) (radius : ℝ) (radiusPositive : 0 < radius) :
    ∀ a b c : {z : ℂ // ‖z - center‖ = radius},
      ‖a.1 - c.1‖ ≤ ‖a.1 - b.1‖ + ‖b.1 - c.1‖ := by
  sorry
/--
`ComplexCircleChordMetric` TODO

Predicate logic:

  noncomputable def ComplexCircleChordMetric
      (center : ℂ) (radius : ℝ) (radiusPositive : 0 < radius) :
      MetricDefinition {z : ℂ // ‖z - center‖ = radius} where
    distance := fun a b => ‖a.1 - b.1‖
    positive := ComplexCircleChordMetricPositive center radius radiusPositive
    symmetric := ComplexCircleChordMetricSymmetric center radius radiusPositive
    triangle := ComplexCircleChordMetricTriangle center radius radiusPositive

Predicate logic (unfolded):

  noncomputable def ComplexCircleChordMetric
      (center : ℂ) (radius : ℝ) (radiusPositive : 0 < radius) :
      MetricDefinition {z : ℂ // ‖z - center‖ = radius} where
    distance := fun a b => ‖a.1 - b.1‖
    positive := ComplexCircleChordMetricPositive center radius radiusPositive
    symmetric := ComplexCircleChordMetricSymmetric center radius radiusPositive
    triangle := ComplexCircleChordMetricTriangle center radius radiusPositive (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def ComplexCircleChordMetric
    (center : ℂ) (radius : ℝ) (radiusPositive : 0 < radius) :
    MetricDefinition {z : ℂ // ‖z - center‖ = radius} where
  distance := fun a b => ‖a.1 - b.1‖
  positive := ComplexCircleChordMetricPositive center radius radiusPositive
  symmetric := ComplexCircleChordMetricSymmetric center radius radiusPositive
  triangle := ComplexCircleChordMetricTriangle center radius radiusPositive
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
noncomputable def ComplexCircleChordMetric
    (center : ℂ) (radius : ℝ) (radiusPositive : 0 < radius) :
    MetricDefinition {z : ℂ // ‖z - center‖ = radius} where
  distance := fun a b => ‖a.1 - b.1‖
  positive := ComplexCircleChordMetricPositive center radius radiusPositive
  symmetric := ComplexCircleChordMetricSymmetric center radius radiusPositive
  triangle := ComplexCircleChordMetricTriangle center radius radiusPositive

end Metrics
end LRA.Analysis.MetricSpace
