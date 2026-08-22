/-
Draft module; not yet imported by the active Volume III root.
Imports only this pass's own promoted draft modules and Mathlib — nothing from the
real `LRA.Analysis.Sequences.*`, so this can be freely
refactored or discarded without touching the working project.
Source: volume-iii/book-analysis-i/sequences/notes/monotonicity/notes-monotonicity.tex
Only file in `monotonicity`. Structural check: 69/69 balanced remark
blocks, 14 labeled nodes — clean.

All 14 nodes are mathematically correct — the standard package:
increasing/decreasing/strictly-increasing/strictly-decreasing/monotone,
their eventual (tail) versions, the Monotone Convergence Theorem itself,
strict-implies-non-strict, the bounded-monotone-convergence equivalences,
the eventually-monotone version, unbounded monotone divergence, and
algebraic transformations preserving/reversing monotonicity. Part (c) of
`thm:bounded-monotone-sequence-equivalences` ("monotone -> (converges iff
bounded)") correctly reduces to parts (a)/(b) since a monotone sequence is
automatically bounded on the "wrong" side already (an increasing sequence
is always bounded below by its first term, etc.) — not spelled out
explicitly in the .tex but a correct and standard elision. Parts (e)/(f)
of `thm:algebraic-transformations-preserve-monotonicity` (negation flips
monotonicity direction) are strict specializations of parts (c)/(d) at
`alpha = -1`, listed separately — the .tex's own Interpretation says so
explicitly ("Negation is the special case alpha=-1"), so this is
deliberate reinforcement, not an error.

Finding: `def:eventually-monotone-sequence`'s dependency list has THREE
`\hyperref[def:m-tail]{...}` cross-references across this file; the first
two (lines 568, 658, in `def:eventually-increasing-sequence` and
`def:eventually-decreasing-sequence`) correctly display "M-Tail of a
Sequence," but the third (line 769, in `def:eventually-monotone-
sequence`'s own dependencies) displays "Convergence of a Tail" instead —
the title of a DIFFERENT node (`thm:convergence-of-tail`) while still
pointing at the `def:m-tail` target. A genuine label-text/target
mismatch, matching the "infimum-is-monotone-under-inclusion" style
naming-inconsistency bug found during the Bounds pass. Not fixed here.

`thm:unbounded-monotone-divergence` depends on the positive- and
negative-infinity divergence predicates, which are now owned by
`SequenceDefinitions.lean` and can be used directly here.

`IsIncreasing`/`IsDecreasing`/etc. reused/extended from
`Monotone`/`Antitone`/`StrictMono`/`StrictAnti` naming conventions but
kept as the project's OWN named predicates (matching house style
throughout this pass) rather than reusing Mathlib's `Monotone` directly,
since the .tex's own vocabulary (`OrderPreserving`/`OrderReversing`) is
being tracked as citable content.
-/

import Mathlib.Order.Basic
import LRA.Analysis.Sequences.SequenceDefinitions
import LRA.Analysis.Sequences.Convergence
import LRA.Analysis.Sequences.NullConstantSequences
import LRA.Analysis.Sequences.Tails
import LRA.Analysis.Bounds.Extrema.SupremaInfima

namespace LRA.Analysis.Sequences

open LRA.Analysis.Bounds (IsSupremum IsInfimum)

/-- `def:increasing-sequence`.

Logical form:

```lean
def IsIncreasing (x : RealSequence) : Prop := ∀ n, x n ≤ x (n + 1)
```
-/
def IsIncreasing (x : RealSequence) : Prop := ∀ n, x n ≤ x (n + 1)

/-- `def:decreasing-sequence`.

Logical form:

```lean
def IsDecreasing (x : RealSequence) : Prop := ∀ n, x (n + 1) ≤ x n
```
-/
def IsDecreasing (x : RealSequence) : Prop := ∀ n, x (n + 1) ≤ x n

/-- `def:strictly-increasing-sequence`.

Logical form:

```lean
def IsStrictlyIncreasing (x : RealSequence) : Prop := ∀ n, x n < x (n + 1)
```
-/
def IsStrictlyIncreasing (x : RealSequence) : Prop := ∀ n, x n < x (n + 1)

/-- `def:strictly-decreasing-sequence`.

Logical form:

```lean
def IsStrictlyDecreasing (x : RealSequence) : Prop := ∀ n, x (n + 1) < x n
```
-/
def IsStrictlyDecreasing (x : RealSequence) : Prop := ∀ n, x (n + 1) < x n

/-- `def:monotone-sequence`.

Logical form:

```lean
def IsMonotoneSeq (x : RealSequence) : Prop := IsIncreasing x ∨ IsDecreasing x
```
-/
def IsMonotoneSeq (x : RealSequence) : Prop := IsIncreasing x ∨ IsDecreasing x

/-- `def:eventually-increasing-sequence`.

Logical form:

```lean
def IsEventuallyIncreasing (x : RealSequence) : Prop :=
  ∃ N : ℕ, ∀ n ≥ N, x n ≤ x (n + 1)
