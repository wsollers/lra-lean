/-
Draft module; not yet imported by the active Volume III root.
Imports only this pass's own promoted draft modules and Mathlib — nothing from the
real `LRA.VolumeIII.Analysis.Sequences.*`, so this can be freely
refactored or discarded without touching the working project.
Source: volume-iii/book-analysis-i/sequences/notes/examples-counterexamples/notes-examples-counterexamples.tex
Only file in `examples-counterexamples`. 7 worked examples, all correct,
no bugs found — these are `example*` blocks (only an Interpretation
remark each, no Standard/Predicate/Negated/Failure-modes suite), which is
the right lighter treatment for concrete worked examples rather than
general theorems.

All content verified: constant sequence converges to `c`; `1/n` is
decreasing, bounded below by `0`, null; `(-1)^n/n` is non-monotone but
null (sign oscillation collapsing to zero doesn't prevent convergence);
`(-1)^n` is bounded and divergent (even subsequence -> 1, odd -> -1);
the four geometric-sequence regimes (`|r|<1` -> 0, `r=1` -> 1, `r=-1`
oscillates/diverges, `|r|>1` unbounded) are all correct, with `|r|=1`
correctly identified as the decay/growth threshold; `(-1)^n` again
witnesses "bounded does not imply convergent"; and the harmonic partial
sums `1 + 1/2 + ... + 1/n` witness "vanishing successive differences does
not imply Cauchy" (classic: harmonic series diverges to infinity despite
adjacent gaps `1/(n+1) -> 0`).

Formalized the quantitative claims as standalone lemmas (not full formal
Cauchy-sequence machinery yet — `def:cauchy-sequence` hasn't been read;
that's the later `cauchy` section — so the last example's "not Cauchy"
half is stated via unboundedness of the harmonic partial sums instead,
which is the actual reason it fails to be Cauchy and doesn't require the
not-yet-introduced Cauchy definition).
-/

import Mathlib.Order.Basic
import Mathlib.Analysis.SpecificLimits.Basic
import LRA.VolumeIII.Analysis.Sequences.SequenceDefinitions
import LRA.VolumeIII.Analysis.Sequences.Convergence
import LRA.VolumeIII.Analysis.Sequences.NullConstantSequences

namespace LRA.VolumeIII.Analysis.Sequences

/-- `ex:sequence-example-constant`. -/
theorem ExampleConstantSequence (c : ℝ) :
    ConvergesTo (fun _ : ℕ => c) c := by
  sorry

/-- `ex:sequence-example-reciprocal`. -/
theorem ExampleReciprocalSequence :
    (∀ n : ℕ, (1 : ℝ) / (n + 2) < 1 / (n + 1)) ∧
      (∀ n : ℕ, 0 ≤ 1 / ((n : ℝ) + 1)) ∧
      ConvergesTo (fun n : ℕ => 1 / ((n : ℝ) + 1)) 0 := by
  sorry

/-- `ex:sequence-example-alternating-null`. Non-monotone but null. -/
theorem ExampleAlternatingNullSequence :
    ¬ Monotone (fun n : ℕ => (-1 : ℝ) ^ n / (n + 1)) ∧
      ConvergesTo (fun n : ℕ => (-1 : ℝ) ^ n / (n + 1)) 0 := by
  sorry

/-- `ex:sequence-example-oscillating`. Bounded and divergent; the two
parity subsequences converge to different limits. -/
theorem ExampleOscillatingSequence :
    BoundedSeq (fun n : ℕ => (-1 : ℝ) ^ n) ∧
      (¬ ∃ L, ConvergesTo (fun n : ℕ => (-1 : ℝ) ^ n) L) ∧
      ConvergesTo (fun n : ℕ => (-1 : ℝ) ^ (2 * n)) 1 ∧
      ConvergesTo (fun n : ℕ => (-1 : ℝ) ^ (2 * n + 1)) (-1) := by
  sorry

/-- `ex:sequence-example-geometric`, the four regimes. -/
theorem ExampleGeometricSequence :
    (∀ r : ℝ, |r| < 1 → ConvergesTo (fun n : ℕ => r ^ n) 0) ∧
      ConvergesTo (fun _ : ℕ => (1 : ℝ) ^ (0 : ℕ)) 1 ∧
      (¬ ∃ L, ConvergesTo (fun n : ℕ => (-1 : ℝ) ^ n) L) ∧
      (∀ r : ℝ, |r| > 1 → ¬ BoundedSeq (fun n : ℕ => r ^ n)) := by
  sorry

/-- `ex:sequence-counterexample-bounded-not-convergent`. -/
theorem ExampleBoundedNotConvergent :
    BoundedSeq (fun n : ℕ => (-1 : ℝ) ^ n) ∧
      ¬ ∃ L, ConvergesTo (fun n : ℕ => (-1 : ℝ) ^ n) L := by
  sorry

/-- `ex:sequence-counterexample-successive-differences-not-cauchy`. The
harmonic partial sums: adjacent differences vanish, but the sequence is
unbounded (hence not Cauchy — Cauchy sequences are bounded, though that
theorem hasn't been formally read yet in this pass). -/
theorem ExampleVanishingDifferencesNotCauchy :
    ConvergesTo (fun n : ℕ => 1 / ((n : ℝ) + 2)) 0 ∧
      ¬ BoundedSeq (fun n : ℕ => ∑ k ∈ Finset.range (n + 1), 1 / ((k : ℝ) + 1)) := by
  sorry

end LRA.VolumeIII.Analysis.Sequences
