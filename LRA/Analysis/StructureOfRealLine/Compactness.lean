/-
Draft module; not yet imported by the active Volume III root.
Source: book-analysis-i/structure-of-real-line/notes/{covers-and-subcovers,
compactness-on-r, heine-borel}/.

Coverage pass, part 3 of 3, over Structure of the Real Line (Ch.2, Book I).
One Lean statement per book label, `sorry`-bodied. Note ISSUES.md #44: the
book's own exposition invokes "closed subset of a compact set is compact"
as the route from `thm:closed-bounded-interval-compact` to
`thm:heine-borel`, but never states or proves that lemma anywhere in the
chapter — recorded here as `ClosedSubsetOfCompactIsCompact` with the
same gap (added, per ISSUES.md's report-only policy, as a `sorry`d
statement matching what the book invokes but does not prove, not as a
silent fix).
-/

import Mathlib.Data.Real.Basic
import LRA.Analysis.StructureOfRealLine.OpenClosedSets
import LRA.Analysis.StructureOfRealLine.CompactnessAdditions

namespace LRA.Analysis.StructureOfRealLine

/-- `def:real-open-cover`.

Logical form:

```lean
def IsOpenCover (𝒰 : Set (Set ℝ)) (K : Set ℝ) : Prop :=
  (∀ U ∈ 𝒰, IsOpenSet U) ∧ K ⊆ ⋃ U ∈ 𝒰, U
```
-/
def IsOpenCover (𝒰 : Set (Set ℝ)) (K : Set ℝ) : Prop :=
  (∀ U ∈ 𝒰, IsOpenSet U) ∧ K ⊆ ⋃ U ∈ 𝒰, U

/-- `def:finite-subcover`.

Logical form:

```lean
def IsFiniteSubcover (𝒱 : Set (Set ℝ)) (𝒰 : Set (Set ℝ)) (K : Set ℝ) : Prop :=
  𝒱 ⊆ 𝒰 ∧ 𝒱.Finite ∧ K ⊆ ⋃ U ∈ 𝒱, U
```
-/
def IsFiniteSubcover (𝒱 : Set (Set ℝ)) (𝒰 : Set (Set ℝ)) (K : Set ℝ) : Prop :=
  𝒱 ⊆ 𝒰 ∧ 𝒱.Finite ∧ K ⊆ ⋃ U ∈ 𝒱, U

/-- `def:compact-set`.

Logical form:

```lean
def IsCompactSet (K : Set ℝ) : Prop :=
  ∀ 𝒰 : Set (Set ℝ), IsOpenCover 𝒰 K → ∃ 𝒱, IsFiniteSubcover 𝒱 𝒰 K
```
-/
def IsCompactSet (K : Set ℝ) : Prop :=
  ∀ 𝒰 : Set (Set ℝ), IsOpenCover 𝒰 K → ∃ 𝒱, IsFiniteSubcover 𝒱 𝒰 K

-- `thm:compact-implies-closed-bounded`
/-- Let `K : Set ℝ`. If `hK : IsCompactSet K`. Then `IsClosedSet K ∧ ∃ M > 0, ∀ x ∈ K, |x| ≤ M`.

Logical form:

```lean
theorem CompactImpliesClosedBounded (K : Set ℝ) (hK : IsCompactSet K) :
    IsClosedSet K ∧ ∃ M > 0, ∀ x ∈ K, |x| ≤ M
```
-/
theorem CompactImpliesClosedBounded (K : Set ℝ) (hK : IsCompactSet K) :
    IsClosedSet K ∧ ∃ M > 0, ∀ x ∈ K, |x| ≤ M := by
  sorry

-- `thm:closed-bounded-interval-compact`
/-- Let `a b : ℝ`. If `hab : a ≤ b`. Then `IsCompactSet (Set.Icc a b)`.

Logical form:

```lean
theorem ClosedBoundedIntervalCompact (a b : ℝ) (hab : a ≤ b) :
    IsCompactSet (Set.Icc a b)
```
-/
theorem ClosedBoundedIntervalCompact (a b : ℝ) (hab : a ≤ b) :
    IsCompactSet (Set.Icc a b) := by
  sorry

/-- Let `K : Set ℝ`. Then `IsCompactSet K ↔ IsCompactR K`.

Logical form:

```lean
theorem IsCompactSetIffIsCompactR (K : Set ℝ) : IsCompactSet K ↔ IsCompactR K
```
-/
theorem IsCompactSetIffIsCompactR (K : Set ℝ) : IsCompactSet K ↔ IsCompactR K := by
  sorry

/-- Let `F : Set ℝ`. Then `IsClosedSet F ↔ IsClosedR F`.

Logical form:

```lean
theorem IsClosedSetIffIsClosedR (F : Set ℝ) : IsClosedSet F ↔ IsClosedR F
```
-/
theorem IsClosedSetIffIsClosedR (F : Set ℝ) : IsClosedSet F ↔ IsClosedR F := by
  sorry

-- `thm:heine-borel`
/-- Let `K : Set ℝ`. Then `IsCompactSet K ↔ IsClosedSet K ∧ ∃ M > 0, ∀ x ∈ K, |x| ≤ M`.

Logical form:

```lean
theorem HeineBorel (K : Set ℝ) :
    IsCompactSet K ↔ IsClosedSet K ∧ ∃ M > 0, ∀ x ∈ K, |x| ≤ M
```
-/
theorem HeineBorel (K : Set ℝ) :
    IsCompactSet K ↔ IsClosedSet K ∧ ∃ M > 0, ∀ x ∈ K, |x| ≤ M := by
  sorry

end LRA.Analysis.StructureOfRealLine
