/-
Draft module; not yet imported by the active Volume III root.
Source: book-analysis-i/structure-of-real-line/notes/{neighborhoods-and-balls,
open-sets, closed-sets, interior-exterior-boundary, limit-and-isolated-points,
unions-and-intersections}/.

Coverage pass, part 2 of 3, over Structure of the Real Line (Ch.2, Book I).
One Lean statement per book label, `sorry`-bodied. Note: this chapter is
deliberately a second, concrete-ℝ-only pass over open/closed/interior
content that also appears (differently phrased, via `def:cluster-point-r`
etc.) in the Functions chapter's `subsets-real-line` section — see
`Functions/SubsetsOfR.lean`.
-/

import Mathlib.Data.Real.Basic

namespace LRA.VolumeIII.Analysis.StructureOfRealLine

/-- `def:open-ball`.

Logical form:

```lean
def OpenBall (x r : ℝ) : Set ℝ := {y | |x - y| < r}
```
-/
def OpenBall (x r : ℝ) : Set ℝ := {y | |x - y| < r}

/-- `def:neighborhood-of-point`.

Logical form:

```lean
def IsNeighborhood (N : Set ℝ) (x : ℝ) : Prop := ∃ r > 0, OpenBall x r ⊆ N
```
-/
def IsNeighborhood (N : Set ℝ) (x : ℝ) : Prop := ∃ r > 0, OpenBall x r ⊆ N

/-- `def:open-set`.

Logical form:

```lean
def IsOpenSet (U : Set ℝ) : Prop := ∀ x ∈ U, ∃ r > 0, OpenBall x r ⊆ U
```
-/
def IsOpenSet (U : Set ℝ) : Prop := ∀ x ∈ U, ∃ r > 0, OpenBall x r ⊆ U

-- `thm:open-interval-is-open`
/-- Let `a b : ℝ`. If `hab : a < b`. Then `IsOpenSet (Set.Ioo a b)`.

Logical form:

```lean
theorem OpenIntervalIsOpen (a b : ℝ) (hab : a < b) : IsOpenSet (Set.Ioo a b)
```
-/
theorem OpenIntervalIsOpen (a b : ℝ) (hab : a < b) : IsOpenSet (Set.Ioo a b) := by
  sorry

-- `thm:open-set-closure-operations`
/-- The theorem asserts `IsOpenSet (∅ : Set ℝ) ∧ IsOpenSet (Set.univ : Set ℝ) ∧ (∀ (ι : Type) (U : ι
→ Set ℝ), (∀ i, IsOpenSet (U i)) → IsOpenSet (⋃ i, U i)) ∧ (∀ (n : ℕ) (U : Fin n → Set ℝ), (∀ i,
IsOpenSet (U i)) → IsOpenSet (⋂ i, U i))`.

Logical form:

```lean
theorem OpenSetClosureOperations :
    IsOpenSet (∅ : Set ℝ) ∧ IsOpenSet (Set.univ : Set ℝ) ∧
    (∀ (ι : Type) (U : ι → Set ℝ), (∀ i, IsOpenSet (U i)) → IsOpenSet (⋃ i, U i)) ∧
    (∀ (n : ℕ) (U : Fin n → Set ℝ), (∀ i, IsOpenSet (U i)) → IsOpenSet (⋂ i, U i))
```
-/
theorem OpenSetClosureOperations :
    IsOpenSet (∅ : Set ℝ) ∧ IsOpenSet (Set.univ : Set ℝ) ∧
    (∀ (ι : Type) (U : ι → Set ℝ), (∀ i, IsOpenSet (U i)) → IsOpenSet (⋃ i, U i)) ∧
    (∀ (n : ℕ) (U : Fin n → Set ℝ), (∀ i, IsOpenSet (U i)) → IsOpenSet (⋂ i, U i)) := by
  sorry

/-- `def:closed-set`.

Logical form:

```lean
def IsClosedSet (F : Set ℝ) : Prop := IsOpenSet Fᶜ
```
-/
def IsClosedSet (F : Set ℝ) : Prop := IsOpenSet Fᶜ

-- `thm:closed-iff-contains-limit-points`
/-- Let `F : Set ℝ`. Then `IsClosedSet F ↔ ∀ x : ℝ, (∀ r > 0, (OpenBall x r \ {x}) ∩ F ≠ ∅) → x ∈
F`.

Logical form:

