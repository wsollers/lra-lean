/-
Draft module; not yet imported by the active Volume III root.
Imports only this pass's own promoted draft modules and Mathlib — nothing from the
real `LRA.VolumeIII.Analysis.Sequences.*`, so this can be freely
refactored or discarded without touching the working project.
Source: volume-iii/book-analysis-i/sequences/notes/convergence/notes-algebra.tex
Third and last file of `convergence` (installment 3 of 3). Structural
check: 68/68 balanced remark blocks, 11 definition + 14 theorem nodes = 25
total — clean, no duplication bug.

All 25 nodes are mathematically correct. The 11 definitions (pointwise
sum/difference/scalar-multiple/linear-combination/negation/product/
reciprocal/quotient/square/absolute-value/square-root of sequences) are
routine and correct. The 14 theorems are the standard limit-algebra
package (scalar multiple, sum, negation, difference, product, "nonzero
limit is eventually nonzero", reciprocal, quotient, square, absolute
value, "positive limit is eventually positive", square root, and the
polynomial/rational composition theorems) — all correct, including the
hand-verified error-track quotient identity in the `[Quotient]` worked
example (`x_n/y_n - A/B = (B*alpha_n - A*beta_n) / (B*(B+beta_n))`,
confirmed by direct algebra: `(B*x_n - A*y_n)/(B*y_n) = (B(A+alpha_n) -
A(B+beta_n))/(B(B+beta_n)) = (B*alpha_n - A*beta_n)/(B(B+beta_n))`).

Two minor findings, reported not fixed:
  - `def:reciprocal-sequence`, `def:pointwise-quotient-sequence`, and
    `def:square-root-sequence` each have a "Predicate reading" remark
    that is a VERBATIM copy of their own "Standard quantified statement"
    remark (including the prose header), rather than translating into
    the corpus's predicate-symbol notation. Same stylistic gap already
    seen twice in the Bounds pass (`thm:absolute-bound-upper-lower-
    bounds`, `thm:upper-lower-bounds-absolute-bound`) — now a recurring,
    if minor, pattern across the whole project: "Predicate reading"
    remarks occasionally don't do their job and just re-display the
    Standard-quantified-statement text unchanged.
  - `thm:positive-limit-eventually-positive`'s dependency list cites only
    `def:convergent-sequence`, but the theorem is really a direct
    specialization of `thm:strict-limit-separation-gives-eventual-order`
    from `notes-limits.tex` (take the constant zero sequence as the
    second sequence, `0 < L` as the strict limit separation) — that
    dependency isn't listed. Minor citation-completeness gap, not a math
    error.

Pointwise operations formalized as plain `fun n => ...` combinators
(matching the `Displace`/`Dilate` precedent from the Bounds pass's
`BoundAlgebra.lean` rather than reaching for Mathlib's `Pi` ring
structure, to keep the correspondence with the .tex's own named
operations explicit and citable). `ConvergesTo` reused from
`Convergence.lean`; `BoundedSeq` reused from `NullConstantSequences.lean`.
-/

import Mathlib.Order.Basic
import Mathlib.Analysis.Real.Sqrt
import Mathlib.Algebra.Polynomial.Eval.Defs
import LRA.VolumeIII.Analysis.Sequences.SequenceDefinitions
import LRA.VolumeIII.Analysis.Sequences.Convergence
import LRA.VolumeIII.Analysis.Sequences.NullConstantSequences
import LRA.VolumeIII.Analysis.Sequences.Limits

namespace LRA.VolumeIII.Analysis.Sequences

/-- `def:pointwise-sum-sequence`. -/
def PointwiseSum (x y : RealSequence) : RealSequence := fun n => x n + y n

/-- `def:pointwise-difference-sequence`. -/
def PointwiseDifference (x y : RealSequence) : RealSequence := fun n => x n - y n

/-- `def:scalar-multiple-sequence`. -/
def ScalarMultiple (α : ℝ) (x : RealSequence) : RealSequence := fun n => α * x n

/-- `def:linear-combination-of-real-sequences`. -/
def LinearCombination (α β : ℝ) (x y : RealSequence) : RealSequence :=
  fun n => α * x n + β * y n

/-- `def:pointwise-negation-sequence`. -/
def PointwiseNegation (x : RealSequence) : RealSequence := fun n => -x n

