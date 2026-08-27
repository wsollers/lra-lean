import LRA.Order.Bounds.BoundSets.Theorems
import LRA.Set.Interface.Laws.Indexed

namespace LRA.Order

open LRA.Set

universe u v w

section IndexedBoundSets

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [Union SetObject] [Inter SetObject] [SDiff SetObject]
variable [EmptyCollection SetObject] [HasSubset SetObject]
variable [HasSeparation Element SetObject]
variable [HasUniversal SetObject] [HasComplement SetObject]
variable [HasIndexedUnion SetObject] [HasIndexedIntersection SetObject]
variable [MembershipLaws Element SetObject]
variable [SeparationLaws Element SetObject]
variable [UniversalMembershipLaws Element SetObject]
variable [IndexedMembershipLaws Element SetObject]
variable [ExtensionalityLaw Element SetObject]
variable [SubsetLaws SetObject]

/--
`UpperBoundsOfIndexedUnion` TODO

Predicate logic:

  UpperBounds relation (HasIndexedUnion.indexedUnion family) = HasIndexedIntersection.indexedIntersection (fun index => UpperBounds relation (family index))

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject] [inst_6 : LRA.Set.HasSeparation Element SetObject] [inst_7 : LRA.Set.HasUniversal SetObject] [inst_8 : LRA.Set.HasComplement SetObject] [inst_9 : LRA.Set.HasIndexedUnion SetObject] [inst_10 : LRA.Set.HasIndexedIntersection SetObject], (LRA.Set.MembershipLaws Element SetObject ∧ (LRA.Set.SeparationLaws Element SetObject ∧ (LRA.Set.UniversalMembershipLaws Element SetObject ∧ (LRA.Set.IndexedMembershipLaws Element SetObject ∧ (LRA.Set.ExtensionalityLaw Element SetObject ∧ LRA.Set.SubsetLaws SetObject))))) → ∀ {Index : Type w} (relation : Element → Element → Prop) (family : Index → SetObject), inst_6.1 inst_7.1 fun bound => ∀ (element : Element), inst.1 (inst_9.1 family) element → relation element bound = inst_10.1 fun index => inst_6.1 inst_7.1 fun bound => ∀ (element : Element), inst.1 (family index) element → relation element bound

Logical form (Lean):

```lean
theorem UpperBoundsOfIndexedUnion
    {Index : Type w}
    (relation : LRA.Relation.Endorelation Element)
    (family : Index -> SetObject) :
    UpperBounds relation (HasIndexedUnion.indexedUnion family) =
      HasIndexedIntersection.indexedIntersection
        (fun index => UpperBounds relation (family index))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem UpperBoundsOfIndexedUnion
    {Index : Type w}
    (relation : LRA.Relation.Endorelation Element)
    (family : Index -> SetObject) :
    UpperBounds relation (HasIndexedUnion.indexedUnion family) =
      HasIndexedIntersection.indexedIntersection
        (fun index => UpperBounds relation (family index)) := by
  sorry

/--
`LowerBoundsOfIndexedUnion` TODO

Predicate logic:

  LowerBounds relation (HasIndexedUnion.indexedUnion family) = HasIndexedIntersection.indexedIntersection (fun index => LowerBounds relation (family index))

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject] [inst_6 : LRA.Set.HasSeparation Element SetObject] [inst_7 : LRA.Set.HasUniversal SetObject] [inst_8 : LRA.Set.HasComplement SetObject] [inst_9 : LRA.Set.HasIndexedUnion SetObject] [inst_10 : LRA.Set.HasIndexedIntersection SetObject], (LRA.Set.MembershipLaws Element SetObject ∧ (LRA.Set.SeparationLaws Element SetObject ∧ (LRA.Set.UniversalMembershipLaws Element SetObject ∧ (LRA.Set.IndexedMembershipLaws Element SetObject ∧ (LRA.Set.ExtensionalityLaw Element SetObject ∧ LRA.Set.SubsetLaws SetObject))))) → ∀ {Index : Type w} (relation : Element → Element → Prop) (family : Index → SetObject), inst_6.1 inst_7.1 fun bound => ∀ (element : Element), inst.1 (inst_9.1 family) element → relation bound element = inst_10.1 fun index => inst_6.1 inst_7.1 fun bound => ∀ (element : Element), inst.1 (family index) element → relation bound element

Logical form (Lean):

```lean
theorem LowerBoundsOfIndexedUnion
    {Index : Type w}
    (relation : LRA.Relation.Endorelation Element)
    (family : Index -> SetObject) :
    LowerBounds relation (HasIndexedUnion.indexedUnion family) =
      HasIndexedIntersection.indexedIntersection
        (fun index => LowerBounds relation (family index))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem LowerBoundsOfIndexedUnion
    {Index : Type w}
    (relation : LRA.Relation.Endorelation Element)
    (family : Index -> SetObject) :
    LowerBounds relation (HasIndexedUnion.indexedUnion family) =
      HasIndexedIntersection.indexedIntersection
        (fun index => LowerBounds relation (family index)) := by
  sorry

