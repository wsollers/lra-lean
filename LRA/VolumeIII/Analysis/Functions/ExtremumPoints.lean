/-
Draft module; not yet imported by the active Volume III root.
Source: notes-real-valued-functions.tex (seventh of 8 files — see
ISSUES.md #30-#32 for file-wide findings, including the duplicated-
Failure-modes-block bug hitting `def:function-maximum-point` and
`def:function-minimum-point` in this cluster).

This cluster (8 nodes): common-maximum/minimum-gives-sum-maximum/minimum
(a common maximizer/minimizer of f and g is a maximizer/minimizer of
f+g — correct, and the accompanying "converse fails" counter-proposition
is exactly right, since a sum can be maximized without either summand
being separately maximized there), the two maximum/minimum-point
definitions, and their supremum/infimum characterizations, plus the
uniqueness-of-extremum-VALUE proposition (the point need not be unique,
only the value attained there).

All 8 nodes mathematically correct. No new findings beyond the already-
logged duplication bug (ISSUES.md).
-/

import Mathlib.Data.Real.Basic
import Mathlib.Order.ConditionallyCompleteLattice.Basic

namespace LRA.Analysis.Functions

/-- Let `A : Set ℝ` and `x₀ : ℝ`. If `f g : ℝ → ℝ`, `hx₀ : x₀ ∈ A`, `hf : ∀ x ∈ A, f x ≤ f x₀`, and
`hg : ∀ x ∈ A, g x ≤ g x₀`. Then `∀ x ∈ A, f x + g x ≤ f x₀ + g x₀`.

Logical form:

```lean
theorem CommonMaximumGivesSumMaximum (f g : ℝ → ℝ) (A : Set ℝ) (x₀ : ℝ)
    (hx₀ : x₀ ∈ A)
    (hf : ∀ x ∈ A, f x ≤ f x₀) (hg : ∀ x ∈ A, g x ≤ g x₀) :
    ∀ x ∈ A, f x + g x ≤ f x₀ + g x₀
```
-/
theorem CommonMaximumGivesSumMaximum (f g : ℝ → ℝ) (A : Set ℝ) (x₀ : ℝ)
    (hx₀ : x₀ ∈ A)
    (hf : ∀ x ∈ A, f x ≤ f x₀) (hg : ∀ x ∈ A, g x ≤ g x₀) :
    ∀ x ∈ A, f x + g x ≤ f x₀ + g x₀ := by
  sorry

/-- Let `A : Set ℝ` and `x₀ : ℝ`. If `f g : ℝ → ℝ`, `hx₀ : x₀ ∈ A`, `hf : ∀ x ∈ A, f x₀ ≤ f x`, and
`hg : ∀ x ∈ A, g x₀ ≤ g x`. Then `∀ x ∈ A, f x₀ + g x₀ ≤ f x + g x`.

Logical form:

```lean
theorem CommonMinimumGivesSumMinimum (f g : ℝ → ℝ) (A : Set ℝ) (x₀ : ℝ)
    (hx₀ : x₀ ∈ A)
    (hf : ∀ x ∈ A, f x₀ ≤ f x) (hg : ∀ x ∈ A, g x₀ ≤ g x) :
    ∀ x ∈ A, f x₀ + g x₀ ≤ f x + g x
```
-/
theorem CommonMinimumGivesSumMinimum (f g : ℝ → ℝ) (A : Set ℝ) (x₀ : ℝ)
    (hx₀ : x₀ ∈ A)
    (hf : ∀ x ∈ A, f x₀ ≤ f x) (hg : ∀ x ∈ A, g x₀ ≤ g x) :
    ∀ x ∈ A, f x₀ + g x₀ ≤ f x + g x := by
  sorry

/-- The theorem asserts `∃ (A : Set ℝ) (f g : ℝ → ℝ) (x₀ : ℝ), x₀ ∈ A ∧ (∀ x ∈ A, f x + g x ≤ f x₀ +
g x₀) ∧ ¬ (∀ x ∈ A, f x ≤ f x₀)`.

Logical form:

```lean
theorem CommonExtremumConverseFails :
    ∃ (A : Set ℝ) (f g : ℝ → ℝ) (x₀ : ℝ), x₀ ∈ A ∧
      (∀ x ∈ A, f x + g x ≤ f x₀ + g x₀) ∧
      ¬ (∀ x ∈ A, f x ≤ f x₀)
```
-/
theorem CommonExtremumConverseFails :
    ∃ (A : Set ℝ) (f g : ℝ → ℝ) (x₀ : ℝ), x₀ ∈ A ∧
      (∀ x ∈ A, f x + g x ≤ f x₀ + g x₀) ∧
      ¬ (∀ x ∈ A, f x ≤ f x₀) := by
  sorry

