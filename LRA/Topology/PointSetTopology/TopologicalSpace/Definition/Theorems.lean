import LRA.Topology.PointSetTopology.TopologicalSpace.Definition.TopologicalSpace

/-!
Basic source-facing topology theorems stated against Mathlib's topology API.
-/

namespace LRA.Topology

universe u

/-- Source: Willard, `General Topology`, Definition 3.3.

A subset of a topological space is closed when its complement is open.
This declaration records the source-facing definition; later formal proofs may
use Mathlib's `IsClosed` API directly.

Mathematical statement (Lean): `def ClosedSetDefinition {X : Type u} [TopologicalSpace X] (E : Set X) : Prop`.


Logical form:

```lean
def ClosedSetDefinition {X : Type u} [TopologicalSpace X] (E : Set X) : Prop :=
  IsOpen (Eᶜ)
```
-/
def ClosedSetDefinition {X : Type u} [TopologicalSpace X] (E : Set X) : Prop :=
  IsOpen (Eᶜ)

/-- Source-facing closed-set family associated to a topology.

This names the family used in Willard's Theorem 3.4: the subsets whose
complements are open.

Mathematical statement (Lean): `def ClosedSetFamilyOfTopology (X : Type u) [TopologicalSpace X] : Set (Set X)`.


Logical form:

```lean
def ClosedSetFamilyOfTopology (X : Type u) [TopologicalSpace X] : Set (Set X) :=
  {F | ClosedSetDefinition F}
```
-/
def ClosedSetFamilyOfTopology (X : Type u) [TopologicalSpace X] : Set (Set X) :=
  {F | ClosedSetDefinition F}

open Set

/-- Source: Willard, `General Topology`, Theorem 3.4 (Forward Direction).

If ℱ is the collection of closed sets in a topological space X, then:
(F-a) Any intersection of members of ℱ belongs to ℱ.
(F-b) Any finite union of members of ℱ belongs to ℱ.
(F-c) X and ∅ both belong to ℱ.


Logical form:

```lean
theorem closed_sets_in_topological_space
    {X : Type u}
    [TopologicalSpace X] :
    (∀ S : Set (Set X), (∀ C ∈ S, IsClosed C) → IsClosed (⋂₀ S)) ∧
    (∀ C D : Set X, IsClosed C → IsClosed D → IsClosed (C ∪ D)) ∧
    IsClosed (univ : Set X) ∧ IsClosed (∅ : Set X)
```
-/
theorem closed_sets_in_topological_space
    {X : Type u}
    [TopologicalSpace X] :
    (∀ S : Set (Set X), (∀ C ∈ S, IsClosed C) → IsClosed (⋂₀ S)) ∧
    (∀ C D : Set X, IsClosed C → IsClosed D → IsClosed (C ∪ D)) ∧
    IsClosed (univ : Set X) ∧ IsClosed (∅ : Set X) := by
  sorry

/-- Source: Willard, `General Topology`, Theorem 3.4 (Converse Direction).

Given a set X and any family ℱ of subsets of X satisfying F-a, F-b, and F-c,
the collection of complements of members of ℱ is a topology on X in which
the family of closed sets is exactly ℱ.


Logical form:

```lean
theorem TopologyFromClosedSetAxioms
    {X : Type u}
    (F : Set (Set X))
    (closedUnderArbitraryIntersections : ∀ S ⊆ F, ⋂₀ S ∈ F)
    (closedUnderFiniteUnions : ∀ C ∈ F, ∀ D ∈ F, C ∪ D ∈ F)
    (_wholeSpaceMem : univ ∈ F)
    (emptyMem : ∅ ∈ F) :
    ∃ topologicalSpace : TopologicalSpace X,
      ∀ C : Set X, @IsClosed X topologicalSpace C ↔ C ∈ F
```
-/

theorem TopologyFromClosedSetAxioms
    {X : Type u}
    (F : Set (Set X))
    (closedUnderArbitraryIntersections : ∀ S ⊆ F, ⋂₀ S ∈ F)
    (closedUnderFiniteUnions : ∀ C ∈ F, ∀ D ∈ F, C ∪ D ∈ F)
    (_wholeSpaceMem : univ ∈ F)
    (emptyMem : ∅ ∈ F) :
    ∃ topologicalSpace : TopologicalSpace X,
      ∀ C : Set X, @IsClosed X topologicalSpace C ↔ C ∈ F := by
  sorry

/-- Source: Willard, `General Topology`, Definition 3.5.

The closure of a subset `E` of a topological space `X` is the intersection of
all closed subsets of `X` that contain `E`.

Mathematical statement (Lean): `def TopologicalClosureDefinition {X : Type u} [TopologicalSpace X] (E : Set X) : Set X`.


Logical form:

```lean
def TopologicalClosureDefinition {X : Type u} [TopologicalSpace X] (E : Set X) : Set X :=
  ⋂₀ {K : Set X | E ⊆ K ∧ IsClosed K}
```
-/
def TopologicalClosureDefinition {X : Type u} [TopologicalSpace X] (E : Set X) : Set X :=
  ⋂₀ {K : Set X | E ⊆ K ∧ IsClosed K}

/-- Source: Willard, `General Topology`, Lemma 3.6.

Closure is monotone with respect to inclusion: if `A ⊆ B`, then the closure of
`A` is contained in the closure of `B`.

Mathematical statement (Lean): `theorem TopologicalClosureMonotone {X : Type u} [TopologicalSpace X] {A B : Set X} (subset : A ⊆ B) : TopologicalClosureDefinition A ⊆ TopologicalClosureDefinition B`.


Logical form:

```lean
theorem TopologicalClosureMonotone
    {X : Type u}
    [TopologicalSpace X]
    {A B : Set X}
    (subset : A ⊆ B) :
    TopologicalClosureDefinition A ⊆ TopologicalClosureDefinition B
```
-/
theorem TopologicalClosureMonotone
    {X : Type u}
    [TopologicalSpace X]
    {A B : Set X}
    (subset : A ⊆ B) :
    TopologicalClosureDefinition A ⊆ TopologicalClosureDefinition B := by
  sorry

end LRA.Topology
