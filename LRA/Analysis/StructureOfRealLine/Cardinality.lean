import Mathlib.Data.Real.Basic

namespace LRA.Analysis.StructureOfRealLine

/-!
Cardinality statements for the real line and its standard intervals.
-/

/-- The closed unit interval `[0,1]` is uncountable: no sequence of real
numbers enumerates every point of the interval.

Logical form:

```lean
theorem ClosedUnitIntervalUncountable :
    ¬ ∃ enumerate : ℕ → ℝ,
      ∀ x : ℝ, x ∈ Set.Icc (0 : ℝ) 1 → ∃ index : ℕ, enumerate index = x
```
-/
theorem ClosedUnitIntervalUncountable :
    ¬ ∃ enumerate : ℕ → ℝ,
      ∀ x : ℝ, x ∈ Set.Icc (0 : ℝ) 1 → ∃ index : ℕ, enumerate index = x := by
  sorry

end LRA.Analysis.StructureOfRealLine
