import LRA.Set.Interface.Definitions.Operations

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

  ∀ {Element : Type u} {SetObject : Type v} {Collection : Type w} [inst : Membership Element SetObject] [inst_1 : Membership SetObject Collection] [inst_2 : LRA.Set.HasCollectionUnion SetObject Collection] [inst_3 : LRA.Set.HasCollectionIntersection SetObject Collection], LRA.Set.CollectionMembershipLaws Element SetObject Collection → ∀ (collection : Collection) (x : Element), x ∈ inst_2.collectionUnion collection ↔ Exists fun B => (B ∈ collection ∧ x ∈ B)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, Collection, ∈)
  Objects
    collection : Collection
    x : Element
  Prove
    LRA.Set.CollectionMembershipLaws Element SetObject Collection → ∀ (collection : Collection) (x : Element), x ∈ inst_2.collectionUnion collection ↔ Exists fun B => (B ∈ collection ∧ x ∈ B)

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

  ∀ {Element : Type u} {SetObject : Type v} {Collection : Type w} [inst : Membership Element SetObject] [inst_1 : Membership SetObject Collection] [inst_2 : LRA.Set.HasCollectionUnion SetObject Collection] [inst_3 : LRA.Set.HasCollectionIntersection SetObject Collection], LRA.Set.CollectionMembershipLaws Element SetObject Collection → ∀ (collection : Collection) (x : Element), (Exists fun B => B) ∈ collection → x ∈ inst_3.collectionIntersection collection ↔ ∀ (B : SetObject), B ∈ collection → x ∈ B

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, Collection, ∈)
  Objects
    collection : Collection
    x : Element
  Prove
    LRA.Set.CollectionMembershipLaws Element SetObject Collection → ∀ (collection : Collection) (x : Element), (Exists fun B => B) ∈ collection → x ∈ inst_3.collectionIntersection collection ↔ ∀ (B : SetObject), B ∈ collection → x ∈ B

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

end LRA.Set
