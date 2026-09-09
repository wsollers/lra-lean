import Mathlib.Data.Real.Basic
import Mathlib.Data.Real.Sqrt
import LRA.Analysis.Completeness.Completeness.Definition

namespace LRA.Analysis.Completeness

/--
`ExistsUniqueNonnegSqrt` TODO

Predicate logic:

  ∀ (a : Real), Real.instLE.le 0 a → ExistsUnique fun b => (Real.instLE.le 0 b ∧ instHPow.hPow b 2 = a)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a : ℝ
  Prove
    Real.instLE.le 0 a → Exists fun x => (((fun b => (Real.instLE.le 0 b ∧ instHPow.1 b 2 = a)) x) ∧ (∀ (y : Real), (Real.instLE.le 0 y ∧ instHPow.1 y 2 = a) → y = x))

Logical form (Lean):

```lean
theorem ExistsUniqueNonnegSqrt (a : ℝ) (ha : 0 ≤ a) :
    ∃! b : ℝ, 0 ≤ b ∧ b ^ 2 = a
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem ExistsUniqueNonnegSqrt (a : ℝ) (ha : 0 ≤ a) :
    ∃! b : ℝ, 0 ≤ b ∧ b ^ 2 = a := by
  sorry
/--
`RealDedekindCutAtSqrtTwoHasNoGap` TODO

Predicate logic:

  ((¬ Exists fun m => (m ∈ LRA.Analysis.Completeness.RealCutLowerAtSqrtTwo ∧ (∀ (x : Real), x ∈ LRA.Analysis.Completeness.RealCutLowerAtSqrtTwo → Real.instLE.le x m))) ∧ (Real.sqrt 2 ∈ LRA.Analysis.Completeness.RealCutUpperAtSqrtTwo ∧ (∀ (x : Real), x ∈ LRA.Analysis.Completeness.RealCutUpperAtSqrtTwo → Real.instLE.le (Real.sqrt 2) x)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (((Exists fun m => (m ∈ LRA.Analysis.Completeness.RealCutLowerAtSqrtTwo ∧ (∀ (x : Real), x ∈ LRA.Analysis.Completeness.RealCutLowerAtSqrtTwo → Real.instLE.le x m))) → False) ∧ (Real.sqrt 2 ∈ LRA.Analysis.Completeness.RealCutUpperAtSqrtTwo ∧ (∀ (x : Real), x ∈ LRA.Analysis.Completeness.RealCutUpperAtSqrtTwo → Real.instLE.le (Real.sqrt 2) x)))

Logical form (Lean):

```lean
theorem RealDedekindCutAtSqrtTwoHasNoGap :
    (¬ ∃ m ∈ RealCutLowerAtSqrtTwo, ∀ x ∈ RealCutLowerAtSqrtTwo, x ≤ m) ∧
    (Real.sqrt 2 ∈ RealCutUpperAtSqrtTwo ∧
      ∀ x ∈ RealCutUpperAtSqrtTwo, Real.sqrt 2 ≤ x)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem RealDedekindCutAtSqrtTwoHasNoGap :
    (¬ ∃ m ∈ RealCutLowerAtSqrtTwo, ∀ x ∈ RealCutLowerAtSqrtTwo, x ≤ m) ∧
    (Real.sqrt 2 ∈ RealCutUpperAtSqrtTwo ∧
      ∀ x ∈ RealCutUpperAtSqrtTwo, Real.sqrt 2 ≤ x) := by
  sorry
/--
`BisectionStepsTowardSqrtTwo` TODO

Predicate logic:

  (Real.instLT.lt 1 (Real.sqrt 2) ∧ (Real.instLT.lt (Real.sqrt 2) 2 ∧ (Real.instLT.lt 1.4 (Real.sqrt 2) ∧ (Real.instLT.lt (Real.sqrt 2) 1.5 ∧ (Real.instLT.lt 1.41 (Real.sqrt 2) ∧ Real.instLT.lt (Real.sqrt 2) 1.42)))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Real.instLT.lt 1 (Real.sqrt 2) ∧ (Real.instLT.lt (Real.sqrt 2) 2 ∧ (Real.instLT.lt (NNRatCast.toOfScientific.1 14 Bool.true 1) (Real.sqrt 2) ∧ (Real.instLT.lt (Real.sqrt 2) (NNRatCast.toOfScientific.1 15 Bool.true 1) ∧ (Real.instLT.lt (NNRatCast.toOfScientific.1 141 Bool.true 2) (Real.sqrt 2) ∧ Real.instLT.lt (Real.sqrt 2) (NNRatCast.toOfScientific.1 142 Bool.true 2))))))

Logical form (Lean):

```lean
theorem BisectionStepsTowardSqrtTwo :
    (1 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 2 ∧
    (1.4 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 1.5 ∧
    (1.41 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 1.42
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem BisectionStepsTowardSqrtTwo :
    (1 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 2 ∧
    (1.4 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 1.5 ∧
    (1.41 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 1.42 := by
  sorry
end LRA.Analysis.Completeness
