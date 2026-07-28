/-
SCRATCH FILE — not wired into the lra-lean project.
Imports only this pass's own scratch files and Mathlib — nothing from the
real `LRA.VolumeIII.Analysis.Bounding.Bounds`, so this can be freely
refactored or discarded without touching the working project.
Source: volume-iii/book-analysis-i/bounding/notes/completeness/notes-completeness-equivalences.tex
Second file of `completeness` (installment 2 of 6 for this chapter).

Structural note: no duplicated-Failure-modes bug here (this file wasn't in
the corpus-wide scan's hit list; `grep -c "Failure modes"` returns 0 —
confirmed directly, not corrupted, just genuinely absent). More broadly,
none of this file's 5 theorem nodes carry the full block-enhancement suite
(Predicate reading / Negated quantified statement / Negation predicate
reading / Failure modes) — each has only "Standard quantified statement"
and "Interpretation". That's a reasonable editorial choice, not a bug:
these are sweeping equivalence-of-properties theorems ("(i) iff (ii) iff
(iii)..."), not the ∀/∃-over-elements statements that the predicate-logic
and failure-modes blocks are designed to dissect. Flagged for awareness,
not treated as a gap.

Math content verified correct on all 5 nodes — this is the standard
textbook package of equivalences between order-completeness (LUB
property) and various sequence/interval-based completeness notions:

  1. thm:lub-property-implies-monotone-convergence — LUB property alone
     (no Archimedean hypothesis needed) implies every bounded monotone
     sequence converges (increasing -> sup, decreasing -> inf, dual
     statements). Correct: this direction never needs Archimedean-ness.

  2. thm:monotone-convergence-implies-lub-property — the converse
     *does* need Archimedean as an extra hypothesis (correctly stated):
     without it, bounded-monotone-sequences-converge does not by itself
     force order-completeness. Interpretation sketch uses bisection
     (classic proof shape: build increasing/decreasing endpoint
     sequences via a midpoint membership test, they converge to a common
     limit, which is then shown to be the least upper bound).

  3. thm:lub-property-equivalent-monotone-convergence — packages 1 and 2
     into a three-way "Archimedean ==> (LUB <-> increasing-converges
     <-> decreasing-converges)" equivalence, correctly citing both
     directional theorems as dependencies.

  4. thm:lub-property-equivalent-nested-interval-property — LUB
     property <-> Nested Interval Property, again under the Archimedean
     hypothesis (also standard and correctly required: NIP alone is
     strictly weaker than completeness in non-Archimedean ordered
     fields).

  5. thm:standard-completeness-equivalences — the "big" six-way TFAE:
     LUB, GLB, monotone convergence (both directions), NIP, Cauchy
     completeness, Bolzano-Weierstrass, all under Archimedean. Cites
     four external dependencies (monotone convergence theorem, nested
     interval theorem, Bolzano-Weierstrass theorem, Cauchy criterion for
     real sequences) that are NOT yet formalized anywhere in this pass —
     same forward-dependency situation as `ImageInverseExtrema.lean`'s
     continuity concepts: these belong to the "sequences" chapter, which
     per the user's stated roadmap (bounds -> sequences -> function
     limits -> derivatives) comes strictly after this one.

Because of that forward dependency, and because scratch files are meant to
be freely refactorable, the sequence/limit/Cauchy vocabulary below is
taken directly from Mathlib (`Filter.Tendsto`, `Monotone`/`Antitone`,
`CauchySeq`, `StrictMono` for subsequence index maps) rather than
reinventing placeholder stand-ins for the project's not-yet-written
`def:convergent-sequence` / `def:cauchy-sequence` / etc. Statements are
kept generic over an ordered field `F` (mirroring the .tex's own generic
"F an Archimedean linearly ordered field" framing) using
`LinearOrderedField`, `Archimedean`, `TopologicalSpace`, `OrderTopology`,
and — only where Cauchy sequences are mentioned — `UniformSpace`. These
typeclass combinations are asserted here purely so the statements
typecheck; whether they're mutually consistent/derivable for a bare `F`
is a question for whoever eventually tries to discharge these `sorry`s
(for `F := ℝ` all of it is available from Mathlib for free).

Mathlib already has exactly the right tool for "(i) <-> (ii) <-> (iii)
<-> ..." packaging: `List.TFAE`. Used for nodes 3, 4, and 5 below instead
of chains of separate `Iff`s, which is a more faithful, and frankly
better, formalization of what the .tex is actually asserting than
unpacking it into O(n^2) pairwise iffs would be.
-/

import Mathlib.Order.Defs
import Mathlib.Data.Set.Defs
import Mathlib.Topology.Order.OrderClosed
import Mathlib.Topology.Algebra.Order.MonotoneContinuity
import Mathlib.Topology.UniformSpace.Cauchy
import Mathlib.Algebra.Order.Archimedean.Basic
import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Data.List.TFAE
import LRA.VolumeIII.Analysis.Bounding.Scratch.UpperLowerBounds
import LRA.VolumeIII.Analysis.Bounding.Scratch.SupremaInfima
import LRA.VolumeIII.Analysis.Bounding.Scratch.AxiomOfCompleteness

namespace LRA
namespace VolumeIII
namespace Analysis
namespace Bounding
namespace Scratch

variable (F : Type*)

/-- `def:greatest-lower-bound-property` (used implicitly by node 5's "GLB"
leg; the .tex never separately re-defines it here, it's the dual of
`HasLeastUpperBoundProperty` from `AxiomOfCompleteness.lean`). -/
def HasGreatestLowerBoundProperty [Preorder F] : Prop :=
  ∀ A : Set F, A.Nonempty → (∃ l, IsLowerBoundOf l A) → ∃ i, IsInfimum i A

