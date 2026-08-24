import LRA.Order.Bounds.BoundedBelow.Definition
import LRA.Order.Bounds.LowerBound.Theorems
import LRA.Set.Interface.Membership
import LRA.Relation.Properties.Definition

namespace LRA.Order

open scoped LRA.Set

universe u v

/--
`BoundedBelowOfSubcollection` TODO

Predicate logic:

  (∀ A B ∈ U), (forall element, element ∈ A -> element ∈ B) → BoundedBelow(A)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : Element → Element → Prop} {smaller larger : SetObject}, (∀ (element : Element), inst.1 smaller element → inst.1 larger element ∧ Exists fun bound => ∀ (element : Element), inst.1 larger element → relation bound element) → Exists fun bound => ∀ (element : Element), inst.1 smaller element → relation bound element

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

  (∀ A B ∈ U), BoundedBelow(A ∪ B) ↔ BoundedBelow(A) ∧ BoundedBelow(B)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop}, (∀ (x y z : Element), relation x y → relation y z → relation x z ∧ ∀ (x y : Element), Or (relation x y) (relation y x)) → ∀ (leftSubset rightSubset : SetObject), Exists fun bound => ∀ (element : Element), inst.1 (inst_1.1 leftSubset rightSubset) element → relation bound element ↔ (Exists fun bound => ∀ (element : Element), inst.1 leftSubset element → relation bound element ∧ Exists fun bound => ∀ (element : Element), inst.1 rightSubset element → relation bound element)

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

  (∀ A B ∈ U), (BoundedBelow(A) ∨ BoundedBelow(B)) → BoundedBelow(A ∩ B)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop} (leftSubset rightSubset : SetObject), Or (Exists fun bound => ∀ (element : Element), inst.1 leftSubset element → relation bound element) (Exists fun bound => ∀ (element : Element), inst.1 rightSubset element → relation bound element) → Exists fun bound => ∀ (element : Element), inst.1 (inst_2.1 leftSubset rightSubset) element → relation bound element

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

  (∀ A B ∈ U), BoundedBelow(A \ B)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop} (subset removed : SetObject), (Exists fun bound => ∀ (element : Element), inst.1 subset element → relation bound element) → Exists fun bound => ∀ (element : Element), inst.1 (inst_3.1 subset removed) element → relation bound element

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

  (∀ A B ∈ U), BoundedBelow(A ∆ B)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSymmDiff SetObject] [inst_2 : Union SetObject] [inst_3 : Inter SetObject] [inst_4 : SDiff SetObject] [inst_5 : EmptyCollection SetObject] [inst_6 : HasSubset SetObject], (LRA.Set.MembershipLaws Element SetObject ∧ LRA.Set.SymmDiffMembershipLaws Element SetObject) → ∀ {relation : Element → Element → Prop} (leftSubset rightSubset : SetObject), (Exists fun bound => ∀ (element : Element), inst.1 leftSubset element → relation bound element ∧ Exists fun bound => ∀ (element : Element), inst.1 rightSubset element → relation bound element) → Exists fun bound => ∀ (element : Element), inst.1 (inst_1.1 leftSubset rightSubset) element → relation bound element

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
