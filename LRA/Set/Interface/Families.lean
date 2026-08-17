import LRA.VolumeI.Set.Interface.Operations

namespace LRA.Set

universe u v w

/-!
Collections of sets: membership certificates for `⋃₀`/`⋂₀`, and the
cover vocabulary (`Covers`, `Subcover`) mined from the retired
`hold/Set/Operations/Families.lean` -- restated over the capability
classes, so it works at every backend and needs no `subsetElement`
embedding.

The collection-intersection characterization is *conditioned on the
collection being nonempty*: `⋂₀ ∅` characterized unconditionally would
be the universal set, which ZF-style backends structurally cannot have.
Predicate backends satisfy the conditioned law trivially (their `⋂₀ ∅`
really is `𝒰`, but that stronger fact is theirs alone).
-/

/--
`CollectionMembershipLaws` packages the class contract for collection membership laws.

Logical form:

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

/-- Membership in the union over a collection of sets.

Logical form:

```lean
theorem CollectionUnionMembership
    [CollectionMembershipLaws Element SetObject Collection]
    (collection : Collection) (x : Element) :
    x ∈ HasCollectionUnion.collectionUnion collection ↔
      ∃ B : SetObject, B ∈ collection ∧ x ∈ B
```
-/
theorem CollectionUnionMembership
    [CollectionMembershipLaws Element SetObject Collection]
    (collection : Collection) (x : Element) :
    x ∈ HasCollectionUnion.collectionUnion collection ↔
      ∃ B : SetObject, B ∈ collection ∧ x ∈ B :=
  CollectionMembershipLaws.CollectionUnionMembership collection x

/-- Membership in the intersection over a *nonempty* collection of sets.

Logical form:

```lean
theorem CollectionIntersectionMembership
    [CollectionMembershipLaws Element SetObject Collection]
    (collection : Collection) (x : Element)
    (collectionNonempty : ∃ B : SetObject, B ∈ collection) :
    x ∈ HasCollectionIntersection.collectionIntersection collection ↔
      ∀ B : SetObject, B ∈ collection → x ∈ B
```
-/
theorem CollectionIntersectionMembership
    [CollectionMembershipLaws Element SetObject Collection]
    (collection : Collection) (x : Element)
    (collectionNonempty : ∃ B : SetObject, B ∈ collection) :
    x ∈ HasCollectionIntersection.collectionIntersection collection ↔
      ∀ B : SetObject, B ∈ collection → x ∈ B :=
  CollectionMembershipLaws.CollectionIntersectionMembership
    collection x collectionNonempty

end Wrappers

section Covers

variable {SetObject : Type v} {Collection : Type w}

/-- A collection covers a target set when the target is contained in its
union.

Logical form:

```lean
def Covers [HasSubset SetObject]
    [HasCollectionUnion SetObject Collection]
    (collection : Collection) (target : SetObject) : Prop :=
  target ⊆ HasCollectionUnion.collectionUnion collection
```
-/
def Covers [HasSubset SetObject]
    [HasCollectionUnion SetObject Collection]
    (collection : Collection) (target : SetObject) : Prop :=
  target ⊆ HasCollectionUnion.collectionUnion collection

/-- A subcover is a subcollection that still covers the same target.

Logical form:

```lean
def Subcover [HasSubset SetObject] [HasSubset Collection]
    [HasCollectionUnion SetObject Collection]
    (subcollection collection : Collection) (target : SetObject) : Prop :=
  subcollection ⊆ collection ∧ Covers subcollection target
```
-/
def Subcover [HasSubset SetObject] [HasSubset Collection]
    [HasCollectionUnion SetObject Collection]
    (subcollection collection : Collection) (target : SetObject) : Prop :=
  subcollection ⊆ collection ∧ Covers subcollection target

end Covers

end LRA.Set
