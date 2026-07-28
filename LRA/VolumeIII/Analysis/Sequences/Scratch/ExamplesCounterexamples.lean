/-
SCRATCH FILE — not wired into the lra-lean project.
Imports only this pass's own scratch files and Mathlib — nothing from the
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

import Mathlib.Order.Defs
import Mathlib.Analysis.SpecificLimits.Basic
import LRA.VolumeIII.Analysis.Sequences.Scratch.SequenceDefinitions
import LRA.VolumeIII.Analysis.Sequences.Scratch.Convergence
import LRA.VolumeIII.Analysis.Sequences.Scratch.NullConstantSequences

namespace LRA
namespace VolumeIII
namespace Analysis
namespace Sequences
namespace Scratch

/-- `ex:sequence-example-constant`. -/
theorem example_constant_sequence (c : ℝ) :
    ConvergesTo (fun _ : ℕ => c) c := by
  sorry

/-- `ex:sequence-example-reciprocal`. -/
theorem example_reciprocal_sequence :
    (∀ n : ℕ, (1 : ℝ) / (n + 2) < 1 / (n + 1)) ∧
      (∀ n : ℕ, 0 ≤ 1 / ((n : ℝ) + 1)) ∧
      ConvergesTo (fun n : ℕ => 1 / ((n : ℝ) + 1)) 0 := by
  sorry

/-- `ex:sequence-example-alternating-null`. Non-monotone but null. -/
theorem example_alternating_null_sequence :
    ¬ Monotone (fun n : ℕ => (-1 : ℝ) ^ n / (n + 1)) ∧
      ConvergesTo (fun n : ℕ => (-1 : ℝ) ^ n / (n + 1)) 0 := by
  sorry

/-- `ex:sequence-example-oscillating`. Bounded and divergent; the two
parity subsequences converge to different limits. -/
theorem example_oscillating_sequence :
    BoundedSeq (fun n : ℕ => (-1 : ℝ) ^ n) ∧
      (¬ ∃ L, ConvergesTo (fun n : ℕ => (-1 : ℝ) ^ n) L) ∧
      ConvergesTo (fun n : ℕ => (-1 : ℝ) ^ (2 * n)) 1 ∧
      ConvergesTo (fun n : ℕ => (-1 : ℝ) ^ (2 * n + 1)) (-1) := by
  sorry

/-- `ex:sequence-example-geometric`, the four regimes. -/
theorem example_geometric_sequence :
    (∀ r : ℝ, |r| < 1 → ConvergesTo (fun n : ℕ => r ^ n) 0) ∧
      ConvergesTo (fun _ : ℕ => (1 : ℝ) ^ (0 : ℕ)) 1 ∧
      (¬ ∃ L, ConvergesTo (fun n : ℕ => (-1 : ℝ) ^ n) L) ∧
      (∀ r : ℝ, |r| > 1 → ¬ BoundedSeq (fun n : ℕ => r ^ n)) := by
  sorry

/-- `ex:sequence-counterexample-bounded-not-convergent`. -/
theorem example_bounded_not_convergent :
    BoundedSeq (fun n : ℕ => (-1 : ℝ) ^ n) ∧
      ¬ ∃ L, ConvergesTo (fun n : ℕ => (-1 : ℝ) ^ n) L := by
  sorry

/-- `ex:sequence-counterexample-successive-differences-not-cauchy`. The
harmonic partial sums: adjacent differences vanish, but the sequence is
unbounded (hence not Cauchy — Cauchy sequences are bounded, though that
theorem hasn't been formally read yet in this pass). -/
theorem example_vanishing_differences_not_cauchy :
    ConvergesTo (fun n : ℕ => 1 / ((n : ℝ) + 2)) 0 ∧
      ¬ BoundedSeq (fun n : ℕ => ∑ k ∈ Finset.range (n + 1), 1 / ((k : ℝ) + 1)) := by
  sorry

end Scratch
end Sequences
end Analysis
end VolumeIII
end LRA