```
-/
def IsEventuallyIncreasing (x : RealSequence) : Prop :=
  ∃ N : ℕ, ∀ n ≥ N, x n ≤ x (n + 1)

/-- `def:eventually-decreasing-sequence`.

Logical form:

```lean
def IsEventuallyDecreasing (x : RealSequence) : Prop :=
  ∃ N : ℕ, ∀ n ≥ N, x (n + 1) ≤ x n
```
-/
def IsEventuallyDecreasing (x : RealSequence) : Prop :=
  ∃ N : ℕ, ∀ n ≥ N, x (n + 1) ≤ x n

/-- `def:eventually-monotone-sequence`.

Logical form:

```lean
def IsEventuallyMonotone (x : RealSequence) : Prop :=
  IsEventuallyIncreasing x ∨ IsEventuallyDecreasing x
```
-/
def IsEventuallyMonotone (x : RealSequence) : Prop :=
  IsEventuallyIncreasing x ∨ IsEventuallyDecreasing x

-- `thm:monotone-convergence-theorem`
/-- Let `x : RealSequence`. If `hinc : IsIncreasing x` and `hbdd : BoundedAboveSeq x`. Then `∃ L,
ConvergesTo x L ∧ IsSupremum L (Set.range x)`.

Logical form:

```lean
theorem MonotoneConvergenceTheoremIncreasing {x : RealSequence}
    (hinc : IsIncreasing x) (hbdd : BoundedAboveSeq x) :
    ∃ L, ConvergesTo x L ∧ IsSupremum L (Set.range x)
```
-/
theorem MonotoneConvergenceTheoremIncreasing {x : RealSequence}
    (hinc : IsIncreasing x) (hbdd : BoundedAboveSeq x) :
    ∃ L, ConvergesTo x L ∧ IsSupremum L (Set.range x) := by
  sorry

-- `thm:monotone-convergence-theorem`
/-- Let `x : RealSequence`. If `hdec : IsDecreasing x` and `hbdd : BoundedBelowSeq x`. Then `∃ L,
ConvergesTo x L ∧ IsInfimum L (Set.range x)`.

Logical form:

```lean
theorem MonotoneConvergenceTheoremDecreasing {x : RealSequence}
    (hdec : IsDecreasing x) (hbdd : BoundedBelowSeq x) :
    ∃ L, ConvergesTo x L ∧ IsInfimum L (Set.range x)
```
-/
theorem MonotoneConvergenceTheoremDecreasing {x : RealSequence}
    (hdec : IsDecreasing x) (hbdd : BoundedBelowSeq x) :
    ∃ L, ConvergesTo x L ∧ IsInfimum L (Set.range x) := by
  sorry

-- `thm:strict-monotonicity-implies-monotonicity`
/-- Let `x : RealSequence`. If `h : IsStrictlyIncreasing x`. Then `IsIncreasing x`.

Logical form:

```lean
theorem StrictIncreasingImpliesIncreasing {x : RealSequence}
    (h : IsStrictlyIncreasing x) : IsIncreasing x
```
-/
theorem StrictIncreasingImpliesIncreasing {x : RealSequence}
    (h : IsStrictlyIncreasing x) : IsIncreasing x := by
  sorry

-- `thm:strict-monotonicity-implies-monotonicity`
/-- Let `x : RealSequence`. If `h : IsStrictlyDecreasing x`. Then `IsDecreasing x`.

Logical form:

```lean
theorem StrictDecreasingImpliesDecreasing {x : RealSequence}
    (h : IsStrictlyDecreasing x) : IsDecreasing x
```
-/
theorem StrictDecreasingImpliesDecreasing {x : RealSequence}
    (h : IsStrictlyDecreasing x) : IsDecreasing x := by
  sorry

-- `thm:bounded-monotone-sequence-equivalences`
/-- Let `x : RealSequence`. If `h : IsIncreasing x`. Then `(∃ L, ConvergesTo x L) ↔ BoundedAboveSeq
x`.

Logical form:

```lean
theorem BoundedMonotoneSequenceEquivalencesIncr {x : RealSequence}
    (h : IsIncreasing x) :
    (∃ L, ConvergesTo x L) ↔ BoundedAboveSeq x
