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
  constructor
  . --
    intro h_b_in_collection
    have h_x_collection_iff := CollectionMembershipLaws.CollectionUnionMembership collection
    rw [h_x_collection_iff] at h_b_in_collection
    exact h_b_in_collection
  . --
    intro h_B_in_collection
    have h_x_collection_iff := CollectionMembershipLaws.CollectionUnionMembership collection
    exact (h_x_collection_iff x).mpr h_B_in_collection

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
  constructor
  · -- Forward direction (→): If x is in the intersection, it belongs to all sets in the collection
    intro h_x_in_inter
    have h_inter_iff := CollectionMembershipLaws.CollectionIntersectionMembership collection
    intro B h_B_in_coll
    have h_all := (h_inter_iff x collectionNonempty).mp h_x_in_inter
    exact h_all B h_B_in_coll

  · -- Reverse direction (←): If x belongs to all sets in the collection, it is in the intersection
    intro h_forall_in_B
    have h_inter_iff := CollectionMembershipLaws.CollectionIntersectionMembership collection
    have h_inter_iff_x := h_inter_iff x collectionNonempty
    exact h_inter_iff_x.mpr h_forall_in_B



end Wrappers

end LRA.Set
