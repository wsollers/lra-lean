/-
Source: book-analysis-ii/continuity/notes/limits/{notes-limits.tex,
notes-one-sided-limits.tex, notes-algebra-of-limits.tex}. Moved out of
`Continuity` since its algebra (`TendstoAdd`, `TendstoMul`, ...) depends on
`Functions`' pointwise-operation algebra, and `Differentiation` depends on
it directly rather than through `Continuity`'s own `ContinuousAtPoint`.
-/

import Mathlib.Data.Real.Basic

namespace LRA.Analysis.Limits

/-- `def:limit-function`: the ε-δ definition of the limit of `f` at `c`,
on domain `A`, `c` a limit point of `A`.

Logical form:

```lean
def TendsTo (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → |f x - L| < ε
```
-/
def TendsTo (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → |f x - L| < ε

/-- `def:right-hand-limit`.

Logical form:

```lean
def TendsToRight (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → |f x - L| < ε
```
-/
def TendsToRight (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → |f x - L| < ε

/-- `def:left-hand-limit`.

Logical form:

```lean
def TendsToLeft (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → |f x - L| < ε
```
-/
def TendsToLeft (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → |f x - L| < ε

/-- `prop:sequential-criterion-limits`: a sequence-based characterization
of `TendsTo`, referenced from the `limits-at-infinity` section's toolkit
table and from the Differentiation chapter.

Logical form:

```lean
def ApproachesButNotEqual (xs : ℕ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  (∀ n, xs n ∈ A) ∧ (∀ n, xs n ≠ c) ∧
    ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |xs n - c| < ε
```
-/
def ApproachesButNotEqual (xs : ℕ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  (∀ n, xs n ∈ A) ∧ (∀ n, xs n ≠ c) ∧
    ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |xs n - c| < ε

end LRA.Analysis.Limits
