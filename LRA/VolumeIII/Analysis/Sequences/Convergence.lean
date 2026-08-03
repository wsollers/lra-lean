/-
Draft module; not yet imported by the active Volume III root.
Imports only this pass's own promoted draft modules and Mathlib — nothing from the
real `LRA.VolumeIII.Analysis.Sequences.*`, so this can be freely
refactored or discarded without touching the working project.
Source: volume-iii/book-analysis-i/sequences/notes/convergence/notes-convergence.tex
First file of `convergence` (installment 1 of 3). This is where the
project's OWN convergence definition finally lands — earlier draft
files (`SequenceDefinitions.lean`, `NullConstantSequences.lean`) used
Mathlib's `Filter.Tendsto` as a forward-dependency placeholder before this
file was read; from here on, the project's own `ConvergesTo` predicate
(matching the epsilon-N definition literally) is what gets used, per
house style of citing the actual theorem-environment content.

Structural check: balanced, 3 labeled nodes
(`def:convergent-sequence`, `def:convergent-sequence-neighborhood`,
`thm:equivalence-of-convergence-formulations`) — clean.

All 3 nodes correct. `def:convergent-sequence` is the standard
epsilon-N definition; its own Interpretation remark is a genuinely good
piece of exposition, correctly explaining why the quantifier order
(`forall eps exists N forall n>=N`, N depending on eps but not on n) is
load-bearing, and that reversing the outer quantifiers would be a
strictly stronger, generally false condition. `def:convergent-sequence-
neighborhood` restates convergence as "the centered open interval
I_eps(L) eventually contains the tail" — logically equivalent, framed as
set membership rather than an inequality, explicitly noted by its own
Interpretation as the natural bridge to the general topological
definition (open neighborhoods replacing centered intervals).
`thm:equivalence-of-convergence-formulations` packages four
notational registers of the same fact (informal arrow notation / absolute
value / double inequality / interval membership) into one equivalence,
correctly.

Minor ordering note (not a bug): `def:convergent-sequence`'s own
"Predicate reading" remark uses `IsCenteredOpenInterval`/`Within` and
`I_eps(L)` notation — vocabulary that isn't formalized until the very
next node (`def:convergent-sequence-neighborhood`). A forward reference
within the remark suite of the FIRST definition to content introduced in
the SECOND. Not wrong (the two definitions are equivalent, so borrowing
either's vocabulary in the other's remarks is harmless), just backwards
in exposition order.

`ConvergesTo` formalizes `def:convergent-sequence` literally (the
epsilon-N form). `ConvergesToNbhd` formalizes `def:convergent-sequence-
neighborhood` via `Set.Ioo`. The equivalence theorem is stated as a
`List.TFAE` over the four registers, following the `List.TFAE` precedent
set in `CompletenessEquivalences.lean` during the Bounds pass for
"the following are equivalent" theorems — though here (b), (c), (d) are
in fact syntactically-near-identical unfoldings of (a)/each other once
`|x_n - L| < eps`, the double inequality, and interval membership are
seen as the same fact in three notations, matching the .tex's own
Interpretation remark ("the same geometric fact written in four
notational registers").
-/

import Mathlib.Order.Basic
import Mathlib.Data.Set.Defs
import Mathlib.Data.List.TFAE
import LRA.VolumeIII.Analysis.Sequences.SequenceDefinitions

namespace LRA.VolumeIII.Analysis.Sequences

/-- `def:convergent-sequence`. -/
def ConvergesTo (x : RealSequence) (L : ℝ) : Prop :=
  ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |x n - L| < ε

/-- Shorthand (not its own `.tex` label): the centered open interval
`I_eps(L) = (L - eps, L + eps)` from `def:convergent-sequence-
neighborhood`. -/
def CenteredInterval (L ε : ℝ) : Set ℝ := Set.Ioo (L - ε) (L + ε)

/-- `def:convergent-sequence-neighborhood`. -/
def ConvergesToNbhd (x : RealSequence) (L : ℝ) : Prop :=
  ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, x n ∈ CenteredInterval L ε

-- `thm:equivalence-of-convergence-formulations`
/-- Let `x : RealSequence` and `L : ℝ`. Then `[ConvergesTo x L, ∀ ε > 0, ∃ K : ℕ, ∀ n ≥ K, |x n - L|
< ε, ∀ ε > 0, ∃ K : ℕ, ∀ n ≥ K, L - ε < x n ∧ x n < L + ε, ConvergesToNbhd x L].TFAE`. -/
theorem EquivalenceOfConvergenceFormulations (x : RealSequence) (L : ℝ) :
    [ConvergesTo x L,
     ∀ ε > 0, ∃ K : ℕ, ∀ n ≥ K, |x n - L| < ε,
     ∀ ε > 0, ∃ K : ℕ, ∀ n ≥ K, L - ε < x n ∧ x n < L + ε,
     ConvergesToNbhd x L].TFAE := by
  sorry

end LRA.VolumeIII.Analysis.Sequences
