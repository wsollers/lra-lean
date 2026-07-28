/-
SCRATCH FILE — not wired into the lra-lean project.
Imports only this pass's own scratch files and Mathlib — nothing from the
real `LRA.VolumeIII.Analysis.Sequences.*`, so this can be freely
refactored or discarded without touching the working project.
Source: volume-iii/book-analysis-i/sequences/notes/tails/notes-tails.tex
Only file in `tails`. Structural check: 15/15 balanced remark blocks, 4
labeled nodes — clean.

All 4 nodes are mathematically correct: `def:m-tail` (the shifted
sequence `(x_M, x_{M+1}, ...)`), `thm:convergence-of-tail` (convergence is
a genuine tail property — shifting by a fixed `m` preserves both
convergence and the limit value), `thm:convergence-by-domination` (the
standard "bound the error by `c` times a null sequence" comparison
criterion), and `thm:ratio-limit-less-than-one-implies-null` (the
sequence form of the ratio test).

TWO STRUCTURAL FINDINGS, same new pattern, reported not fixed:
`thm:convergence-of-tail` and `thm:convergence-by-domination` each have
their `[Interpretation]` remark begin with TWO formally displayed
math statements (a quantified contrapositive/negation, then the same fact
restated without quantifiers) BEFORE the actual prose interpretation
text — content that reads exactly like what should be a
"Negated quantified statement" / "Negation predicate reading" remark pair,
misplaced inside Interpretation instead of getting its own remark box (both
nodes are missing those two remark kinds entirely, unlike most other
iff/comparison theorems in this corpus that carry them separately). Hand-
verified BOTH displaced formulas are mathematically CORRECT as stated —
this is a placement/formatting bug, not a math error: `convergence-of-
tail`'s divergence-iff-divergence restatement is the direct contrapositive
of its own convergence-iff-convergence claim, and `convergence-by-
domination`'s "`lim x_n != L` implies `lim a_n != 0` or ..." is exactly
the logical contrapositive of the theorem (verified by hand: negating
`(lim a_n = 0 and exists c,m forall n>=m, |x_n-L|<=c*a_n) => lim x_n=L`
gives precisely the displayed formula). A new bug shape not seen
elsewhere in the corpus so far — worth a search for other occurrences of
this "negation content stuck inside Interpretation" pattern elsewhere in
the Sequences chapter as auditing continues.

Also (same recurring minor pattern as before): `thm:convergence-by-
domination`'s "Predicate reading" is a verbatim copy of its own "Standard
quantified statement" (8th instance of this specific gap across the whole
corpus now).

Also: `thm:convergence-of-tail`'s "Predicate reading" only captures the
convergence <-> convergence half of the theorem, omitting the "Moreover,
the limits agree" clause — same "Moreover clause dropped from the remark"
pattern seen repeatedly in the Bounds pass. Formalized in full below
(including the limit-equality clause), not the narrower remark-box
version.

`MTail` formalizes `def:m-tail` as the obvious index shift.
-/

import Mathlib.Order.Defs
import LRA.VolumeIII.Analysis.Sequences.Scratch.SequenceDefinitions
import LRA.VolumeIII.Analysis.Sequences.Scratch.Convergence
import LRA.VolumeIII.Analysis.Sequences.Scratch.NullConstantSequences

namespace LRA
namespace VolumeIII
namespace Analysis
namespace Sequences
namespace Scratch

/-- `def:m-tail`. -/
def MTail (x : RealSequence) (M : ℕ) : RealSequence := fun n => x (M + n)

/-- `thm:convergence-of-tail`. Includes the "Moreover, the limits agree"
clause the .tex's own Predicate reading omits — see audit note above. -/
theorem convergence_of_tail (x : RealSequence) (m : ℕ) :
    ((∃ L, ConvergesTo x L) ↔ (∃ L, ConvergesTo (MTail x m) L)) ∧
      (∀ L, ConvergesTo x L → ConvergesTo (MTail x m) L) := by
  sorry

/-- `thm:convergence-by-domination`. -/
theorem convergence_by_domination {x : RealSequence} {L : ℝ}
    {a : RealSequence} (ha_pos : ∀ n, 0 < a n) (ha_null : ConvergesTo a 0)
    (h : ∃ c > 0, ∃ m : ℕ, ∀ n ≥ m, |x n - L| ≤ c * a n) :
    ConvergesTo x L := by
  sorry

/-- `thm:ratio-limit-less-than-one-implies-null`. -/
theorem ratio_limit_less_than_one_implies_null {x : RealSequence}
    (hx_pos : ∀ n, 0 < x n) {L : ℝ}
    (hratio : ConvergesTo (fun n => x (n + 1) / x n) L) (hL : L < 1) :
    ConvergesTo x 0 := by
  sorry

end Scratch
end Sequences
end Analysis
end VolumeIII
end LRA
