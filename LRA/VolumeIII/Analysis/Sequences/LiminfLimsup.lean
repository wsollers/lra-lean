/-
Draft module; not yet imported by the active Volume III root.
Imports only this pass's own promoted draft modules and Mathlib — nothing from the
real `LRA.Analysis.Sequences.*`, so this can be freely
refactored or discarded without touching the working project.
Source: volume-iii/book-analysis-i/sequences/notes/liminf-limsup/notes-liminf-limsup.tex
Only file in `liminf-limsup`. Structural check: 42/42 balanced remark
blocks, 15 labeled nodes — clean, and the block count is exactly
accounted for: 2 defs (tail-supremum and tail-infimum sequence) and 1 theorem
(liminf-below-limsup) get the lighter 2-block treatment (Standard +
Interpretation, no Predicate reading), the remaining 12 nodes get the
3-block treatment (Standard + Predicate + Interpretation) — 2*2 + 1*2 +
12*3 = 42. Deliberate, not a missing-block bug.

All 15 nodes are mathematically correct — the standard package: tail
supremum/infimum sequences, limsup/liminf defined as the limit of the
tail sup/inf sequence (a relation via `ConvergesTo`, matching this
project's own house style of treating limits/limsup/liminf as relations
rather than partial functions), tail suprema decreasing / tail infima
increasing (both by inclusion-monotonicity of sup/inf over shrinking
tails), liminf <= limsup always, convergence iff liminf = limsup = L,
limsup/liminf as the largest/smallest subsequential limit (both actually
ATTAINED, not just bounds — correctly proved via Bolzano-Weierstrass),
the oscillation criterion (strict gap iff >= 2 distinct subsequential
limits — a clean payoff of the previous two theorems combined with
`thm:two-subsequential-limits-force-divergence`), and eventual-order
comparison/squeeze theorems for both limsup and liminf.