```
-/
theorem BoundedMonotoneSequenceEquivalencesIncr {x : RealSequence}
    (h : IsIncreasing x) :
    (∃ L, ConvergesTo x L) ↔ BoundedAboveSeq x := by
  sorry

-- `thm:bounded-monotone-sequence-equivalences`
/-- Let `x : RealSequence`. If `h : IsDecreasing x`. Then `(∃ L, ConvergesTo x L) ↔ BoundedBelowSeq
x`.

Logical form:

```lean
theorem BoundedMonotoneSequenceEquivalencesDecr {x : RealSequence}
    (h : IsDecreasing x) :
    (∃ L, ConvergesTo x L) ↔ BoundedBelowSeq x
```
-/
theorem BoundedMonotoneSequenceEquivalencesDecr {x : RealSequence}
    (h : IsDecreasing x) :
    (∃ L, ConvergesTo x L) ↔ BoundedBelowSeq x := by
  sorry

/-- Let `x : RealSequence`. If `h : IsIncreasing x`. Then `∀ n, x 0 ≤ x n`.

Logical form:

```lean
theorem IncreasingBoundedBelowByFirstTerm {x : RealSequence}
    (h : IsIncreasing x) : ∀ n, x 0 ≤ x n
```
-/
theorem IncreasingBoundedBelowByFirstTerm {x : RealSequence}
    (h : IsIncreasing x) : ∀ n, x 0 ≤ x n := by
  sorry

/-- Let `x : RealSequence`. If `h : IsDecreasing x`. Then `∀ n, x n ≤ x 0`.

Logical form:

```lean
theorem DecreasingBoundedAboveByFirstTerm {x : RealSequence}
    (h : IsDecreasing x) : ∀ n, x n ≤ x 0
```
-/
theorem DecreasingBoundedAboveByFirstTerm {x : RealSequence}
    (h : IsDecreasing x) : ∀ n, x n ≤ x 0 := by
  sorry

-- `thm:bounded-monotone-sequence-equivalences`
/-- Let `x : RealSequence`. If `h : IsMonotoneSeq x`. Then `(∃ L, ConvergesTo x L) ↔ BoundedSeq x`.

Logical form:

```lean
theorem BoundedMonotoneSequenceEquivalences {x : RealSequence}
    (h : IsMonotoneSeq x) :
    (∃ L, ConvergesTo x L) ↔ BoundedSeq x
```
-/
theorem BoundedMonotoneSequenceEquivalences {x : RealSequence}
    (h : IsMonotoneSeq x) :
    (∃ L, ConvergesTo x L) ↔ BoundedSeq x := by
  sorry

-- `thm:eventually-monotone-convergence-theorem`
/-- Let `x : RealSequence`. If `h : IsEventuallyIncreasing x` and `hbdd : BoundedAboveSeq x`. Then
`∃ L, ConvergesTo x L`.

Logical form:

```lean
theorem EventuallyMonotoneConvergenceTheoremIncr {x : RealSequence}
    (h : IsEventuallyIncreasing x) (hbdd : BoundedAboveSeq x) :
    ∃ L, ConvergesTo x L
```
-/
theorem EventuallyMonotoneConvergenceTheoremIncr {x : RealSequence}
    (h : IsEventuallyIncreasing x) (hbdd : BoundedAboveSeq x) :
    ∃ L, ConvergesTo x L := by
  sorry

-- `thm:eventually-monotone-convergence-theorem`
/-- Let `x : RealSequence`. If `h : IsEventuallyDecreasing x` and `hbdd : BoundedBelowSeq x`. Then
`∃ L, ConvergesTo x L`.

Logical form:

```lean
theorem EventuallyMonotoneConvergenceTheoremDecr {x : RealSequence}
    (h : IsEventuallyDecreasing x) (hbdd : BoundedBelowSeq x) :
    ∃ L, ConvergesTo x L
```
-/
theorem EventuallyMonotoneConvergenceTheoremDecr {x : RealSequence}
    (h : IsEventuallyDecreasing x) (hbdd : BoundedBelowSeq x) :
    ∃ L, ConvergesTo x L := by
  sorry

-- `thm:eventually-monotone-convergence-theorem`
/-- Let `x : RealSequence`. If `h : IsEventuallyMonotone x` and `hbdd : BoundedSeq x`. Then `∃ L,
ConvergesTo x L`.

Logical form:

```lean
theorem EventuallyMonotoneConvergenceTheorem {x : RealSequence}
    (h : IsEventuallyMonotone x) (hbdd : BoundedSeq x) :
    ∃ L, ConvergesTo x L
```
-/
theorem EventuallyMonotoneConvergenceTheorem {x : RealSequence}
    (h : IsEventuallyMonotone x) (hbdd : BoundedSeq x) :
    ∃ L, ConvergesTo x L := by
  sorry

-- `thm:unbounded-monotone-divergence`
/-- Let `x : RealSequence`. If `hinc : IsIncreasing x` and
`hunbdd : ¬ BoundedAboveSeq x`. Then `DivergesToPosInf x`.

Logical form:

```lean
theorem UnboundedMonotoneDivergencePos {x : RealSequence}
    (hinc : IsIncreasing x) (hunbdd : ¬ BoundedAboveSeq x) :
    DivergesToPosInf x
