import LRA.Order.Bounds.BoundedBelow.Definition
import LRA.Order.Bounds.LowerBound.Theorems
import LRA.Set.Interface.Laws.Membership
import LRA.Relation.Interface.Laws.Definition

namespace LRA.Order

open scoped LRA.Set

universe u v

/--
`BoundedBelowOfSubcollection` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : LRA.Relation.Endorelation Element} {smaller larger : SetObject}, ((∀ (element : Element), element ∈ smaller → element ∈ larger) ∧ LRA.Order.BoundedBelow relation larger) → LRA.Order.BoundedBelow relation smaller

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    smaller larger : SetObject
    largerIsBoundedBelow : BoundedBelow relation larger
  Prove
    ((∀ (element : Element), inst.1 smaller element → inst.1 larger element) ∧ (Exists fun bound => ∀ (element : Element), inst.1 larger element → relation bound element)) → Exists fun bound => ∀ (element : Element), inst.1 smaller element → relation bound element

Logical form (Lean):

```lean
theorem BoundedBelowOfSubcollection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject}
    (smallerIsContained : forall element, element ∈ smaller -> element ∈ larger)
    (largerIsBoundedBelow : BoundedBelow relation larger) :
    BoundedBelow relation smaller
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
theorem BoundedBelowOfSubcollection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject}
    (smallerIsContained : forall element, element ∈ smaller -> element ∈ larger)
    (largerIsBoundedBelow : BoundedBelow relation larger) :
    BoundedBelow relation smaller := by
  sorry
/--
`UnionBoundedBelowIffPiecesBoundedBelow` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : LRA.Relation.Endorelation Element}, (LRA.Relation.Transitive relation ∧ LRA.Relation.Total relation) → ∀ (leftSubset rightSubset : SetObject), LRA.Order.BoundedBelow relation (leftSubset ∪ rightSubset) ↔ (LRA.Order.BoundedBelow relation leftSubset ∧ LRA.Order.BoundedBelow relation rightSubset)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    relationIsTransitive : LRA.Relation.Transitive relation
    relationIsTotal : LRA.Relation.Total relation
    leftSubset rightSubset : SetObject
  Prove
    LRA.Set.MembershipLaws Element SetObject → ∀ {relation : LRA.Relation.Endorelation Element}, (LRA.Relation.Transitive relation ∧ LRA.Relation.Total relation) → ∀ (leftSubset rightSubset : SetObject), LRA.Order.BoundedBelow relation (leftSubset ∪ rightSubset) ↔ (LRA.Order.BoundedBelow relation leftSubset ∧ LRA.Order.BoundedBelow relation rightSubset)

Logical form (Lean):

```lean
theorem UnionBoundedBelowIffPiecesBoundedBelow
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    (relationIsTotal : LRA.Relation.Total relation)
    (leftSubset rightSubset : SetObject) :
    BoundedBelow relation (leftSubset ∪ rightSubset) ↔
      BoundedBelow relation leftSubset /\
        BoundedBelow relation rightSubset
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
theorem UnionBoundedBelowIffPiecesBoundedBelow
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    (relationIsTotal : LRA.Relation.Total relation)
    (leftSubset rightSubset : SetObject) :
    BoundedBelow relation (leftSubset ∪ rightSubset) ↔
      BoundedBelow relation leftSubset /\
        BoundedBelow relation rightSubset := by
  sorry
/--
`IntersectionBoundedBelow` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : LRA.Relation.Endorelation Element} (leftSubset rightSubset : SetObject), Or (LRA.Order.BoundedBelow relation leftSubset) (LRA.Order.BoundedBelow relation rightSubset) → LRA.Order.BoundedBelow relation (leftSubset ∩ rightSubset)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    leftSubset rightSubset : SetObject
  Prove
    LRA.Set.MembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop} (leftSubset rightSubset : SetObject), Or (Exists fun bound => ∀ (element : Element), inst.1 leftSubset element → relation bound element) (Exists fun bound => ∀ (element : Element), inst.1 rightSubset element → relation bound element) → Exists fun bound => ∀ (element : Element), inst.1 (inst_2.1 leftSubset rightSubset) element → relation bound element

