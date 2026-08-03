/-
Draft module; not yet imported by the active Volume III root.
Imports only this pass's own promoted draft modules and Mathlib — nothing from the
real `LRA.VolumeIII.Analysis.Sequences.*`, so this can be freely
refactored or discarded without touching the working project.
Source: volume-iii/book-analysis-i/sequences/notes/cluster-values/notes-cluster-values.tex
Only file in `cluster-values`. Structural check: 15/15 balanced remark
blocks, 4 labeled nodes — clean.

All 4 nodes are mathematically correct: a cluster value ("frequently
within epsilon of L," the neighborhood formulation of accumulation)
coincides exactly with a subsequential limit, bounded sequences have at
least one cluster value (immediate from Bolzano-Weierstrass), and
limsup/liminf are literally the largest/smallest cluster values (the
same content as `thm:limsup-largest-subsequential-limit` etc. from
`notes-liminf-limsup.tex`, restated in this section's "cluster value"
vocabulary).

Finding (see ISSUES.md #26, 🟠): `def:cluster-value-sequence` here and
`def:subsequential-limit` in `notes-subsequences.tex` are two A PRIORI
DIFFERENT definitions (one epsilon/frequently-close, one exists-a-
convergent-subsequence) that this very file's own
`thm:cluster-values-are-subsequential-limits` proves are equivalent —
but BOTH nodes' "Predicate reading" remarks use the identical operator
name `IsClusterValue(x_n,L,R)` for both notions. The collision makes
`thm:cluster-values-are-subsequential-limits`'s own Predicate reading
degenerate into the tautology `IsClusterValue(x_n,L,R) <=>
IsClusterValue(x_n,L,R)` — completely losing the theorem's actual
content (that two different-looking formulations coincide), which is
exactly the kind of thing these Predicate-reading blocks exist to state
precisely. Recommended fix (not applied here — content authoring, out of
scope for this pass): give the two notions distinct predicate names
(e.g. keep `IsClusterValue` for the epsilon formulation here, and rename
`def:subsequential-limit`'s predicate to something like
`IsSubsequentialLimit`, exactly as this Lean file does below) so the
equivalence theorem's Predicate reading can actually say something.

Formalized below with two DISTINCT names precisely to sidestep this
collision: `IsClusterValueOf` for this file's own epsilon-formulation
definition, and the already-established `IsSubsequentialLimit` (from
`Subsequences.lean`) for the subsequence formulation.
-/

import Mathlib.Order.Basic
import LRA.VolumeIII.Analysis.Sequences.SequenceDefinitions
import LRA.VolumeIII.Analysis.Sequences.Convergence
import LRA.VolumeIII.Analysis.Sequences.NullConstantSequences
import LRA.VolumeIII.Analysis.Sequences.Subsequences
import LRA.VolumeIII.Analysis.Sequences.LiminfLimsup

namespace LRA.VolumeIII.Analysis.Sequences

/-- `def:cluster-value-sequence`. Named `IsClusterValueOf` (not
`IsClusterValue`) to avoid colliding with `IsSubsequentialLimit` — see
the naming-collision finding in this file's header comment. -/
def IsClusterValueOf (x : RealSequence) (L : ℝ) : Prop :=
  ∀ ε > 0, ∀ N : ℕ, ∃ n ≥ N, |x n - L| < ε

-- `thm:cluster-values-are-subsequential-limits`
/-- Let `x : RealSequence` and `L : ℝ`. Then `IsClusterValueOf x L ↔ IsSubsequentialLimit x L`. -/
theorem ClusterValuesAreSubsequentialLimits {x : RealSequence} {L : ℝ} :
    IsClusterValueOf x L ↔ IsSubsequentialLimit x L := by
  sorry

-- `thm:bounded-sequences-have-cluster-values`
/-- Let `x : RealSequence`. If `h : BoundedSeq x`. Then `∃ L : ℝ, IsClusterValueOf x L`. -/
theorem BoundedSequencesHaveClusterValues {x : RealSequence}
    (h : BoundedSeq x) : ∃ L : ℝ, IsClusterValueOf x L := by
  sorry

-- `thm:limsup-liminf-extremal-cluster-values`
/-- Let `x : RealSequence` and `S I : ℝ`. If `hbdd : BoundedSeq x`, `hS : LimsupSeq x S`, and `hI :
LiminfSeq x I`. Then `(IsClusterValueOf x S ∧ ∀ L, IsClusterValueOf x L → L ≤ S) ∧
(IsClusterValueOf x I ∧ ∀ L, IsClusterValueOf x L → I ≤ L)`. -/
theorem LimsupLiminfExtremalClusterValues {x : RealSequence}
    (hbdd : BoundedSeq x) {S I : ℝ} (hS : LimsupSeq x S) (hI : LiminfSeq x I) :
    (IsClusterValueOf x S ∧ ∀ L, IsClusterValueOf x L → L ≤ S) ∧
    (IsClusterValueOf x I ∧ ∀ L, IsClusterValueOf x L → I ≤ L) := by
  sorry

end LRA.VolumeIII.Analysis.Sequences
