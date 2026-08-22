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

Finding 4 (see ISSUES.md #36, repaired at the Lean surface):
`cor:interval-all-limit-points` needs a nondegeneracy hypothesis if it is
formalized via `Set.OrdConnected`, because Mathlib admits singleton
intervals. The active theorem surface below therefore carries
`I.Nontrivial` explicitly, excluding the degenerate singleton
counterexample `I = {a}` where `a` has no distinct nearby point of `I`.

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

namespace LRA.Analysis.Functions

/-- `def:epsilon-neighbourhood`.

Logical form:

```lean
def CenteredOpenInterval (x ε : ℝ) : Set ℝ := {y : ℝ | |y - x| < ε}
```
-/
def CenteredOpenInterval (x ε : ℝ) : Set ℝ := {y : ℝ | |y - x| < ε}

/-- `def:deleted-epsilon-neighbourhood`.

Logical form:

```lean
def PuncturedCenteredOpenInterval (x ε : ℝ) : Set ℝ :=
  CenteredOpenInterval x ε \ {x}
```
-/
def PuncturedCenteredOpenInterval (x ε : ℝ) : Set ℝ :=
  CenteredOpenInterval x ε \ {x}

/-- `def:cluster-point-r`.

Logical form:

```lean
def IsClusterPointR (x : ℝ) (X : Set ℝ) : Prop :=
  ∀ ε > 0, ∃ y ∈ X \ {x}, |y - x| < ε
```
-/
def IsClusterPointR (x : ℝ) (X : Set ℝ) : Prop :=
  ∀ ε > 0, ∃ y ∈ X \ {x}, |y - x| < ε

-- `thm:cluster-point-sequential`
/-- Let `c : ℝ` and `A : Set ℝ`. Then `IsClusterPointR c A ↔ ∃ a : ℕ → ℝ, (∀ n, a n ∈ A \ {c}) ∧
Filter.Tendsto a Filter.atTop (nhds c)`.

Logical form:

```lean
theorem ClusterPointSequential (c : ℝ) (A : Set ℝ) :
    IsClusterPointR c A ↔
      ∃ a : ℕ → ℝ, (∀ n, a n ∈ A \ {c}) ∧
        Filter.Tendsto a Filter.atTop (nhds c)
```
-/
theorem ClusterPointSequential (c : ℝ) (A : Set ℝ) :
    IsClusterPointR c A ↔
      ∃ a : ℕ → ℝ, (∀ n, a n ∈ A \ {c}) ∧
        Filter.Tendsto a Filter.atTop (nhds c) := by
  sorry

/-- `def:adherent-point-r`.

Logical form:

```lean
def IsAdherentPointR (x : ℝ) (X : Set ℝ) : Prop :=
  ∀ ε > 0, ∃ y ∈ X, |y - x| < ε
```
-/
def IsAdherentPointR (x : ℝ) (X : Set ℝ) : Prop :=
  ∀ ε > 0, ∃ y ∈ X, |y - x| < ε

/-- `def:isolated-point-r`.

Logical form:

```lean
def IsIsolatedPointR (x : ℝ) (X : Set ℝ) : Prop :=
  x ∈ X ∧ ∃ ε > 0, CenteredOpenInterval x ε ∩ X = {x}
```
-/
def IsIsolatedPointR (x : ℝ) (X : Set ℝ) : Prop :=
  x ∈ X ∧ ∃ ε > 0, CenteredOpenInterval x ε ∩ X = {x}

/-- `def:interior-point-r`.

Logical form:

```lean
def IsInteriorPointR (x : ℝ) (X : Set ℝ) : Prop :=
  ∃ ε > 0, CenteredOpenInterval x ε ⊆ X
```
-/
def IsInteriorPointR (x : ℝ) (X : Set ℝ) : Prop :=
  ∃ ε > 0, CenteredOpenInterval x ε ⊆ X

/-- `def:boundary-point-r`.

Logical form:

```lean
def IsBoundaryPointR (x : ℝ) (X : Set ℝ) : Prop :=
  ∀ ε > 0, (CenteredOpenInterval x ε ∩ X).Nonempty ∧
    (CenteredOpenInterval x ε ∩ Xᶜ).Nonempty
```
-/
def IsBoundaryPointR (x : ℝ) (X : Set ℝ) : Prop :=
  ∀ ε > 0, (CenteredOpenInterval x ε ∩ X).Nonempty ∧
    (CenteredOpenInterval x ε ∩ Xᶜ).Nonempty

/-- `def:interior-r`.

Logical form:

```lean
def InteriorR (X : Set ℝ) : Set ℝ := {x : ℝ | IsInteriorPointR x X}
```
-/
def InteriorR (X : Set ℝ) : Set ℝ := {x : ℝ | IsInteriorPointR x X}

/-- `def:boundary-r`.

Logical form:

```lean
def BoundaryR (X : Set ℝ) : Set ℝ := {x : ℝ | IsBoundaryPointR x X}
```
-/
def BoundaryR (X : Set ℝ) : Set ℝ := {x : ℝ | IsBoundaryPointR x X}

/-- `def:closure-r`.

Logical form:

```lean
def ClosureR (X : Set ℝ) : Set ℝ := {x : ℝ | IsAdherentPointR x X}
```
-/
def ClosureR (X : Set ℝ) : Set ℝ := {x : ℝ | IsAdherentPointR x X}

/-- Let `x : ℝ` and `X : Set ℝ`. Then `x ∈ ClosureR X ↔ IsAdherentPointR x X`.

Logical form:

```lean
theorem AdherentPointsAreClosurePoints (x : ℝ) (X : Set ℝ) :
    x ∈ ClosureR X ↔ IsAdherentPointR x X
```
-/
theorem AdherentPointsAreClosurePoints (x : ℝ) (X : Set ℝ) :
    x ∈ ClosureR X ↔ IsAdherentPointR x X := by
  sorry

/-- Let `x : ℝ` and `X : Set ℝ`. If `hx : x ∈ X`. Then `IsIsolatedPointR x X ↔ IsAdherentPointR x X
∧ ¬ IsClusterPointR x X`.

Logical form:

```lean
theorem IsolatedPointsAreNonclusterAdherentPoints (x : ℝ) (X : Set ℝ)
    (hx : x ∈ X) :
    IsIsolatedPointR x X ↔ IsAdherentPointR x X ∧ ¬ IsClusterPointR x X
```
-/
theorem IsolatedPointsAreNonclusterAdherentPoints (x : ℝ) (X : Set ℝ)
    (hx : x ∈ X) :
    IsIsolatedPointR x X ↔ IsAdherentPointR x X ∧ ¬ IsClusterPointR x X := by
  sorry

/-- Let `x : ℝ` and `X : Set ℝ`. Then `x ∈ InteriorR X ↔ IsInteriorPointR x X`.

Logical form:

```lean
theorem InteriorMembershipCharacterization (x : ℝ) (X : Set ℝ) :
    x ∈ InteriorR X ↔ IsInteriorPointR x X
```
-/
theorem InteriorMembershipCharacterization (x : ℝ) (X : Set ℝ) :
    x ∈ InteriorR X ↔ IsInteriorPointR x X := by
  sorry

/-- Let `X : Set ℝ`. Then `InteriorR X ⊆ X`.

Logical form:

```lean
theorem InteriorIsContainedInSet (X : Set ℝ) : InteriorR X ⊆ X
```
-/
theorem InteriorIsContainedInSet (X : Set ℝ) : InteriorR X ⊆ X := by
  sorry

/-- `def:closed-set-r`.

Logical form:

```lean
def IsClosedR (E : Set ℝ) : Prop := ClosureR E = E
```
-/
def IsClosedR (E : Set ℝ) : Prop := ClosureR E = E

/-- Let `X : Set ℝ`. Then `X ⊆ ClosureR X ∧ IsClosedR (ClosureR X) ∧ ∀ C : Set ℝ, IsClosedR C → X ⊆
C → ClosureR X ⊆ C`.

Logical form:

```lean
theorem ClosureIsSmallestClosedSuperset (X : Set ℝ) :
    X ⊆ ClosureR X ∧ IsClosedR (ClosureR X) ∧
      ∀ C : Set ℝ, IsClosedR C → X ⊆ C → ClosureR X ⊆ C
```
-/
theorem ClosureIsSmallestClosedSuperset (X : Set ℝ) :
    X ⊆ ClosureR X ∧ IsClosedR (ClosureR X) ∧
      ∀ C : Set ℝ, IsClosedR C → X ⊆ C → ClosureR X ⊆ C := by
  sorry

/-- Let `X : Set ℝ`. Then `BoundaryR X = ClosureR X \ InteriorR X`.

Logical form:

```lean
theorem BoundaryAsClosureMinusInterior (X : Set ℝ) :
    BoundaryR X = ClosureR X \ InteriorR X
```
-/
theorem BoundaryAsClosureMinusInterior (X : Set ℝ) :
    BoundaryR X = ClosureR X \ InteriorR X := by
  sorry

-- `lem:closure-elementary`
/-- Let `X Y : Set ℝ`. Then `X ⊆ ClosureR X ∧ ClosureR (X ∪ Y) = ClosureR X ∪ ClosureR Y ∧ ClosureR
(X ∩ Y) ⊆ ClosureR X ∩ ClosureR Y ∧ (X ⊆ Y → ClosureR X ⊆ ClosureR Y)`.

Logical form:

```lean
theorem ClosureElementary (X Y : Set ℝ) :
    X ⊆ ClosureR X ∧
      ClosureR (X ∪ Y) = ClosureR X ∪ ClosureR Y ∧
      ClosureR (X ∩ Y) ⊆ ClosureR X ∩ ClosureR Y ∧
      (X ⊆ Y → ClosureR X ⊆ ClosureR Y)
```
-/
theorem ClosureElementary (X Y : Set ℝ) :
    X ⊆ ClosureR X ∧
      ClosureR (X ∪ Y) = ClosureR X ∪ ClosureR Y ∧
      ClosureR (X ∩ Y) ⊆ ClosureR X ∩ ClosureR Y ∧
      (X ⊆ Y → ClosureR X ⊆ ClosureR Y) := by
  sorry

/-- Let `X : Set ℝ`. Then `IsClosedR X ↔ ∀ a : ℕ → ℝ, (∀ n, a n ∈ X) → ∀ x : ℝ, Filter.Tendsto a
Filter.atTop (nhds x) → x ∈ X`.

Logical form:

```lean
theorem ClosedIffSeqLimits (X : Set ℝ) :
    IsClosedR X ↔
      ∀ a : ℕ → ℝ, (∀ n, a n ∈ X) →
        ∀ x : ℝ, Filter.Tendsto a Filter.atTop (nhds x) → x ∈ X
```
-/
theorem ClosedIffSeqLimits (X : Set ℝ) :
    IsClosedR X ↔
      ∀ a : ℕ → ℝ, (∀ n, a n ∈ X) →
        ∀ x : ℝ, Filter.Tendsto a Filter.atTop (nhds x) → x ∈ X := by
  sorry

/-- Let `I : Set ℝ`. If `hI : I.OrdConnected` and `hnontrivial : I.Nontrivial`, then `∀ x ∈ I,
IsClusterPointR x I`.

Logical form:

```lean
theorem IntervalAllLimitPoints (I : Set ℝ) (hI : I.OrdConnected) (hnontrivial : I.Nontrivial) :
    ∀ x ∈ I, IsClusterPointR x I
```
-/
theorem IntervalAllLimitPoints (I : Set ℝ) (hI : I.OrdConnected) (hnontrivial : I.Nontrivial) :
    ∀ x ∈ I, IsClusterPointR x I := by
  sorry

/-- `def:bounded-set-r`.

Logical form:

```lean
def IsBoundedSetR (X : Set ℝ) : Prop := ∃ M > 0, ∀ x ∈ X, |x| ≤ M
```
-/
def IsBoundedSetR (X : Set ℝ) : Prop := ∃ M > 0, ∀ x ∈ X, |x| ≤ M

-- `thm:heine-borel-subsets-real-line`
/-- Let `X : Set ℝ`. Then `(IsClosedR X ∧ IsBoundedSetR X) ↔ ∀ a : ℕ → ℝ, (∀ n, a n ∈ X) → ∃ φ : ℕ →
ℕ, StrictMono φ ∧ ∃ L ∈ X, Filter.Tendsto (a ∘ φ) Filter.atTop (nhds L)`.

Logical form:

```lean
theorem HeineBorelSubsetsRealLine (X : Set ℝ) :
    (IsClosedR X ∧ IsBoundedSetR X) ↔
      ∀ a : ℕ → ℝ, (∀ n, a n ∈ X) →
        ∃ φ : ℕ → ℕ, StrictMono φ ∧
          ∃ L ∈ X, Filter.Tendsto (a ∘ φ) Filter.atTop (nhds L)
```
-/
theorem HeineBorelSubsetsRealLine (X : Set ℝ) :
    (IsClosedR X ∧ IsBoundedSetR X) ↔
      ∀ a : ℕ → ℝ, (∀ n, a n ∈ X) →
        ∃ φ : ℕ → ℕ, StrictMono φ ∧
          ∃ L ∈ X, Filter.Tendsto (a ∘ φ) Filter.atTop (nhds L) := by
  sorry

/-- `def:true-near`. `Q` plays the role of the already-composed property
`P(f(·))` from the `.tex` — matching how `PointwiseRelationNearPoint` in
`real-valued-functions` treats the analogous "near a point" shape
generically rather than threading `f` through explicitly.

Logical form:

```lean
def TrueNear (Q : ℝ → Prop) (x₀ : ℝ) : Prop :=
  ∃ δ > 0, ∀ x : ℝ, 0 < |x - x₀| ∧ |x - x₀| < δ → Q x
```
-/
def TrueNear (Q : ℝ → Prop) (x₀ : ℝ) : Prop :=
  ∃ δ > 0, ∀ x : ℝ, 0 < |x - x₀| ∧ |x - x₀| < δ → Q x

/-- Let `x₀ : ℝ`. If `Q : ℝ → Prop` and `h : TrueNear Q x₀`. Then `∃ η > 0, ∀ x : ℝ, 0 < |x - x₀| ∧
|x - x₀| < η → Q x`.

Logical form:

```lean
theorem TrueNearStableUnderShrinking (Q : ℝ → Prop) (x₀ : ℝ)
    (h : TrueNear Q x₀) :
    ∃ η > 0, ∀ x : ℝ, 0 < |x - x₀| ∧ |x - x₀| < η → Q x
```
-/
theorem TrueNearStableUnderShrinking (Q : ℝ → Prop) (x₀ : ℝ)
    (h : TrueNear Q x₀) :
    ∃ η > 0, ∀ x : ℝ, 0 < |x - x₀| ∧ |x - x₀| < η → Q x := by
  sorry

/-- Let `x₀ : ℝ`. If `P Q : ℝ → Prop`, `hP : TrueNear P x₀`, and `hQ : TrueNear Q x₀`. Then
`TrueNear (fun x => P x ∧ Q x) x₀`.

Logical form:

```lean
theorem TrueNearStableUnderConjunction (P Q : ℝ → Prop) (x₀ : ℝ)
    (hP : TrueNear P x₀) (hQ : TrueNear Q x₀) :
    TrueNear (fun x => P x ∧ Q x) x₀
```
-/
theorem TrueNearStableUnderConjunction (P Q : ℝ → Prop) (x₀ : ℝ)
    (hP : TrueNear P x₀) (hQ : TrueNear Q x₀) :
    TrueNear (fun x => P x ∧ Q x) x₀ := by
  sorry

/-- ADDITIONS.md #16. `X` is open iff it equals its own interior — the
direct parallel to the existing `def:closed-set-r` (`X` closed iff it
equals its own closure), completing the open/closed pair that the file
otherwise leaves asymmetric.

Logical form:

```lean
def IsOpenR (X : Set ℝ) : Prop := InteriorR X = X
```
-/
def IsOpenR (X : Set ℝ) : Prop := InteriorR X = X

/-- Let `X : Set ℝ`. Then `IsOpenR X ↔ IsClosedR Xᶜ`.

Logical form:

```lean
theorem OpenIffComplementClosed (X : Set ℝ) :
    IsOpenR X ↔ IsClosedR Xᶜ
```
-/
theorem OpenIffComplementClosed (X : Set ℝ) :
    IsOpenR X ↔ IsClosedR Xᶜ := by
  sorry

/-- Let `X : Set ℝ`. If `hX : X.Finite`. Then `(∀ x : ℝ, ¬ IsClusterPointR x X) ∧ IsClosedR X`.

Logical form:

```lean
theorem FiniteSetIsClosed (X : Set ℝ) (hX : X.Finite) :
    (∀ x : ℝ, ¬ IsClusterPointR x X) ∧ IsClosedR X
```
-/
theorem FiniteSetIsClosed (X : Set ℝ) (hX : X.Finite) :
    (∀ x : ℝ, ¬ IsClusterPointR x X) ∧ IsClosedR X := by
  sorry

end LRA.Analysis.Functions