/-- `def:function-maximum-point`.

Logical form:

```lean
def FunctionMaximumPoint (f : ℝ → ℝ) (A : Set ℝ) (x₀ : ℝ) : Prop :=
  x₀ ∈ A ∧ ∀ x ∈ A, f x ≤ f x₀
```
-/
def FunctionMaximumPoint (f : ℝ → ℝ) (A : Set ℝ) (x₀ : ℝ) : Prop :=
  x₀ ∈ A ∧ ∀ x ∈ A, f x ≤ f x₀

-- `thm:maximum-point-characterized-by-supremum`
/-- Let `A : Set ℝ` and `x₀ : ℝ`. If `f : ℝ → ℝ`, `hx₀ : x₀ ∈ A`, `hA : A.Nonempty`, and `hbdd : ∃
M, ∀ x ∈ A, f x ≤ M`. Then `FunctionMaximumPoint f A x₀ ↔ IsLUB (f '' A) (f x₀)`.

Logical form:

```lean
theorem MaximumPointCharacterizedBySupremum (f : ℝ → ℝ) (A : Set ℝ) (x₀ : ℝ)
    (hx₀ : x₀ ∈ A) (hA : A.Nonempty) (hbdd : ∃ M, ∀ x ∈ A, f x ≤ M) :
    FunctionMaximumPoint f A x₀ ↔ IsLUB (f '' A) (f x₀)
```
-/
theorem MaximumPointCharacterizedBySupremum (f : ℝ → ℝ) (A : Set ℝ) (x₀ : ℝ)
    (hx₀ : x₀ ∈ A) (hA : A.Nonempty) (hbdd : ∃ M, ∀ x ∈ A, f x ≤ M) :
    FunctionMaximumPoint f A x₀ ↔ IsLUB (f '' A) (f x₀) := by
  sorry

/-- `def:function-minimum-point`.

Logical form:

```lean
def FunctionMinimumPoint (f : ℝ → ℝ) (A : Set ℝ) (x₀ : ℝ) : Prop :=
  x₀ ∈ A ∧ ∀ x ∈ A, f x₀ ≤ f x
```
-/
def FunctionMinimumPoint (f : ℝ → ℝ) (A : Set ℝ) (x₀ : ℝ) : Prop :=
  x₀ ∈ A ∧ ∀ x ∈ A, f x₀ ≤ f x

-- `thm:minimum-point-characterized-by-infimum`
/-- Let `A : Set ℝ` and `x₀ : ℝ`. If `f : ℝ → ℝ`, `hx₀ : x₀ ∈ A`, `hA : A.Nonempty`, and `hbdd : ∃
m, ∀ x ∈ A, m ≤ f x`. Then `FunctionMinimumPoint f A x₀ ↔ IsGLB (f '' A) (f x₀)`.

Logical form:

```lean
theorem MinimumPointCharacterizedByInfimum (f : ℝ → ℝ) (A : Set ℝ) (x₀ : ℝ)
    (hx₀ : x₀ ∈ A) (hA : A.Nonempty) (hbdd : ∃ m, ∀ x ∈ A, m ≤ f x) :
    FunctionMinimumPoint f A x₀ ↔ IsGLB (f '' A) (f x₀)
```
-/
theorem MinimumPointCharacterizedByInfimum (f : ℝ → ℝ) (A : Set ℝ) (x₀ : ℝ)
    (hx₀ : x₀ ∈ A) (hA : A.Nonempty) (hbdd : ∃ m, ∀ x ∈ A, m ≤ f x) :
    FunctionMinimumPoint f A x₀ ↔ IsGLB (f '' A) (f x₀) := by
  sorry

/-- Let `A : Set ℝ` and `x₁ x₂ : ℝ`. If `f : ℝ → ℝ`, `h₁ : FunctionMaximumPoint f A x₁`, and `h₂ :
FunctionMaximumPoint f A x₂`. Then `f x₁ = f x₂`.

Logical form:

```lean
theorem FunctionExtremumValuesAreUnique (f : ℝ → ℝ) (A : Set ℝ)
    (x₁ x₂ : ℝ) (h₁ : FunctionMaximumPoint f A x₁)
    (h₂ : FunctionMaximumPoint f A x₂) : f x₁ = f x₂
```
-/
theorem FunctionExtremumValuesAreUnique (f : ℝ → ℝ) (A : Set ℝ)
    (x₁ x₂ : ℝ) (h₁ : FunctionMaximumPoint f A x₁)
    (h₂ : FunctionMaximumPoint f A x₂) : f x₁ = f x₂ := by
  sorry

end LRA.Analysis.Functions
