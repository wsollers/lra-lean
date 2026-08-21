import Mathlib.Data.Real.Basic
import Mathlib.Data.Real.Sqrt
import LRA.Analysis.Completeness.Completeness.Definition

/-!
Existence of square roots and the Dedekind cut of `ℝ` at `√2` having no gap.

Source: ADDITIONS.md items 19, 20, 22, 23.
-/

namespace LRA.Analysis.Completeness

/-- Let `a : ℝ`. If `ha : 0 ≤ a`. Then `∃! b : ℝ, 0 ≤ b ∧ b ^ 2 = a`.

Logical form:

```lean
theorem ExistsUniqueNonnegSqrt (a : ℝ) (ha : 0 ≤ a) :
    ∃! b : ℝ, 0 ≤ b ∧ b ^ 2 = a
```
-/
theorem ExistsUniqueNonnegSqrt (a : ℝ) (ha : 0 ≤ a) :
    ∃! b : ℝ, 0 ≤ b ∧ b ^ 2 = a := by
  sorry

/-- The theorem asserts `(¬ ∃ m ∈ RealCutLowerAtSqrtTwo, ∀ x ∈ RealCutLowerAtSqrtTwo, x ≤ m) ∧
(Real.sqrt 2 ∈ RealCutUpperAtSqrtTwo ∧ ∀ x ∈ RealCutUpperAtSqrtTwo, Real.sqrt 2 ≤ x)`.

Logical form:

```lean
theorem RealDedekindCutAtSqrtTwoHasNoGap :
    (¬ ∃ m ∈ RealCutLowerAtSqrtTwo, ∀ x ∈ RealCutLowerAtSqrtTwo, x ≤ m) ∧
    (Real.sqrt 2 ∈ RealCutUpperAtSqrtTwo ∧
      ∀ x ∈ RealCutUpperAtSqrtTwo, Real.sqrt 2 ≤ x)
```
-/
theorem RealDedekindCutAtSqrtTwoHasNoGap :
    (¬ ∃ m ∈ RealCutLowerAtSqrtTwo, ∀ x ∈ RealCutLowerAtSqrtTwo, x ≤ m) ∧
    (Real.sqrt 2 ∈ RealCutUpperAtSqrtTwo ∧
      ∀ x ∈ RealCutUpperAtSqrtTwo, Real.sqrt 2 ≤ x) := by
  sorry

/-- The theorem asserts `(1 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 2 ∧ (1.4 : ℝ) < Real.sqrt 2 ∧
Real.sqrt 2 < 1.5 ∧ (1.41 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 1.42`.

Logical form:

```lean
theorem BisectionStepsTowardSqrtTwo :
    (1 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 2 ∧
    (1.4 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 1.5 ∧
    (1.41 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 1.42
```
-/
theorem BisectionStepsTowardSqrtTwo :
    (1 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 2 ∧
    (1.4 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 1.5 ∧
    (1.41 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 1.42 := by
  sorry

end LRA.Analysis.Completeness
