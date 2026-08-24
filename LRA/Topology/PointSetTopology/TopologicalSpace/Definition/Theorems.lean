import LRA.Topology.PointSetTopology.TopologicalSpace.Definition.TopologicalSpace

namespace LRA.Topology

universe u

/--
`ClosedSetDefinition` TODO

Predicate logic:

  ∀ {X : Type u} [inst : TopologicalSpace X] (E : Set X), inst.1 (Set.instCompl.compl E)

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : TopologicalSpace X] (E : X → Prop), inst.1 (Set.instCompl.1 E)

Logical form (Lean):

```lean
def ClosedSetDefinition {X : Type u} [TopologicalSpace X] (E : Set X) : Prop :=
  IsOpen (Eᶜ)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def ClosedSetDefinition {X : Type u} [TopologicalSpace X] (E : Set X) : Prop :=
  IsOpen (Eᶜ)

/--
`ClosedSetFamilyOfTopology` TODO

Predicate logic:

  ∀ (X : Type u) [inst : TopologicalSpace X] (a : Set X), inst.1 (Set.instCompl.compl a)

Predicate logic (unfolded):

  ∀ (X : Type u) [inst : TopologicalSpace X] (a : X → Prop), inst.1 (Set.instCompl.1 a)

Logical form (Lean):

```lean
def ClosedSetFamilyOfTopology (X : Type u) [TopologicalSpace X] : Set (Set X) :=
  {F | ClosedSetDefinition F}
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def ClosedSetFamilyOfTopology (X : Type u) [TopologicalSpace X] : Set (Set X) :=
  {F | ClosedSetDefinition F}

open Set

/--
`closed_sets_in_topological_space` TODO

Predicate logic:

  ∀ S ∈ Set (Set X, (∀ C ∈ S, IsClosed C) → IsClosed (⋂₀ S)) ∧ ∀ C D ∈ Set X, IsClosed C → IsClosed D → IsClosed (C ∪ D) ∧ IsClosed univ ∈ Set X ∧ IsClosed ∅ ∈ Set X

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : TopologicalSpace X], (∀ (S : (X → Prop) → Prop), (∀ (C : X → Prop), Set.instMembership.1 S C → IsClosed C) → IsClosed (Set.instInfSet.1 S) ∧ (∀ (C D : X → Prop), IsClosed C → IsClosed D → IsClosed (Set.instUnion.1 C D) ∧ (IsClosed fun _a => True ∧ IsClosed Set.instEmptyCollection.1)))

Logical form (Lean):

```lean
theorem closed_sets_in_topological_space
    {X : Type u}
    [TopologicalSpace X] :
    (∀ S : Set (Set X), (∀ C ∈ S, IsClosed C) → IsClosed (⋂₀ S)) ∧
    (∀ C D : Set X, IsClosed C → IsClosed D → IsClosed (C ∪ D)) ∧
    IsClosed (univ : Set X) ∧ IsClosed (∅ : Set X)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases

-/
theorem closed_sets_in_topological_space
    {X : Type u}
    [TopologicalSpace X] :
    (∀ S : Set (Set X), (∀ C ∈ S, IsClosed C) → IsClosed (⋂₀ S)) ∧
    (∀ C D : Set X, IsClosed C → IsClosed D → IsClosed (C ∪ D)) ∧
    IsClosed (univ : Set X) ∧ IsClosed (∅ : Set X) := by
  sorry

/--
`TopologyFromClosedSetAxioms` TODO

Predicate logic:

  (∀ S ⊆ F, ⋂₀ S ∈ F ∧ ∀ C ∈ F, ∀ D ∈ F, C ∪ D ∈ F ∧ univ ∈ F ∧ ∅ ∈ F) → ∃ topologicalSpace ∈ TopologicalSpace X, ∀ C : Set X, @IsClosed X topologicalSpace C ↔ C ∈ F

Predicate logic (unfolded):

  ∀ {X : Type u} (F : (X → Prop) → Prop), (∀ (S : (X → Prop) → Prop), Set.instLE.1 S F → Set.instMembership.1 F (Set.instInfSet.1 S) ∧ (∀ (C : X → Prop), Set.instMembership.1 F C → ∀ (D : X → Prop), Set.instMembership.1 F D → Set.instMembership.1 F (Set.instUnion.1 C D) ∧ (Set.instMembership.1 F fun _a => True ∧ Set.instMembership.1 F Set.instEmptyCollection.1))) → Exists fun topologicalSpace => ∀ (C : X → Prop), IsClosed C ↔ Set.instMembership.1 F C

Logical form (Lean):

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

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, use, rcases

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

/--
`TopologicalClosureDefinition` TODO

Predicate logic:

  ∀ {X : Type u} [inst : TopologicalSpace X] (E : Set X) (a : X) (t : Set X), Set.instMembership.mem (setOf fun K => (Set.instLE.le E K ∧ IsClosed K)) t → Set.instMembership.mem t a

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : TopologicalSpace X] (E : X → Prop) (a : X) (t : X → Prop), Set.instMembership.1 (fun K => (Set.instLE.1 E K ∧ IsClosed K)) t → Set.instMembership.1 t a

Logical form (Lean):

```lean
def TopologicalClosureDefinition {X : Type u} [TopologicalSpace X] (E : Set X) : Set X :=
  ⋂₀ {K : Set X | E ⊆ K ∧ IsClosed K}
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def TopologicalClosureDefinition {X : Type u} [TopologicalSpace X] (E : Set X) : Set X :=
  ⋂₀ {K : Set X | E ⊆ K ∧ IsClosed K}

/--
`TopologicalClosureMonotone` TODO

Predicate logic:

  TopologicalClosureDefinition A ⊆ TopologicalClosureDefinition B

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : TopologicalSpace X] {A B : X → Prop}, Set.instLE.1 A B → Set.instLE.1 (Set.instInfSet.1 fun K => (Set.instLE.1 A K ∧ IsClosed K)) (Set.instInfSet.1 fun K => (Set.instLE.1 B K ∧ IsClosed K))

Logical form (Lean):

```lean
theorem TopologicalClosureMonotone
    {X : Type u}
    [TopologicalSpace X]
    {A B : Set X}
    (subset : A ⊆ B) :
    TopologicalClosureDefinition A ⊆ TopologicalClosureDefinition B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem TopologicalClosureMonotone
    {X : Type u}
    [TopologicalSpace X]
    {A B : Set X}
    (subset : A ⊆ B) :
    TopologicalClosureDefinition A ⊆ TopologicalClosureDefinition B := by
  sorry

end LRA.Topology
