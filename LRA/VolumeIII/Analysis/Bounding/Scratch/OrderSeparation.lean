/-
SCRATCH FILE — not wired into the lra-lean project.
Imports only this pass's own scratch files and Mathlib — nothing from the
real `LRA.VolumeIII.Analysis.Bounding.Bounds`, so this can be freely
refactored or discarded without touching the working project.
Source: volume-iii/book-analysis-i/bounding/notes/completeness/notes-order-separation.tex
Third file of `completeness` (installment 3 of 6 for this chapter).

Structural check: `grep -c "Failure modes"` = 3 (one per node), matching
node count, no duplication pattern found — clean.

Math content, node by node:

  1. `thm:order-separation-by-supremum` — correct and correctly proved by
     hand: A is bounded above by any fixed b0 in nonempty B, B bounded
     below by any fixed a0 in nonempty A, c := sup A exists by
     completeness, a <= c for all a in A is the upper-bound property of
     sup, and c <= b for every b in B because every such b is *itself* an
     upper bound of A (given the hypothesis a <= b for all a,b) so the
     *least* upper bound c must be <= b. Then sup A <= inf B follows
     because c is a lower bound of B, hence <= the greatest lower bound.
     All correct, all remark blocks (standard/predicate/negated/failure)
     literally and correctly transcribe this.

  2. `thm:dedekind-cut-property` — correct (standard order-completeness
     restated as "no L/U split of R has a gap": either L has a max or U
     has a min). Verified by hand that the "Standard quantified
     statement" remark's chosen conclusion form, `exists c, forall a in
     A forall b in B (a <= c <= b)`, is genuinely *equivalent* to "max L
     exists or min U exists" under this theorem's hypotheses (not just a
     re-statement of a different, weaker fact): forward direction, take
     c = max L or c = min U and the strict-inequality hypothesis upgrades
     the needed <= on the far side; backward direction, L union U = R
     forces c into L or U, and the separator property then makes c an
     upper bound of L (if c in L, so c = max L) or a lower bound of U (if
     c in U, so c = min U). Legitimate reformulation, not an error.

  3. `cor:no-gaps-in-r` — **FINDING, reported not auto-fixed**: the
     corollary's own theorem-environment content is a genuinely sharper
     claim than node 2 — it asserts existence of a *unique* c together
     with an exact structural characterization of L and U as one of two
     interval shapes. But this node's "Standard quantified statement" /
     "Predicate reading" / "Negated quantified statement" / "Negation
     predicate reading" / "Failure modes" remark blocks all collapse to
     the *weaker*, purely qualitative claim "no Dedekind gap exists" /
     "R IsOrderComplete" — they never mention uniqueness of `c` or the
     interval-characterization of `L`/`U` at all. That's imprecise: the
     block-enhancement remarks are supposed to formally unpack *this*
     corollary's actual quantified content, not restate the previous
     theorem's conclusion in predicate-shorthand. Worth tightening later
     (e.g. a "Standard quantified statement" reading like `forall L,U
     (hyps) -> exists! c, (L = {x | x < c} and U = {x | c <= x}) or (L =
     {x | x <= c} and U = {x | c < x})`) — not fixed here per the
     "report, don't auto-fix statement content" policy for this pass.
     The *theorem-environment statement itself* (in the corollary box) is
     correct and is what's formalized below, unaffected by the remark
     imprecision.

`IsMaximum`/`IsMinimum` reused from `MaximaMinima.lean`; `IsSupremum`/
`IsInfimum`/`IsUpperBoundOf`/`IsLowerBoundOf` from `SupremaInfima.lean` /
`UpperLowerBounds.lean`. Everything here is genuinely ℝ-specific (the
theorems are about R.'s completeness, not general order-theoretic facts),
matching the .tex's own literal `A,B ⊆ ℝ` / `L,U ⊆ ℝ` framing.
-/

import Mathlib.Order.Defs
import Mathlib.Data.Set.Defs
import LRA.VolumeIII.Analysis.Bounding.Scratch.UpperLowerBounds
import LRA.VolumeIII.Analysis.Bounding.Scratch.SupremaInfima
import LRA.VolumeIII.Analysis.Bounding.Scratch.MaximaMinima

namespace LRA
namespace VolumeIII
namespace Analysis
namespace Bounding
namespace Scratch

/-- `thm:order-separation-by-supremum`. -/
theorem order_separation_by_supremum {A B : Set ℝ} (hAne : A.Nonempty)
    (hBne : B.Nonempty) (hAB : ∀ a ∈ A, ∀ b ∈ B, a ≤ b) :
    (∃ u, IsUpperBoundOf u A) ∧ (∃ l, IsLowerBoundOf l B) ∧
      ∃ c : ℝ, IsSupremum c A ∧ (∀ a ∈ A, ∀ b ∈ B, a ≤ c ∧ c ≤ b) := by
  sorry

/-- `thm:order-separation-by-supremum`, "in particular" clause: `sup A ≤
inf B`. Stated as its own theorem since the .tex singles it out with "In
particular". -/
theorem sup_le_inf_of_order_separated {A B : Set ℝ} (hAne : A.Nonempty)
    (hBne : B.Nonempty) (hAB : ∀ a ∈ A, ∀ b ∈ B, a ≤ b) {s i : ℝ}
    (hs : IsSupremum s A) (hi : IsInfimum i B) : s ≤ i := by
  sorry

/-- `thm:dedekind-cut-property`. -/
theorem dedekind_cut_property {L U : Set ℝ} (hLne : L.Nonempty)
    (hUne : U.Nonempty) (hdisj : L ∩ U = ∅) (hcov : L ∪ U = Set.univ)
    (hlt : ∀ l ∈ L, ∀ u ∈ U, l < u) :
    (∃ m, IsMaximum m L) ∨ (∃ n, IsMinimum n U) := by
  sorry

/-- `cor:no-gaps-in-r`. Formalizes the actual corollary statement (unique
`c` with an exact two-case interval characterization of `L`, `U`) — the
sharper content than the remark blocks' "no gap" shorthand; see the audit
note above. -/
theorem no_gaps_in_r {L U : Set ℝ} (hLne : L.Nonempty) (hUne : U.Nonempty)
    (hdisj : L ∩ U = ∅) (hcov : L ∪ U = Set.univ)
    (hlt : ∀ l ∈ L, ∀ u ∈ U, l < u) :
    ∃! c : ℝ, (L = {x : ℝ | x < c} ∧ U = {x : ℝ | c ≤ x}) ∨
      (L = {x : ℝ | x ≤ c} ∧ U = {x : ℝ | c < x}) := by
  sorry

end Scratch
end Bounding
end Analysis
end VolumeIII
end LRA
