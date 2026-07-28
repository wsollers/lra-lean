/-
SCRATCH FILE — not wired into the lra-lean project.
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

namespace LRA
namespace VolumeIII
namespace Analysis
namespace Functions
namespace Scratch

/-- `prop:common-maximum-gives-sum-maximum`. -/
theorem common_maximum_gives_sum_maximum (f g : ℝ → ℝ) (A : Set ℝ) (x₀ : ℝ)
    (hx₀ : x₀ ∈ A)
    (hf : ∀ x ∈ A, f x ≤ f x₀) (hg : ∀ x ∈ A, g x ≤ g x₀) :
    ∀ x ∈ A, f x + g x ≤ f x₀ + g x₀ := by
  sorry

/-- `prop:common-minimum-gives-sum-minimum`. -/
theorem common_minimum_gives_sum_minimum (f g : ℝ → ℝ) (A : Set ℝ) (x₀ : ℝ)
    (hx₀ : x₀ ∈ A)
    (hf : ∀ x ∈ A, f x₀ ≤ f x) (hg : ∀ x ∈ A, g x₀ ≤ g x) :
    ∀ x ∈ A, f x₀ + g x₀ ≤ f x + g x := by
  sorry

/-- `prop:common-extremum-converse-fails`. -/
theorem common_extremum_converse_fails :
    ∃ (A : Set ℝ) (f g : ℝ → ℝ) (x₀ : ℝ), x₀ ∈ A ∧
      (∀ x ∈ A, f x + g x ≤ f x₀ + g x₀) ∧
      ¬ (∀ x ∈ A, f x ≤ f x₀) := by
  sorry

/-- `def:function-maximum-point`. -/
def FunctionMaximumPoint (f : ℝ → ℝ) (A : Set ℝ) (x₀ : ℝ) : Prop :=
  x₀ ∈ A ∧ ∀ x ∈ A, f x ≤ f x₀

/-- `thm:maximum-point-characterized-by-supremum`. -/
theorem maximum_point_characterized_by_supremum (f : ℝ → ℝ) (A : Set ℝ) (x₀ : ℝ)
    (hx₀ : x₀ ∈ A) (hA : A.Nonempty) (hbdd : ∃ M, ∀ x ∈ A, f x ≤ M) :
    FunctionMaximumPoint f A x₀ ↔ f x₀ = sSup (f '' A) := by
  sorry

/-- `def:function-minimum-point`. -/
def FunctionMinimumPoint (f : ℝ → ℝ) (A : Set ℝ) (x₀ : ℝ) : Prop :=
  x₀ ∈ A ∧ ∀ x ∈ A, f x₀ ≤ f x

/-- `thm:minimum-point-characterized-by-infimum`. -/
theorem minimum_point_characterized_by_infimum (f : ℝ → ℝ) (A : Set ℝ) (x₀ : ℝ)
    (hx₀ : x₀ ∈ A) (hA : A.Nonempty) (hbdd : ∃ m, ∀ x ∈ A, m ≤ f x) :
    FunctionMinimumPoint f A x₀ ↔ f x₀ = sInf (f '' A) := by
  sorry

/-- `prop:function-extremum-values-are-unique`. The VALUE attained at a
maximum/minimum point is unique, though the point itself need not be. -/
theorem function_extremum_values_are_unique (f : ℝ → ℝ) (A : Set ℝ)
    (x₁ x₂ : ℝ) (h₁ : FunctionMaximumPoint f A x₁)
    (h₂ : FunctionMaximumPoint f A x₂) : f x₁ = f x₂ := by
  sorry

end Scratch
end Functions
end Analysis
end VolumeIII
end LRA
