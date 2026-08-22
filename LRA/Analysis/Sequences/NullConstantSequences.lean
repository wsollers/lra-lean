/-
Draft module; not yet imported by the active Volume III root.
Imports only this pass's own promoted draft modules and Mathlib — nothing from the
real `LRA.Analysis.Sequences.*`, so this can be freely
refactored or discarded without touching the working project.
Source: volume-iii/book-analysis-i/sequences/notes/definition/notes-null-constant-sequences.tex
Second file of `definition` (installment 2 of 2). Structural check: 81/81
balanced remark blocks, 21 labeled nodes — clean, no duplication bug.

All 21 nodes are mathematically correct — standard package: constant /
null / ultimately-constant sequences, their convergence facts, the
"convergence = null tail-shift" translation lemma, tail-invariance of
convergence, and one- or two-sided boundedness with the tail and
absolute-value reformulations.

Two minor findings, reported not fixed:
  - `thm:difference-from-limit-is-null`'s "Standard quantified statement"
    remark shows the LEFT side (`ConvergesTo`) and RIGHT side (`IsNull`)
    as the exact same displayed formula `forall eps exists N forall n>=N,
    |x_n - L| < eps`. This is NOT a copy-paste bug — it's mathematically
    correct and rather the point: unpacking `IsNull` applied to the
    sequence `(x_n - L)` literally produces the same predicate as
    `ConvergesTo(x_n, L)`, which is exactly why this theorem is close to
    definitional. Flagged only so it isn't mistaken for the
    leftover-formula corruption pattern from the Bounds pass — this one
    is correct as written.
  - `thm:absolute-bound-upper-lower-bounds` and
    `thm:upper-lower-bounds-absolute-bound` both have "Predicate reading"
    remarks that are verbatim copies of their own "Standard quantified
    statement" remarks (including the prose header), rather than
    translating into the corpus's named predicates
    (`Bounded`/`BoundedAbove`/`BoundedBelow`) the way every other node in
    this file does. Not wrong math, just not doing a Predicate reading's
    job — minor authoring gap.
  - The three "Eventually ... Tail Formulation" theorems' Predicate
    readings use an `Eventually(x_n, P)` operator that isn't formally
    defined anywhere in this file (or earlier) — presumably intended to
    be introduced in the upcoming `tails` section (the very next section
    per `notes/index.tex`). One-section forward reference, not a bug.

Formalized generic sequence predicates below (`IsConstant`, `IsNull`,
`IsUltimatelyConstant`, `BoundedAboveSeq`, `BoundedBelowSeq`,
`BoundedSeq`) scoped to `RealSequence` from `SequenceDefinitions.lean`.
All convergence statements now use the native `ConvergesTo` predicate.
-/

import Mathlib.Order.Basic
import LRA.Analysis.Sequences.SequenceDefinitions

namespace LRA.Analysis.Sequences

/-- `def:constant-sequence`.

Logical form:

```lean
def IsConstant (x : RealSequence) (c : ℝ) : Prop := ∀ n, x n = c
```
-/
def IsConstant (x : RealSequence) (c : ℝ) : Prop := ∀ n, x n = c

/-- `def:null-sequence`.

Logical form:

```lean
def IsNull (x : RealSequence) : Prop :=
  ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |x n| < ε
```
-/
def IsNull (x : RealSequence) : Prop :=
  ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |x n| < ε

/-- `def:ultimately-constant-sequence`.

Logical form:

```lean
def IsUltimatelyConstant (x : RealSequence) (c : ℝ) : Prop :=
  ∃ N : ℕ, ∀ n ≥ N, x n = c
```
-/
def IsUltimatelyConstant (x : RealSequence) (c : ℝ) : Prop :=
  ∃ N : ℕ, ∀ n ≥ N, x n = c

/-- `def:sequence-bounded-above`.

Logical form:

```lean
def BoundedAboveSeq (x : RealSequence) : Prop := ∃ M : ℝ, ∀ n, x n ≤ M
```
-/
def BoundedAboveSeq (x : RealSequence) : Prop := ∃ M : ℝ, ∀ n, x n ≤ M

/-- `def:sequence-bounded-below`.

Logical form:

```lean
def BoundedBelowSeq (x : RealSequence) : Prop := ∃ m : ℝ, ∀ n, m ≤ x n
```
-/
def BoundedBelowSeq (x : RealSequence) : Prop := ∃ m : ℝ, ∀ n, m ≤ x n

/-- `def:bounded-sequence`.

Logical form:

```lean
def BoundedSeq (x : RealSequence) : Prop := ∃ M > 0, ∀ n, |x n| ≤ M
```
-/
def BoundedSeq (x : RealSequence) : Prop := ∃ M > 0, ∀ n, |x n| ≤ M

-- `thm:constant-sequence-convergence`
/-- Let `x : RealSequence` and `c : ℝ`. If `h : IsConstant x c`. Then
`ConvergesTo x c`.