```lean
theorem ClosedIffContainsLimitPoints (F : Set ℝ) :
    IsClosedSet F ↔ ∀ x : ℝ, (∀ r > 0, (OpenBall x r \ {x}) ∩ F ≠ ∅) → x ∈ F
```
-/
theorem ClosedIffContainsLimitPoints (F : Set ℝ) :
    IsClosedSet F ↔ ∀ x : ℝ, (∀ r > 0, (OpenBall x r \ {x}) ∩ F ≠ ∅) → x ∈ F := by
  sorry

/-- `def:interior-point`.

Logical form:

```lean
def IsInteriorPoint (A : Set ℝ) (x : ℝ) : Prop := ∃ r > 0, OpenBall x r ⊆ A
```
-/
def IsInteriorPoint (A : Set ℝ) (x : ℝ) : Prop := ∃ r > 0, OpenBall x r ⊆ A

/-- `def:exterior-point`.

Logical form:

```lean
def IsExteriorPoint (A : Set ℝ) (x : ℝ) : Prop := ∃ r > 0, OpenBall x r ⊆ Aᶜ
```
-/
def IsExteriorPoint (A : Set ℝ) (x : ℝ) : Prop := ∃ r > 0, OpenBall x r ⊆ Aᶜ

/-- `def:boundary-point`.

Logical form:

```lean
def IsBoundaryPoint (A : Set ℝ) (x : ℝ) : Prop :=
  (∀ r > 0, OpenBall x r ∩ A ≠ ∅) ∧ (∀ r > 0, OpenBall x r ∩ Aᶜ ≠ ∅)
```
-/
def IsBoundaryPoint (A : Set ℝ) (x : ℝ) : Prop :=
  (∀ r > 0, OpenBall x r ∩ A ≠ ∅) ∧ (∀ r > 0, OpenBall x r ∩ Aᶜ ≠ ∅)

/-- `def:interior-of-set`.

Logical form:

```lean
def Interior' (A : Set ℝ) : Set ℝ := {x | IsInteriorPoint A x}
```
-/
def Interior' (A : Set ℝ) : Set ℝ := {x | IsInteriorPoint A x}

/-- `def:limit-point`.

Logical form:

```lean
def IsLimitPoint (A : Set ℝ) (x : ℝ) : Prop := ∀ r > 0, ∃ a ∈ A, 0 < |a - x| ∧ |a - x| < r
```
-/
def IsLimitPoint (A : Set ℝ) (x : ℝ) : Prop := ∀ r > 0, ∃ a ∈ A, 0 < |a - x| ∧ |a - x| < r

/-- `def:isolated-point`.

Logical form:

```lean
def IsIsolatedPoint (A : Set ℝ) (x : ℝ) : Prop :=
  x ∈ A ∧ ∃ r > 0, OpenBall x r ∩ A = {x}
```
-/
def IsIsolatedPoint (A : Set ℝ) (x : ℝ) : Prop :=
  x ∈ A ∧ ∃ r > 0, OpenBall x r ∩ A = {x}

-- `thm:closed-set-closure-operations`
/-- The theorem asserts `IsClosedSet (∅ : Set ℝ) ∧ IsClosedSet (Set.univ : Set ℝ) ∧ (∀ (ι : Type) (F
: ι → Set ℝ), (∀ i, IsClosedSet (F i)) → IsClosedSet (⋂ i, F i)) ∧ (∀ (n : ℕ) (F : Fin n → Set
ℝ), (∀ i, IsClosedSet (F i)) → IsClosedSet (⋃ i, F i))`.

Logical form:

```lean
theorem ClosedSetClosureOperations :
    IsClosedSet (∅ : Set ℝ) ∧ IsClosedSet (Set.univ : Set ℝ) ∧
    (∀ (ι : Type) (F : ι → Set ℝ), (∀ i, IsClosedSet (F i)) → IsClosedSet (⋂ i, F i)) ∧
    (∀ (n : ℕ) (F : Fin n → Set ℝ), (∀ i, IsClosedSet (F i)) → IsClosedSet (⋃ i, F i))
```
-/
theorem ClosedSetClosureOperations :
    IsClosedSet (∅ : Set ℝ) ∧ IsClosedSet (Set.univ : Set ℝ) ∧
    (∀ (ι : Type) (F : ι → Set ℝ), (∀ i, IsClosedSet (F i)) → IsClosedSet (⋂ i, F i)) ∧
    (∀ (n : ℕ) (F : Fin n → Set ℝ), (∀ i, IsClosedSet (F i)) → IsClosedSet (⋃ i, F i)) := by
  sorry

end LRA.VolumeIII.Analysis.StructureOfRealLine
