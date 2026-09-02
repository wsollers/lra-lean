import LRA.Order.Bounds.LowerBound.Definition
import LRA.Set.Interface.Laws.Indexed
import LRA.Set.Interface.Laws.Membership

namespace LRA.Order

open scoped LRA.Set

universe u v w

/--
`LowerBoundOfEmpty` TODO

Predicate logic:

  (∀ x ∈ Element), LowerBound relation ∅ ∈ SetObject x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ (relation : Element → Element → Prop) (bound element : Element), inst.1 inst_4.1 element → relation bound element

Logical form (Lean):

```lean
theorem LowerBoundOfEmpty
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (bound : Element) :
    LowerBound relation (∅ : SetObject) bound
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
theorem LowerBoundOfEmpty
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (bound : Element) :
    LowerBound relation (∅ : SetObject) bound := by
  sorry
/--
`LowerBoundOfSubcollection` TODO

Predicate logic:

  (∀ A B ∈ U ∀ x ∈ Element), (forall element, element ∈ A -> element ∈ B) → LowerBound relation A x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : Element → Element → Prop} {smaller larger : SetObject} {bound : Element}, (∀ (element : Element), inst.1 smaller element → inst.1 larger element ∧ ∀ (element : Element), inst.1 larger element → relation bound element) → ∀ (element : Element), inst.1 smaller element → relation bound element

Logical form (Lean):

```lean
theorem LowerBoundOfSubcollection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject} {bound : Element}
    (smallerIsContained : forall element, element ∈ smaller -> element ∈ larger)
    (boundIsLowerForLarger : LowerBound relation larger bound) :
    LowerBound relation smaller bound
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
theorem LowerBoundOfSubcollection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject} {bound : Element}
    (smallerIsContained : forall element, element ∈ smaller -> element ∈ larger)
    (boundIsLowerForLarger : LowerBound relation larger bound) :
    LowerBound relation smaller bound := by
  sorry
/--
`LowerBoundOfUnion` TODO

Predicate logic:

  (∀ A B ∈ U ∀ x ∈ Element), LowerBound relation (A ∪ B) x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop} {leftSubset rightSubset : SetObject} {bound : Element}, (∀ (element : Element), inst.1 leftSubset element → relation bound element ∧ ∀ (element : Element), inst.1 rightSubset element → relation bound element) → ∀ (element : Element), inst.1 (inst_1.1 leftSubset rightSubset) element → relation bound element

Logical form (Lean):

```lean
theorem LowerBoundOfUnion
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {bound : Element}
    (boundIsLowerForLeft : LowerBound relation leftSubset bound)
    (boundIsLowerForRight : LowerBound relation rightSubset bound) :
    LowerBound relation (leftSubset ∪ rightSubset) bound
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
theorem LowerBoundOfUnion
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {bound : Element}
    (boundIsLowerForLeft : LowerBound relation leftSubset bound)
    (boundIsLowerForRight : LowerBound relation rightSubset bound) :
    LowerBound relation (leftSubset ∪ rightSubset) bound := by
  sorry
/--
`LowerBoundOfUnionIff` TODO

Predicate logic:

  (∀ A B ∈ U ∀ x ∈ Element), LowerBound relation (A ∪ B) x ↔ LowerBound relation A x ∧ LowerBound relation B x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop} {leftSubset rightSubset : SetObject} {bound : Element}, ∀ (element : Element), inst.1 (inst_1.1 leftSubset rightSubset) element → relation bound element ↔ (∀ (element : Element), inst.1 leftSubset element → relation bound element ∧ ∀ (element : Element), inst.1 rightSubset element → relation bound element)

Logical form (Lean):

```lean
theorem LowerBoundOfUnionIff
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {bound : Element} :
    LowerBound relation (leftSubset ∪ rightSubset) bound ↔
      LowerBound relation leftSubset bound /\
        LowerBound relation rightSubset bound
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, cases, rcases

-/
theorem LowerBoundOfUnionIff
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {bound : Element} :
    LowerBound relation (leftSubset ∪ rightSubset) bound ↔
      LowerBound relation leftSubset bound /\
        LowerBound relation rightSubset bound := by
  sorry
/--
`LowerBoundOfIntersection` TODO

Predicate logic:

  (∀ A B ∈ U ∀ x ∈ Element), (LowerBound relation A x ∨ LowerBound relation B x) → LowerBound relation (A ∩ B) x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop} {leftSubset rightSubset : SetObject} {bound : Element}, Or (∀ (element : Element), inst.1 leftSubset element → relation bound element) (∀ (element : Element), inst.1 rightSubset element → relation bound element) → ∀ (element : Element), inst.1 (inst_2.1 leftSubset rightSubset) element → relation bound element

Logical form (Lean):

```lean
theorem LowerBoundOfIntersection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {bound : Element}
    (boundIsLowerForEither :
      LowerBound relation leftSubset bound \/
        LowerBound relation rightSubset bound) :
    LowerBound relation (leftSubset ∩ rightSubset) bound
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases

-/
theorem LowerBoundOfIntersection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {bound : Element}
    (boundIsLowerForEither :
      LowerBound relation leftSubset bound \/
        LowerBound relation rightSubset bound) :
    LowerBound relation (leftSubset ∩ rightSubset) bound := by
  sorry
/--
`LowerBoundOfDifference` TODO

Predicate logic:

  (∀ A B ∈ U ∀ x ∈ Element), LowerBound relation (A \ B) x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop} {subset removed : SetObject} {bound : Element}, (∀ (element : Element), inst.1 subset element → relation bound element) → ∀ (element : Element), inst.1 (inst_3.1 subset removed) element → relation bound element

Logical form (Lean):

```lean
theorem LowerBoundOfDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset removed : SetObject} {bound : Element}
    (boundIsLowerForSubset : LowerBound relation subset bound) :
    LowerBound relation (subset \ removed) bound
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
theorem LowerBoundOfDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset removed : SetObject} {bound : Element}
    (boundIsLowerForSubset : LowerBound relation subset bound) :
    LowerBound relation (subset \ removed) bound := by
  sorry
