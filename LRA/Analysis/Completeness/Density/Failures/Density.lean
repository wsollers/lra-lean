import Mathlib.Data.Rat.Cast.Defs
import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import LRA.Analysis.Completeness.Density.Definition
import LRA.Analysis.Completeness.Density.Theorems

/-!
Order density does not survive intersection, unlike union.
-/

namespace LRA.Analysis.Completeness

/-- The rationals and the irrationals are each order dense in `ℝ`, but their intersection is
empty and hence not order dense.

Logical form:

```lean
theorem IntersectionOfDenseRationalsAndIrrationalsIsNotOrderDense :
    IsOrderDenseSubset (Set.range ((↑) : ℚ → ℝ)) ∧
      IsOrderDenseSubset {x : ℝ | ¬ IsRational x} ∧
      ¬ IsOrderDenseSubset
          (Set.range ((↑) : ℚ → ℝ) ∩ {x : ℝ | ¬ IsRational x})
```
-/
theorem IntersectionOfDenseRationalsAndIrrationalsIsNotOrderDense :
    IsOrderDenseSubset (Set.range ((↑) : ℚ → ℝ)) ∧
      IsOrderDenseSubset {x : ℝ | ¬ IsRational x} ∧
      ¬ IsOrderDenseSubset
          (Set.range ((↑) : ℚ → ℝ) ∩ {x : ℝ | ¬ IsRational x}) := by
  sorry

end LRA.Analysis.Completeness
