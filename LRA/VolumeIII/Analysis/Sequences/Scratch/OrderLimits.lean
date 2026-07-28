/-
SCRATCH FILE — not wired into the lra-lean project.
Imports only this pass's own scratch files and Mathlib — nothing from the
real `LRA.VolumeIII.Analysis.Sequences.*`, so this can be freely
refactored or discarded without touching the working project.
Source: volume-iii/book-analysis-i/sequences/notes/order-limits/notes-order-limits.tex
Only file in `order-limits`. Structural check: 12/12 balanced remark
blocks, 4 labeled nodes (all theorems, no new definitions) — clean.

All 4 nodes are mathematically correct, and this short file quietly does
important, correctly-placed work: it is the WELL-DEFINEDNESS closure for
`def:limsup-sequence`/`def:liminf-sequence` from `notes-liminf-limsup.tex`,
which defined `limsup x_n := lim s_n` without independently justifying
that limit exists at definition time (ordinary, acceptable textbook
practice). `thm:tail-suprema-infima-converge` here is exactly that
justification: `(s_n)` is decreasing (already proved) and bounded (since
`(x_n)` bounded implies every tail sup/inf is bounded too), so it
converges by the Monotone Convergence Theorem — and dually for `(i_n)`.
`thm:bounded-sequence-limsup-liminf` then packages this as "every bounded
sequence has a limsup and a liminf," correctly citing the tail-
convergence theorem as its sole dependency. The two opening theorems
(increasing-bounded-above sequence converges exactly TO its supremum;
decreasing-bounded-below sequence converges exactly TO its infimum) are
the sharpened, formula-level versions of the existence-only Monotone
Convergence Theorem from `notes-monotonicity.tex`, correctly citing it
as a dependency.

No findings in this file.
-/

import Mathlib.Order.Defs
import LRA.VolumeIII.Analysis.Sequences.Scratch.SequenceDefinitions
import LRA.VolumeIII.Analysis.Sequences.Scratch.Convergence
import LRA.VolumeIII.Analysis.Sequences.Scratch.NullConstantSequences
import LRA.VolumeIII.Analysis.Sequences.Scratch.Monotonicity
import LRA.VolumeIII.Analysis.Sequences.Scratch.LiminfLimsup
import LRA.VolumeIII.Analysis.Bounding.Scratch.SupremaInfima

namespace LRA
namespace VolumeIII
namespace Analysis
namespace Sequences
namespace Scratch

open LRA.VolumeIII.Analysis.Bounding.Scratch (IsSupremum IsInfimum)

/-- `thm:increasing-sequence-limit-as-supremum`. -/
theorem increasing_sequence_limit_as_supremum {x : RealSequence} {S : ℝ}
    (hinc : IsIncreasing x) (hbdd : BoundedAboveSeq x)
    (hS : IsSupremum S (Set.range x)) : ConvergesTo x S := by
  sorry

/-- `thm:decreasing-sequence-limit-as-infimum`. -/
theorem decreasing_sequence_limit_as_infimum {x : RealSequence} {I : ℝ}
    (hdec : IsDecreasing x) (hbdd : BoundedBelowSeq x)
    (hI : IsInfimum I (Set.range x)) : ConvergesTo x I := by
  sorry

/-- `thm:tail-suprema-infima-converge`. -/
theorem tail_suprema_infima_converge {x : RealSequence} (h : BoundedSeq x) :
    (∃ S : ℝ, ConvergesTo (TailSupSeq x) S) ∧
      (∃ I : ℝ, ConvergesTo (TailInfSeq x) I) := by
  sorry

/-- `thm:bounded-sequence-limsup-liminf`. -/
theorem bounded_sequence_limsup_liminf {x : RealSequence} (h : BoundedSeq x) :
    (∃ S : ℝ, LimsupSeq x S) ∧ (∃ I : ℝ, LiminfSeq x I) := by
  sorry

end Scratch
end Sequences
end Analysis
end VolumeIII
end LRA
