import LRA.Topology.PointSetTopology.TopologicalSpace.Definition.TopologicalSpace

namespace LRA.Topology

universe u

/--
`ClosedSetDefinition` TODO

Predicate logic:

  ∀ {X : Type u} [inst : TopologicalSpace X] (E : Set X), inst.1 (Set.instCompl.compl E)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    inst.1 (Set.instCompl.1 E)

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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    inst.1 (Set.instCompl.1 a)

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

  ∀ {X : Type u} [inst : TopologicalSpace X], ((∀ (S : Set (Set X)), (∀ (C : Set X), C ∈ S → IsClosed C) → IsClosed S.sInter) ∧ ((∀ (C D : Set X), IsClosed C → IsClosed D → IsClosed (C ∪ D)) ∧ (IsClosed Set.univ ∧ IsClosed Set.instEmptyCollection.emptyCollection)))

Predicate logic (unfolded):

  Ambient
    (X)
  Objects
    (none)
  Prove
    ((∀ (S : (X → Prop) → Prop), (∀ (C : X → Prop), C ∈ S → IsClosed C) → IsClosed (Set.instInfSet.1 S)) ∧ ((∀ (C D : X → Prop), IsClosed C → IsClosed D → IsClosed (C ∪ D)) ∧ (IsClosed fun _a => True ∧ IsClosed Set.instEmptyCollection.1)))

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

  ∀ {X : Type u} (F : Set (Set X)), ((∀ (S : Set (Set X)), Set.instLE.le S F → S.sInter ∈ F) ∧ ((∀ (C : Set X), C ∈ F → ∀ (D : Set X), D ∈ F → C ∪ D ∈ F) ∧ (Set.univ ∈ F ∧ Set.instEmptyCollection.emptyCollection ∈ F))) → Exists fun topologicalSpace => ∀ (C : Set X), IsClosed C ↔ C ∈ F

Predicate logic (unfolded):

  Ambient
    (X)
  Objects
    F : Set (Set X)
  Prove
    ((∀ (S : Set (Set X)), Set.instLE.le S F → S.sInter ∈ F) ∧ ((∀ (C : Set X), C ∈ F → ∀ (D : Set X), D ∈ F → C ∪ D ∈ F) ∧ (Set.univ ∈ F ∧ Set.instEmptyCollection.emptyCollection ∈ F))) → Exists fun topologicalSpace => ∀ (C : Set X), IsClosed C ↔ C ∈ F

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

  ∀ {X : Type u} [inst : TopologicalSpace X] (E : Set X) (a : X) (t : Set X), t ∈ setOf fun K => (Set.instLE.le E K ∧ IsClosed K) → a ∈ t

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    t ∈ fun K => (({ le := fun s₁ s₂ => ∀ ⦃a : X⦄, a ∈ s₁ → a ∈ s₂}.le E K) ∧ IsClosed K) → a ∈ t

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

  ∀ {X : Type u} [inst : TopologicalSpace X] {A B : Set X}, Set.instLE.le A B → Set.instLE.le (LRA.Topology.TopologicalClosureDefinition A) (LRA.Topology.TopologicalClosureDefinition B)

Predicate logic (unfolded):

  Ambient
    (X)
  Objects
    A B : Set X
    subset : A ⊆ B
  Prove
    { le := fun s₁ s₂ => ∀ ⦃a : X⦄, a ∈ s₁ → a ∈ s₂}.le A B → { le := fun s₁ s₂ => ∀ ⦃a : X⦄, a ∈ s₁ → a ∈ s₂}.le (Set.instInfSet.1 fun K => (({ le := fun s₁ s₂ => ∀ ⦃a : X⦄, a ∈ s₁ → a ∈ s₂}.le A K) ∧ IsClosed K)) (Set.instInfSet.1 fun K => (({ le := fun s₁ s₂ => ∀ ⦃a : X⦄, a ∈ s₁ → a ∈ s₂}.le B K) ∧ IsClosed K))

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
