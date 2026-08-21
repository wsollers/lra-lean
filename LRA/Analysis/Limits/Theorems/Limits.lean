import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.Definition

/-!
Source: book-analysis-ii/continuity/notes/limits/{notes-limits.tex,
notes-one-sided-limits.tex, notes-algebra-of-limits.tex}.
-/

namespace LRA.Analysis.Limits

-- `thm:limit-unique`
/-- Let `A : Set ℝ` and `c L₁ L₂ : ℝ`. If `f : ℝ → ℝ`, `hc : ∀ δ > 0, ∃ x ∈ A, 0 < |x - c| ∧ |x - c|
< δ`, `h₁ : TendsTo f A c L₁`, and `h₂ : TendsTo f A c L₂`. Then `L₁ = L₂`.

Logical form:

```lean
theorem TendstoUnique (f : ℝ → ℝ) (A : Set ℝ) (c L₁ L₂ : ℝ)
    (hc : ∀ δ > 0, ∃ x ∈ A, 0 < |x - c| ∧ |x - c| < δ)
    (h₁ : TendsTo f A c L₁) (h₂ : TendsTo f A c L₂) : L₁ = L₂
```
-/
theorem TendstoUnique (f : ℝ → ℝ) (A : Set ℝ) (c L₁ L₂ : ℝ)
    (hc : ∀ δ > 0, ∃ x ∈ A, 0 < |x - c| ∧ |x - c| < δ)
    (h₁ : TendsTo f A c L₁) (h₂ : TendsTo f A c L₂) : L₁ = L₂ := by
  sorry

-- `thm:two-sided-limit-iff-matching-one-sided-limits`
/-- Let `A : Set ℝ` and `c L : ℝ`. If `f : ℝ → ℝ`. Then `TendsTo f A c L ↔ TendsToLeft f A c L ∧
TendsToRight f A c L`.

Logical form:

```lean
theorem TendstoIffOneSidedAgree (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) :
    TendsTo f A c L ↔ TendsToLeft f A c L ∧ TendsToRight f A c L
```
-/
theorem TendstoIffOneSidedAgree (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) :
    TendsTo f A c L ↔ TendsToLeft f A c L ∧ TendsToRight f A c L := by
  sorry

-- ---------------------------------------------------------------------
-- Algebra of limits (`notes-algebra-of-limits.tex` — referenced
-- throughout the book, e.g. as a dependency of the Differentiation
-- chapter's algebra-of-derivatives section).
-- ---------------------------------------------------------------------

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

/-- Let `A : Set ℝ` and `c L : ℝ`. If `f : ℝ → ℝ`. Then `TendsTo f A c L ↔ ∀ xs : ℕ → ℝ,
ApproachesButNotEqual xs A c → ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - L| < ε`.

Logical form:

```lean
theorem SequentialCriterionTendsto (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) :
    TendsTo f A c L ↔
      ∀ xs : ℕ → ℝ, ApproachesButNotEqual xs A c →
        ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - L| < ε
```
-/
theorem SequentialCriterionTendsto (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) :
    TendsTo f A c L ↔
      ∀ xs : ℕ → ℝ, ApproachesButNotEqual xs A c →
        ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - L| < ε := by
  sorry

-- `thm:composition-of-limits`
/-- Let `A B : Set ℝ` and `c₁ c₂ L₂ : ℝ`. If `f g : ℝ → ℝ`, `hf : TendsTo f A c₁ c₂`, `hfA : ∀ x ∈
A, f x ∈ B`, `hg : TendsTo g B c₂ L₂`, and `hgc : g c₂ = L₂`. Then `TendsTo (fun x => g (f x)) A
c₁ L₂`.

Logical form:

```lean
theorem TendstoComp (f g : ℝ → ℝ) (A B : Set ℝ) (c₁ c₂ L₂ : ℝ)
    (hf : TendsTo f A c₁ c₂) (hfA : ∀ x ∈ A, f x ∈ B)
    (hg : TendsTo g B c₂ L₂) (hgc : g c₂ = L₂) :
    TendsTo (fun x => g (f x)) A c₁ L₂
```
-/
theorem TendstoComp (f g : ℝ → ℝ) (A B : Set ℝ) (c₁ c₂ L₂ : ℝ)
    (hf : TendsTo f A c₁ c₂) (hfA : ∀ x ∈ A, f x ∈ B)
    (hg : TendsTo g B c₂ L₂) (hgc : g c₂ = L₂) :
    TendsTo (fun x => g (f x)) A c₁ L₂ := by
  sorry

end LRA.Analysis.Limits