Logical form:

```lean
theorem ConstantSequenceConvergence {x : RealSequence} {c : ℝ}
    (h : IsConstant x c) : ConvergesTo x c
```
-/
theorem ConstantSequenceConvergence {x : RealSequence} {c : ℝ}
    (h : IsConstant x c) : ConvergesTo x c := by
  sorry

-- `thm:zero-sequence-is-null`
/-- Let `x : RealSequence`. If `h : IsConstant x 0`. Then `IsNull x`.

Logical form:

```lean
theorem ZeroSequenceIsNull {x : RealSequence} (h : IsConstant x 0) :
    IsNull x
```
-/
theorem ZeroSequenceIsNull {x : RealSequence} (h : IsConstant x 0) :
    IsNull x := by
  sorry

-- `thm:constant-null-sequence`
/-- Let `x : RealSequence` and `c : ℝ`. If `h : IsConstant x c`. Then `IsNull x ↔ c = 0`.

Logical form:

```lean
theorem ConstantNullSequence {x : RealSequence} {c : ℝ}
    (h : IsConstant x c) : IsNull x ↔ c = 0
```
-/
theorem ConstantNullSequence {x : RealSequence} {c : ℝ}
    (h : IsConstant x c) : IsNull x ↔ c = 0 := by
  sorry

-- `thm:difference-from-limit-is-null`
/-- Let `x : RealSequence` and `L : ℝ`. Then `ConvergesTo x L ↔ IsNull (fun n
=> x n - L)`.

Logical form:

```lean
theorem DifferenceFromLimitIsNull (x : RealSequence) (L : ℝ) :
    ConvergesTo x L ↔ IsNull (fun n => x n - L)
```
-/
theorem DifferenceFromLimitIsNull (x : RealSequence) (L : ℝ) :
    ConvergesTo x L ↔ IsNull (fun n => x n - L) := by
  sorry

-- `thm:ultimately-constant-sequence-convergence`
/-- Let `x : RealSequence` and `c : ℝ`. If `h : IsUltimatelyConstant x c`.
Then `ConvergesTo x c`.

Logical form:

```lean
theorem UltimatelyConstantSequenceConvergence {x : RealSequence} {c : ℝ}
    (h : IsUltimatelyConstant x c) :
    ConvergesTo x c
```
-/
theorem UltimatelyConstantSequenceConvergence {x : RealSequence} {c : ℝ}
    (h : IsUltimatelyConstant x c) :
    ConvergesTo x c := by
  sorry

-- `thm:constant-implies-ultimately-constant`
/-- Let `x : RealSequence` and `c : ℝ`. If `h : IsConstant x c`. Then `IsUltimatelyConstant x c`.

Logical form:

```lean
theorem ConstantImpliesUltimatelyConstant {x : RealSequence} {c : ℝ}
    (h : IsConstant x c) : IsUltimatelyConstant x c
```
-/
theorem ConstantImpliesUltimatelyConstant {x : RealSequence} {c : ℝ}
    (h : IsConstant x c) : IsUltimatelyConstant x c := by
  sorry

-- `thm:ultimately-zero-sequence-is-null`
/-- Let `x : RealSequence`. If `h : IsUltimatelyConstant x 0`. Then `IsNull x`.

Logical form:

```lean
theorem UltimatelyZeroSequenceIsNull {x : RealSequence}
    (h : IsUltimatelyConstant x 0) : IsNull x
```
-/
theorem UltimatelyZeroSequenceIsNull {x : RealSequence}
    (h : IsUltimatelyConstant x 0) : IsNull x := by
  sorry

-- `thm:ultimately-constant-null-sequence`
/-- Let `x : RealSequence` and `c : ℝ`. If `h : IsUltimatelyConstant x c`. Then `IsNull x ↔ c = 0`.

Logical form:

```lean
theorem UltimatelyConstantNullSequence {x : RealSequence} {c : ℝ}
    (h : IsUltimatelyConstant x c) : IsNull x ↔ c = 0
```
-/
theorem UltimatelyConstantNullSequence {x : RealSequence} {c : ℝ}
    (h : IsUltimatelyConstant x c) : IsNull x ↔ c = 0 := by
  sorry

-- `thm:tail-equality-preserves-convergence`
/-- Let `x y : RealSequence` and `L : ℝ`. If `h : ∃ N₀ : ℕ, ∀ n ≥ N₀, x n = y n`.
Then `ConvergesTo x L ↔ ConvergesTo y L`.

Logical form:

```lean
theorem TailEqualityPreservesConvergence {x y : RealSequence}
    (h : ∃ N₀ : ℕ, ∀ n ≥ N₀, x n = y n) (L : ℝ) :
    ConvergesTo x L ↔ ConvergesTo y L
```
-/
theorem TailEqualityPreservesConvergence {x y : RealSequence}
    (h : ∃ N₀ : ℕ, ∀ n ≥ N₀, x n = y n) (L : ℝ) :
    ConvergesTo x L ↔ ConvergesTo y L := by
  sorry

