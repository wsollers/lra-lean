import LRA.Order.Bounds.UpperBound.Definition
import LRA.Set.Interface.Laws.Indexed
import LRA.Set.Interface.Laws.Membership

namespace LRA.Order

open scoped LRA.Set

universe u v w

/--
`UpperBoundOfEmpty` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ (relation : LRA.Relation.Endorelation Element) (bound : Element), LRA.Order.UpperBound relation inst_4.emptyCollection bound

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    bound : Element
  Prove
    LRA.Set.MembershipLaws Element SetObject → ∀ (relation : Element → Element → Prop) (bound element : Element), inst.1 inst_4.1 element → relation element bound

Logical form (Lean):

```lean
theorem UpperBoundOfEmpty
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (bound : Element) :
    UpperBound relation (∅ : SetObject) bound
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
theorem UpperBoundOfEmpty
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (bound : Element) :
    UpperBound relation (∅ : SetObject) bound := by
  sorry
/--
`UpperBoundOfSubcollection` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : LRA.Relation.Endorelation Element} {smaller larger : SetObject} {bound : Element}, ((∀ (element : Element), element ∈ smaller → element ∈ larger) ∧ LRA.Order.UpperBound relation larger bound) → LRA.Order.UpperBound relation smaller bound

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    smaller larger : SetObject
    bound : Element
    boundIsUpperForLarger : UpperBound relation larger bound
  Prove
    ((∀ (element : Element), inst.1 smaller element → inst.1 larger element) ∧ (∀ (element : Element), inst.1 larger element → relation element bound)) → ∀ (element : Element), inst.1 smaller element → relation element bound

Logical form (Lean):

```lean
theorem UpperBoundOfSubcollection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject} {bound : Element}
    (smallerIsContained : forall element, element ∈ smaller -> element ∈ larger)
    (boundIsUpperForLarger : UpperBound relation larger bound) :
    UpperBound relation smaller bound
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
theorem UpperBoundOfSubcollection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject} {bound : Element}
    (smallerIsContained : forall element, element ∈ smaller -> element ∈ larger)
    (boundIsUpperForLarger : UpperBound relation larger bound) :
    UpperBound relation smaller bound := by
  sorry
/--
`UpperBoundOfUnion` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : LRA.Relation.Endorelation Element} {leftSubset rightSubset : SetObject} {bound : Element}, (LRA.Order.UpperBound relation leftSubset bound ∧ LRA.Order.UpperBound relation rightSubset bound) → LRA.Order.UpperBound relation (leftSubset ∪ rightSubset)bound

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    leftSubset rightSubset : SetObject
    bound : Element
    boundIsUpperForLeft : UpperBound relation leftSubset bound
    boundIsUpperForRight : UpperBound relation rightSubset bound
  Prove
    LRA.Set.MembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop} {leftSubset rightSubset : SetObject} {bound : Element}, ((∀ (element : Element), inst.1 leftSubset element → relation element bound) ∧ (∀ (element : Element), inst.1 rightSubset element → relation element bound)) → ∀ (element : Element), inst.1 (inst_1.1 leftSubset rightSubset) element → relation element bound

Logical form (Lean):

```lean
theorem UpperBoundOfUnion
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {bound : Element}
    (boundIsUpperForLeft : UpperBound relation leftSubset bound)
    (boundIsUpperForRight : UpperBound relation rightSubset bound) :
    UpperBound relation (leftSubset ∪ rightSubset) bound
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
theorem UpperBoundOfUnion
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {bound : Element}
    (boundIsUpperForLeft : UpperBound relation leftSubset bound)
    (boundIsUpperForRight : UpperBound relation rightSubset bound) :
    UpperBound relation (leftSubset ∪ rightSubset) bound := by
  sorry
/--
`UpperBoundOfUnionIff` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : LRA.Relation.Endorelation Element} {leftSubset rightSubset : SetObject} {bound : Element}, LRA.Order.UpperBound relation (leftSubset ∪ rightSubset)bound ↔ (LRA.Order.UpperBound relation leftSubset bound ∧ LRA.Order.UpperBound relation rightSubset bound)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    leftSubset rightSubset : SetObject
    bound : Element
  Prove
    LRA.Set.MembershipLaws Element SetObject → ∀ {relation : LRA.Relation.Endorelation Element} {leftSubset rightSubset : SetObject} {bound : Element}, LRA.Order.UpperBound relation (leftSubset ∪ rightSubset)bound ↔ (LRA.Order.UpperBound relation leftSubset bound ∧ LRA.Order.UpperBound relation rightSubset bound)

Logical form (Lean):

```lean
theorem UpperBoundOfUnionIff
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {bound : Element} :
    UpperBound relation (leftSubset ∪ rightSubset) bound ↔
      UpperBound relation leftSubset bound /\
        UpperBound relation rightSubset bound
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
theorem UpperBoundOfUnionIff
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {bound : Element} :
    UpperBound relation (leftSubset ∪ rightSubset) bound ↔
      UpperBound relation leftSubset bound /\
        UpperBound relation rightSubset bound := by
  sorry
