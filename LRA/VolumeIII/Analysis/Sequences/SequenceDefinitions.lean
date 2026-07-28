/-
Draft module; not yet imported by the active Volume III root.
Imports only this pass's own promoted draft modules and Mathlib — nothing from the
real `LRA.VolumeIII.Analysis.Sequences.Sequences` (or wherever the real
project eventually lands this), so this can be freely refactored or
discarded without touching the working project. May freely import
`LRA.VolumeIII.Analysis.Bounding.*` files from the earlier Bounds
pass, since Sequences builds on suprema/infima/bounds concepts.
Source: volume-iii/book-analysis-i/sequences/notes/definition/notes-sequences-definitions.tex
First file of `definition` (installment 1 of 2), first file of the
Sequences chapter overall.

Both boxed definitions are correct and standard: `def:sequence` (a
function N -> X for nonempty X) and `def:real-sequence` (specialized to
X = R). In Lean these aren't really separate "things to formalize" beyond
type aliases — `ℕ → X` already *is* the sequence, definitionally; there's
no extra structure/predicate to state as a `sorry`-able theorem the way
`IsBounded`/`IsSupremum` needed unpacking in the Bounds pass. Kept as thin
type aliases below purely so later files have a citable name matching the
.tex's own vocabulary.

Finding: `def:real-sequence`'s "Predicate reading" remark is tautological
and doesn't actually unpack anything — it reads
`Sequence(x_n, R) := Sequence(x_n, R)`, defining the predicate in terms of
itself. Every other Predicate-reading remark in this corpus (including
`def:sequence`'s own, two nodes earlier) unpacks the predicate into its
actual content (`x : N -> X`); this one should read
`Sequence(x_n, R) := x : N -> R}`, matching that pattern, but doesn't.
Minor authoring slip, reported not fixed.

The three unlabeled-as-theorems `exposition` blocks (`ex:constant-sequence`,
`ex:sequence-reciprocal`, `ex:sequence-natural`) are informal previews that
use the word "converges"/"divergent" before `def:convergent-sequence` is
formally introduced (that's the very next section, `convergence`) — a
one-section forward reference, not really a bug (common textbook style:
motivate with examples, then define formally), but noted. Their actual
mathematical content is correct: the constant sequence converges to `c`
trivially (`N = 1` works since the tail is identically `c`); `1/n -> 0` via
the Archimedean property (this reuses `archimedean_reciprocal_form` /
`archimedean_reciprocal` from the Bounds pass's `ArchimedeanProperty.lean`
almost verbatim); and `x_n = n` diverges because it's unbounded (correctly
hedged in the .tex's own prose: "divergence also follows from that theorem
[every convergent sequence is bounded] once it is established" — a
theorem not yet reached). Formalized here using Mathlib's own
`Filter.Tendsto _ Filter.atTop (nhds _)` for convergence and
`Filter.Tendsto _ Filter.atTop Filter.atTop` for the "grows without bound"
half of the divergence example, matching the forward-dependency handling
pattern established in the Bounds pass (`CompletenessEquivalences.lean`,
`NestedIntervalProperty.lean`) rather than waiting for the project's own
`def:convergent-sequence` (arriving next file) to be re-read here.
-/

import Mathlib.Order.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Order.Filter.AtTopBot.Basic

namespace LRA
namespace VolumeIII
namespace Analysis
namespace Sequences

/-- `def:sequence`. A sequence in a nonempty `X` is a function `N -> X`.
No extra content beyond the Lean function type itself — kept as a type
alias so later files can cite `Sequence X` by name. -/
abbrev Sequence (X : Type*) : Type _ := ℕ → X

/-- `def:real-sequence`. -/
abbrev RealSequence : Type := ℕ → ℝ

/-- `ex:constant-sequence`. The constant sequence converges to `c` — the
degenerate case where the tail is identically, not just eventually,
equal to the limit. -/
theorem ConstantSequenceConverges (c : ℝ) :
    Filter.Tendsto (fun _ : ℕ => c) Filter.atTop (nhds c) := by
  sorry

/-- `ex:sequence-reciprocal`. `1/n -> 0`, via the Archimedean property. -/
theorem ReciprocalSequenceConvergesToZero :
    Filter.Tendsto (fun n : ℕ => 1 / (n : ℝ)) Filter.atTop (nhds 0) := by
  sorry

/-- `ex:sequence-natural`. `x_n = n` diverges by growing without bound
(the .tex's actual argument: for every proposed limit `L`, taking
`ε = 1` and using the Archimedean property to find `n > L + 1` shows the
tail is eventually, in fact permanently past distance `1` from `L`).
Formalized as the positive "tends to infinity" fact, which is the
substance of what the .tex's proof sketch establishes, rather than
literally negating convergence to an arbitrary `L` (both are correct
statements of the same underlying fact; this is the sharper one). -/
theorem NaturalNumberSequenceDiverges :
    Filter.Tendsto (fun n : ℕ => (n : ℝ)) Filter.atTop Filter.atTop := by
  sorry

end Sequences
end Analysis
end VolumeIII
end LRA
