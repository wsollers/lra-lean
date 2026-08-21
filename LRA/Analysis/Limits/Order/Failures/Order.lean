import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.Definition

/-!
Strict pointwise order does not persist into the limit — only `≤` does.
-/

namespace LRA.Analysis.Limits

/-- Strict inequality holding everywhere on the domain does not force strict inequality between
the limits: the witness `f = 0`, `g = fun x => x ^ 2` has `f x < g x` for every nonzero `x`, yet
both tend to `0` as `x → 0`.

Logical form:

```lean
theorem PointwiseStrictOrderNeedNotPersistInTheLimit :
    ∃ (f g : ℝ → ℝ) (A : Set ℝ) (c Lf Lg : ℝ),
      (∀ x ∈ A, f x < g x) ∧ TendsTo f A c Lf ∧ TendsTo g A c Lg ∧ Lf = Lg
```
-/
theorem PointwiseStrictOrderNeedNotPersistInTheLimit :
    ∃ (f g : ℝ → ℝ) (A : Set ℝ) (c Lf Lg : ℝ),
      (∀ x ∈ A, f x < g x) ∧ TendsTo f A c Lf ∧ TendsTo g A c Lg ∧ Lf = Lg := by
  sorry

end LRA.Analysis.Limits