/--
`UpperBoundOfIntersection` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : LRA.Relation.Endorelation Element} {leftSubset rightSubset : SetObject} {bound : Element}, Or (LRA.Order.UpperBound relation leftSubset bound) (LRA.Order.UpperBound relation rightSubset bound) → LRA.Order.UpperBound relation (leftSubset ∩ rightSubset)bound

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    leftSubset rightSubset : SetObject
    bound : Element
  Prove
    LRA.Set.MembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop} {leftSubset rightSubset : SetObject} {bound : Element}, Or (∀ (element : Element), inst.1 leftSubset element → relation element bound) (∀ (element : Element), inst.1 rightSubset element → relation element bound) → ∀ (element : Element), inst.1 (inst_2.1 leftSubset rightSubset) element → relation element bound

Logical form (Lean):

```lean
theorem UpperBoundOfIntersection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {bound : Element}
    (boundIsUpperForEither :
      UpperBound relation leftSubset bound \/
        UpperBound relation rightSubset bound) :
    UpperBound relation (leftSubset ∩ rightSubset) bound
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
theorem UpperBoundOfIntersection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {bound : Element}
    (boundIsUpperForEither :
      UpperBound relation leftSubset bound \/
        UpperBound relation rightSubset bound) :
    UpperBound relation (leftSubset ∩ rightSubset) bound := by
  sorry
/--
`UpperBoundOfDifference` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : LRA.Relation.Endorelation Element} {subset removed : SetObject} {bound : Element}, LRA.Order.UpperBound relation subset bound → LRA.Order.UpperBound relation (subset \ removed)bound

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    subset removed : SetObject
    bound : Element
    boundIsUpperForSubset : UpperBound relation subset bound
  Prove
    LRA.Set.MembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop} {subset removed : SetObject} {bound : Element}, (∀ (element : Element), inst.1 subset element → relation element bound) → ∀ (element : Element), inst.1 (inst_3.1 subset removed) element → relation element bound

Logical form (Lean):

```lean
theorem UpperBoundOfDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset removed : SetObject} {bound : Element}
    (boundIsUpperForSubset : UpperBound relation subset bound) :
    UpperBound relation (subset \ removed) bound
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
theorem UpperBoundOfDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset removed : SetObject} {bound : Element}
    (boundIsUpperForSubset : UpperBound relation subset bound) :
    UpperBound relation (subset \ removed) bound := by
  sorry
/--
`UpperBoundOfSymmetricDifference` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSymmDiff SetObject] [inst_2 : Union SetObject] [inst_3 : Inter SetObject] [inst_4 : SDiff SetObject] [inst_5 : EmptyCollection SetObject] [inst_6 : HasSubset SetObject], (LRA.Set.MembershipLaws Element SetObject ∧ LRA.Set.SymmDiffMembershipLaws Element SetObject) → ∀ {relation : LRA.Relation.Endorelation Element} {leftSubset rightSubset : SetObject} {bound : Element}, (LRA.Order.UpperBound relation leftSubset bound ∧ LRA.Order.UpperBound relation rightSubset bound) → LRA.Order.UpperBound relation (inst_1.symmDiff leftSubset rightSubset) bound

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    leftSubset rightSubset : SetObject
    bound : Element
    boundIsUpperForLeft : UpperBound relation leftSubset bound
    boundIsUpperForRight : UpperBound relation rightSubset bound
  Prove
    (LRA.Set.MembershipLaws Element SetObject ∧ LRA.Set.SymmDiffMembershipLaws Element SetObject) → ∀ {relation : Element → Element → Prop} {leftSubset rightSubset : SetObject} {bound : Element}, ((∀ (element : Element), inst.1 leftSubset element → relation element bound) ∧ (∀ (element : Element), inst.1 rightSubset element → relation element bound)) → ∀ (element : Element), inst.1 (inst_1.1 leftSubset rightSubset) element → relation element bound