-- `thm:eventually-bounded-above-tail-formulation`
/-- Let `x : RealSequence`. Then `BoundedAboveSeq x ↔ ∃ N₀ : ℕ, ∃ M : ℝ, ∀ n ≥ N₀, x n ≤ M`.

Logical form:

```lean
theorem EventuallyBoundedAboveTailFormulation (x : RealSequence) :
    BoundedAboveSeq x ↔ ∃ N₀ : ℕ, ∃ M : ℝ, ∀ n ≥ N₀, x n ≤ M
```
-/
theorem EventuallyBoundedAboveTailFormulation (x : RealSequence) :
    BoundedAboveSeq x ↔ ∃ N₀ : ℕ, ∃ M : ℝ, ∀ n ≥ N₀, x n ≤ M := by
  sorry

-- `thm:eventually-bounded-below-tail-formulation`
/-- Let `x : RealSequence`. Then `BoundedBelowSeq x ↔ ∃ N₀ : ℕ, ∃ m : ℝ, ∀ n ≥ N₀, m ≤ x n`.

Logical form:

```lean
theorem EventuallyBoundedBelowTailFormulation (x : RealSequence) :
    BoundedBelowSeq x ↔ ∃ N₀ : ℕ, ∃ m : ℝ, ∀ n ≥ N₀, m ≤ x n
```
-/
theorem EventuallyBoundedBelowTailFormulation (x : RealSequence) :
    BoundedBelowSeq x ↔ ∃ N₀ : ℕ, ∃ m : ℝ, ∀ n ≥ N₀, m ≤ x n := by
  sorry

-- `thm:eventually-bounded-tail-formulation`
/-- Let `x : RealSequence`. Then `BoundedSeq x ↔ ∃ N₀ : ℕ, ∃ M > 0, ∀ n ≥ N₀, |x n| ≤ M`.

Logical form:

```lean
theorem EventuallyBoundedTailFormulation (x : RealSequence) :
    BoundedSeq x ↔ ∃ N₀ : ℕ, ∃ M > 0, ∀ n ≥ N₀, |x n| ≤ M
```
-/
theorem EventuallyBoundedTailFormulation (x : RealSequence) :
    BoundedSeq x ↔ ∃ N₀ : ℕ, ∃ M > 0, ∀ n ≥ N₀, |x n| ≤ M := by
  sorry

-- `thm:bounded-sequence-bounded-above-below`
/-- Let `x : RealSequence`. Then `BoundedSeq x ↔ (BoundedAboveSeq x ∧ BoundedBelowSeq x)`.

Logical form:

```lean
theorem BoundedSequenceBoundedAboveBelow (x : RealSequence) :
    BoundedSeq x ↔ (BoundedAboveSeq x ∧ BoundedBelowSeq x)
```
-/
theorem BoundedSequenceBoundedAboveBelow (x : RealSequence) :
    BoundedSeq x ↔ (BoundedAboveSeq x ∧ BoundedBelowSeq x) := by
  sorry

-- `thm:absolute-bound-upper-lower-bounds`
/-- Let `x : RealSequence` and `K : ℝ`. If `hK : K > 0` and `h : ∀ n, |x n| ≤ K`. Then `∀ n, -K ≤ x
n ∧ x n ≤ K`.

Logical form:

```lean
theorem AbsoluteBoundUpperLowerBounds {x : RealSequence} {K : ℝ}
    (hK : K > 0) (h : ∀ n, |x n| ≤ K) : ∀ n, -K ≤ x n ∧ x n ≤ K
```
-/
theorem AbsoluteBoundUpperLowerBounds {x : RealSequence} {K : ℝ}
    (hK : K > 0) (h : ∀ n, |x n| ≤ K) : ∀ n, -K ≤ x n ∧ x n ≤ K := by
  sorry

-- `thm:upper-lower-bounds-absolute-bound`
/-- Let `x : RealSequence` and `m M : ℝ`. If `h : ∀ n, m ≤ x n ∧ x n ≤ M`. Then `∃ K > 0, ∀ n, |x n|
≤ K`.

Logical form:

```lean
theorem UpperLowerBoundsAbsoluteBound {x : RealSequence} {m M : ℝ}
    (h : ∀ n, m ≤ x n ∧ x n ≤ M) : ∃ K > 0, ∀ n, |x n| ≤ K
```
-/
theorem UpperLowerBoundsAbsoluteBound {x : RealSequence} {m M : ℝ}
    (h : ∀ n, m ≤ x n ∧ x n ≤ M) : ∃ K > 0, ∀ n, |x n| ≤ K := by
  sorry

end LRA.Analysis.Sequences