/--
`LowerBoundOfSymmetricDifference` TODO

Predicate logic:

  (∀ A B ∈ U ∀ x ∈ Element), LowerBound relation (A ∆ B) x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSymmDiff SetObject] [inst_2 : Union SetObject] [inst_3 : Inter SetObject] [inst_4 : SDiff SetObject] [inst_5 : EmptyCollection SetObject] [inst_6 : HasSubset SetObject], (LRA.Set.MembershipLaws Element SetObject ∧ LRA.Set.SymmDiffMembershipLaws Element SetObject) → ∀ {relation : Element → Element → Prop} {leftSubset rightSubset : SetObject} {bound : Element}, (∀ (element : Element), inst.1 leftSubset element → relation bound element ∧ ∀ (element : Element), inst.1 rightSubset element → relation bound element) → ∀ (element : Element), inst.1 (inst_1.1 leftSubset rightSubset) element → relation bound element

Logical form (Lean):

```lean
theorem LowerBoundOfSymmetricDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [LRA.Set.HasSymmDiff SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    [LRA.Set.SymmDiffMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {bound : Element}
    (boundIsLowerForLeft : LowerBound relation leftSubset bound)
    (boundIsLowerForRight : LowerBound relation rightSubset bound) :
    LowerBound relation (leftSubset ∆ rightSubset) bound
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
theorem LowerBoundOfSymmetricDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [LRA.Set.HasSymmDiff SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    [LRA.Set.SymmDiffMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {bound : Element}
    (boundIsLowerForLeft : LowerBound relation leftSubset bound)
    (boundIsLowerForRight : LowerBound relation rightSubset bound) :
    LowerBound relation (leftSubset ∆ rightSubset) bound := by
  sorry
/--
`LowerBoundOfIndexedUnionIff` TODO

Predicate logic:

  (∀ x ∈ Element), LowerBound relation (LRA.Set.HasIndexedUnion.indexedUnion family) x ↔ forall index, LowerBound relation (family index) x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} {Index : Type w} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasIndexedUnion SetObject] [inst_2 : LRA.Set.HasIndexedIntersection SetObject], LRA.Set.IndexedMembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop} {family : Index → SetObject} {bound : Element}, ∀ (element : Element), inst.1 (inst_1.1 family) element → relation bound element ↔ ∀ (index : Index) (element : Element), inst.1 (family index) element → relation bound element

Logical form (Lean):

```lean
theorem LowerBoundOfIndexedUnionIff
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [LRA.Set.HasIndexedUnion SetObject]
    [LRA.Set.HasIndexedIntersection SetObject]
    [LRA.Set.IndexedMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {family : Index -> SetObject} {bound : Element} :
    LowerBound relation (LRA.Set.HasIndexedUnion.indexedUnion family) bound ↔
      forall index, LowerBound relation (family index) bound
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
theorem LowerBoundOfIndexedUnionIff
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [LRA.Set.HasIndexedUnion SetObject]
    [LRA.Set.HasIndexedIntersection SetObject]
    [LRA.Set.IndexedMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {family : Index -> SetObject} {bound : Element} :
    LowerBound relation (LRA.Set.HasIndexedUnion.indexedUnion family) bound ↔
      forall index, LowerBound relation (family index) bound := by
  sorry
/--
`LowerBoundOfIndexedIntersection` TODO

Predicate logic:

  (∀ index ∈ Index ∀ x ∈ Element), LowerBound relation (LRA.Set.HasIndexedIntersection.indexedIntersection family) x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} {Index : Type w} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasIndexedUnion SetObject] [inst_2 : LRA.Set.HasIndexedIntersection SetObject], LRA.Set.IndexedMembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop} {family : Index → SetObject} (index : Index) {bound : Element}, (∀ (element : Element), inst.1 (family index) element → relation bound element) → ∀ (element : Element), inst.1 (inst_2.1 family) element → relation bound element

Logical form (Lean):

```lean
theorem LowerBoundOfIndexedIntersection
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [LRA.Set.HasIndexedUnion SetObject]
    [LRA.Set.HasIndexedIntersection SetObject]
    [LRA.Set.IndexedMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {family : Index -> SetObject} (index : Index) {bound : Element}
    (boundIsLowerForMember : LowerBound relation (family index) bound) :
    LowerBound relation
      (LRA.Set.HasIndexedIntersection.indexedIntersection family) bound
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
theorem LowerBoundOfIndexedIntersection
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [LRA.Set.HasIndexedUnion SetObject]
    [LRA.Set.HasIndexedIntersection SetObject]
    [LRA.Set.IndexedMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {family : Index -> SetObject} (index : Index) {bound : Element}
    (boundIsLowerForMember : LowerBound relation (family index) bound) :
    LowerBound relation
      (LRA.Set.HasIndexedIntersection.indexedIntersection family) bound := by
  sorry
end LRA.Order
