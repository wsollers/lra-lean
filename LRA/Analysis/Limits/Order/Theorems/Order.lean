import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.Definition

/-!
Order-theoretic properties of function limits: `≤` (but not `<`) survives
into the limit, the converse direction for strict inequality, local
boundedness near a limit point, and sign persistence near the limit.
-/

namespace LRA.Analysis.Limits

variable {f g : ℝ → ℝ} {A : Set ℝ} {c Lf Lg L : ℝ}

/-- Order is preserved (non-strictly) by limits: if `f ≤ g` pointwise on `A` and both limits exist,
then `Lf ≤ Lg`. Strict inequality does **not** transfer this way — see
`PointwiseStrictOrderNeedNotPersistInTheLimit` in `Failures`.

Logical form:

```lean
theorem TendstoOrderLe (hfg : ∀ x ∈ A, f x ≤ g x)
    (hf : TendsTo f A c Lf) (hg : TendsTo g A c Lg) :
    Lf ≤ Lg
```
-/
theorem TendstoOrderLe (hfg : ∀ x ∈ A, f x ≤ g x)
    (hf : TendsTo f A c Lf) (hg : TendsTo g A c Lg) :
    Lf ≤ Lg := by
  sorry

/-- The converse direction of strict order: if the limits are strictly ordered, the functions are
strictly ordered near `c`. (This is the genuinely strict fact — order only sharpens as you
approach the limit, it never has to widen from a strict pointwise hypothesis.)

Logical form:

```lean
theorem TendstoStrictOrderNear (hf : TendsTo f A c Lf) (hg : TendsTo g A c Lg)
    (hLfg : Lf < Lg) :
    ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → f x < g x
```
-/
theorem TendstoStrictOrderNear (hf : TendsTo f A c Lf) (hg : TendsTo g A c Lg)
    (hLfg : Lf < Lg) :
    ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → f x < g x := by
  sorry

/-- A function with a limit at `c` is bounded near `c`.

Logical form:

```lean
theorem TendstoBoundedNear (hf : TendsTo f A c L) :
    ∃ δ > 0, ∃ M : ℝ, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → |f x| ≤ M
```
-/
theorem TendstoBoundedNear (hf : TendsTo f A c L) :
    ∃ δ > 0, ∃ M : ℝ, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → |f x| ≤ M := by
  sorry

/-- A function whose limit is nonzero has the same sign as its limit near `c` (in particular, it is
itself nonzero there). Stated as `0 < L * f x` since that single inequality captures both facts
at once.

Logical form:

```lean
theorem TendstoSameSignNear (hf : TendsTo f A c L) (hL : L ≠ 0) :
    ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → 0 < L * f x
```
-/
theorem TendstoSameSignNear (hf : TendsTo f A c L) (hL : L ≠ 0) :
    ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → 0 < L * f x := by
  sorry

end LRA.Analysis.Limits
