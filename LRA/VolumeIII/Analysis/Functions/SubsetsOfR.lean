/-
Draft module; not yet imported by the active Volume III root.
Source: notes-subsets-of-R.tex (third and final section of the
`functions` chapter — `algebra-of-functions` -> `real-valued-functions`
-> `subsets-real-line`). Structural check: 81/81 balanced remark blocks;
27 labels, 1 of which (`sec:subsets-of-R`) is the section's own label,
leaving 26 content nodes, all formalized below.

This file is the point-set-topology toolkit for ℝ (centered open
intervals, cluster/adherent/isolated/interior/boundary points, interior/
closure/boundary as sets, closed sets, Heine–Borel, and the "true near a
point" scaffolding that `def:true-near` explicitly says underlies the
`lim_{x→x0} f(x) = L` definition — confirming, from this section, the
same forward-pointing-toward-limits observation made when reading
`real-valued-functions`'s `def:pointwise-relation-near-point`). All 26
theorem/definition BOXES (the actual boxed content) are mathematically
correct. Four findings, none auto-fixed:

Finding 1 (see ISSUES.md #33, 🟡 — new recurring-pattern instance,
related to the existing #19 "Predicate reading duplicates Standard
quantified statement" pattern but hitting a different remark pair):
in `def:adherent-point-r`, `def:isolated-point-r`, `def:bounded-set-r`,
and `thm:heine-borel-subsets-real-line`, the "Negation predicate
reading" remark is a VERBATIM duplicate of the "Negated quantified
statement" remark immediately above it — no translation into the
corpus's set/predicate notation happens at all. Contrast with the two
nodes that get this right: `def:cluster-point-r` (Negated: raw
`¬|y-x|<ε` logic; Negation predicate reading: correctly translated to
`I_ε^×(x)∩X=∅`) and `def:closed-set-r` (same correct pattern, translated
via the adherent-point unpacking).

Finding 2 (see ISSUES.md #34, — structural, matches the Bounds-pass
duplicated-block corruption pattern exactly): `thm:heine-borel-subsets-
real-line` has TWO separate back-to-back `[Failure modes]` remark
blocks (not one, like every other node in this file) — an older,
generic-Exposition version immediately followed by a newer, more
specific version. Confirmed via `grep`: 7 total `[Failure modes]` blocks
in the file, 5 solo (well-separated) and this one adjacent pair.

Finding 3 (see ISSUES.md #35, 🟡): `lem:closure-elementary`'s theorem
box states FOUR parts — (i) `X ⊆ X̄`, (ii) `X̄∪Ȳ = (X∪Y)‾`, (iii)
`(X∩Y)‾ ⊆ X̄∩Ȳ`, (iv) monotonicity `X⊆Y ⟹ X̄⊆Ȳ` — but the "Standard
quantified statement" remark covers only (ii) and (iii), omitting (i)
and (iv) entirely (not corrupted/misplaced elsewhere, as in the earlier
`prop:preimage-union-intersection` bug — just silently dropped).
Formalized below with all four parts, from the theorem box itself.

Finding 4 (see ISSUES.md #36, 🟠 — possible genuine gap, flagging for
your judgment since this file doesn't define "interval"):
`cor:interval-all-limit-points` states "if `I` is an interval, then
every `x∈I` is a cluster point of `I`" with NO nondegeneracy hypothesis.
This is FALSE for a degenerate single-point interval `I = {a}` (under
the common convention — e.g. Mathlib's `Set.OrdConnected` — that a
singleton counts as an interval): `x = a` has no OTHER point of `I`
nearby, so `a` is not a cluster point of `{a}`. If this corpus's own
`def:interval` (defined elsewhere, not yet read this pass) requires at
least two points, this finding is moot — otherwise it's a genuine
missing hypothesis. Formalized below exactly as stated (via
`Set.OrdConnected`, Mathlib's interval predicate, which does admit
singletons), with the counterexample noted inline.

Formalized using project-parallel predicate names (`IsClusterPointR`
etc., suffixed `R` to avoid colliding with the cluster-point-vs-
subsequential-limit naming collision already flagged as ISSUES.md #26
in the Sequences chapter) rather than Mathlib's own topology API
(`closure`, `IsClosed`, `interior`, `frontier`, `AccPt`), matching this
pass's house style of tracking the corpus's own named predicates as
citable content in their own right.
-/

import Mathlib.Data.Real.Basic
import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Order.Interval.Set.OrdConnected

namespace LRA
namespace VolumeIII
namespace Analysis
namespace Functions

/-- `def:epsilon-neighbourhood`. -/
def CenteredOpenInterval (x ε : ℝ) : Set ℝ := {y : ℝ | |y - x| < ε}

/-- `def:deleted-epsilon-neighbourhood`. -/
def PuncturedCenteredOpenInterval (x ε : ℝ) : Set ℝ :=
  CenteredOpenInterval x ε \ {x}

/-- `def:cluster-point-r`. -/
def IsClusterPointR (x : ℝ) (X : Set ℝ) : Prop :=
  ∀ ε > 0, ∃ y ∈ X \ {x}, |y - x| < ε

/-- `thm:cluster-point-sequential`. -/
theorem ClusterPointSequential (c : ℝ) (A : Set ℝ) :
    IsClusterPointR c A ↔
      ∃ a : ℕ → ℝ, (∀ n, a n ∈ A \ {c}) ∧
        Filter.Tendsto a Filter.atTop (nhds c) := by
  sorry

/-- `def:adherent-point-r`. -/
def IsAdherentPointR (x : ℝ) (X : Set ℝ) : Prop :=
  ∀ ε > 0, ∃ y ∈ X, |y - x| < ε

/-- `def:isolated-point-r`. -/
def IsIsolatedPointR (x : ℝ) (X : Set ℝ) : Prop :=
  x ∈ X ∧ ∃ ε > 0, CenteredOpenInterval x ε ∩ X = {x}

/-- `def:interior-point-r`. -/
def IsInteriorPointR (x : ℝ) (X : Set ℝ) : Prop :=
  ∃ ε > 0, CenteredOpenInterval x ε ⊆ X

/-- `def:boundary-point-r`. -/
def IsBoundaryPointR (x : ℝ) (X : Set ℝ) : Prop :=
  ∀ ε > 0, (CenteredOpenInterval x ε ∩ X).Nonempty ∧
    (CenteredOpenInterval x ε ∩ Xᶜ).Nonempty

/-- `def:interior-r`. -/
def InteriorR (X : Set ℝ) : Set ℝ := {x : ℝ | IsInteriorPointR x X}

/-- `def:boundary-r`. -/
def BoundaryR (X : Set ℝ) : Set ℝ := {x : ℝ | IsBoundaryPointR x X}

/-- `def:closure-r`. -/
def ClosureR (X : Set ℝ) : Set ℝ := {x : ℝ | IsAdherentPointR x X}

/-- `prop:adherent-points-are-closure-points`. -/
theorem AdherentPointsAreClosurePoints (x : ℝ) (X : Set ℝ) :
    x ∈ ClosureR X ↔ IsAdherentPointR x X := by
  sorry

/-- `prop:isolated-points-are-noncluster-adherent-points`. -/
theorem IsolatedPointsAreNonclusterAdherentPoints (x : ℝ) (X : Set ℝ)
    (hx : x ∈ X) :
    IsIsolatedPointR x X ↔ IsAdherentPointR x X ∧ ¬ IsClusterPointR x X := by
  sorry

/-- `prop:interior-membership-characterization`. -/
theorem InteriorMembershipCharacterization (x : ℝ) (X : Set ℝ) :
    x ∈ InteriorR X ↔ IsInteriorPointR x X := by
  sorry

/-- `prop:interior-is-contained-in-set`. -/
theorem InteriorIsContainedInSet (X : Set ℝ) : InteriorR X ⊆ X := by
  sorry

/-- `def:closed-set-r`. -/
def IsClosedR (E : Set ℝ) : Prop := ClosureR E = E

/-- `prop:closure-is-smallest-closed-superset`. -/
theorem ClosureIsSmallestClosedSuperset (X : Set ℝ) :
    X ⊆ ClosureR X ∧ IsClosedR (ClosureR X) ∧
      ∀ C : Set ℝ, IsClosedR C → X ⊆ C → ClosureR X ⊆ C := by
  sorry

/-- `prop:boundary-as-closure-minus-interior`. -/
theorem BoundaryAsClosureMinusInterior (X : Set ℝ) :
    BoundaryR X = ClosureR X \ InteriorR X := by
  sorry

/-- `lem:closure-elementary`. All FOUR parts of the theorem box,
including (i) and (iv), which the "Standard quantified statement"
remark omits — see Finding 3 above / ISSUES.md #35. -/
theorem ClosureElementary (X Y : Set ℝ) :
    X ⊆ ClosureR X ∧
      ClosureR (X ∪ Y) = ClosureR X ∪ ClosureR Y ∧
      ClosureR (X ∩ Y) ⊆ ClosureR X ∩ ClosureR Y ∧
      (X ⊆ Y → ClosureR X ⊆ ClosureR Y) := by
  sorry

/-- `cor:closed-iff-seq-limits`. -/
theorem ClosedIffSeqLimits (X : Set ℝ) :
    IsClosedR X ↔
      ∀ a : ℕ → ℝ, (∀ n, a n ∈ X) →
        ∀ x : ℝ, Filter.Tendsto a Filter.atTop (nhds x) → x ∈ X := by
  sorry

/-- `cor:interval-all-limit-points`. Formalized EXACTLY as the theorem
box states it (no nondegeneracy hypothesis on `I`), using Mathlib's
`Set.OrdConnected` for "is an interval" — which DOES admit singletons.
See Finding 4 above / ISSUES.md #36: this is false for `I = {a}`, since
`a` would then not be a cluster point of `I`. Left exactly as stated
(with `sorry`, appropriately unprovable as written) rather than silently
patching in a nondegeneracy hypothesis, per this pass's report-only
policy on flawed statements. -/
theorem IntervalAllLimitPoints (I : Set ℝ) (hI : I.OrdConnected) :
    ∀ x ∈ I, IsClusterPointR x I := by
  sorry

/-- `def:bounded-set-r`. -/
def IsBoundedSetR (X : Set ℝ) : Prop := ∃ M > 0, ∀ x ∈ X, |x| ≤ M

/-- `thm:heine-borel-subsets-real-line`. -/
theorem HeineBorelSubsetsRealLine (X : Set ℝ) :
    (IsClosedR X ∧ IsBoundedSetR X) ↔
      ∀ a : ℕ → ℝ, (∀ n, a n ∈ X) →
        ∃ φ : ℕ → ℕ, StrictMono φ ∧
          ∃ L ∈ X, Filter.Tendsto (a ∘ φ) Filter.atTop (nhds L) := by
  sorry

/-- `def:true-near`. `Q` plays the role of the already-composed property
`P(f(·))` from the `.tex` — matching how `PointwiseRelationNearPoint` in
`real-valued-functions` treats the analogous "near a point" shape
generically rather than threading `f` through explicitly. -/
def TrueNear (Q : ℝ → Prop) (x₀ : ℝ) : Prop :=
  ∃ δ > 0, ∀ x : ℝ, 0 < |x - x₀| ∧ |x - x₀| < δ → Q x

/-- `prop:true-near-stable-under-shrinking`. -/
theorem TrueNearStableUnderShrinking (Q : ℝ → Prop) (x₀ : ℝ)
    (h : TrueNear Q x₀) :
    ∃ η > 0, ∀ x : ℝ, 0 < |x - x₀| ∧ |x - x₀| < η → Q x := by
  sorry

/-- `prop:true-near-stable-under-conjunction`. -/
theorem TrueNearStableUnderConjunction (P Q : ℝ → Prop) (x₀ : ℝ)
    (hP : TrueNear P x₀) (hQ : TrueNear Q x₀) :
    TrueNear (fun x => P x ∧ Q x) x₀ := by
  sorry

/- ================================================================
   ADDITIONS.md items 16-18. Added with user sign-off.

   Rationale (per discussion): this file deliberately scopes its whole
   toolkit (cluster/adherent/interior/closure/boundary/closed) to
   concrete ℝ with ε-intervals — clearly the "see it happen with actual
   numbers" pass before a later general topological-space treatment —
   but conspicuously never defines OPEN, even though it already uses
   "closed and bounded" (Heine–Borel) and is visibly laying track toward
   function limits (`def:true-near` says so explicitly). Adding it here
   is the concrete ℝ instance a later general topology definition should
   specialize down to, not a duplicate of that later work.
   ================================================================ -/

/-- ADDITIONS.md #16. `X` is open iff it equals its own interior — the
direct parallel to the existing `def:closed-set-r` (`X` closed iff it
equals its own closure), completing the open/closed pair that the file
otherwise leaves asymmetric. -/
def IsOpenR (X : Set ℝ) : Prop := InteriorR X = X

/-- ADDITIONS.md #17. `X` is open iff its complement is closed — the
standard open/closed duality, immediate once `IsOpenR` exists. -/
theorem OpenIffComplementClosed (X : Set ℝ) :
    IsOpenR X ↔ IsClosedR Xᶜ := by
  sorry

/-- ADDITIONS.md #18. A finite subset of `ℝ` has no cluster points, and
consequently is closed — ties `def:closed-set-r` and `def:cluster-point-
r` together with one of the standard first examples students reach for
(a finite set can't be approached by DISTINCT nearby points since there
are only finitely many candidates and each is isolated by taking `ε`
smaller than the least gap to any other point of the set). -/
theorem FiniteSetIsClosed (X : Set ℝ) (hX : X.Finite) :
    (∀ x : ℝ, ¬ IsClusterPointR x X) ∧ IsClosedR X := by
  sorry

end Functions
end Analysis
end VolumeIII
end LRA