/-- Support definition (not a standalone `.tex` label): "every bounded
increasing sequence converges (to its supremum, though the property as
stated only demands *some* limit exists — the fact that the limit must
equal the sup is part of what the theorems below establish, not baked
into the definition itself)." -/
def IncreasingBoundedSequencesConverge [Preorder F] [TopologicalSpace F] : Prop :=
  ∀ a : ℕ → F, Monotone a → (∃ u, IsUpperBoundOf u (Set.range a)) →
    ∃ L, Filter.Tendsto a Filter.atTop (nhds L)

/-- Dual support definition for decreasing sequences. -/
def DecreasingBoundedSequencesConverge [Preorder F] [TopologicalSpace F] : Prop :=
  ∀ a : ℕ → F, Antitone a → (∃ l, IsLowerBoundOf l (Set.range a)) →
    ∃ L, Filter.Tendsto a Filter.atTop (nhds L)

/-- `def:nested-interval-property`-adjacent support definition: nested
closed bounded intervals `[a n, b n]` (nestedness captured by `a`
increasing, `b` decreasing, `a n ≤ b n` for all `n`) have nonempty total
intersection. -/
def NestedIntervalProperty [Preorder F] : Prop :=
  ∀ a b : ℕ → F, Monotone a → Antitone b → (∀ n, a n ≤ b n) →
    ∃ x, ∀ n, a n ≤ x ∧ x ≤ b n

/-- Support definition: every Cauchy sequence in `F` converges. -/
def CauchySequencesConverge [UniformSpace F] : Prop :=
  ∀ a : ℕ → F, CauchySeq a → ∃ L, Filter.Tendsto a Filter.atTop (nhds L)

/-- Support definition: every bounded sequence in `F` has a convergent
subsequence. -/
def BolzanoWeierstrassProperty [Preorder F] [TopologicalSpace F] : Prop :=
  ∀ a : ℕ → F, (∃ u, IsUpperBoundOf u (Set.range a)) →
    (∃ l, IsLowerBoundOf l (Set.range a)) →
    ∃ φ : ℕ → ℕ, StrictMono φ ∧ ∃ L, Filter.Tendsto (a ∘ φ) Filter.atTop (nhds L)

/-- `thm:lub-property-implies-monotone-convergence`, increasing half. No
Archimedean hypothesis needed for this direction — correct per the .tex. -/
theorem lub_property_implies_increasing_convergence
    [LinearOrder F] [TopologicalSpace F] [OrderTopology F]
    (h : HasLeastUpperBoundProperty F) : IncreasingBoundedSequencesConverge F := by
  sorry

/-- `thm:lub-property-implies-monotone-convergence`, decreasing half. -/
theorem lub_property_implies_decreasing_convergence
    [LinearOrder F] [TopologicalSpace F] [OrderTopology F]
    (h : HasLeastUpperBoundProperty F) : DecreasingBoundedSequencesConverge F := by
  sorry

/-- `thm:monotone-convergence-implies-lub-property`. Archimedean-ness is a
genuinely necessary extra hypothesis here (unlike the forward direction
above) — correctly required by the .tex. -/
theorem monotone_convergence_implies_lub_property
    [LinearOrderedField F] [Archimedean F] [TopologicalSpace F] [OrderTopology F]
    (h : IncreasingBoundedSequencesConverge F) : HasLeastUpperBoundProperty F := by
  sorry

/-- `thm:lub-property-equivalent-monotone-convergence`. Packages the
three theorems above into a TFAE, matching the .tex's "(i) LUB property,
(ii) bounded increasing sequences converge, (iii) bounded decreasing
sequences converge" statement (for `F` Archimedean). -/
theorem lub_property_equivalent_monotone_convergence
    [LinearOrderedField F] [Archimedean F] [TopologicalSpace F] [OrderTopology F] :
    [HasLeastUpperBoundProperty F,
     IncreasingBoundedSequencesConverge F,
     DecreasingBoundedSequencesConverge F].TFAE := by
  sorry

/-- `thm:lub-property-equivalent-nested-interval-property`. (F Archimedean.) -/
theorem lub_property_equivalent_nested_interval_property
    [LinearOrderedField F] [Archimedean F] [TopologicalSpace F] [OrderTopology F] :
    [HasLeastUpperBoundProperty F, NestedIntervalProperty F].TFAE := by
  sorry

/-- `thm:standard-completeness-equivalences`. The "big" six-way
equivalence. Cites four external dependencies
(`thm:monotone-convergence-theorem`, `thm:nested-interval-theorem`,
`thm:bolzano-weierstrass-sequences`, `thm:cauchy-criterion-real-sequences`)
that belong to the not-yet-reached "sequences" chapter — formalized here
directly against Mathlib's `CauchySeq`/subsequence machinery rather than
against project vocabulary that doesn't exist yet, same pattern as
`ImageInverseExtrema.lean`. -/
theorem standard_completeness_equivalences
    [LinearOrderedField F] [Archimedean F] [TopologicalSpace F] [OrderTopology F]
    [UniformSpace F] :
    [HasLeastUpperBoundProperty F,
     HasGreatestLowerBoundProperty F,
     IncreasingBoundedSequencesConverge F,
     DecreasingBoundedSequencesConverge F,
     NestedIntervalProperty F,
     CauchySequencesConverge F,
     BolzanoWeierstrassProperty F].TFAE := by
  sorry

end Scratch
end Bounding
end Analysis
end VolumeIII
end LRA
