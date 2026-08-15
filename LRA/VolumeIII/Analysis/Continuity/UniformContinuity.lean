/-
Draft module; not yet imported by the active Volume III root.
Source: book-analysis-ii/continuity/notes/uniform-continuity/notes-uniform-continuity.tex.

Full-coverage pass over the `uniform-continuity` section. One Lean
statement per book label, `sorry`-bodied.
-/

import Mathlib.Data.Real.Basic
import Mathlib.Analysis.Real.Sqrt
import LRA.VolumeIII.Analysis.Continuity.GlobalTheorems

namespace LRA.Analysis.Continuity

/-- `def:uniform-continuity`.

Logical form:

```lean
def IsUniformlyContinuous (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, ∀ y ∈ A, |x - y| < δ → |f x - f y| < ε
```
-/
def IsUniformlyContinuous (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, ∀ y ∈ A, |x - y| < δ → |f x - f y| < ε

-- `thm:algebra-of-uniform-continuity-bounded`
/-- Let `A : Set ℝ`. If `f g : ℝ → ℝ`, `hf : IsUniformlyContinuous f A`, and `hg :
IsUniformlyContinuous g A`. Then `IsUniformlyContinuous (fun x => f x + g x) A`.

Logical form:

```lean
theorem UcAdd (f g : ℝ → ℝ) (A : Set ℝ)
    (hf : IsUniformlyContinuous f A) (hg : IsUniformlyContinuous g A) :
    IsUniformlyContinuous (fun x => f x + g x) A
```
-/
theorem UcAdd (f g : ℝ → ℝ) (A : Set ℝ)
    (hf : IsUniformlyContinuous f A) (hg : IsUniformlyContinuous g A) :
    IsUniformlyContinuous (fun x => f x + g x) A := by
  sorry

/-- Let `A : Set ℝ`. If `f g : ℝ → ℝ`, `hf : IsUniformlyContinuous f A`, `hg : IsUniformlyContinuous
g A`, `hfB : BoundedOnSet f A`, and `hgB : BoundedOnSet g A`. Then `IsUniformlyContinuous (fun x
=> f x * g x) A`.

Logical form:

```lean
theorem UcMulOfBounded (f g : ℝ → ℝ) (A : Set ℝ)
    (hf : IsUniformlyContinuous f A) (hg : IsUniformlyContinuous g A)
    (hfB : BoundedOnSet f A) (hgB : BoundedOnSet g A) :
    IsUniformlyContinuous (fun x => f x * g x) A
```
-/
theorem UcMulOfBounded (f g : ℝ → ℝ) (A : Set ℝ)
    (hf : IsUniformlyContinuous f A) (hg : IsUniformlyContinuous g A)
    (hfB : BoundedOnSet f A) (hgB : BoundedOnSet g A) :
    IsUniformlyContinuous (fun x => f x * g x) A := by
  sorry

-- `thm:algebra-of-uniform-continuity-general`
/-- Let `A B : Set ℝ`. If `f g : ℝ → ℝ`, `hf : IsUniformlyContinuous f A`, `hfA : ∀ x ∈ A, f x ∈ B`,
and `hg : IsUniformlyContinuous g B`. Then `IsUniformlyContinuous (fun x => g (f x)) A`.

Logical form:

```lean
theorem UcComp (f g : ℝ → ℝ) (A B : Set ℝ)
    (hf : IsUniformlyContinuous f A) (hfA : ∀ x ∈ A, f x ∈ B)
    (hg : IsUniformlyContinuous g B) :
    IsUniformlyContinuous (fun x => g (f x)) A
```
-/
theorem UcComp (f g : ℝ → ℝ) (A B : Set ℝ)
    (hf : IsUniformlyContinuous f A) (hfA : ∀ x ∈ A, f x ∈ B)
    (hg : IsUniformlyContinuous g B) :
    IsUniformlyContinuous (fun x => g (f x)) A := by
  sorry

/-- Let `A : Set ℝ`. If `f : ℝ → ℝ`. Then `IsUniformlyContinuous f A ↔ ∀ xs ys : ℕ → ℝ, (∀ n, xs n ∈
A) → (∀ n, ys n ∈ A) → (∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |xs n - ys n| < ε) → ∀ ε > 0, ∃ N : ℕ, ∀ n ≥
N, |f (xs n) - f (ys n)| < ε`.

Logical form:

```lean
theorem UcIffSequential (f : ℝ → ℝ) (A : Set ℝ) :
    IsUniformlyContinuous f A ↔
      ∀ xs ys : ℕ → ℝ, (∀ n, xs n ∈ A) → (∀ n, ys n ∈ A) →
        (∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |xs n - ys n| < ε) →
        ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - f (ys n)| < ε
```
-/
theorem UcIffSequential (f : ℝ → ℝ) (A : Set ℝ) :
    IsUniformlyContinuous f A ↔
      ∀ xs ys : ℕ → ℝ, (∀ n, xs n ∈ A) → (∀ n, ys n ∈ A) →
        (∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |xs n - ys n| < ε) →
        ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - f (ys n)| < ε := by
  sorry

/-- Let `A : Set ℝ`. If `f : ℝ → ℝ`, `hf : IsUniformlyContinuous f A`, `xs : ℕ → ℝ`, `hxs : ∀ n, xs
n ∈ A`, and `hCauchy : ∀ ε > 0, ∃ N : ℕ, ∀ m ≥ N, ∀ n ≥ N, |xs m - xs n| < ε`. Then `∀ ε > 0, ∃
N : ℕ, ∀ m ≥ N, ∀ n ≥ N, |f (xs m) - f (xs n)| < ε`.

Logical form:

```lean
theorem UcMapsCauchyToCauchy (f : ℝ → ℝ) (A : Set ℝ)
    (hf : IsUniformlyContinuous f A) (xs : ℕ → ℝ) (hxs : ∀ n, xs n ∈ A)
    (hCauchy : ∀ ε > 0, ∃ N : ℕ, ∀ m ≥ N, ∀ n ≥ N, |xs m - xs n| < ε) :
    ∀ ε > 0, ∃ N : ℕ, ∀ m ≥ N, ∀ n ≥ N, |f (xs m) - f (xs n)| < ε
```
-/
theorem UcMapsCauchyToCauchy (f : ℝ → ℝ) (A : Set ℝ)
    (hf : IsUniformlyContinuous f A) (xs : ℕ → ℝ) (hxs : ∀ n, xs n ∈ A)
    (hCauchy : ∀ ε > 0, ∃ N : ℕ, ∀ m ≥ N, ∀ n ≥ N, |xs m - xs n| < ε) :
    ∀ ε > 0, ∃ N : ℕ, ∀ m ≥ N, ∀ n ≥ N, |f (xs m) - f (xs n)| < ε := by
  sorry

/-- `def:lipschitz-condition`, with a fixed generic-`ℝ` argument
convention chosen to be the single canonical signature this draft module
uses throughout (ISSUES.md #50/#58 track the book's own inconsistency
here — this file does not reproduce it).

Logical form:

```lean
def IsLipschitzOn (f : ℝ → ℝ) (A : Set ℝ) (K : ℝ) : Prop :=
  K ≥ 0 ∧ ∀ x ∈ A, ∀ y ∈ A, |f x - f y| ≤ K * |x - y|
```
-/
def IsLipschitzOn (f : ℝ → ℝ) (A : Set ℝ) (K : ℝ) : Prop :=
  K ≥ 0 ∧ ∀ x ∈ A, ∀ y ∈ A, |f x - f y| ≤ K * |x - y|

/-- Let `A : Set ℝ` and `K : ℝ`. If `f : ℝ → ℝ` and `hf : IsLipschitzOn f A K`. Then
`IsUniformlyContinuous f A`.

Logical form:

```lean
theorem LipschitzImpliesUc (f : ℝ → ℝ) (A : Set ℝ) (K : ℝ)
    (hf : IsLipschitzOn f A K) : IsUniformlyContinuous f A
```
-/
theorem LipschitzImpliesUc (f : ℝ → ℝ) (A : Set ℝ) (K : ℝ)
    (hf : IsLipschitzOn f A K) : IsUniformlyContinuous f A := by
  sorry

/-- `def:bi-lipschitz`.

Logical form:

```lean
def IsBiLipschitzOn (f : ℝ → ℝ) (A : Set ℝ) (α K : ℝ) : Prop :=
  0 < α ∧ α ≤ K ∧ ∀ x ∈ A, ∀ y ∈ A,
    α * |x - y| ≤ |f x - f y| ∧ |f x - f y| ≤ K * |x - y|
```
-/
def IsBiLipschitzOn (f : ℝ → ℝ) (A : Set ℝ) (α K : ℝ) : Prop :=
  0 < α ∧ α ≤ K ∧ ∀ x ∈ A, ∀ y ∈ A,
    α * |x - y| ≤ |f x - f y| ∧ |f x - f y| ≤ K * |x - y|

-- `thm:bilipschitz-inverse-is-lipschitz`
/-- Let `A : Set ℝ` and `α K : ℝ`. If `f : ℝ → ℝ`, `hf : IsBiLipschitzOn f A α K`, `finv : ℝ → ℝ`,
and `hfinv : ∀ x ∈ A, finv (f x) = x`. Then `IsLipschitzOn finv (f '' A) (1 / α)`.

Logical form:

```lean
theorem BiLipschitzInverseIsLipschitz (f : ℝ → ℝ) (A : Set ℝ) (α K : ℝ)
    (hf : IsBiLipschitzOn f A α K) (finv : ℝ → ℝ)
    (hfinv : ∀ x ∈ A, finv (f x) = x) :
    IsLipschitzOn finv (f '' A) (1 / α)
```
-/
theorem BiLipschitzInverseIsLipschitz (f : ℝ → ℝ) (A : Set ℝ) (α K : ℝ)
    (hf : IsBiLipschitzOn f A α K) (finv : ℝ → ℝ)
    (hfinv : ∀ x ∈ A, finv (f x) = x) :
    IsLipschitzOn finv (f '' A) (1 / α) := by
  sorry

/-- The theorem asserts `IsUniformlyContinuous Real.sqrt (Set.Icc (0:ℝ) 1) ∧ ¬ ∃ K, IsLipschitzOn
Real.sqrt (Set.Icc (0:ℝ) 1) K`.

Logical form:

```lean
theorem SqrtUcNotLipschitz :
    IsUniformlyContinuous Real.sqrt (Set.Icc (0:ℝ) 1) ∧
    ¬ ∃ K, IsLipschitzOn Real.sqrt (Set.Icc (0:ℝ) 1) K
```
-/
theorem SqrtUcNotLipschitz :
    IsUniformlyContinuous Real.sqrt (Set.Icc (0:ℝ) 1) ∧
    ¬ ∃ K, IsLipschitzOn Real.sqrt (Set.Icc (0:ℝ) 1) K := by
  sorry

end LRA.Analysis.Continuity
