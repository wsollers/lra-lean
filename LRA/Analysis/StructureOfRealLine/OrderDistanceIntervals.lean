/-
Draft module; not yet imported by the active Volume III root.
Source: book-analysis-i/structure-of-real-line/notes/{order-distance-length,
absolute-value-as-distance, intervals-as-subsets, set-operations-on-real-line}/.

Coverage pass, part 1 of 3, over Structure of the Real Line (Ch.2, Book I).
One Lean statement per book label, `sorry`-bodied.
-/

import Mathlib.Data.Real.Basic

namespace LRA.Analysis.StructureOfRealLine

/-- `def:distance-on-real-line`.

Logical form:

```lean
def dist' (x y : ℝ) : ℝ := |x - y|
```
-/
def dist' (x y : ℝ) : ℝ := |x - y|

/-- `def:length-of-interval`.

Logical form:

```lean
def IntervalLength (a b : ℝ) (hab : a ≤ b) : ℝ := b - a
```
-/
def IntervalLength (a b : ℝ) (hab : a ≤ b) : ℝ := b - a

-- `thm:distance-is-a-metric`
/-- The theorem asserts `(∀ x y : ℝ, dist' x y ≥ 0) ∧ (∀ x y : ℝ, dist' x y = 0 ↔ x = y) ∧ (∀ x y :
ℝ, dist' x y = dist' y x) ∧ (∀ x y z : ℝ, dist' x z ≤ dist' x y + dist' y z)`.

Logical form:

```lean
theorem DistanceIsAMetric :
    (∀ x y : ℝ, dist' x y ≥ 0) ∧ (∀ x y : ℝ, dist' x y = 0 ↔ x = y) ∧
    (∀ x y : ℝ, dist' x y = dist' y x) ∧
    (∀ x y z : ℝ, dist' x z ≤ dist' x y + dist' y z)
```
-/
theorem DistanceIsAMetric :
    (∀ x y : ℝ, dist' x y ≥ 0) ∧ (∀ x y : ℝ, dist' x y = 0 ↔ x = y) ∧
    (∀ x y : ℝ, dist' x y = dist' y x) ∧
    (∀ x y z : ℝ, dist' x z ≤ dist' x y + dist' y z) := by
  sorry

-- `thm:real-line-structural-order-facts`
/-- The theorem asserts `(∀ A : Set ℝ, A.Nonempty → BddAbove A → ∃ s, IsLUB A s)`.

Logical form:

```lean
theorem RealLineStructuralOrderFacts :
    (∀ A : Set ℝ, A.Nonempty → BddAbove A → ∃ s, IsLUB A s)
```
-/
theorem RealLineStructuralOrderFacts :
    (∀ A : Set ℝ, A.Nonempty → BddAbove A → ∃ s, IsLUB A s) := by
  sorry

-- `lem:minimum-of-positive-numbers-is-positive`
/-- Let `a b : ℝ`. If `ha : a > 0` and `hb : b > 0`. Then `min a b > 0`.

Logical form:

```lean
theorem MinOfPositiveIsPositive (a b : ℝ) (ha : a > 0) (hb : b > 0) :
    min a b > 0
```
-/
theorem MinOfPositiveIsPositive (a b : ℝ) (ha : a > 0) (hb : b > 0) :
    min a b > 0 := by
  sorry

-- `lem:half-epsilon-is-positive`
/-- Let `ε : ℝ`. If `hε : ε > 0`. Then `ε / 2 > 0`.

Logical form:

```lean
theorem HalfEpsilonIsPositive (ε : ℝ) (hε : ε > 0) : ε / 2 > 0
```
-/
theorem HalfEpsilonIsPositive (ε : ℝ) (hε : ε > 0) : ε / 2 > 0 := by
  sorry

-- `lem:epsilon-splitting`
/-- Let `ε : ℝ`. If `hε : ε > 0`. Then `ε / 2 + ε / 2 = ε`.

Logical form:

```lean
theorem EpsilonSplitting (ε : ℝ) (hε : ε > 0) : ε / 2 + ε / 2 = ε
```
-/
theorem EpsilonSplitting (ε : ℝ) (hε : ε > 0) : ε / 2 + ε / 2 = ε := by
  sorry

-- `lem:positive-minimum-bound`
/-- Let `δ a b : ℝ`. If `h1 : 0 < δ`, `h2 : δ ≤ a`, and `h3 : δ ≤ b`. Then `δ ≤ min a b`.

Logical form:

```lean
theorem PositiveMinimumBound (δ a b : ℝ) (h1 : 0 < δ) (h2 : δ ≤ a) (h3 : δ ≤ b) :
    δ ≤ min a b
```
-/
theorem PositiveMinimumBound (δ a b : ℝ) (h1 : 0 < δ) (h2 : δ ≤ a) (h3 : δ ≤ b) :
    δ ≤ min a b := by
  sorry

-- `lem:choosing-a-smaller-positive-number`
/-- Let `ε c : ℝ`. If `hε : ε > 0` and `hc : c > 0`. Then `∃ δ, 0 < δ ∧ δ < ε ∧ δ < c`.

Logical form:

```lean
theorem ChoosingSmallerPositive (ε c : ℝ) (hε : ε > 0) (hc : c > 0) :
    ∃ δ, 0 < δ ∧ δ < ε ∧ δ < c
```
-/
theorem ChoosingSmallerPositive (ε c : ℝ) (hε : ε > 0) (hc : c > 0) :
    ∃ δ, 0 < δ ∧ δ < ε ∧ δ < c := by
  sorry

/-- Let `x : ℝ`. Then `|x| = dist' x 0`.

Logical form:

```lean
theorem AbsIsDistanceToZero (x : ℝ) : |x| = dist' x 0
```
-/
theorem AbsIsDistanceToZero (x : ℝ) : |x| = dist' x 0 := by
  sorry

-- ---------------------------------------------------------------------
-- Intervals as Subsets.
-- ---------------------------------------------------------------------

/-- `def:bounded-subset-of-r`.

Logical form:

```lean
def IsBoundedSubset (A : Set ℝ) : Prop := ∃ M > 0, ∀ x ∈ A, |x| ≤ M
```
-/
def IsBoundedSubset (A : Set ℝ) : Prop := ∃ M > 0, ∀ x ∈ A, |x| ≤ M

/-- The theorem asserts `True`.

Logical form:

```lean
theorem IntervalSetOpsAreOrdinarySetOps :
    forall A B : Set ℝ, A ∪ B = B ∪ A
```
-/
theorem IntervalSetOpsAreOrdinarySetOps :
    forall A B : Set ℝ, A ∪ B = B ∪ A := by
  sorry

end LRA.Analysis.StructureOfRealLine
