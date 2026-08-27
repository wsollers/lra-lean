import LRA.Set.Interface.Definitions.Operations

namespace LRA.Set

universe u v w

/--
`IndexedMembershipLaws` TODO

Predicate logic:

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

Predicate logic (unfolded):

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
        ∀ index, x ∈ family index (source fallback; no compiled unfold data available)

Logical form (Lean):

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
`CountableMembershipLaws` TODO

Predicate logic:

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

Predicate logic (unfolded):

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
        ∀ index, x ∈ family index (source fallback; no compiled unfold data available)

Logical form (Lean):

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

/--
`IndexedUnionMembership` TODO

Predicate logic:

  (∀ x ∈ Element), (Index → SetObject) → x ∈ HasIndexedUnion.indexedUnion family ↔ ∃ index, x ∈ family index

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasIndexedUnion SetObject] [inst_2 : LRA.Set.HasIndexedIntersection SetObject], LRA.Set.IndexedMembershipLaws Element SetObject → ∀ {Index : Type w} (family : Index → SetObject) (x : Element), inst.1 (inst_1.1 family) x ↔ Exists fun index => inst.1 (family index) x

Logical form (Lean):

```lean
theorem IndexedUnionMembership
    [Membership Element SetObject]
    [HasIndexedUnion SetObject] [HasIndexedIntersection SetObject]
    [IndexedMembershipLaws Element SetObject]
    {Index : Type w} (family : Index → SetObject) (x : Element) :
    x ∈ HasIndexedUnion.indexedUnion family ↔ ∃ index, x ∈ family index
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
theorem IndexedUnionMembership
    [Membership Element SetObject]
    [HasIndexedUnion SetObject] [HasIndexedIntersection SetObject]
    [IndexedMembershipLaws Element SetObject]
    {Index : Type w} (family : Index → SetObject) (x : Element) :
    x ∈ HasIndexedUnion.indexedUnion family ↔ ∃ index, x ∈ family index := by
  sorry

/--
`IndexedIntersectionMembership` TODO

Predicate logic:

  (∀ x ∈ Element), (Index → SetObject) → x ∈ HasIndexedIntersection.indexedIntersection family ↔ ∀ index, x ∈ family index

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasIndexedUnion SetObject] [inst_2 : LRA.Set.HasIndexedIntersection SetObject], LRA.Set.IndexedMembershipLaws Element SetObject → ∀ {Index : Type w} (family : Index → SetObject) (x : Element), inst.1 (inst_2.1 family) x ↔ ∀ (index : Index), inst.1 (family index) x

Logical form (Lean):

```lean
theorem IndexedIntersectionMembership
    [Membership Element SetObject]
    [HasIndexedUnion SetObject] [HasIndexedIntersection SetObject]
    [IndexedMembershipLaws Element SetObject]
    {Index : Type w} (family : Index → SetObject) (x : Element) :
    x ∈ HasIndexedIntersection.indexedIntersection family ↔
      ∀ index, x ∈ family index
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem IndexedIntersectionMembership
    [Membership Element SetObject]
    [HasIndexedUnion SetObject] [HasIndexedIntersection SetObject]
    [IndexedMembershipLaws Element SetObject]
    {Index : Type w} (family : Index → SetObject) (x : Element) :
    x ∈ HasIndexedIntersection.indexedIntersection family ↔
      ∀ index, x ∈ family index := by
  sorry

/--
`CountableUnionMembership` TODO

Predicate logic:

  (∀ x ∈ Element), (Nat → SetObject) → x ∈ HasCountableUnion.countableUnion family ↔ ∃ index, x ∈ family index

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasCountableUnion SetObject] [inst_2 : LRA.Set.HasCountableIntersection SetObject], LRA.Set.CountableMembershipLaws Element SetObject → ∀ (family : Nat → SetObject) (x : Element), inst.1 (inst_1.1 family) x ↔ Exists fun index => inst.1 (family index) x

Logical form (Lean):

```lean
theorem CountableUnionMembership
    [Membership Element SetObject]
    [HasCountableUnion SetObject] [HasCountableIntersection SetObject]
    [CountableMembershipLaws Element SetObject]
    (family : Nat → SetObject) (x : Element) :
    x ∈ HasCountableUnion.countableUnion family ↔
      ∃ index, x ∈ family index
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
theorem CountableUnionMembership
    [Membership Element SetObject]
    [HasCountableUnion SetObject] [HasCountableIntersection SetObject]
    [CountableMembershipLaws Element SetObject]
    (family : Nat → SetObject) (x : Element) :
    x ∈ HasCountableUnion.countableUnion family ↔
      ∃ index, x ∈ family index := by
  sorry

/--
`CountableIntersectionMembership` TODO

Predicate logic:

  (∀ x ∈ Element), (Nat → SetObject) → x ∈ HasCountableIntersection.countableIntersection family ↔ ∀ index, x ∈ family index

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasCountableUnion SetObject] [inst_2 : LRA.Set.HasCountableIntersection SetObject], LRA.Set.CountableMembershipLaws Element SetObject → ∀ (family : Nat → SetObject) (x : Element), inst.1 (inst_2.1 family) x ↔ ∀ (index : Nat), inst.1 (family index) x

Logical form (Lean):

```lean
theorem CountableIntersectionMembership
    [Membership Element SetObject]
    [HasCountableUnion SetObject] [HasCountableIntersection SetObject]
    [CountableMembershipLaws Element SetObject]
    (family : Nat → SetObject) (x : Element) :
    x ∈ HasCountableIntersection.countableIntersection family ↔
      ∀ index, x ∈ family index
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem CountableIntersectionMembership
    [Membership Element SetObject]
    [HasCountableUnion SetObject] [HasCountableIntersection SetObject]
    [CountableMembershipLaws Element SetObject]
    (family : Nat → SetObject) (x : Element) :
    x ∈ HasCountableIntersection.countableIntersection family ↔
      ∀ index, x ∈ family index := by
  sorry

end Wrappers

end LRA.Set
