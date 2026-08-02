/-
Draft module; not yet imported by the active Volume III root.
New namespace/area: `LRA.VolumeIII.Analysis.StructureOfRealLine.*`, the Lean
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

namespace LRA.VolumeIII.Analysis.StructureOfRealLine

/-- `def:open-set`, restated: `U` is open iff every point of `U` is the
center of an open ball contained in `U`. -/
def IsOpenR (U : Set ℝ) : Prop :=
  ∀ x ∈ U, ∃ r > 0, ∀ y : ℝ, |x - y| < r → y ∈ U

/-- `def:closed-set`: `F` is closed iff its complement (in `ℝ`) is open. -/
def IsClosedR (F : Set ℝ) : Prop :=
  IsOpenR (Set.univ \ F)

/-- `def:compact-set`, restated with an arbitrary index type `ι` standing in
for the book's arbitrary family `{U_λ}_{λ∈Λ}`: `K` is compact iff every open
cover of `K` admits a finite subcover. -/
def IsCompactR (K : Set ℝ) : Prop :=
  ∀ (ι : Type) (U : ι → Set ℝ),
    (∀ i, IsOpenR (U i)) → K ⊆ ⋃ i, U i →
    ∃ J : Finset ι, K ⊆ ⋃ i ∈ J, U i

/- ================================================================
   ADDITIONS.md item 28. Added with user sign-off. Fills ISSUES.md #44.
   ================================================================ -/

/-- ADDITIONS.md #28. A closed subset of a compact set is compact — the
/-- The lemma states the `thm assertion. -/
lemma `thm:heine-borel`'s own opening exposition names as doing the real
work in reducing the general Heine–Borel statement to the closed-bounded-
interval case (`thm:closed-bounded-interval-compact`), but which is never
itself stated or proved anywhere in the chapter. Standard proof: given an
open cover `{U_i}` of `F`, adjoin the open set `ℝ \ F` (open since `F` is
closed) to get an open cover of the ambient compact `K`; extract a finite
subcover of `K` from that, then discard `ℝ \ F` from it — the rest still
covers `F` (since `ℝ \ F` contributed nothing to `F`) and is finite. -/
theorem ClosedSubsetOfCompactIsCompact
    (F K : Set ℝ) (hFK : F ⊆ K) (hF : IsClosedR F) (hK : IsCompactR K) :
    IsCompactR F := by
  sorry

/- ================================================================
   ADDITIONS.md item 29. Added with user sign-off.
   ================================================================ -/

/-- Sequential compactness: every sequence valued in `K` has a subsequence
converging to a point of `K`. Phrased in the Sequences chapter's own
strictly-increasing-index-map idiom for subsequences, so this definition
reads as a direct extension of that chapter's vocabulary rather than a
fresh import from general topology. -/
def IsSeqCompactR (K : Set ℝ) : Prop :=
  ∀ x : ℕ → ℝ, (∀ n, x n ∈ K) →
    ∃ φ : ℕ → ℕ, StrictMono φ ∧
      ∃ L ∈ K, Filter.Tendsto (x ∘ φ) Filter.atTop (nhds L)

/-- ADDITIONS.md #29. On `ℝ`, the Sequences chapter's Bolzano–Weierstrass-
flavoured sequential compactness and this chapter's open-cover compactness
pick out exactly the same sets — but nothing in either chapter currently
says so. This is the bridge theorem tying `IsCompactR` (this chapter) to the
sequence-extraction machinery already formalized under
`Sequences` (`BolzanoWeierstrassSequences`, the peak-argument
Monotone Subsequence Theorem, etc.), so that either notion of "compact" can
be reached for interchangeably going forward. -/
theorem SequentialCompactnessIffOpenCoverCompactness (K : Set ℝ) :
    IsSeqCompactR K ↔ IsCompactR K := by
  sorry

end LRA.VolumeIII.Analysis.StructureOfRealLine
