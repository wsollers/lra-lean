import LRA.Order.Bounds.BoundedAbove.Definition
import LRA.Order.Bounds.UpperBound.Theorems
import LRA.Set.Interface.Laws.Membership
import LRA.Relation.Properties.Definition

namespace LRA.Order

open scoped LRA.Set

universe u v

/--
`BoundedAboveOfSubcollection` TODO

Predicate logic:

  (∀ A B ∈ U), (forall element, element ∈ A -> element ∈ B) → BoundedAbove(A)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : Element → Element → Prop} {smaller larger : SetObject}, (∀ (element : Element), inst.1 smaller element → inst.1 larger element ∧ Exists fun bound => ∀ (element : Element), inst.1 larger element → relation element bound) → Exists fun bound => ∀ (element : Element), inst.1 smaller element → relation element bound

Logical form (Lean):

```lean
theorem BoundedAboveOfSubcollection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject}
    (smallerIsContained : forall element, element ∈ smaller -> element ∈ larger)
    (largerIsBoundedAbove : BoundedAbove relation larger) :
    BoundedAbove relation smaller
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
theorem BoundedAboveOfSubcollection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject}
    (smallerIsContained : forall element, element ∈ smaller -> element ∈ larger)
    (largerIsBoundedAbove : BoundedAbove relation larger) :
    BoundedAbove relation smaller := by
  sorry

/--
`UnionBoundedAboveIffPiecesBoundedAbove` TODO

Predicate logic:

  (∀ A B ∈ U), BoundedAbove(A ∪ B) ↔ BoundedAbove(A) ∧ BoundedAbove(B)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop}, (∀ (x y z : Element), relation x y → relation y z → relation x z ∧ ∀ (x y : Element), Or (relation x y) (relation y x)) → ∀ (leftSubset rightSubset : SetObject), Exists fun bound => ∀ (element : Element), inst.1 (inst_1.1 leftSubset rightSubset) element → relation element bound ↔ (Exists fun bound => ∀ (element : Element), inst.1 leftSubset element → relation element bound ∧ Exists fun bound => ∀ (element : Element), inst.1 rightSubset element → relation element bound)

Logical form (Lean):

```lean
theorem UnionBoundedAboveIffPiecesBoundedAbove
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    (relationIsTotal : LRA.Relation.Total relation)
    (leftSubset rightSubset : SetObject) :
    BoundedAbove relation (leftSubset ∪ rightSubset) ↔
      BoundedAbove relation leftSubset /\
        BoundedAbove relation rightSubset
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
theorem UnionBoundedAboveIffPiecesBoundedAbove
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    (relationIsTotal : LRA.Relation.Total relation)
    (leftSubset rightSubset : SetObject) :
    BoundedAbove relation (leftSubset ∪ rightSubset) ↔
      BoundedAbove relation leftSubset /\
        BoundedAbove relation rightSubset := by
  sorry

/--
`IntersectionBoundedAbove` TODO

Predicate logic:

  (∀ A B ∈ U), (BoundedAbove(A) ∨ BoundedAbove(B)) → BoundedAbove(A ∩ B)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop} (leftSubset rightSubset : SetObject), Or (Exists fun bound => ∀ (element : Element), inst.1 leftSubset element → relation element bound) (Exists fun bound => ∀ (element : Element), inst.1 rightSubset element → relation element bound) → Exists fun bound => ∀ (element : Element), inst.1 (inst_2.1 leftSubset rightSubset) element → relation element bound

Logical form (Lean):

```lean
theorem IntersectionBoundedAbove
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (leftSubset rightSubset : SetObject)
    (eitherIsBoundedAbove :
      BoundedAbove relation leftSubset \/
        BoundedAbove relation rightSubset) :
    BoundedAbove relation (leftSubset ∩ rightSubset)
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
theorem IntersectionBoundedAbove
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (leftSubset rightSubset : SetObject)
    (eitherIsBoundedAbove :
      BoundedAbove relation leftSubset \/
        BoundedAbove relation rightSubset) :
    BoundedAbove relation (leftSubset ∩ rightSubset) := by
  sorry

/--
`DifferenceBoundedAbove` TODO

Predicate logic:

  (∀ A B ∈ U), BoundedAbove(A \ B)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop} (subset removed : SetObject), (Exists fun bound => ∀ (element : Element), inst.1 subset element → relation element bound) → Exists fun bound => ∀ (element : Element), inst.1 (inst_3.1 subset removed) element → relation element bound

Logical form (Lean):

```lean
theorem DifferenceBoundedAbove
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (subset removed : SetObject)
    (subsetIsBoundedAbove : BoundedAbove relation subset) :
    BoundedAbove relation (subset \ removed)
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
theorem DifferenceBoundedAbove
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (subset removed : SetObject)
    (subsetIsBoundedAbove : BoundedAbove relation subset) :
    BoundedAbove relation (subset \ removed) := by
  sorry

/--
`SymmetricDifferenceBoundedAbove` TODO

Predicate logic:

  (∀ A B ∈ U), BoundedAbove(A ∆ B)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSymmDiff SetObject] [inst_2 : Union SetObject] [inst_3 : Inter SetObject] [inst_4 : SDiff SetObject] [inst_5 : EmptyCollection SetObject] [inst_6 : HasSubset SetObject], (LRA.Set.MembershipLaws Element SetObject ∧ LRA.Set.SymmDiffMembershipLaws Element SetObject) → ∀ {relation : Element → Element → Prop} (leftSubset rightSubset : SetObject), (Exists fun bound => ∀ (element : Element), inst.1 leftSubset element → relation element bound ∧ Exists fun bound => ∀ (element : Element), inst.1 rightSubset element → relation element bound) → Exists fun bound => ∀ (element : Element), inst.1 (inst_1.1 leftSubset rightSubset) element → relation element bound

Logical form (Lean):

```lean
theorem SymmetricDifferenceBoundedAbove
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [LRA.Set.HasSymmDiff SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    [LRA.Set.SymmDiffMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (leftSubset rightSubset : SetObject)
    (leftIsBoundedAbove : BoundedAbove relation leftSubset)
    (rightIsBoundedAbove : BoundedAbove relation rightSubset) :
    BoundedAbove relation (leftSubset ∆ rightSubset)
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
theorem SymmetricDifferenceBoundedAbove
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [LRA.Set.HasSymmDiff SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    [LRA.Set.SymmDiffMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (leftSubset rightSubset : SetObject)
    (leftIsBoundedAbove : BoundedAbove relation leftSubset)
    (rightIsBoundedAbove : BoundedAbove relation rightSubset) :
    BoundedAbove relation (leftSubset ∆ rightSubset) := by
  sorry

end LRA.Order
