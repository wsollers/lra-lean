import Mathlib.Data.Real.Basic
import Mathlib.Order.Bounds.Basic
import LRA.Analysis.Completeness.Completeness.Definition

/-!
The rationals lack the least-upper-bound property, witnessed concretely by
the Dedekind cut of `ℚ` at `√2` having a gap.

Source: ADDITIONS.md items 19, 20, 22, 23.
-/

namespace LRA.Analysis.Completeness

/-- The theorem asserts `({x : ℚ | x ^ 2 < 2} : Set ℚ).Nonempty ∧ (∃ u : ℚ, ∀ x ∈ ({x : ℚ | x ^ 2 <
2} : Set ℚ), x ≤ u) ∧ ¬ ∃ s : ℚ, IsLUB ({x : ℚ | x ^ 2 < 2} : Set ℚ) s`.

Logical form:

```lean
theorem RationalsLackLubProperty :
    ({x : ℚ | x ^ 2 < 2} : Set ℚ).Nonempty ∧
      (∃ u : ℚ, ∀ x ∈ ({x : ℚ | x ^ 2 < 2} : Set ℚ), x ≤ u) ∧
      ¬ ∃ s : ℚ, IsLUB ({x : ℚ | x ^ 2 < 2} : Set ℚ) s
```
-/
theorem RationalsLackLubProperty :
    ({x : ℚ | x ^ 2 < 2} : Set ℚ).Nonempty ∧
      (∃ u : ℚ, ∀ x ∈ ({x : ℚ | x ^ 2 < 2} : Set ℚ), x ≤ u) ∧
      ¬ ∃ s : ℚ, IsLUB ({x : ℚ | x ^ 2 < 2} : Set ℚ) s := by
  sorry

/-- The theorem asserts `(¬ ∃ m ∈ RationalCutLowerAtSqrtTwo, ∀ x ∈ RationalCutLowerAtSqrtTwo, x ≤ m)
∧ (¬ ∃ m ∈ RationalCutUpperAtSqrtTwo, ∀ x ∈ RationalCutUpperAtSqrtTwo, m ≤ x)`.

Logical form:

```lean
theorem RationalDedekindCutAtSqrtTwoHasAGap :
    (¬ ∃ m ∈ RationalCutLowerAtSqrtTwo,
        ∀ x ∈ RationalCutLowerAtSqrtTwo, x ≤ m) ∧
    (¬ ∃ m ∈ RationalCutUpperAtSqrtTwo,
        ∀ x ∈ RationalCutUpperAtSqrtTwo, m ≤ x)
```
-/
theorem RationalDedekindCutAtSqrtTwoHasAGap :
    (¬ ∃ m ∈ RationalCutLowerAtSqrtTwo,
        ∀ x ∈ RationalCutLowerAtSqrtTwo, x ≤ m) ∧
    (¬ ∃ m ∈ RationalCutUpperAtSqrtTwo,
        ∀ x ∈ RationalCutUpperAtSqrtTwo, m ≤ x) := by
  sorry

end LRA.Analysis.Completeness
