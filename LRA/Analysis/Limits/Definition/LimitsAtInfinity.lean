/-
Source: book-analysis-ii/continuity/notes/limits-at-infinity/notes-limits-at-infinity.tex.
ADDITIONS.md items 30-32 (Continuity chapter, Ch.9*).
-/

import Mathlib.Data.Real.Basic

namespace LRA.Analysis.Limits

/-- `def:infinite-adherent-points`: `+∞` (resp. `−∞`) is an adherent
point of `A` if `A` is unbounded above (resp. below) — the domain
hypothesis under which `TendsToInfty`/`TendsToNegInfty` are meaningful.

Logical form:

```lean
def PlusInftyAdherent (A : Set ℝ) : Prop := ∀ M : ℝ, ∃ x ∈ A, x > M
```
-/
def PlusInftyAdherent (A : Set ℝ) : Prop := ∀ M : ℝ, ∃ x ∈ A, x > M

/--
`MinusInftyAdherent` defines the displayed object for minus infty adherent.

Logical form:

```lean
def MinusInftyAdherent (A : Set ℝ) : Prop := ∀ M : ℝ, ∃ x ∈ A, x < M
```
-/
def MinusInftyAdherent (A : Set ℝ) : Prop := ∀ M : ℝ, ∃ x ∈ A, x < M

/-- `def:limit-at-infinity` (restated): the limit of `f` at `+∞`, on
domain `X`, equals `L`.

Logical form:

```lean
def TendsToInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ) : Prop :=
  ∀ ε > 0, ∃ M : ℝ, ∀ x ∈ X, x > M → |f x - L| < ε
```
-/
def TendsToInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ) : Prop :=
  ∀ ε > 0, ∃ M : ℝ, ∀ x ∈ X, x > M → |f x - L| < ε

/-- Item 32: the `x → −∞` companion to `def:limit-at-infinity`, the
missing symmetric case flagged in ISSUES.md #51.

Logical form:

```lean
def TendsToNegInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ) : Prop :=
  ∀ ε > 0, ∃ M : ℝ, ∀ x ∈ X, x < M → |f x - L| < ε
```
-/
def TendsToNegInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ) : Prop :=
  ∀ ε > 0, ∃ M : ℝ, ∀ x ∈ X, x < M → |f x - L| < ε

/-- A sequence "escapes to `+∞`": eventually exceeds every bound. Hand-
rolled rather than `Filter.Tendsto atTop atTop`, matching this book's
own elementary (non-filter) style throughout.

Logical form:

```lean
def EscapesToInfty (xs : ℕ → ℝ) : Prop :=
  ∀ M : ℝ, ∃ N : ℕ, ∀ n ≥ N, xs n > M
```
-/
def EscapesToInfty (xs : ℕ → ℝ) : Prop :=
  ∀ M : ℝ, ∃ N : ℕ, ∀ n ≥ N, xs n > M

end LRA.Analysis.Limits
