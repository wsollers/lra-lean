/-
Draft module; not yet imported by the active Volume III root.
New namespace/area: `LRA.Analysis.StructureOfRealLine.*`, the Lean
home for Chapter 2 ("Structure of the Real Line") — the open-ball/open-cover
metric-topology development that deliberately parallels (without duplicating)
the earlier `Functions.SubsetsOfR` epsilon-language treatment. See
ISSUES.md's "Structure of the Real Line chapter" section for the one gap this
file exists to patch.

Source: ADDITIONS.md items 28, 29 — proposed after auditing the chapter and
finding `thm:heine-borel`'s own opening exposition invokes "a closed subset
of a compact set is compact" as a load-bearing step that is never itself
proved anywhere in the chapter (ISSUES.md #44), plus the observation that
this chapter's open-cover compactness and the Sequences chapter's
Bolzano–Weierstrass content are never connected to each other. Both approved
with sign-off.

Predicates below restate the book's own definitions directly (open ball via
explicit `∀y, |x-y|<r → …` quantifiers, open cover via an indexed family),
matching the style of every other draft module in this corpus rather than
reaching for Mathlib's bundled `IsOpen`/`IsCompact` typeclass machinery.
-/

import Mathlib.Data.Real.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Order.Filter.Basic

namespace LRA.Analysis.StructureOfRealLine

/-- `def:open-set`, restated: `U` is open iff every point of `U` is the
center of an open ball contained in `U`.

Logical form:

```lean
def IsOpenR (U : Set ℝ) : Prop :=
  ∀ x ∈ U, ∃ r > 0, ∀ y : ℝ, |x - y| < r → y ∈ U
```
-/
def IsOpenR (U : Set ℝ) : Prop :=
  ∀ x ∈ U, ∃ r > 0, ∀ y : ℝ, |x - y| < r → y ∈ U

/-- `def:closed-set`: `F` is closed iff its complement (in `ℝ`) is open.

Logical form:

```lean
def IsClosedR (F : Set ℝ) : Prop :=
  IsOpenR (Set.univ \ F)
```
-/
def IsClosedR (F : Set ℝ) : Prop :=
  IsOpenR (Set.univ \ F)

/-- `def:compact-set`, restated with an arbitrary index type `ι` standing in
for the book's arbitrary family `{U_λ}_{λ∈Λ}`: `K` is compact iff every open
cover of `K` admits a finite subcover.

Logical form:

```lean
def IsCompactR (K : Set ℝ) : Prop :=
  ∀ (ι : Type) (U : ι → Set ℝ),
    (∀ i, IsOpenR (U i)) → K ⊆ ⋃ i, U i →
    ∃ J : Finset ι, K ⊆ ⋃ i ∈ J, U i
```
-/
def IsCompactR (K : Set ℝ) : Prop :=
  ∀ (ι : Type) (U : ι → Set ℝ),
    (∀ i, IsOpenR (U i)) → K ⊆ ⋃ i, U i →
    ∃ J : Finset ι, K ⊆ ⋃ i ∈ J, U i

/- ================================================================
   ADDITIONS.md item 28. Added with user sign-off. Fills ISSUES.md #44.
   ================================================================ -/

/-- Let `F` be a closed subset of a compact real set `K`. Then `F` is compact.

Logical form:

```lean
theorem ClosedSubsetOfCompactIsCompact
    (F K : Set ℝ) (hFK : F ⊆ K) (hF : IsClosedR F) (hK : IsCompactR K) :
    IsCompactR F
```
-/
theorem ClosedSubsetOfCompactIsCompact
    (F K : Set ℝ) (hFK : F ⊆ K) (hF : IsClosedR F) (hK : IsCompactR K) :
    IsCompactR F := by
  sorry

/-- Sequential compactness: every sequence valued in `K` has a subsequence
converging to a point of `K`. Phrased in the Sequences chapter's own
strictly-increasing-index-map idiom for subsequences, so this definition
reads as a direct extension of that chapter's vocabulary rather than a
fresh import from general topology.

Logical form:

```lean
def IsSeqCompactR (K : Set ℝ) : Prop :=
  ∀ x : ℕ → ℝ, (∀ n, x n ∈ K) →
    ∃ φ : ℕ → ℕ, StrictMono φ ∧
      ∃ L ∈ K, Filter.Tendsto (x ∘ φ) Filter.atTop (nhds L)
```
-/
def IsSeqCompactR (K : Set ℝ) : Prop :=
  ∀ x : ℕ → ℝ, (∀ n, x n ∈ K) →
    ∃ φ : ℕ → ℕ, StrictMono φ ∧
      ∃ L ∈ K, Filter.Tendsto (x ∘ φ) Filter.atTop (nhds L)

/-- Let `K : Set ℝ`. Then `IsSeqCompactR K ↔ IsCompactR K`.

Logical form:

```lean
theorem SequentialCompactnessIffOpenCoverCompactness (K : Set ℝ) :
    IsSeqCompactR K ↔ IsCompactR K
```
-/
theorem SequentialCompactnessIffOpenCoverCompactness (K : Set ℝ) :
    IsSeqCompactR K ↔ IsCompactR K := by
  sorry

end LRA.Analysis.StructureOfRealLine
