import LRA.Set.Interface.Operations

namespace LRA.Set

universe u v w

/--
`CollectionMembershipLaws` TODO

Predicate logic:

  class CollectionMembershipLaws
    (Element : outParam (Type u)) (SetObject : outParam (Type v))
    (Collection : Type w)
    [Membership Element SetObject] [Membership SetObject Collection]
    [HasCollectionUnion SetObject Collection]
    [HasCollectionIntersection SetObject Collection] : Prop where
  CollectionUnionMembership :
    ∀ (collection : Collection) (x : Element),
      x ∈ HasCollectionUnion.collectionUnion collection ↔
        ∃ B : SetObject, B ∈ collection ∧ x ∈ B
  CollectionIntersectionMembership :
    ∀ (collection : Collection) (x : Element),
      (∃ B : SetObject, B ∈ collection) →
        (x ∈ HasCollectionIntersection.collectionIntersection collection ↔
          ∀ B : SetObject, B ∈ collection → x ∈ B)

Predicate logic (unfolded):

  class CollectionMembershipLaws
    (Element : outParam (Type u)) (SetObject : outParam (Type v))
    (Collection : Type w)
    [Membership Element SetObject] [Membership SetObject Collection]
    [HasCollectionUnion SetObject Collection]
    [HasCollectionIntersection SetObject Collection] : Prop where
  CollectionUnionMembership :
    ∀ (collection : Collection) (x : Element),
      x ∈ HasCollectionUnion.collectionUnion collection ↔
        ∃ B : SetObject, B ∈ collection ∧ x ∈ B
  CollectionIntersectionMembership :
    ∀ (collection : Collection) (x : Element),
      (∃ B : SetObject, B ∈ collection) →
        (x ∈ HasCollectionIntersection.collectionIntersection collection ↔
          ∀ B : SetObject, B ∈ collection → x ∈ B) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class CollectionMembershipLaws
    (Element : outParam (Type u)) (SetObject : outParam (Type v))
    (Collection : Type w)
    [Membership Element SetObject] [Membership SetObject Collection]
    [HasCollectionUnion SetObject Collection]
    [HasCollectionIntersection SetObject Collection] : Prop where
  CollectionUnionMembership :
    ∀ (collection : Collection) (x : Element),
      x ∈ HasCollectionUnion.collectionUnion collection ↔
        ∃ B : SetObject, B ∈ collection ∧ x ∈ B
  CollectionIntersectionMembership :
    ∀ (collection : Collection) (x : Element),
      (∃ B : SetObject, B ∈ collection) →
        (x ∈ HasCollectionIntersection.collectionIntersection collection ↔
          ∀ B : SetObject, B ∈ collection → x ∈ B)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, use

-/
class CollectionMembershipLaws
    (Element : outParam (Type u)) (SetObject : outParam (Type v))
    (Collection : Type w)
    [Membership Element SetObject] [Membership SetObject Collection]
    [HasCollectionUnion SetObject Collection]
    [HasCollectionIntersection SetObject Collection] : Prop where
  CollectionUnionMembership :
    ∀ (collection : Collection) (x : Element),
      x ∈ HasCollectionUnion.collectionUnion collection ↔
        ∃ B : SetObject, B ∈ collection ∧ x ∈ B
  CollectionIntersectionMembership :
    ∀ (collection : Collection) (x : Element),
      (∃ B : SetObject, B ∈ collection) →
        (x ∈ HasCollectionIntersection.collectionIntersection collection ↔
          ∀ B : SetObject, B ∈ collection → x ∈ B)

section Wrappers

variable {Element : Type u} {SetObject : Type v} {Collection : Type w}
variable [Membership Element SetObject] [Membership SetObject Collection]
variable [HasCollectionUnion SetObject Collection]
variable [HasCollectionIntersection SetObject Collection]

/--
`CollectionUnionMembership` TODO

