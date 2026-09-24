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

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasIndexedUnion SetObject] [inst_2 : LRA.Set.HasIndexedIntersection SetObject], LRA.Set.IndexedMembershipLaws Element SetObject → ∀ {Index : Type w} (family : Index → SetObject) (x : Element), x ∈ inst_1.indexedUnion family ↔ Exists fun index => x ∈ family index

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, Index, ∈)
  Objects
    family : Index → SetObject
    x : Element
  Prove
    LRA.Set.IndexedMembershipLaws Element SetObject → ∀ {Index : Type w} (family : Index → SetObject) (x : Element), x ∈ inst_1.indexedUnion family ↔ Exists fun index => x ∈ family index

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
  constructor
  · intro h_x_in_union
    have indexed_union_membership_iff :=
      IndexedMembershipLaws.IndexedUnionMembership family x
    exact indexed_union_membership_iff.mp h_x_in_union
  · intro h_exists_index
    have indexed_union_membership_iff :=
      IndexedMembershipLaws.IndexedUnionMembership family x
    exact indexed_union_membership_iff.mpr h_exists_index


/--
`IndexedIntersectionMembership` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasIndexedUnion SetObject] [inst_2 : LRA.Set.HasIndexedIntersection SetObject], LRA.Set.IndexedMembershipLaws Element SetObject → ∀ {Index : Type w} (family : Index → SetObject) (x : Element), x ∈ inst_2.indexedIntersection family ↔ ∀ (index : Index), x ∈ family index

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, Index, ∈)
  Objects
    family : Index → SetObject
    x : Element
  Prove
    LRA.Set.IndexedMembershipLaws Element SetObject → ∀ {Index : Type w} (family : Index → SetObject) (x : Element), x ∈ inst_2.indexedIntersection family ↔ ∀ (index : Index), x ∈ family index

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

  constructor
  . --
    intro h_x_in_indexed_intersection
    have indexed_intersection_membership_iff :=
      IndexedMembershipLaws.IndexedIntersectionMembership family x
    --intro uindex
    exact indexed_intersection_membership_iff.mp h_x_in_indexed_intersection
  . --
    have indexed_intersection_membership_iff :=
      IndexedMembershipLaws.IndexedIntersectionMembership family x

    exact indexed_intersection_membership_iff.symm.mp

/--
`CountableUnionMembership` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasCountableUnion SetObject] [inst_2 : LRA.Set.HasCountableIntersection SetObject], LRA.Set.CountableMembershipLaws Element SetObject → ∀ (family : Nat → SetObject) (x : Element), x ∈ inst_1.countableUnion family ↔ Exists fun index => x ∈ family index

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    family : Nat → SetObject
    x : Element
  Prove
    LRA.Set.CountableMembershipLaws Element SetObject → ∀ (family : Nat → SetObject) (x : Element), x ∈ inst_1.countableUnion family ↔ Exists fun index => x ∈ family index

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
  constructor
  . --
    intro h_x_in_countable_union
    exact (CountableMembershipLaws.CountableUnionMembership family x).mp
      h_x_in_countable_union
  . --
    intro h_exists_index
    exact (CountableMembershipLaws.CountableUnionMembership family x).mpr
      h_exists_index

/--
`CountableIntersectionMembership` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasCountableUnion SetObject] [inst_2 : LRA.Set.HasCountableIntersection SetObject], LRA.Set.CountableMembershipLaws Element SetObject → ∀ (family : Nat → SetObject) (x : Element), x ∈ inst_2.countableIntersection family ↔ ∀ (index : Nat), x ∈ family index

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    family : Nat → SetObject
    x : Element
  Prove
    LRA.Set.CountableMembershipLaws Element SetObject → ∀ (family : Nat → SetObject) (x : Element), x ∈ inst_2.countableIntersection family ↔ ∀ (index : Nat), x ∈ family index

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
  constructor
  . --
    intro h_has_countable_int
    have h_has_countable_int_iff := CountableMembershipLaws.CountableIntersectionMembership family
    rw [← h_has_countable_int_iff]
    exact h_has_countable_int
  . --
    intro h_x_in_index
    have h_has_countable_int_iff := CountableMembershipLaws.CountableIntersectionMembership family
    rw [h_has_countable_int_iff]
    exact h_x_in_index


end Wrappers

end LRA.Set
