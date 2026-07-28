/-
SCRATCH FILE — not wired into the lra-lean project.
Source: notes-real-valued-functions.tex (sixth of 8 files — see
ISSUES.md #30-#32 for file-wide findings).

This cluster (19 nodes): 4 definitions (function-supremum-on-set,
function-infimum-on-set, pointwise-supremum-family, pointwise-infimum-
family) plus 15 theorems covering existence (conditioned on nonempty +
bounded, correctly), monotonicity under pointwise order (both
directions, sup and inf), the "monotonicity converse fails" counter-
proposition, evaluation formulas for finite pointwise sup/inf families,
subadditivity/superadditivity of sup/inf under sums, negation
(sup(-f) = -inf(f) and symmetric), scalar-multiple behavior (split by
sign, matching the pointwise-order-arithmetic pattern from the previous
cluster), and the finite-family corollaries identifying pointwise
supremum/infimum with pointwise maximum/minimum.

All 19 nodes are mathematically correct. No findings in this cluster.

`function-supremum-on-set`/`function-infimum-on-set` are formalized with
`sSup`/`sInf` over the image `f '' A`, matching the `.tex`'s own
`sup_{x∈A} f(x)` notation as "the supremum of the image set." The
existence theorems supply the nonempty+bounded hypotheses that make
`sSup`/`sInf` meaningful (Lean's `sSup`/`sInf` are total but junk-valued
outside those hypotheses, same total-function caveat as prior clusters).
-/

import Mathlib.Data.Real.Basic
import Mathlib.Order.ConditionallyCompleteLattice.Basic

namespace LRA
namespace VolumeIII
namespace Analysis
namespace Functions
namespace Scratch

/-- `def:function-supremum-on-set`. -/
noncomputable def FunctionSupremumOnSet (f : ℝ → ℝ) (A : Set ℝ) : ℝ :=
  sSup (f '' A)

/-- `def:function-infimum-on-set`. -/
noncomputable def FunctionInfimumOnSet (f : ℝ → ℝ) (A : Set ℝ) : ℝ :=
  sInf (f '' A)

/-- `def:pointwise-supremum-family`. -/
noncomputable def PointwiseSupremumFamily {I : Type*} (f : I → ℝ → ℝ) (x : ℝ) : ℝ :=
  sSup (Set.range (fun α => f α x))

/-- `def:pointwise-infimum-family`. -/
noncomputable def PointwiseInfimumFamily {I : Type*} (f : I → ℝ → ℝ) (x : ℝ) : ℝ :=
  sInf (Set.range (fun α => f α x))

/-- `thm:function-supremum-existence`. -/
theorem function_supremum_existence (f : ℝ → ℝ) (A : Set ℝ) (hA : A.Nonempty)
    (hbdd : ∃ M, ∀ x ∈ A, f x ≤ M) :
    ∃ s : ℝ, IsLUB (f '' A) s := by
  sorry

/-- `thm:function-infimum-existence`. -/
theorem function_infimum_existence (f : ℝ → ℝ) (A : Set ℝ) (hA : A.Nonempty)
    (hbdd : ∃ m, ∀ x ∈ A, m ≤ f x) :
    ∃ s : ℝ, IsGLB (f '' A) s := by
  sorry

/-- `thm:supremum-monotone-under-pointwise-order`. -/
theorem supremum_monotone_under_pointwise_order (f g : ℝ → ℝ) (A : Set ℝ)
    (hA : A.Nonempty)
    (hbddf : ∃ M, ∀ x ∈ A, f x ≤ M) (hbddg : ∃ M, ∀ x ∈ A, g x ≤ M)
    (h : ∀ x ∈ A, f x ≤ g x) :
    FunctionSupremumOnSet f A ≤ FunctionSupremumOnSet g A := by
  sorry

/-- `thm:infimum-monotone-under-pointwise-order`. -/
theorem infimum_monotone_under_pointwise_order (f g : ℝ → ℝ) (A : Set ℝ)
    (hA : A.Nonempty)
    (hbddf : ∃ m, ∀ x ∈ A, m ≤ f x) (hbddg : ∃ m, ∀ x ∈ A, m ≤ g x)
    (h : ∀ x ∈ A, f x ≤ g x) :
    FunctionInfimumOnSet f A ≤ FunctionInfimumOnSet g A := by
  sorry

/-- `prop:supremum-monotonicity-converse-fails`. -/
theorem supremum_monotonicity_converse_fails :
    ∃ (A : Set ℝ) (f g : ℝ → ℝ), A.Nonempty ∧
      (∃ M, ∀ x ∈ A, f x ≤ M) ∧ (∃ M, ∀ x ∈ A, g x ≤ M) ∧
      FunctionSupremumOnSet f A ≤ FunctionSupremumOnSet g A ∧
      ¬ (∀ x ∈ A, f x ≤ g x) := by
  sorry

/-- `thm:pointwise-supremum-evaluation`. -/
theorem pointwise_supremum_evaluation {I : Type*} [Fintype I] [Nonempty I]
    (f : I → ℝ → ℝ) (x : ℝ) :
    ∃ α : I, PointwiseSupremumFamily f x = f α x ∧ ∀ β : I, f β x ≤ f α x := by
  sorry

/-- `thm:pointwise-infimum-evaluation`. -/
theorem pointwise_infimum_evaluation {I : Type*} [Fintype I] [Nonempty I]
    (f : I → ℝ → ℝ) (x : ℝ) :
    ∃ α : I, PointwiseInfimumFamily f x = f α x ∧ ∀ β : I, f α x ≤ f β x := by
  sorry

/-- `thm:supremum-subadditivity`. -/
theorem supremum_subadditivity (f g : ℝ → ℝ) (A : Set ℝ) (hA : A.Nonempty)
    (hbddf : ∃ M, ∀ x ∈ A, f x ≤ M) (hbddg : ∃ M, ∀ x ∈ A, g x ≤ M) :
    FunctionSupremumOnSet (fun x => f x + g x) A ≤
      FunctionSupremumOnSet f A + FunctionSupremumOnSet g A := by
  sorry

/-- `thm:infimum-superadditivity`. -/
theorem infimum_superadditivity (f g : ℝ → ℝ) (A : Set ℝ) (hA : A.Nonempty)
    (hbddf : ∃ m, ∀ x ∈ A, m ≤ f x) (hbddg : ∃ m, ∀ x ∈ A, m ≤ g x) :
    FunctionInfimumOnSet f A + FunctionInfimumOnSet g A ≤
      FunctionInfimumOnSet (fun x => f x + g x) A := by
  sorry

/-- `thm:supremum-negation`. -/
theorem supremum_negation (f : ℝ → ℝ) (A : Set ℝ) (hA : A.Nonempty)
    (hbdd : ∃ M, ∀ x ∈ A, f x ≤ M) :
    FunctionSupremumOnSet (fun x => -f x) A = - FunctionInfimumOnSet f A := by
  sorry

/-- `thm:infimum-negation`. -/
theorem infimum_negation (f : ℝ → ℝ) (A : Set ℝ) (hA : A.Nonempty)
    (hbdd : ∃ m, ∀ x ∈ A, m ≤ f x) :
    FunctionInfimumOnSet (fun x => -f x) A = - FunctionSupremumOnSet f A := by
  sorry

/-- `thm:supremum-scalar-multiple`. -/
theorem supremum_scalar_multiple (f : ℝ → ℝ) (A : Set ℝ) (lam : ℝ) (hA : A.Nonempty)
    (hbdd : ∃ M, ∀ x ∈ A, f x ≤ M) :
    (0 ≤ lam → FunctionSupremumOnSet (fun x => lam * f x) A
      = lam * FunctionSupremumOnSet f A) ∧
    (lam ≤ 0 → FunctionSupremumOnSet (fun x => lam * f x) A
      = lam * FunctionInfimumOnSet f A) := by
  sorry

/-- `thm:infimum-scalar-multiple`. -/
theorem infimum_scalar_multiple (f : ℝ → ℝ) (A : Set ℝ) (lam : ℝ) (hA : A.Nonempty)
    (hbdd : ∃ m, ∀ x ∈ A, m ≤ f x) :
    (0 ≤ lam → FunctionInfimumOnSet (fun x => lam * f x) A
      = lam * FunctionInfimumOnSet f A) ∧
    (lam ≤ 0 → FunctionInfimumOnSet (fun x => lam * f x) A
      = lam * FunctionSupremumOnSet f A) := by
  sorry

/-- `cor:finite-family-pointwise-supremum-is-maximum`. -/
theorem finite_family_pointwise_supremum_is_maximum {I : Type*} [Fintype I] [Nonempty I]
    (f : I → ℝ → ℝ) (x : ℝ) :
    ∃ α : I, PointwiseSupremumFamily f x = f α x := by
  sorry

/-- `cor:finite-family-pointwise-infimum-is-minimum`. -/
theorem finite_family_pointwise_infimum_is_minimum {I : Type*} [Fintype I] [Nonempty I]
    (f : I → ℝ → ℝ) (x : ℝ) :
    ∃ α : I, PointwiseInfimumFamily f x = f α x := by
  sorry

end Scratch
end Functions
end Analysis
end VolumeIII
end LRA