/-- `def:pointwise-product-sequence`. -/
def PointwiseProduct (x y : RealSequence) : RealSequence := fun n => x n * y n

/-- `def:reciprocal-sequence`. Hypothesis `x_n ≠ 0` carried as a
side-condition on theorems that use it, matching how the .tex states it
(the definition itself is only meaningful under that hypothesis, but
`1 / 0 = 0` in Lean means the raw function is still total). -/
noncomputable def ReciprocalSeq (x : RealSequence) : RealSequence := fun n => 1 / x n

/-- `def:pointwise-quotient-sequence`. -/
noncomputable def PointwiseQuotient (x y : RealSequence) : RealSequence := fun n => x n / y n

/-- `def:square-sequence`. -/
def SquareSeq (x : RealSequence) : RealSequence := fun n => (x n) ^ 2

/-- `def:absolute-value-sequence`. -/
def AbsSeq (x : RealSequence) : RealSequence := fun n => |x n|

/-- `def:square-root-sequence`. -/
noncomputable def SqrtSeq (x : RealSequence) : RealSequence := fun n => Real.sqrt (x n)

-- `thm:limit-of-scalar-multiple`
/-- Let `x : RealSequence` and `L α : ℝ`. If `h : ConvergesTo x L`. Then `ConvergesTo
(ScalarMultiple α x) (α * L)`. -/
theorem LimitOfScalarMultiple {x : RealSequence} {L α : ℝ}
    (h : ConvergesTo x L) : ConvergesTo (ScalarMultiple α x) (α * L) := by
  sorry

-- `thm:limit-of-a-sum`
/-- Let `x y : RealSequence` and `L M : ℝ`. If `hx : ConvergesTo x L` and `hy : ConvergesTo y M`.
Then `ConvergesTo (PointwiseSum x y) (L + M)`. -/
theorem LimitOfASum {x y : RealSequence} {L M : ℝ}
    (hx : ConvergesTo x L) (hy : ConvergesTo y M) :
    ConvergesTo (PointwiseSum x y) (L + M) := by
  sorry

-- `thm:limit-of-a-negation`
/-- Let `x : RealSequence` and `L : ℝ`. If `h : ConvergesTo x L`. Then `ConvergesTo
(PointwiseNegation x) (-L)`. -/
theorem LimitOfANegation {x : RealSequence} {L : ℝ}
    (h : ConvergesTo x L) : ConvergesTo (PointwiseNegation x) (-L) := by
  sorry

-- `thm:limit-of-a-difference`
/-- Let `x y : RealSequence` and `L M : ℝ`. If `hx : ConvergesTo x L` and `hy : ConvergesTo y M`.
Then `ConvergesTo (PointwiseDifference x y) (L - M)`. -/
theorem LimitOfADifference {x y : RealSequence} {L M : ℝ}
    (hx : ConvergesTo x L) (hy : ConvergesTo y M) :
    ConvergesTo (PointwiseDifference x y) (L - M) := by
  sorry

-- `thm:limit-of-a-product`
/-- Let `x y : RealSequence` and `L M : ℝ`. If `hx : ConvergesTo x L` and `hy : ConvergesTo y M`.
Then `ConvergesTo (PointwiseProduct x y) (L * M)`. -/
theorem LimitOfAProduct {x y : RealSequence} {L M : ℝ}
    (hx : ConvergesTo x L) (hy : ConvergesTo y M) :
    ConvergesTo (PointwiseProduct x y) (L * M) := by
  sorry

-- `thm:nonzero-limit-eventually-nonzero`
/-- Let `x : RealSequence` and `L : ℝ`. If `hL : L ≠ 0` and `h : ConvergesTo x L`. Then `∃ N : ℕ, ∀
n ≥ N, x n ≠ 0`. -/
theorem NonzeroLimitEventuallyNonzero {x : RealSequence} {L : ℝ}
    (hL : L ≠ 0) (h : ConvergesTo x L) : ∃ N : ℕ, ∀ n ≥ N, x n ≠ 0 := by
  sorry

-- `thm:limit-of-a-reciprocal`
/-- Let `x : RealSequence` and `L : ℝ`. If `hx : ∀ n, x n ≠ 0`, `hL : L ≠ 0`, and `h : ConvergesTo x
L`. Then `ConvergesTo (ReciprocalSeq x) (1 / L)`. -/
theorem LimitOfAReciprocal {x : RealSequence} (hx : ∀ n, x n ≠ 0)
    {L : ℝ} (hL : L ≠ 0) (h : ConvergesTo x L) :
    ConvergesTo (ReciprocalSeq x) (1 / L) := by
  sorry

