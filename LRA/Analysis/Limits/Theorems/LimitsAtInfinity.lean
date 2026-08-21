import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.Definition

/-!
Source: book-analysis-ii/continuity/notes/limits-at-infinity/notes-limits-at-infinity.tex.
Fills ISSUES.md #51: the section's own toolkit table promises an "algebra
of limits" and a "sequential criterion" for limits at infinity.
-/

namespace LRA.Analysis.Limits

/-- Let `X : Set ℝ` and `L : ℝ`. If `f : ℝ → ℝ`. Then `TendsToNegInfty f X L ↔ TendsToInfty (fun x
=> f (-x)) {x : ℝ | -x ∈ X} L`.

Logical form:

```lean
theorem LimitAtNegInfinityIffReflection (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ) :
    TendsToNegInfty f X L ↔ TendsToInfty (fun x => f (-x)) {x : ℝ | -x ∈ X} L
```
-/
theorem LimitAtNegInfinityIffReflection (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ) :
    TendsToNegInfty f X L ↔ TendsToInfty (fun x => f (-x)) {x : ℝ | -x ∈ X} L := by
  sorry

-- ---------------------------------------------------------------------
-- Item 30: Algebra of limits at infinity.
-- ---------------------------------------------------------------------

section AlgebraOfLimitsAtInfinity

variable {f g : ℝ → ℝ} {X : Set ℝ} {Lf Lg c : ℝ}

/-- If `hf : TendsToInfty f X Lf` and `hg : TendsToInfty g X Lg`. Then `TendsToInfty (fun x => f x +
g x) X (Lf + Lg)`.

Logical form:

```lean
theorem TendstoInftyAdd (hf : TendsToInfty f X Lf) (hg : TendsToInfty g X Lg) :
    TendsToInfty (fun x => f x + g x) X (Lf + Lg)
```
-/
theorem TendstoInftyAdd (hf : TendsToInfty f X Lf) (hg : TendsToInfty g X Lg) :
    TendsToInfty (fun x => f x + g x) X (Lf + Lg) := by
  sorry

/-- If `hf : TendsToInfty f X Lf` and `hg : TendsToInfty g X Lg`. Then `TendsToInfty (fun x => f x -
g x) X (Lf - Lg)`.

Logical form:

```lean
theorem TendstoInftySub (hf : TendsToInfty f X Lf) (hg : TendsToInfty g X Lg) :
    TendsToInfty (fun x => f x - g x) X (Lf - Lg)
```
-/
theorem TendstoInftySub (hf : TendsToInfty f X Lf) (hg : TendsToInfty g X Lg) :
    TendsToInfty (fun x => f x - g x) X (Lf - Lg) := by
  sorry

/-- Let `c : ℝ`. If `hf : TendsToInfty f X Lf`. Then `TendsToInfty (fun x => c * f x) X (c * Lf)`.

Logical form:

```lean
theorem TendstoInftyScalar (hf : TendsToInfty f X Lf) (c : ℝ) :
    TendsToInfty (fun x => c * f x) X (c * Lf)
```
-/
theorem TendstoInftyScalar (hf : TendsToInfty f X Lf) (c : ℝ) :
    TendsToInfty (fun x => c * f x) X (c * Lf) := by
  sorry

/-- If `hf : TendsToInfty f X Lf` and `hg : TendsToInfty g X Lg`. Then `TendsToInfty (fun x => f x *
g x) X (Lf * Lg)`.

Logical form:

```lean
theorem TendstoInftyMul (hf : TendsToInfty f X Lf) (hg : TendsToInfty g X Lg) :
    TendsToInfty (fun x => f x * g x) X (Lf * Lg)
```
-/
theorem TendstoInftyMul (hf : TendsToInfty f X Lf) (hg : TendsToInfty g X Lg) :
    TendsToInfty (fun x => f x * g x) X (Lf * Lg) := by
  sorry

/-- If `hf : TendsToInfty f X Lf`, `hg : TendsToInfty g X Lg`, and `hLg : Lg ≠ 0`. Then
`TendsToInfty (fun x => f x / g x) X (Lf / Lg)`.

Logical form:

```lean
theorem TendstoInftyDiv (hf : TendsToInfty f X Lf) (hg : TendsToInfty g X Lg)
    (hLg : Lg ≠ 0) :
    TendsToInfty (fun x => f x / g x) X (Lf / Lg)
```
-/
theorem TendstoInftyDiv (hf : TendsToInfty f X Lf) (hg : TendsToInfty g X Lg)
    (hLg : Lg ≠ 0) :
    TendsToInfty (fun x => f x / g x) X (Lf / Lg) := by
  sorry

end AlgebraOfLimitsAtInfinity

-- ---------------------------------------------------------------------
-- Item 31: Sequential criterion for limits at infinity.
-- ---------------------------------------------------------------------

/-- Let `X : Set ℝ` and `L : ℝ`. If `f : ℝ → ℝ` and `hX : ∀ M : ℝ, ∃ x ∈ X, x > M`. Then
`TendsToInfty f X L ↔ ∀ xs : ℕ → ℝ, (∀ n, xs n ∈ X) → EscapesToInfty xs → ∀ ε > 0, ∃ N : ℕ, ∀ n
≥ N, |f (xs n) - L| < ε`.

Logical form:

```lean
theorem SequentialCriterionTendstoInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ)
    (hX : ∀ M : ℝ, ∃ x ∈ X, x > M) :
    TendsToInfty f X L ↔
      ∀ xs : ℕ → ℝ, (∀ n, xs n ∈ X) → EscapesToInfty xs →
        ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - L| < ε
```
-/
theorem SequentialCriterionTendstoInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ)
    (hX : ∀ M : ℝ, ∃ x ∈ X, x > M) :
    TendsToInfty f X L ↔
      ∀ xs : ℕ → ℝ, (∀ n, xs n ∈ X) → EscapesToInfty xs →
        ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - L| < ε := by
  sorry

end LRA.Analysis.Limits