Logical form (Lean):

```lean
theorem UpperBoundOfSymmetricDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [LRA.Set.HasSymmDiff SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    [LRA.Set.SymmDiffMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {bound : Element}
    (boundIsUpperForLeft : UpperBound relation leftSubset bound)
    (boundIsUpperForRight : UpperBound relation rightSubset bound) :
    UpperBound relation (leftSubset ∆ rightSubset) bound
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
theorem UpperBoundOfSymmetricDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [LRA.Set.HasSymmDiff SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    [LRA.Set.SymmDiffMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {bound : Element}
    (boundIsUpperForLeft : UpperBound relation leftSubset bound)
    (boundIsUpperForRight : UpperBound relation rightSubset bound) :
    UpperBound relation (leftSubset ∆ rightSubset) bound := by
  sorry
/--
`UpperBoundOfIndexedUnionIff` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} {Index : Type w} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasIndexedUnion SetObject] [inst_2 : LRA.Set.HasIndexedIntersection SetObject], LRA.Set.IndexedMembershipLaws Element SetObject → ∀ {relation : LRA.Relation.Endorelation Element} {family : Index → SetObject} {bound : Element}, LRA.Order.UpperBound relation (inst_1.indexedUnion family) bound ↔ ∀ (index : Index), LRA.Order.UpperBound relation (family index) bound

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, Index, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    family : Index -> SetObject
    bound : Element
  Prove
    LRA.Set.IndexedMembershipLaws Element SetObject → ∀ {relation : LRA.Relation.Endorelation Element} {family : Index → SetObject} {bound : Element}, LRA.Order.UpperBound relation (inst_1.indexedUnion family) bound ↔ ∀ (index : Index), LRA.Order.UpperBound relation (family index) bound

Logical form (Lean):

```lean
theorem UpperBoundOfIndexedUnionIff
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [LRA.Set.HasIndexedUnion SetObject]
    [LRA.Set.HasIndexedIntersection SetObject]
    [LRA.Set.IndexedMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {family : Index -> SetObject} {bound : Element} :
    UpperBound relation (LRA.Set.HasIndexedUnion.indexedUnion family) bound ↔
      forall index, UpperBound relation (family index) bound
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
theorem UpperBoundOfIndexedUnionIff
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [LRA.Set.HasIndexedUnion SetObject]
    [LRA.Set.HasIndexedIntersection SetObject]
    [LRA.Set.IndexedMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {family : Index -> SetObject} {bound : Element} :
    UpperBound relation (LRA.Set.HasIndexedUnion.indexedUnion family) bound ↔
      forall index, UpperBound relation (family index) bound := by
  sorry
/--
`UpperBoundOfIndexedIntersection` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} {Index : Type w} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasIndexedUnion SetObject] [inst_2 : LRA.Set.HasIndexedIntersection SetObject], LRA.Set.IndexedMembershipLaws Element SetObject → ∀ {relation : LRA.Relation.Endorelation Element} {family : Index → SetObject} (index : Index) {bound : Element}, LRA.Order.UpperBound relation (family index) bound → LRA.Order.UpperBound relation (inst_2.indexedIntersection family) bound

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, Index, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    family : Index -> SetObject
    index : Index
    bound : Element
    boundIsUpperForMember : UpperBound relation (family index) bound
  Prove
    LRA.Set.IndexedMembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop} {family : Index → SetObject} (index : Index) {bound : Element}, (∀ (element : Element), inst.1 (family index) element → relation element bound) → ∀ (element : Element), inst.1 (inst_2.1 family) element → relation element bound

Logical form (Lean):

```lean
theorem UpperBoundOfIndexedIntersection
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [LRA.Set.HasIndexedUnion SetObject]
    [LRA.Set.HasIndexedIntersection SetObject]
    [LRA.Set.IndexedMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {family : Index -> SetObject} (index : Index) {bound : Element}
    (boundIsUpperForMember : UpperBound relation (family index) bound) :
    UpperBound relation
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
theorem UpperBoundOfIndexedIntersection
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [LRA.Set.HasIndexedUnion SetObject]
    [LRA.Set.HasIndexedIntersection SetObject]
    [LRA.Set.IndexedMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {family : Index -> SetObject} (index : Index) {bound : Element}
    (boundIsUpperForMember : UpperBound relation (family index) bound) :
    UpperBound relation
      (LRA.Set.HasIndexedIntersection.indexedIntersection family) bound := by
  sorry
end LRA.Order
