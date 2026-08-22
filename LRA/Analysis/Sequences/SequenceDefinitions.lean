/-
Draft module; not yet imported by the active Volume III root.
Imports only this pass's own promoted draft modules and Mathlib — nothing from the
real `LRA.Analysis.Sequences.Sequences` (or wherever the real
project eventually lands this), so this can be freely refactored or
discarded without touching the working project. May freely import
`LRA.Analysis.Bounds.*` files from the earlier Bounds
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

The three unlabeled-as-theorems `exposition` blocks (`ex:constant-sequence`,
`ex:sequence-reciprocal`, `ex:sequence-natural`) are informal previews that
use the word "converges"/"divergent" before `def:convergent-sequence` is
formally introduced (that's the very next section, `convergence`) — a
one-section forward reference, not really a bug (common textbook style:
motivate with examples, then define formally), but noted. Their actual
mathematical content is correct: the constant sequence converges to `c`
trivially (`N = 1` works since the tail is identically `c`); `1/n -> 0` via
the Archimedean property; and `x_n = n` diverges because it's unbounded
(correctly hedged in the .tex's own prose: "divergence also follows from that
theorem [every convergent sequence is bounded] once it is established" — a
theorem not yet reached). The foundational sequence layer now owns the native
epsilon-tail convergence and divergence predicates directly.
-/

import Mathlib.Data.Real.Basic

namespace LRA.Analysis.Sequences

/-- `def:sequence`. A sequence in a nonempty `X` is a function `N -> X`.
No extra content beyond the Lean function type itself — kept as a type
alias so later files can cite `Sequence X` by name.

Logical form:

```lean
abbrev Sequence (X : Type*) : Type _ := ℕ → X
```
-/
abbrev Sequence (X : Type*) : Type _ := ℕ → X

/-- `def:real-sequence`.

Logical form:

```lean
abbrev RealSequence : Type := ℕ → ℝ
```
-/
abbrev RealSequence : Type := ℕ → ℝ

/-- `def:convergent-sequence`.

Logical form:

```lean
def ConvergesTo (x : RealSequence) (L : ℝ) : Prop :=
  ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, abs (x n - L) < ε
```
-/
def ConvergesTo (x : RealSequence) (L : ℝ) : Prop :=
  ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |x n - L| < ε

/-- `def:divergent-sequence`.

Logical form:

```lean
def IsDivergent (x : RealSequence) : Prop := ¬ ∃ L : ℝ, ConvergesTo x L
```
-/
def IsDivergent (x : RealSequence) : Prop := ¬ ∃ L : ℝ, ConvergesTo x L

/-- `def:diverges-to-positive-infinity`.

Logical form:

```lean
def DivergesToPosInf (x : RealSequence) : Prop :=
  ∀ M : ℝ, ∃ N : ℕ, ∀ n ≥ N, M < x n
```
-/
def DivergesToPosInf (x : RealSequence) : Prop :=
  ∀ M : ℝ, ∃ N : ℕ, ∀ n ≥ N, M < x n

/-- `def:diverges-to-negative-infinity`.

Logical form:

```lean
def DivergesToNegInf (x : RealSequence) : Prop :=
  ∀ M : ℝ, ∃ N : ℕ, ∀ n ≥ N, x n < M
```
-/
def DivergesToNegInf (x : RealSequence) : Prop :=
  ∀ M : ℝ, ∃ N : ℕ, ∀ n ≥ N, x n < M

/-- `def:oscillatory-sequence`.

Logical form:

```lean
def IsOscillatory (x : RealSequence) : Prop :=
  IsDivergent x ∧ ¬ DivergesToPosInf x ∧ ¬ DivergesToNegInf x
```
-/
def IsOscillatory (x : RealSequence) : Prop :=
  IsDivergent x ∧ ¬ DivergesToPosInf x ∧ ¬ DivergesToNegInf x

/-- Let `c : ℝ`. Then the constant sequence with value `c` converges to `c`.

Logical form:

```lean
theorem ConstantSequenceConverges (c : ℝ) :
    ConvergesTo (fun _ : ℕ => c) c
```
-/
theorem ConstantSequenceConverges (c : ℝ) :
    ConvergesTo (fun _ : ℕ => c) c := by
  sorry

/-- The reciprocal sequence `n ↦ 1 / n` converges to `0`.

Logical form:

```lean
theorem ReciprocalSequenceConvergesToZero :
    ConvergesTo (fun n : ℕ => 1 / (n : ℝ)) 0
```
-/
theorem ReciprocalSequenceConvergesToZero :
    ConvergesTo (fun n : ℕ => 1 / (n : ℝ)) 0 := by
  sorry

/-- The natural-number sequence `n ↦ n`, read as a real sequence, diverges to
positive infinity.

Logical form:

```lean
theorem NaturalNumberSequenceDiverges :
    DivergesToPosInf (fun n : ℕ => (n : ℝ))
```
-/
theorem NaturalNumberSequenceDiverges :
    DivergesToPosInf (fun n : ℕ => (n : ℝ)) := by
  sorry

end LRA.Analysis.Sequences