/--
`IndexedUnionOfUpperBoundsContainedInUpperBoundsOfIntersection` TODO

Predicate logic:

  HasIndexedUnion.indexedUnion (fun index => UpperBounds relation (family index)) ⊆ UpperBounds relation (HasIndexedIntersection.indexedIntersection family)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject] [inst_6 : LRA.Set.HasSeparation Element SetObject] [inst_7 : LRA.Set.HasUniversal SetObject] [inst_8 : LRA.Set.HasComplement SetObject] [inst_9 : LRA.Set.HasIndexedUnion SetObject] [inst_10 : LRA.Set.HasIndexedIntersection SetObject], (LRA.Set.MembershipLaws Element SetObject ∧ (LRA.Set.SeparationLaws Element SetObject ∧ (LRA.Set.UniversalMembershipLaws Element SetObject ∧ (LRA.Set.IndexedMembershipLaws Element SetObject ∧ (LRA.Set.ExtensionalityLaw Element SetObject ∧ LRA.Set.SubsetLaws SetObject))))) → ∀ {Index : Type w} (relation : Element → Element → Prop) (family : Index → SetObject), inst_5.1 (inst_9.1 fun index => inst_6.1 inst_7.1 fun bound => ∀ (element : Element), inst.1 (family index) element → relation element bound) (inst_6.1 inst_7.1 fun bound => ∀ (element : Element), inst.1 (inst_10.1 family) element → relation element bound)

Logical form (Lean):

```lean
theorem IndexedUnionOfUpperBoundsContainedInUpperBoundsOfIntersection
    {Index : Type w}
    (relation : LRA.Relation.Endorelation Element)
    (family : Index -> SetObject) :
    HasIndexedUnion.indexedUnion
        (fun index => UpperBounds relation (family index)) ⊆
      UpperBounds relation
        (HasIndexedIntersection.indexedIntersection family)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem IndexedUnionOfUpperBoundsContainedInUpperBoundsOfIntersection
    {Index : Type w}
    (relation : LRA.Relation.Endorelation Element)
    (family : Index -> SetObject) :
    HasIndexedUnion.indexedUnion
        (fun index => UpperBounds relation (family index)) ⊆
      UpperBounds relation
        (HasIndexedIntersection.indexedIntersection family) := by
  sorry

/--
`IndexedUnionOfLowerBoundsContainedInLowerBoundsOfIntersection` TODO

Predicate logic:

  HasIndexedUnion.indexedUnion (fun index => LowerBounds relation (family index)) ⊆ LowerBounds relation (HasIndexedIntersection.indexedIntersection family)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject] [inst_6 : LRA.Set.HasSeparation Element SetObject] [inst_7 : LRA.Set.HasUniversal SetObject] [inst_8 : LRA.Set.HasComplement SetObject] [inst_9 : LRA.Set.HasIndexedUnion SetObject] [inst_10 : LRA.Set.HasIndexedIntersection SetObject], (LRA.Set.MembershipLaws Element SetObject ∧ (LRA.Set.SeparationLaws Element SetObject ∧ (LRA.Set.UniversalMembershipLaws Element SetObject ∧ (LRA.Set.IndexedMembershipLaws Element SetObject ∧ (LRA.Set.ExtensionalityLaw Element SetObject ∧ LRA.Set.SubsetLaws SetObject))))) → ∀ {Index : Type w} (relation : Element → Element → Prop) (family : Index → SetObject), inst_5.1 (inst_9.1 fun index => inst_6.1 inst_7.1 fun bound => ∀ (element : Element), inst.1 (family index) element → relation bound element) (inst_6.1 inst_7.1 fun bound => ∀ (element : Element), inst.1 (inst_10.1 family) element → relation bound element)

Logical form (Lean):

```lean
theorem IndexedUnionOfLowerBoundsContainedInLowerBoundsOfIntersection
    {Index : Type w}
    (relation : LRA.Relation.Endorelation Element)
    (family : Index -> SetObject) :
    HasIndexedUnion.indexedUnion
        (fun index => LowerBounds relation (family index)) ⊆
      LowerBounds relation
        (HasIndexedIntersection.indexedIntersection family)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem IndexedUnionOfLowerBoundsContainedInLowerBoundsOfIntersection
    {Index : Type w}
    (relation : LRA.Relation.Endorelation Element)
    (family : Index -> SetObject) :
    HasIndexedUnion.indexedUnion
        (fun index => LowerBounds relation (family index)) ⊆
      LowerBounds relation
        (HasIndexedIntersection.indexedIntersection family) := by
  sorry

end IndexedBoundSets

end LRA.Order
