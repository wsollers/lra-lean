/-
Draft module; not yet imported by the active Volume III root.
Imports only this pass's own promoted draft modules and Mathlib — nothing from the
real `LRA.Analysis.Sequences.*`, so this can be freely
refactored or discarded without touching the working project.
Source: volume-iii/book-analysis-i/sequences/notes/convergence/notes-convergence.tex
First file of `convergence` (installment 1 of 3). The foundational
epsilon-tail convergence predicate now lives in `SequenceDefinitions.lean`,
so this file packages the equivalent neighborhood-style formulations in the
same native vocabulary.

Structural check: balanced, 3 labeled nodes
(`def:convergent-sequence`, `def:convergent-sequence-neighborhood`,
`thm:equivalence-of-convergence-formulations`) — clean.

All 3 nodes correct. `def:convergent-sequence` is the standard
epsilon-N definition; its own Interpretation remark is a genuinely good
piece of exposition, correctly explaining why the quantifier order
(`forall eps exists N forall n>=N`, N depending on eps but not on n) is
load-bearing, and that reversing the outer quantifiers would be a
strictly stronger, generally false condition. `def:convergent-sequence-
neighborhood` restates convergence in the equivalent double-inequality
register. `thm:equivalence-of-convergence-formulations` packages the
project-native formulations directly rather than routing through a list of
registers.
-/

import Mathlib.Order.Basic
import LRA.Analysis.Sequences.SequenceDefinitions

namespace LRA.Analysis.Sequences

/-- `def:convergent-sequence-neighborhood`.

Logical form:

```lean
def ConvergesToNbhd (x : RealSequence) (L : ℝ) : Prop :=
  ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, L - ε < x n ∧ x n < L + ε
```
-/
def ConvergesToNbhd (x : RealSequence) (L : ℝ) : Prop :=
  ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, L - ε < x n ∧ x n < L + ε

-- `thm:equivalence-of-convergence-formulations`
/-- Let `x : RealSequence` and `L : ℝ`. Then the absolute-value,
double-inequality, and neighborhood-tail formulations are equivalent.

Logical form:

```lean
theorem EquivalenceOfConvergenceFormulations (x : RealSequence) (L : ℝ) :
    (ConvergesTo x L ↔ ∀ ε > 0, ∃ K : ℕ, ∀ n ≥ K, |x n - L| < ε) ∧
      (ConvergesTo x L ↔ ∀ ε > 0, ∃ K : ℕ, ∀ n ≥ K, L - ε < x n ∧ x n < L + ε) ∧
      (ConvergesTo x L ↔ ConvergesToNbhd x L)
```
-/
theorem EquivalenceOfConvergenceFormulations (x : RealSequence) (L : ℝ) :
    (ConvergesTo x L ↔ ∀ ε > 0, ∃ K : ℕ, ∀ n ≥ K, |x n - L| < ε) ∧
      (ConvergesTo x L ↔ ∀ ε > 0, ∃ K : ℕ, ∀ n ≥ K, L - ε < x n ∧ x n < L + ε) ∧
      (ConvergesTo x L ↔ ConvergesToNbhd x L) := by
  sorry

end LRA.Analysis.Sequences
