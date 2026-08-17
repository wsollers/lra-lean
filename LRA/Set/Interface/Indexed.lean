import LRA.Set.Interface.Operations

namespace LRA.Set

universe u v w

/-!
Membership-characterization certificates for indexed and countable
unions and intersections. Same design as `Interface/Membership.lean`:
two-sorted `Prop`-classes whose fields are the membership readings,
resolved by instance search from argument types.

Capability profile: `IndexedMembershipLaws` is registrable only by
backends with arbitrary-index operations (the predicate backends);
`CountableMembershipLaws` additionally by `ZFSet`.
-/

/--
`IndexedMembershipLaws` packages the class contract for indexed membership laws.

Logical form:

```lean
class IndexedMembershipLaws
    (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject]
    [HasIndexedUnion SetObject] [HasIndexedIntersection SetObject] :
    Prop where
  IndexedUnionMembership :
    ∀ {Index : Type w} (family : Index → SetObject) (x : Element),
      x ∈ HasIndexedUnion.indexedUnion family ↔ ∃ index, x ∈ family index
  IndexedIntersectionMembership :
    ∀ {Index : Type w} (family : Index → SetObject) (x : Element),
      x ∈ HasIndexedIntersection.indexedIntersection family ↔
        ∀ index, x ∈ family index
```
-/
class IndexedMembershipLaws
    (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject]
    [HasIndexedUnion SetObject] [HasIndexedIntersection SetObject] :
    Prop where
  IndexedUnionMembership :
    ∀ {Index : Type w} (family : Index → SetObject) (x : Element),
      x ∈ HasIndexedUnion.indexedUnion family ↔ ∃ index, x ∈ family index
  IndexedIntersectionMembership :
    ∀ {Index : Type w} (family : Index → SetObject) (x : Element),
      x ∈ HasIndexedIntersection.indexedIntersection family ↔
        ∀ index, x ∈ family index

/--
`CountableMembershipLaws` packages the class contract for countable membership laws.

Logical form:

```lean
class CountableMembershipLaws
    (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject]
    [HasCountableUnion SetObject] [HasCountableIntersection SetObject] :
    Prop where
  CountableUnionMembership :
    ∀ (family : Nat → SetObject) (x : Element),
      x ∈ HasCountableUnion.countableUnion family ↔
        ∃ index, x ∈ family index
  CountableIntersectionMembership :
    ∀ (family : Nat → SetObject) (x : Element),
      x ∈ HasCountableIntersection.countableIntersection family ↔
        ∀ index, x ∈ family index
```
-/
class CountableMembershipLaws
    (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject]
    [HasCountableUnion SetObject] [HasCountableIntersection SetObject] :
    Prop where
  CountableUnionMembership :
    ∀ (family : Nat → SetObject) (x : Element),
      x ∈ HasCountableUnion.countableUnion family ↔
        ∃ index, x ∈ family index
  CountableIntersectionMembership :
    ∀ (family : Nat → SetObject) (x : Element),
      x ∈ HasCountableIntersection.countableIntersection family ↔
        ∀ index, x ∈ family index

section Wrappers

variable {Element : Type u} {SetObject : Type v}

/-- Membership in an indexed union.

Logical form:

```lean
theorem IndexedUnionMembership
    [Membership Element SetObject]
    [HasIndexedUnion SetObject] [HasIndexedIntersection SetObject]
    [IndexedMembershipLaws Element SetObject]
    {Index : Type w} (family : Index → SetObject) (x : Element) :
    x ∈ HasIndexedUnion.indexedUnion family ↔ ∃ index, x ∈ family index
```
-/
theorem IndexedUnionMembership
    [Membership Element SetObject]
    [HasIndexedUnion SetObject] [HasIndexedIntersection SetObject]
    [IndexedMembershipLaws Element SetObject]
    {Index : Type w} (family : Index → SetObject) (x : Element) :
    x ∈ HasIndexedUnion.indexedUnion family ↔ ∃ index, x ∈ family index :=
  IndexedMembershipLaws.IndexedUnionMembership family x

/-- Membership in an indexed intersection.

Logical form:

```lean
theorem IndexedIntersectionMembership
    [Membership Element SetObject]
    [HasIndexedUnion SetObject] [HasIndexedIntersection SetObject]
    [IndexedMembershipLaws Element SetObject]
    {Index : Type w} (family : Index → SetObject) (x : Element) :
    x ∈ HasIndexedIntersection.indexedIntersection family ↔
      ∀ index, x ∈ family index
```
-/
theorem IndexedIntersectionMembership
    [Membership Element SetObject]
    [HasIndexedUnion SetObject] [HasIndexedIntersection SetObject]
    [IndexedMembershipLaws Element SetObject]
    {Index : Type w} (family : Index → SetObject) (x : Element) :
    x ∈ HasIndexedIntersection.indexedIntersection family ↔
      ∀ index, x ∈ family index :=
  IndexedMembershipLaws.IndexedIntersectionMembership family x

/-- Membership in a countable union.

Logical form:

```lean
theorem CountableUnionMembership
    [Membership Element SetObject]
    [HasCountableUnion SetObject] [HasCountableIntersection SetObject]
    [CountableMembershipLaws Element SetObject]
    (family : Nat → SetObject) (x : Element) :
    x ∈ HasCountableUnion.countableUnion family ↔
      ∃ index, x ∈ family index
```
-/
theorem CountableUnionMembership
    [Membership Element SetObject]
    [HasCountableUnion SetObject] [HasCountableIntersection SetObject]
    [CountableMembershipLaws Element SetObject]
    (family : Nat → SetObject) (x : Element) :
    x ∈ HasCountableUnion.countableUnion family ↔
      ∃ index, x ∈ family index :=
  CountableMembershipLaws.CountableUnionMembership family x

/-- Membership in a countable intersection.

Logical form:

```lean
theorem CountableIntersectionMembership
    [Membership Element SetObject]
    [HasCountableUnion SetObject] [HasCountableIntersection SetObject]
    [CountableMembershipLaws Element SetObject]
    (family : Nat → SetObject) (x : Element) :
    x ∈ HasCountableIntersection.countableIntersection family ↔
      ∀ index, x ∈ family index
```
-/
theorem CountableIntersectionMembership
    [Membership Element SetObject]
    [HasCountableUnion SetObject] [HasCountableIntersection SetObject]
    [CountableMembershipLaws Element SetObject]
    (family : Nat → SetObject) (x : Element) :
    x ∈ HasCountableIntersection.countableIntersection family ↔
      ∀ index, x ∈ family index :=
  CountableMembershipLaws.CountableIntersectionMembership family x

end Wrappers

end LRA.Set