```
-/
theorem UnboundedMonotoneDivergencePos {x : RealSequence}
    (hinc : IsIncreasing x) (hunbdd : ¬ BoundedAboveSeq x) :
    DivergesToPosInf x := by
  sorry

-- `thm:unbounded-monotone-divergence`
/-- Let `x : RealSequence`. If `hdec : IsDecreasing x` and
`hunbdd : ¬ BoundedBelowSeq x`. Then `DivergesToNegInf x`.

Logical form:

```lean
theorem UnboundedMonotoneDivergenceNeg {x : RealSequence}
    (hdec : IsDecreasing x) (hunbdd : ¬ BoundedBelowSeq x) :
    DivergesToNegInf x
```
-/
theorem UnboundedMonotoneDivergenceNeg {x : RealSequence}
    (hdec : IsDecreasing x) (hunbdd : ¬ BoundedBelowSeq x) :
    DivergesToNegInf x := by
  sorry

-- `thm:algebraic-transformations-preserve-monotonicity`
/-- Let `x : RealSequence` and `c : ℝ`. If `h : IsIncreasing x`. Then `IsIncreasing (fun n => x n +
c)`.

Logical form:

```lean
theorem TranslationPreservesIncreasing {x : RealSequence} {c : ℝ}
    (h : IsIncreasing x) : IsIncreasing (fun n => x n + c)
```
-/
theorem TranslationPreservesIncreasing {x : RealSequence} {c : ℝ}
    (h : IsIncreasing x) : IsIncreasing (fun n => x n + c) := by
  sorry

-- `thm:algebraic-transformations-preserve-monotonicity`
/-- Let `x : RealSequence` and `c : ℝ`. If `h : IsDecreasing x`. Then `IsDecreasing (fun n => x n +
c)`.

Logical form:

```lean
theorem TranslationPreservesDecreasing {x : RealSequence} {c : ℝ}
    (h : IsDecreasing x) : IsDecreasing (fun n => x n + c)
```
-/
theorem TranslationPreservesDecreasing {x : RealSequence} {c : ℝ}
    (h : IsDecreasing x) : IsDecreasing (fun n => x n + c) := by
  sorry

-- `thm:algebraic-transformations-preserve-monotonicity`
/-- Let `x : RealSequence` and `α : ℝ`. If `h : IsIncreasing x` and `hα : α > 0`. Then `IsIncreasing
(fun n => α * x n)`.

Logical form:

```lean
theorem PositiveScalarPreservesIncreasing {x : RealSequence} {α : ℝ}
    (h : IsIncreasing x) (hα : α > 0) : IsIncreasing (fun n => α * x n)
```
-/
theorem PositiveScalarPreservesIncreasing {x : RealSequence} {α : ℝ}
    (h : IsIncreasing x) (hα : α > 0) : IsIncreasing (fun n => α * x n) := by
  sorry

-- `thm:algebraic-transformations-preserve-monotonicity`
/-- Let `x : RealSequence` and `α : ℝ`. If `h : IsIncreasing x` and `hα : α < 0`. Then `IsDecreasing
(fun n => α * x n)`.

Logical form:

```lean
theorem NegativeScalarReversesIncreasing {x : RealSequence} {α : ℝ}
    (h : IsIncreasing x) (hα : α < 0) : IsDecreasing (fun n => α * x n)
```
-/
theorem NegativeScalarReversesIncreasing {x : RealSequence} {α : ℝ}
    (h : IsIncreasing x) (hα : α < 0) : IsDecreasing (fun n => α * x n) := by
  sorry

-- `thm:algebraic-transformations-preserve-monotonicity`
/-- Let `x : RealSequence`. If `h : IsIncreasing x`. Then `IsDecreasing (fun n => -x n)`.

Logical form:

```lean
theorem NegationReversesIncreasing {x : RealSequence}
    (h : IsIncreasing x) : IsDecreasing (fun n => -x n)
```
-/
theorem NegationReversesIncreasing {x : RealSequence}
    (h : IsIncreasing x) : IsDecreasing (fun n => -x n) := by
  sorry

-- `thm:algebraic-transformations-preserve-monotonicity`
/-- Let `x : RealSequence`. If `h : IsDecreasing x`. Then `IsIncreasing (fun n => -x n)`.

Logical form:

```lean
theorem NegationReversesDecreasing {x : RealSequence}
    (h : IsDecreasing x) : IsIncreasing (fun n => -x n)
```
-/
theorem NegationReversesDecreasing {x : RealSequence}
    (h : IsDecreasing x) : IsIncreasing (fun n => -x n) := by
  sorry

end LRA.Analysis.Sequences
