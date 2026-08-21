import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.Definition

/-!
Source: book-analysis-ii/continuity/notes/limits/notes-algebra-of-limits.tex
— referenced throughout the book, e.g. as a dependency of the
Differentiation chapter's algebra-of-derivatives section.
-/

namespace LRA.Analysis.Limits

section AlgebraOfLimits

variable {f g : ℝ → ℝ} {A : Set ℝ} {c Lf Lg α : ℝ}

-- `thm:limit-sum`
/-- If `hf : TendsTo f A c Lf` and `hg : TendsTo g A c Lg`. Then `TendsTo (fun x => f x + g x) A c
(Lf + Lg)`.

Logical form:

```lean
theorem TendstoAdd (hf : TendsTo f A c Lf) (hg : TendsTo g A c Lg) :
    TendsTo (fun x => f x + g x) A c (Lf + Lg)
```
-/
theorem TendstoAdd (hf : TendsTo f A c Lf) (hg : TendsTo g A c Lg) :
    TendsTo (fun x => f x + g x) A c (Lf + Lg) := by
  sorry

/-- If `hf : TendsTo f A c Lf` and `hg : TendsTo g A c Lg`. Then `TendsTo (fun x => f x - g x) A c
(Lf - Lg)`.

Logical form:

```lean
theorem TendstoSub (hf : TendsTo f A c Lf) (hg : TendsTo g A c Lg) :
    TendsTo (fun x => f x - g x) A c (Lf - Lg)
```
-/
theorem TendstoSub (hf : TendsTo f A c Lf) (hg : TendsTo g A c Lg) :
    TendsTo (fun x => f x - g x) A c (Lf - Lg) := by
  sorry

-- `thm:limit-scalar-multiple`
/-- Let `α : ℝ`. If `hf : TendsTo f A c Lf`. Then `TendsTo (fun x => α * f x) A c (α * Lf)`.

Logical form:

```lean
theorem TendstoScalar (hf : TendsTo f A c Lf) (α : ℝ) :
    TendsTo (fun x => α * f x) A c (α * Lf)
```
-/
theorem TendstoScalar (hf : TendsTo f A c Lf) (α : ℝ) :
    TendsTo (fun x => α * f x) A c (α * Lf) := by
  sorry

-- `thm:limit-product`
/-- If `hf : TendsTo f A c Lf` and `hg : TendsTo g A c Lg`. Then `TendsTo (fun x => f x * g x) A c
(Lf * Lg)`.

Logical form:

```lean
theorem TendstoMul (hf : TendsTo f A c Lf) (hg : TendsTo g A c Lg) :
    TendsTo (fun x => f x * g x) A c (Lf * Lg)
```
-/
theorem TendstoMul (hf : TendsTo f A c Lf) (hg : TendsTo g A c Lg) :
    TendsTo (fun x => f x * g x) A c (Lf * Lg) := by
  sorry

-- `thm:limit-quotient`
/-- If `hf : TendsTo f A c Lf`, `hg : TendsTo g A c Lg`, and `hLg : Lg ≠ 0`. Then `TendsTo (fun x =>
f x / g x) A c (Lf / Lg)`.

Logical form:

```lean
theorem TendstoDiv (hf : TendsTo f A c Lf) (hg : TendsTo g A c Lg)
    (hLg : Lg ≠ 0) :
    TendsTo (fun x => f x / g x) A c (Lf / Lg)
```
-/
theorem TendstoDiv (hf : TendsTo f A c Lf) (hg : TendsTo g A c Lg)
    (hLg : Lg ≠ 0) :
    TendsTo (fun x => f x / g x) A c (Lf / Lg) := by
  sorry

end AlgebraOfLimits

-- `thm:squeeze-function-limits`
/-- Let `A : Set ℝ` and `c L : ℝ`. If `f g h : ℝ → ℝ`, `hfg : ∀ x ∈ A, f x ≤ g x`, `hgh : ∀ x ∈ A, g
x ≤ h x`, `hf : TendsTo f A c L`, and `hh : TendsTo h A c L`. Then `TendsTo g A c L`.

Logical form:

```lean
theorem SqueezeFunctionLimits (f g h : ℝ → ℝ) (A : Set ℝ) (c L : ℝ)
    (hfg : ∀ x ∈ A, f x ≤ g x) (hgh : ∀ x ∈ A, g x ≤ h x)
    (hf : TendsTo f A c L) (hh : TendsTo h A c L) :
    TendsTo g A c L
```
-/
theorem SqueezeFunctionLimits (f g h : ℝ → ℝ) (A : Set ℝ) (c L : ℝ)
    (hfg : ∀ x ∈ A, f x ≤ g x) (hgh : ∀ x ∈ A, g x ≤ h x)
    (hf : TendsTo f A c L) (hh : TendsTo h A c L) :
    TendsTo g A c L := by
  sorry

end LRA.Analysis.Limits