Logical form (Lean):

```lean
theorem IntersectionBoundedBelow
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (leftSubset rightSubset : SetObject)
    (eitherIsBoundedBelow :
      BoundedBelow relation leftSubset \/
        BoundedBelow relation rightSubset) :
    BoundedBelow relation (leftSubset ∩ rightSubset)
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
theorem IntersectionBoundedBelow
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (leftSubset rightSubset : SetObject)
    (eitherIsBoundedBelow :
      BoundedBelow relation leftSubset \/
        BoundedBelow relation rightSubset) :
    BoundedBelow relation (leftSubset ∩ rightSubset) := by
  sorry
/--
`DifferenceBoundedBelow` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : LRA.Relation.Endorelation Element} (subset removed : SetObject), LRA.Order.BoundedBelow relation subset → LRA.Order.BoundedBelow relation (subset \ removed)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    subset removed : SetObject
    subsetIsBoundedBelow : BoundedBelow relation subset
  Prove
    LRA.Set.MembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop} (subset removed : SetObject), (Exists fun bound => ∀ (element : Element), inst.1 subset element → relation bound element) → Exists fun bound => ∀ (element : Element), inst.1 (inst_3.1 subset removed) element → relation bound element

Logical form (Lean):

```lean
theorem DifferenceBoundedBelow
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (subset removed : SetObject)
    (subsetIsBoundedBelow : BoundedBelow relation subset) :
    BoundedBelow relation (subset \ removed)
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
theorem DifferenceBoundedBelow
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (subset removed : SetObject)
    (subsetIsBoundedBelow : BoundedBelow relation subset) :
    BoundedBelow relation (subset \ removed) := by
  sorry
/--
`SymmetricDifferenceBoundedBelow` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSymmDiff SetObject] [inst_2 : Union SetObject] [inst_3 : Inter SetObject] [inst_4 : SDiff SetObject] [inst_5 : EmptyCollection SetObject] [inst_6 : HasSubset SetObject], (LRA.Set.MembershipLaws Element SetObject ∧ LRA.Set.SymmDiffMembershipLaws Element SetObject) → ∀ {relation : LRA.Relation.Endorelation Element} (leftSubset rightSubset : SetObject), (LRA.Order.BoundedBelow relation leftSubset ∧ LRA.Order.BoundedBelow relation rightSubset) → LRA.Order.BoundedBelow relation (inst_1.symmDiff leftSubset rightSubset)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    leftSubset rightSubset : SetObject
    leftIsBoundedBelow : BoundedBelow relation leftSubset
    rightIsBoundedBelow : BoundedBelow relation rightSubset
  Prove
    (LRA.Set.MembershipLaws Element SetObject ∧ LRA.Set.SymmDiffMembershipLaws Element SetObject) → ∀ {relation : Element → Element → Prop} (leftSubset rightSubset : SetObject), ((Exists fun bound => ∀ (element : Element), inst.1 leftSubset element → relation bound element) ∧ (Exists fun bound => ∀ (element : Element), inst.1 rightSubset element → relation bound element)) → Exists fun bound => ∀ (element : Element), inst.1 (inst_1.1 leftSubset rightSubset) element → relation bound element

Logical form (Lean):

```lean
theorem SymmetricDifferenceBoundedBelow
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [LRA.Set.HasSymmDiff SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    [LRA.Set.SymmDiffMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (leftSubset rightSubset : SetObject)
    (leftIsBoundedBelow : BoundedBelow relation leftSubset)
    (rightIsBoundedBelow : BoundedBelow relation rightSubset) :
    BoundedBelow relation (leftSubset ∆ rightSubset)
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
theorem SymmetricDifferenceBoundedBelow
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [LRA.Set.HasSymmDiff SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    [LRA.Set.SymmDiffMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (leftSubset rightSubset : SetObject)
    (leftIsBoundedBelow : BoundedBelow relation leftSubset)
    (rightIsBoundedBelow : BoundedBelow relation rightSubset) :
    BoundedBelow relation (leftSubset ∆ rightSubset) := by
  sorry
end LRA.Order