Predicate logic:

  (∀ collection ∈ Collection ∀ x ∈ Element), x ∈ HasCollectionUnion.collectionUnion collection ↔ ∃ B ∈ SetObject, B ∈ collection ∧ x ∈ B

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} {Collection : Type w} [inst : Membership Element SetObject] [inst_1 : Membership SetObject Collection] [inst_2 : LRA.Set.HasCollectionUnion SetObject Collection] [inst_3 : LRA.Set.HasCollectionIntersection SetObject Collection], LRA.Set.CollectionMembershipLaws Element SetObject Collection → ∀ (collection : Collection) (x : Element), inst.1 (inst_2.1 collection) x ↔ Exists fun B => (inst_1.1 collection B ∧ inst.1 B x)

Logical form (Lean):

```lean
theorem CollectionUnionMembership
    [CollectionMembershipLaws Element SetObject Collection]
    (collection : Collection) (x : Element) :
    x ∈ HasCollectionUnion.collectionUnion collection ↔
      ∃ B : SetObject, B ∈ collection ∧ x ∈ B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, cases, rcases, use

-/
theorem CollectionUnionMembership
    [CollectionMembershipLaws Element SetObject Collection]
    (collection : Collection) (x : Element) :
    x ∈ HasCollectionUnion.collectionUnion collection ↔
      ∃ B : SetObject, B ∈ collection ∧ x ∈ B := by
  sorry

/--
`CollectionIntersectionMembership` TODO

Predicate logic:

  (∀ collection ∈ Collection ∀ x ∈ Element), (∃ B ∈ SetObject, B ∈ collection) → x ∈ HasCollectionIntersection.collectionIntersection collection ↔ ∀ B : SetObject, B ∈ collection → x ∈ B

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} {Collection : Type w} [inst : Membership Element SetObject] [inst_1 : Membership SetObject Collection] [inst_2 : LRA.Set.HasCollectionUnion SetObject Collection] [inst_3 : LRA.Set.HasCollectionIntersection SetObject Collection], LRA.Set.CollectionMembershipLaws Element SetObject Collection → ∀ (collection : Collection) (x : Element), (Exists fun B => inst_1.1 collection B) → inst.1 (inst_3.1 collection) x ↔ ∀ (B : SetObject), inst_1.1 collection B → inst.1 B x

Logical form (Lean):

```lean
theorem CollectionIntersectionMembership
    [CollectionMembershipLaws Element SetObject Collection]
    (collection : Collection) (x : Element)
    (collectionNonempty : ∃ B : SetObject, B ∈ collection) :
    x ∈ HasCollectionIntersection.collectionIntersection collection ↔
      ∀ B : SetObject, B ∈ collection → x ∈ B
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
theorem CollectionIntersectionMembership
    [CollectionMembershipLaws Element SetObject Collection]
    (collection : Collection) (x : Element)
    (collectionNonempty : ∃ B : SetObject, B ∈ collection) :
    x ∈ HasCollectionIntersection.collectionIntersection collection ↔
      ∀ B : SetObject, B ∈ collection → x ∈ B := by
  sorry

end Wrappers

section Covers

variable {SetObject : Type v} {Collection : Type w}

/--
`Covers` TODO

Predicate logic:

  ∀ {SetObject : Type v} {Collection : Type w} [inst : HasSubset SetObject] [inst_1 : LRA.Set.HasCollectionUnion SetObject Collection] (collection : Collection) (target : SetObject), inst.1 target (inst_1.collectionUnion collection)

Predicate logic (unfolded):

  ∀ {SetObject : Type v} {Collection : Type w} [inst : HasSubset SetObject] [inst_1 : LRA.Set.HasCollectionUnion SetObject Collection] (collection : Collection) (target : SetObject), inst.1 target (inst_1.1 collection)

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

  ∀ {SetObject : Type v} {Collection : Type w} [inst : HasSubset SetObject] [inst_1 : HasSubset Collection] [inst_2 : LRA.Set.HasCollectionUnion SetObject Collection] (subcollection collection : Collection) (target : SetObject), (inst_1.1 subcollection collection ∧ inst.1 target (inst_2.1 subcollection))

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
