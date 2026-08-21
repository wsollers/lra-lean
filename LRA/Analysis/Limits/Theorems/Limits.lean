import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.Definition

/-!
Source: book-analysis-ii/continuity/notes/limits/notes-limits.tex. Basic
properties of `TendsTo` that aren't algebra, order, or an equivalent
characterization: uniqueness and composition.
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
