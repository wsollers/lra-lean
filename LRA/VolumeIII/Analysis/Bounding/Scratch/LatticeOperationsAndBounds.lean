/-
SCRATCH FILE — not wired into the lra-lean project.
Imports only this pass's own scratch files and Mathlib — nothing from the
real `LRA.VolumeIII.Analysis.Bounding.Bounds`, so this can be freely
refactored or discarded without touching the working project.
Source: volume-iii/book-analysis-i/bounding/notes/bounds-algebra/notes-lattice-operations-and-bounds.tex
Second file of `bounds-algebra` (installment 2 of 5 for this chapter).

Audit note: same duplicated-"Failure modes" bug as
notes-epsilon-characterization-supremum.tex, but this time on ALL 5 nodes
in the file (not 2 of 4) — stronger evidence this came from a bulk
find/replace or template-copy pass across the repo rather than an isolated
one-off. Fixed the same way: kept the newer/better block, deleted the
older duplicate, verified `\begin{remark*}`/`\end{remark*}` balance and
exactly 5 `Failure modes` blocks remain.

Core math verified correct (by hand, since the .tex doesn't spell out the
proofs): for A,B nonempty and bounded on the relevant side,
  sup(A ∨ B) = max(sup A, sup B),   inf(A ∨ B) = max(inf A, inf B),
  sup(A ∧ B) = min(sup A, sup B),   inf(A ∧ B) = min(inf A, inf B),
where `A ∨ B = {max a b | a ∈ A, b ∈ B}` and `A ∧ B` is the pairwise-min
analogue. Sanity-checked the least/greatest-bound direction is not just an
inequality but genuine equality in each case (the "obvious" bound is
always attained via approximating sequences from the nonempty sets) —
these are not off-by-one max/min swaps.
-/

import Mathlib.Order.Defs
import Mathlib.Data.Set.Defs
import LRA.VolumeIII.Analysis.Bounding.Scratch.UpperLowerBounds
import LRA.VolumeIII.Analysis.Bounding.Scratch.SupremaInfima

namespace LRA
namespace VolumeIII
namespace Analysis
namespace Bounding
namespace Scratch

/-- `def:pairwise-maximum-minimum-sets`. The pairwise maximum set: every
`max a b` for `a ∈ A`, `b ∈ B`. -/
def PairwiseMax (A B : Set ℝ) : Set ℝ :=
  {x | ∃ a ∈ A, ∃ b ∈ B, x = max a b}

/-- `def:pairwise-maximum-minimum-sets`, minimum half. -/
def PairwiseMin (A B : Set ℝ) : Set ℝ :=
  {x | ∃ a ∈ A, ∃ b ∈ B, x = min a b}

/-- `thm:supremum-pairwise-maximum-set`. -/
theorem supremum_pairwise_maximum_set {A B : Set ℝ} (hAne : A.Nonempty)
    (hBne : B.Nonempty) {sA sB : ℝ} (hsA : IsSupremum sA A)
    (hsB : IsSupremum sB B) : IsSupremum (max sA sB) (PairwiseMax A B) := by
  sorry

/-- `thm:infimum-pairwise-maximum-set`. -/
theorem infimum_pairwise_maximum_set {A B : Set ℝ} (hAne : A.Nonempty)
    (hBne : B.Nonempty) {iA iB : ℝ} (hiA : IsInfimum iA A)
    (hiB : IsInfimum iB B) : IsInfimum (max iA iB) (PairwiseMax A B) := by
  sorry

/-- `thm:supremum-pairwise-minimum-set`. -/
theorem supremum_pairwise_minimum_set {A B : Set ℝ} (hAne : A.Nonempty)
    (hBne : B.Nonempty) {sA sB : ℝ} (hsA : IsSupremum sA A)
    (hsB : IsSupremum sB B) : IsSupremum (min sA sB) (PairwiseMin A B) := by
  sorry

/-- `thm:infimum-pairwise-minimum-set`. -/
theorem infimum_pairwise_minimum_set {A B : Set ℝ} (hAne : A.Nonempty)
    (hBne : B.Nonempty) {iA iB : ℝ} (hiA : IsInfimum iA A)
    (hiB : IsInfimum iB B) : IsInfimum (min iA iB) (PairwiseMin A B) := by
  sorry

end Scratch
end Bounding
end Analysis
end VolumeIII
end LRA
