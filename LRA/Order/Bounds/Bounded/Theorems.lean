import LRA.Order.Bounds.Bounded.Definition
import LRA.Order.Bounds.BoundedAbove.Theorems
import LRA.Order.Bounds.BoundedBelow.Theorems

namespace LRA.Order

open scoped LRA.Set

universe u v

/--
`BoundedOfSubcollection` TODO

Predicate logic:

  (∀ A B ∈ U), (forall element, element ∈ A -> element ∈ B) → Bounded relation A

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : Element → Element → Prop} {smaller larger : SetObject}, (∀ (element : Element), inst.1 smaller element → inst.1 larger element ∧ (Exists fun bound => ∀ (element : Element), inst.1 larger element → relation element bound ∧ Exists fun bound => ∀ (element : Element), inst.1 larger element → relation bound element)) → (Exists fun bound => ∀ (element : Element), inst.1 smaller element → relation element bound ∧ Exists fun bound => ∀ (element : Element), inst.1 smaller element → relation bound element)

Logical form (Lean):

```lean
theorem BoundedOfSubcollection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject}
    (smallerIsContained : forall element, element ∈ smaller -> element ∈ larger)
    (largerIsBounded : Bounded relation larger) :
    Bounded relation smaller
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
theorem BoundedOfSubcollection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject}
    (smallerIsContained : forall element, element ∈ smaller -> element ∈ larger)
    (largerIsBounded : Bounded relation larger) :
    Bounded relation smaller := by
  sorry
/--
`UnionBoundedIffPiecesBounded` TODO

Predicate logic:

  (∀ A B ∈ U), Bounded relation (A ∪ B) ↔ Bounded relation A ∧ Bounded relation B

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop}, (∀ (x y z : Element), relation x y → relation y z → relation x z ∧ ∀ (x y : Element), Or (relation x y) (relation y x)) → ∀ (leftSubset rightSubset : SetObject), (Exists fun bound => ∀ (element : Element), inst.1 (inst_1.1 leftSubset rightSubset) element → relation element bound ∧ Exists fun bound => ∀ (element : Element), inst.1 (inst_1.1 leftSubset rightSubset) element → relation bound element) ↔ ((Exists fun bound => ∀ (element : Element), inst.1 leftSubset element → relation element bound ∧ Exists fun bound => ∀ (element : Element), inst.1 leftSubset element → relation bound element) ∧ (Exists fun bound => ∀ (element : Element), inst.1 rightSubset element → relation element bound ∧ Exists fun bound => ∀ (element : Element), inst.1 rightSubset element → relation bound element))

Logical form (Lean):

```lean
theorem UnionBoundedIffPiecesBounded
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    (relationIsTotal : LRA.Relation.Total relation)
    (leftSubset rightSubset : SetObject) :
    Bounded relation (leftSubset ∪ rightSubset) ↔
      Bounded relation leftSubset /\ Bounded relation rightSubset
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
theorem UnionBoundedIffPiecesBounded
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    (relationIsTotal : LRA.Relation.Total relation)
    (leftSubset rightSubset : SetObject) :
    Bounded relation (leftSubset ∪ rightSubset) ↔
      Bounded relation leftSubset /\ Bounded relation rightSubset := by
  sorry
/--
`IntersectionBounded` TODO

Predicate logic:

  (∀ A B ∈ U), (Bounded relation A ∨ Bounded relation B) → Bounded relation (A ∩ B)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop} (leftSubset rightSubset : SetObject), Or ((Exists fun bound => ∀ (element : Element), inst.1 leftSubset element → relation element bound ∧ Exists fun bound => ∀ (element : Element), inst.1 leftSubset element → relation bound element)) ((Exists fun bound => ∀ (element : Element), inst.1 rightSubset element → relation element bound ∧ Exists fun bound => ∀ (element : Element), inst.1 rightSubset element → relation bound element)) → (Exists fun bound => ∀ (element : Element), inst.1 (inst_2.1 leftSubset rightSubset) element → relation element bound ∧ Exists fun bound => ∀ (element : Element), inst.1 (inst_2.1 leftSubset rightSubset) element → relation bound element)

Logical form (Lean):

```lean
theorem IntersectionBounded
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (leftSubset rightSubset : SetObject)
    (eitherIsBounded :
      Bounded relation leftSubset \/ Bounded relation rightSubset) :
    Bounded relation (leftSubset ∩ rightSubset)
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
theorem IntersectionBounded
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (leftSubset rightSubset : SetObject)
    (eitherIsBounded :
      Bounded relation leftSubset \/ Bounded relation rightSubset) :
    Bounded relation (leftSubset ∩ rightSubset) := by
  sorry
/--
`DifferenceBounded` TODO

Predicate logic:

  (∀ A B ∈ U), Bounded relation (A \ B)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop} (subset removed : SetObject), (Exists fun bound => ∀ (element : Element), inst.1 subset element → relation element bound ∧ Exists fun bound => ∀ (element : Element), inst.1 subset element → relation bound element) → (Exists fun bound => ∀ (element : Element), inst.1 (inst_3.1 subset removed) element → relation element bound ∧ Exists fun bound => ∀ (element : Element), inst.1 (inst_3.1 subset removed) element → relation bound element)

Logical form (Lean):

```lean
theorem DifferenceBounded
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (subset removed : SetObject)
    (subsetIsBounded : Bounded relation subset) :
    Bounded relation (subset \ removed)
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
theorem DifferenceBounded
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (subset removed : SetObject)
    (subsetIsBounded : Bounded relation subset) :
    Bounded relation (subset \ removed) := by
  sorry
/--
`SymmetricDifferenceBounded` TODO

Predicate logic:

  (∀ A B ∈ U), Bounded relation (A ∆ B)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSymmDiff SetObject] [inst_2 : Union SetObject] [inst_3 : Inter SetObject] [inst_4 : SDiff SetObject] [inst_5 : EmptyCollection SetObject] [inst_6 : HasSubset SetObject], (LRA.Set.MembershipLaws Element SetObject ∧ LRA.Set.SymmDiffMembershipLaws Element SetObject) → ∀ {relation : Element → Element → Prop} (leftSubset rightSubset : SetObject), ((Exists fun bound => ∀ (element : Element), inst.1 leftSubset element → relation element bound ∧ Exists fun bound => ∀ (element : Element), inst.1 leftSubset element → relation bound element) ∧ (Exists fun bound => ∀ (element : Element), inst.1 rightSubset element → relation element bound ∧ Exists fun bound => ∀ (element : Element), inst.1 rightSubset element → relation bound element)) → (Exists fun bound => ∀ (element : Element), inst.1 (inst_1.1 leftSubset rightSubset) element → relation element bound ∧ Exists fun bound => ∀ (element : Element), inst.1 (inst_1.1 leftSubset rightSubset) element → relation bound element)

Logical form (Lean):

```lean
theorem SymmetricDifferenceBounded
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [LRA.Set.HasSymmDiff SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    [LRA.Set.SymmDiffMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (leftSubset rightSubset : SetObject)
    (leftIsBounded : Bounded relation leftSubset)
    (rightIsBounded : Bounded relation rightSubset) :
    Bounded relation (leftSubset ∆ rightSubset)
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
theorem SymmetricDifferenceBounded
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [LRA.Set.HasSymmDiff SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    [LRA.Set.SymmDiffMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (leftSubset rightSubset : SetObject)
    (leftIsBounded : Bounded relation leftSubset)
    (rightIsBounded : Bounded relation rightSubset) :
    Bounded relation (leftSubset ∆ rightSubset) := by
  sorry
end LRA.Order
