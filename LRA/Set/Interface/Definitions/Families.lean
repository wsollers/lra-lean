import LRA.Set.Interface.Definitions.Operations

namespace LRA.Set

universe u v w

section Covers

variable {SetObject : Type v} {Collection : Type w}

/--
`Covers` TODO

Predicate logic:

  ∀ {SetObject : Type v} {Collection : Type w} [inst : HasSubset SetObject] [inst_1 : LRA.Set.HasCollectionUnion SetObject Collection] (collection : Collection) (target : SetObject), inst.1 target (inst_1.collectionUnion collection)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    inst.1 target (inst_1.1 collection)

Logical form (Lean):

```lean
def Covers [HasSubset SetObject]
    [HasCollectionUnion SetObject Collection]
    (collection : Collection) (target : SetObject) : Prop :=
  target ⊆ HasCollectionUnion.collectionUnion collection
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
def Covers [HasSubset SetObject]
    [HasCollectionUnion SetObject Collection]
    (collection : Collection) (target : SetObject) : Prop :=
  target ⊆ HasCollectionUnion.collectionUnion collection

/--
`Subcover` TODO

Predicate logic:

  ∀ {SetObject : Type v} {Collection : Type w} [inst : HasSubset SetObject] [inst_1 : HasSubset Collection] [inst_2 : LRA.Set.HasCollectionUnion SetObject Collection] (subcollection collection : Collection) (target : SetObject), (inst_1.Subset subcollection collection ∧ LRA.Set.Covers subcollection target)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (inst_1.1 subcollection collection ∧ inst.1 target (inst_2.1 subcollection))

Logical form (Lean):

```lean
def Subcover [HasSubset SetObject] [HasSubset Collection]
    [HasCollectionUnion SetObject Collection]
    (subcollection collection : Collection) (target : SetObject) : Prop :=
  subcollection ⊆ collection ∧ Covers subcollection target
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
def Subcover [HasSubset SetObject] [HasSubset Collection]
    [HasCollectionUnion SetObject Collection]
    (subcollection collection : Collection) (target : SetObject) : Prop :=
  subcollection ⊆ collection ∧ Covers subcollection target

end Covers

end LRA.Set
