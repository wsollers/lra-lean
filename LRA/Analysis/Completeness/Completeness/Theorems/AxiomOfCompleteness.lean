import Mathlib.Data.Real.Basic
import LRA.Analysis.Bounds.Extrema.SupremaInfima
import LRA.Analysis.Completeness.Completeness.Definition

/-!
Direct consequences of the axiom of completeness for concrete real sets.
-/

namespace LRA.Analysis.Completeness

open LRA.Analysis.Bounds.Extrema
open LRA.Analysis.Bounds

/-- Let `A : Set ℝ`. If `nonemptyHypothesis : A.Nonempty` and `boundedAboveHypothesis : ∃ u,
IsUpperBound u A`. Then `∃ s, IsSupremum s A`.

Logical form:

```lean
theorem CompletenessGivesRealSupremum {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedAboveHypothesis : ∃ u, IsUpperBound u A) :
    ∃ s, IsSupremum s A
```
-/
theorem CompletenessGivesRealSupremum {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedAboveHypothesis : ∃ u, IsUpperBound u A) :
    ∃ s, IsSupremum s A := by
  sorry

end LRA.Analysis.Completeness