Finding A (see ISSUES.md #24): `thm:tail-infima-are-increasing`'s
dependency list is asymmetric with its sibling `thm:tail-suprema-are-
decreasing`. The suprema theorem correctly cites `thm:supremum-is-
monotone-under-inclusion` (shrinking tail => sup can't increase); the
infima theorem, proving the exact dual fact, cites only the bare
`def:infimum` instead of the analogous "infimum is monotone under
inclusion" theorem it actually needs. Not fixed here.

Finding B (see ISSUES.md #25): `thm:liminf-squeeze-under-eventual-
order`'s `[Interpretation]` remark runs on, after two blank lines, into
what reads as independent section-closing exposition -- worked examples
computing limsup/liminf of `(-1)^n` (= 1 / -1) and the "both envelopes
collapse to L for convergent sequences" remark. This is correct content
but doesn't belong to THIS theorem's interpretation specifically; it
reads like closing exposition that should have been its own block (cf.
`notes-completeness-end.tex`'s dedicated wrap-up remark in the Bounds
pass) rather than appended to the last theorem's Interpretation. Not
fixed here.

Addition candidate (proposed, NOT yet added to ADDITIONS.md pending your
call): the sign-flip identity `limsup(-x_n) = -liminf(x_n)` (equivalently
`liminf(-x_n) = -limsup(x_n)`) is completely absent from this file, and
so is any "algebra of limsup/liminf" content (subadditivity
`limsup(x_n+y_n) <= limsup(x_n)+limsup(y_n)`, superadditivity for liminf,
positive-homogeneity). The sign-flip identity in particular is the
standard trick for converting any limsup fact into the matching liminf
fact "for free," and would have made several of the dual theorem pairs
in this file (suprema-decreasing/infima-increasing, limsup-comparison/
liminf-comparison, limsup-squeeze/liminf-squeeze) provable as one-line
corollaries of each other rather than fully independent proofs. Not
formalized below -- your call whether to add it (and whether to also
pull in subadditivity, which is a bigger lift).
-/

import Mathlib.Order.Basic
import LRA.VolumeIII.Analysis.Sequences.SequenceDefinitions
import LRA.VolumeIII.Analysis.Sequences.Convergence
import LRA.VolumeIII.Analysis.Sequences.NullConstantSequences
import LRA.VolumeIII.Analysis.Sequences.Monotonicity
import LRA.VolumeIII.Analysis.Sequences.Subsequences

namespace LRA.Analysis.Sequences

/-- `def:tail-supremum-sequence`.

Logical form:

```lean
noncomputable def TailSupSeq (x : RealSequence) : RealSequence :=
  fun n => sSup (x '' {k : ℕ | n ≤ k})
```
-/
noncomputable def TailSupSeq (x : RealSequence) : RealSequence :=
  fun n => sSup (x '' {k : ℕ | n ≤ k})

/-- `def:tail-infimum-sequence`.

Logical form:

```lean
noncomputable def TailInfSeq (x : RealSequence) : RealSequence :=
  fun n => sInf (x '' {k : ℕ | n ≤ k})
```
-/
noncomputable def TailInfSeq (x : RealSequence) : RealSequence :=
  fun n => sInf (x '' {k : ℕ | n ≤ k})

/-- `def:limsup-sequence`. A relation, not a partial function — matching
the project's own house style for `ConvergesTo` itself.

Logical form:

```lean
def LimsupSeq (x : RealSequence) (L : ℝ) : Prop := ConvergesTo (TailSupSeq x) L
```
-/
def LimsupSeq (x : RealSequence) (L : ℝ) : Prop := ConvergesTo (TailSupSeq x) L

/-- `def:liminf-sequence`.

Logical form:

```lean
def LiminfSeq (x : RealSequence) (L : ℝ) : Prop := ConvergesTo (TailInfSeq x) L
```
-/
def LiminfSeq (x : RealSequence) (L : ℝ) : Prop := ConvergesTo (TailInfSeq x) L

-- `thm:tail-suprema-are-decreasing`
/-- Let `x : RealSequence`. If `h : BoundedSeq x`. Then `IsDecreasing (TailSupSeq x)`.

Logical form:

```lean
theorem TailSupremaAreDecreasing {x : RealSequence} (h : BoundedSeq x) :
    IsDecreasing (TailSupSeq x)
```
-/
theorem TailSupremaAreDecreasing {x : RealSequence} (h : BoundedSeq x) :
    IsDecreasing (TailSupSeq x) := by
  sorry

-- `thm:tail-infima-are-increasing`
/-- Let `x : RealSequence`. If `h : BoundedSeq x`. Then `IsIncreasing (TailInfSeq x)`.

Logical form:

```lean
theorem TailInfimaAreIncreasing {x : RealSequence} (h : BoundedSeq x) :
    IsIncreasing (TailInfSeq x)
```
-/
theorem TailInfimaAreIncreasing {x : RealSequence} (h : BoundedSeq x) :
    IsIncreasing (TailInfSeq x) := by
  sorry

-- `thm:liminf-below-limsup`
/-- Let `x : RealSequence` and `I S : ℝ`. If `hbdd : BoundedSeq x`, `hI : LiminfSeq x I`, and `hS :
LimsupSeq x S`. Then `I ≤ S`.

Logical form:

```lean
theorem LiminfBelowLimsup {x : RealSequence} (hbdd : BoundedSeq x)
    {I S : ℝ} (hI : LiminfSeq x I) (hS : LimsupSeq x S) : I ≤ S
```
-/
theorem LiminfBelowLimsup {x : RealSequence} (hbdd : BoundedSeq x)
    {I S : ℝ} (hI : LiminfSeq x I) (hS : LimsupSeq x S) : I ≤ S := by
  sorry

-- `thm:convergence-iff-liminf-equals-limsup`
/-- Let `x : RealSequence` and `L : ℝ`. If `hbdd : BoundedSeq x`. Then `ConvergesTo x L ↔ (LiminfSeq
x L ∧ LimsupSeq x L)`.

Logical form:

```lean
theorem ConvergenceIffLiminfEqualsLimsup {x : RealSequence}
    (hbdd : BoundedSeq x) {L : ℝ} :
    ConvergesTo x L ↔ (LiminfSeq x L ∧ LimsupSeq x L)
```
-/
theorem ConvergenceIffLiminfEqualsLimsup {x : RealSequence}
    (hbdd : BoundedSeq x) {L : ℝ} :
    ConvergesTo x L ↔ (LiminfSeq x L ∧ LimsupSeq x L) := by
  sorry

-- `thm:limsup-largest-subsequential-limit`
/-- Let `x : RealSequence` and `S : ℝ`. If `hbdd : BoundedSeq x` and `hS : LimsupSeq x S`. Then
`IsSubsequentialLimit x S ∧ ∀ L, IsSubsequentialLimit x L → L ≤ S`.

Logical form:

```lean
theorem LimsupLargestSubsequentialLimit {x : RealSequence}
    (hbdd : BoundedSeq x) {S : ℝ} (hS : LimsupSeq x S) :
    IsSubsequentialLimit x S ∧ ∀ L, IsSubsequentialLimit x L → L ≤ S
```
-/
theorem LimsupLargestSubsequentialLimit {x : RealSequence}
    (hbdd : BoundedSeq x) {S : ℝ} (hS : LimsupSeq x S) :
    IsSubsequentialLimit x S ∧ ∀ L, IsSubsequentialLimit x L → L ≤ S := by
  sorry

-- `thm:liminf-smallest-subsequential-limit`
/-- Let `x : RealSequence` and `I : ℝ`. If `hbdd : BoundedSeq x` and `hI : LiminfSeq x I`. Then
`IsSubsequentialLimit x I ∧ ∀ L, IsSubsequentialLimit x L → I ≤ L`.

Logical form:

```lean
theorem LiminfSmallestSubsequentialLimit {x : RealSequence}
    (hbdd : BoundedSeq x) {I : ℝ} (hI : LiminfSeq x I) :
    IsSubsequentialLimit x I ∧ ∀ L, IsSubsequentialLimit x L → I ≤ L
```
-/
theorem LiminfSmallestSubsequentialLimit {x : RealSequence}
    (hbdd : BoundedSeq x) {I : ℝ} (hI : LiminfSeq x I) :
    IsSubsequentialLimit x I ∧ ∀ L, IsSubsequentialLimit x L → I ≤ L := by
  sorry

-- `thm:oscillation-criterion-via-liminf-limsup`
/-- Let `x : RealSequence` and `I S : ℝ`. If `hbdd : BoundedSeq x`, `hI : LiminfSeq x I`, and `hS :
LimsupSeq x S`. Then `I < S ↔ ∃ L K : ℝ, L ≠ K ∧ IsSubsequentialLimit x L ∧ IsSubsequentialLimit
x K`.

Logical form:

```lean
theorem OscillationCriterionViaLiminfLimsup {x : RealSequence}
    (hbdd : BoundedSeq x) {I S : ℝ} (hI : LiminfSeq x I) (hS : LimsupSeq x S) :
    I < S ↔ ∃ L K : ℝ, L ≠ K ∧ IsSubsequentialLimit x L ∧ IsSubsequentialLimit x K
```
-/
theorem OscillationCriterionViaLiminfLimsup {x : RealSequence}
    (hbdd : BoundedSeq x) {I S : ℝ} (hI : LiminfSeq x I) (hS : LimsupSeq x S) :
    I < S ↔ ∃ L K : ℝ, L ≠ K ∧ IsSubsequentialLimit x L ∧ IsSubsequentialLimit x K := by
  sorry

-- `thm:limsup-comparison-under-eventual-order`
/-- Let `x y : RealSequence` and `Sx Sy : ℝ`. If `hx : BoundedSeq x`, `hy : BoundedSeq y`, `h : ∃ N
: ℕ, ∀ n ≥ N, x n ≤ y n`, `hSx : LimsupSeq x Sx`, and `hSy : LimsupSeq y Sy`. Then `Sx ≤ Sy`.

Logical form:

```lean
theorem LimsupComparisonUnderEventualOrder {x y : RealSequence}
    (hx : BoundedSeq x) (hy : BoundedSeq y)
    (h : ∃ N : ℕ, ∀ n ≥ N, x n ≤ y n) {Sx Sy : ℝ}
    (hSx : LimsupSeq x Sx) (hSy : LimsupSeq y Sy) : Sx ≤ Sy
```
-/
theorem LimsupComparisonUnderEventualOrder {x y : RealSequence}
    (hx : BoundedSeq x) (hy : BoundedSeq y)
    (h : ∃ N : ℕ, ∀ n ≥ N, x n ≤ y n) {Sx Sy : ℝ}
    (hSx : LimsupSeq x Sx) (hSy : LimsupSeq y Sy) : Sx ≤ Sy := by
  sorry

-- `thm:liminf-comparison-under-eventual-order`
/-- Let `x y : RealSequence` and `Ix Iy : ℝ`. If `hx : BoundedSeq x`, `hy : BoundedSeq y`, `h : ∃ N
: ℕ, ∀ n ≥ N, x n ≤ y n`, `hIx : LiminfSeq x Ix`, and `hIy : LiminfSeq y Iy`. Then `Ix ≤ Iy`.

Logical form:

```lean
theorem LiminfComparisonUnderEventualOrder {x y : RealSequence}
    (hx : BoundedSeq x) (hy : BoundedSeq y)
    (h : ∃ N : ℕ, ∀ n ≥ N, x n ≤ y n) {Ix Iy : ℝ}
    (hIx : LiminfSeq x Ix) (hIy : LiminfSeq y Iy) : Ix ≤ Iy
```
-/
theorem LiminfComparisonUnderEventualOrder {x y : RealSequence}
    (hx : BoundedSeq x) (hy : BoundedSeq y)
    (h : ∃ N : ℕ, ∀ n ≥ N, x n ≤ y n) {Ix Iy : ℝ}
    (hIx : LiminfSeq x Ix) (hIy : LiminfSeq y Iy) : Ix ≤ Iy := by
  sorry

-- `thm:limsup-squeeze-under-eventual-order`
/-- Let `a x b : RealSequence` and `Sa Sx Sb : ℝ`. If `ha : BoundedSeq a`, `hx : BoundedSeq x`, `hb
: BoundedSeq b`, `h : ∃ N : ℕ, ∀ n ≥ N, a n ≤ x n ∧ x n ≤ b n`, `hSa : LimsupSeq a Sa`, `hSx :
LimsupSeq x Sx`, and `hSb : LimsupSeq b Sb`. Then `Sa ≤ Sx ∧ Sx ≤ Sb`.

Logical form:

```lean
theorem LimsupSqueezeUnderEventualOrder {a x b : RealSequence}
    (ha : BoundedSeq a) (hx : BoundedSeq x) (hb : BoundedSeq b)
    (h : ∃ N : ℕ, ∀ n ≥ N, a n ≤ x n ∧ x n ≤ b n)
    {Sa Sx Sb : ℝ} (hSa : LimsupSeq a Sa) (hSx : LimsupSeq x Sx)
    (hSb : LimsupSeq b Sb) : Sa ≤ Sx ∧ Sx ≤ Sb
```
-/
theorem LimsupSqueezeUnderEventualOrder {a x b : RealSequence}
    (ha : BoundedSeq a) (hx : BoundedSeq x) (hb : BoundedSeq b)
    (h : ∃ N : ℕ, ∀ n ≥ N, a n ≤ x n ∧ x n ≤ b n)
    {Sa Sx Sb : ℝ} (hSa : LimsupSeq a Sa) (hSx : LimsupSeq x Sx)
    (hSb : LimsupSeq b Sb) : Sa ≤ Sx ∧ Sx ≤ Sb := by
  sorry

-- `thm:liminf-squeeze-under-eventual-order`
/-- Let `a x b : RealSequence` and `Ia Ix Ib : ℝ`. If `ha : BoundedSeq a`, `hx : BoundedSeq x`, `hb
: BoundedSeq b`, `h : ∃ N : ℕ, ∀ n ≥ N, a n ≤ x n ∧ x n ≤ b n`, `hIa : LiminfSeq a Ia`, `hIx :
LiminfSeq x Ix`, and `hIb : LiminfSeq b Ib`. Then `Ia ≤ Ix ∧ Ix ≤ Ib`.

Logical form:

```lean
theorem LiminfSqueezeUnderEventualOrder {a x b : RealSequence}
    (ha : BoundedSeq a) (hx : BoundedSeq x) (hb : BoundedSeq b)
    (h : ∃ N : ℕ, ∀ n ≥ N, a n ≤ x n ∧ x n ≤ b n)
    {Ia Ix Ib : ℝ} (hIa : LiminfSeq a Ia) (hIx : LiminfSeq x Ix)
    (hIb : LiminfSeq b Ib) : Ia ≤ Ix ∧ Ix ≤ Ib
```
-/
theorem LiminfSqueezeUnderEventualOrder {a x b : RealSequence}
    (ha : BoundedSeq a) (hx : BoundedSeq x) (hb : BoundedSeq b)
    (h : ∃ N : ℕ, ∀ n ≥ N, a n ≤ x n ∧ x n ≤ b n)
    {Ia Ix Ib : ℝ} (hIa : LiminfSeq a Ia) (hIx : LiminfSeq x Ix)
    (hIb : LiminfSeq b Ib) : Ia ≤ Ix ∧ Ix ≤ Ib := by
  sorry

/-- Let `x : RealSequence` and `L : ℝ`. Then `LimsupSeq (fun n => -x n) L ↔ LiminfSeq x (-L)`.

Logical form:

```lean
theorem LimsupNegEqNegLiminf {x : RealSequence} {L : ℝ} :
    LimsupSeq (fun n => -x n) L ↔ LiminfSeq x (-L)
```
-/
theorem LimsupNegEqNegLiminf {x : RealSequence} {L : ℝ} :
    LimsupSeq (fun n => -x n) L ↔ LiminfSeq x (-L) := by
  sorry

/-- Let `x : RealSequence` and `L : ℝ`. Then `LiminfSeq (fun n => -x n) L ↔ LimsupSeq x (-L)`.

Logical form:

```lean
theorem LiminfNegEqNegLimsup {x : RealSequence} {L : ℝ} :
    LiminfSeq (fun n => -x n) L ↔ LimsupSeq x (-L)
```
-/
theorem LiminfNegEqNegLimsup {x : RealSequence} {L : ℝ} :
    LiminfSeq (fun n => -x n) L ↔ LimsupSeq x (-L) := by
  sorry

end LRA.Analysis.Sequences