-- `thm:limit-of-a-quotient`
/-- Let `x y : RealSequence` and `L M : ℝ`. If `hy : ∀ n, y n ≠ 0`, `hM : M ≠ 0`, `hx : ConvergesTo
x L`, and `hy' : ConvergesTo y M`. Then `ConvergesTo (PointwiseQuotient x y) (L / M)`. -/
theorem LimitOfAQuotient {x y : RealSequence} (hy : ∀ n, y n ≠ 0)
    {L M : ℝ} (hM : M ≠ 0) (hx : ConvergesTo x L) (hy' : ConvergesTo y M) :
    ConvergesTo (PointwiseQuotient x y) (L / M) := by
  sorry

-- `thm:limit-of-a-square`
/-- Let `x : RealSequence` and `L : ℝ`. If `h : ConvergesTo x L`. Then `ConvergesTo (SquareSeq x) (L
^ 2)`. -/
theorem LimitOfASquare {x : RealSequence} {L : ℝ}
    (h : ConvergesTo x L) : ConvergesTo (SquareSeq x) (L ^ 2) := by
  sorry

-- `thm:limit-of-an-absolute-value`
/-- Let `x : RealSequence` and `L : ℝ`. If `h : ConvergesTo x L`. Then `ConvergesTo (AbsSeq x) |L|`. -/
theorem LimitOfAnAbsoluteValue {x : RealSequence} {L : ℝ}
    (h : ConvergesTo x L) : ConvergesTo (AbsSeq x) |L| := by
  sorry

-- `thm:positive-limit-eventually-positive`
/-- Let `x : RealSequence` and `L : ℝ`. If `hL : L > 0` and `h : ConvergesTo x L`. Then `∃ N : ℕ, ∀
n ≥ N, 0 < x n`. -/
theorem PositiveLimitEventuallyPositive {x : RealSequence} {L : ℝ}
    (hL : L > 0) (h : ConvergesTo x L) : ∃ N : ℕ, ∀ n ≥ N, 0 < x n := by
  sorry

-- `thm:limit-of-a-square-root`
/-- Let `x : RealSequence` and `L : ℝ`. If `hx : ∀ n, 0 ≤ x n` and `h : ConvergesTo x L`. Then `0 ≤
L ∧ ConvergesTo (SqrtSeq x) (Real.sqrt L)`. -/
theorem LimitOfASquareRoot {x : RealSequence} (hx : ∀ n, 0 ≤ x n)
    {L : ℝ} (h : ConvergesTo x L) :
    0 ≤ L ∧ ConvergesTo (SqrtSeq x) (Real.sqrt L) := by
  sorry

-- `thm:polynomial-sequence-limit`
/-- Let `x : RealSequence`, `L : ℝ`, and `p : Polynomial ℝ`. If `h : ConvergesTo x L`. Then
`ConvergesTo (fun n => p.eval (x n)) (p.eval L)`. -/
theorem PolynomialSequenceLimit {x : RealSequence} {L : ℝ}
    (p : Polynomial ℝ) (h : ConvergesTo x L) :
    ConvergesTo (fun n => p.eval (x n)) (p.eval L) := by
  sorry

-- `thm:rational-sequence-limit`
/-- Let `x : RealSequence`, `L : ℝ`, and `p q : Polynomial ℝ`. If `hqL : q.eval L ≠ 0`, `hqx : ∀ n,
q.eval (x n) ≠ 0`, and `h : ConvergesTo x L`. Then `ConvergesTo (fun n => p.eval (x n) / q.eval
(x n)) (p.eval L / q.eval L)`. -/
theorem RationalSequenceLimit {x : RealSequence} {L : ℝ}
    (p q : Polynomial ℝ) (hqL : q.eval L ≠ 0) (hqx : ∀ n, q.eval (x n) ≠ 0)
    (h : ConvergesTo x L) :
    ConvergesTo (fun n => p.eval (x n) / q.eval (x n)) (p.eval L / q.eval L) := by
  sorry

end LRA.VolumeIII.Analysis.Sequences
