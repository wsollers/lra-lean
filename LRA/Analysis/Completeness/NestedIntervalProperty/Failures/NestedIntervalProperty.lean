import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic

/-!
Both hypotheses of the nested interval theorem are necessary: dropping
closedness or boundedness can make the total intersection empty.
-/

namespace LRA.Analysis.Completeness

/-- The theorem asserts `∃ a b : ℕ → ℝ, (∀ n, a n < b n) ∧ (∀ n, Set.Ioo (a (n + 1)) (b (n + 1)) ⊆
Set.Ioo (a n) (b n)) ∧ (⋂ n, Set.Ioo (a n) (b n)) = ∅`.

Logical form:

```lean
theorem OpenNestedIntervalsNeedNotHaveNonemptyIntersection :
    ∃ a b : ℕ → ℝ, (∀ n, a n < b n) ∧
      (∀ n, Set.Ioo (a (n + 1)) (b (n + 1)) ⊆ Set.Ioo (a n) (b n)) ∧
        (⋂ n, Set.Ioo (a n) (b n)) = ∅
```
-/
theorem OpenNestedIntervalsNeedNotHaveNonemptyIntersection :
    ∃ a b : ℕ → ℝ, (∀ n, a n < b n) ∧
      (∀ n, Set.Ioo (a (n + 1)) (b (n + 1)) ⊆ Set.Ioo (a n) (b n)) ∧
        (⋂ n, Set.Ioo (a n) (b n)) = ∅ := by
  sorry

/-- The theorem asserts `∃ a b : ℕ → ℝ, (∀ n, a n < b n) ∧ (∀ n, Set.Ioc (a (n + 1)) (b (n + 1)) ⊆
Set.Ioc (a n) (b n)) ∧ (⋂ n, Set.Ioc (a n) (b n)) = ∅`.

Logical form:

```lean
theorem ClosednessIsNecessaryInNestedIntervalTheorem :
    ∃ a b : ℕ → ℝ, (∀ n, a n < b n) ∧
      (∀ n, Set.Ioc (a (n + 1)) (b (n + 1)) ⊆ Set.Ioc (a n) (b n)) ∧
        (⋂ n, Set.Ioc (a n) (b n)) = ∅
```
-/
theorem ClosednessIsNecessaryInNestedIntervalTheorem :
    ∃ a b : ℕ → ℝ, (∀ n, a n < b n) ∧
      (∀ n, Set.Ioc (a (n + 1)) (b (n + 1)) ⊆ Set.Ioc (a n) (b n)) ∧
        (⋂ n, Set.Ioc (a n) (b n)) = ∅ := by
  sorry

/-- The theorem asserts `∃ a : ℕ → ℝ, (∀ n, Set.Ici (a (n + 1)) ⊆ Set.Ici (a n)) ∧ (⋂ n, Set.Ici (a
n)) = ∅`.

Logical form:

```lean
theorem BoundednessIsNecessaryInNestedIntervalTheorem :
    ∃ a : ℕ → ℝ, (∀ n, Set.Ici (a (n + 1)) ⊆ Set.Ici (a n)) ∧
      (⋂ n, Set.Ici (a n)) = ∅
```
-/
theorem BoundednessIsNecessaryInNestedIntervalTheorem :
    ∃ a : ℕ → ℝ, (∀ n, Set.Ici (a (n + 1)) ⊆ Set.Ici (a n)) ∧
      (⋂ n, Set.Ici (a n)) = ∅ := by
  sorry

end LRA.Analysis.Completeness
