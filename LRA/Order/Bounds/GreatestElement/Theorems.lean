import LRA.Order.Bounds.GreatestElement.Definition
import LRA.Relation.Properties.Definition
import LRA.Set.Interface.Laws.Membership

namespace LRA.Order

universe u v

/--
`GreatestElementUnique` TODO

Predicate logic:

  (∀ A ∈ U ∀ x y ∈ Element), x = y

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : Element → Element → Prop}, (∀ (x y : Element), relation x y → relation y x → x = y) → ∀ {subset : SetObject} {first second : Element}, ((inst.1 subset first ∧ ∀ (element : Element), inst.1 subset element → relation element first) ∧ (inst.1 subset second ∧ ∀ (element : Element), inst.1 subset element → relation element second)) → first = second

Logical form (Lean):

```lean
theorem GreatestElementUnique
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {subset : SetObject} {first second : Element}
    (firstIsGreatest : GreatestElement relation subset first)
    (secondIsGreatest : GreatestElement relation subset second) :
    first = second
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
theorem GreatestElementUnique
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {subset : SetObject} {first second : Element}
    (firstIsGreatest : GreatestElement relation subset first)
    (secondIsGreatest : GreatestElement relation subset second) :
    first = second := by
  sorry

open scoped LRA.Set

/--
`GreatestElementRetainedByIntersection` TODO

Predicate logic:

  (∀ A B ∈ U ∀ x ∈ Element), (x ∈ B) → GreatestElement(x, A ∩ B)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop} {subset retainedBy : SetObject} {greatest : Element}, ((inst.1 subset greatest ∧ ∀ (element : Element), inst.1 subset element → relation element greatest) ∧ inst.1 retainedBy greatest) → (inst.1 (inst_2.1 subset retainedBy) greatest ∧ ∀ (element : Element), inst.1 (inst_2.1 subset retainedBy) element → relation element greatest)

Logical form (Lean):

```lean
theorem GreatestElementRetainedByIntersection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset retainedBy : SetObject} {greatest : Element}
    (greatestIsGreatest : GreatestElement relation subset greatest)
    (greatestIsRetained : greatest ∈ retainedBy) :
    GreatestElement relation (subset ∩ retainedBy) greatest
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
theorem GreatestElementRetainedByIntersection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset retainedBy : SetObject} {greatest : Element}
    (greatestIsGreatest : GreatestElement relation subset greatest)
    (greatestIsRetained : greatest ∈ retainedBy) :
    GreatestElement relation (subset ∩ retainedBy) greatest := by
  sorry

/--
`GreatestElementRetainedByDifference` TODO

Predicate logic:

  (∀ A B ∈ U ∀ x ∈ Element), GreatestElement(x, A \ B)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop} {subset removed : SetObject} {greatest : Element}, ((inst.1 subset greatest ∧ ∀ (element : Element), inst.1 subset element → relation element greatest) ∧ inst.1 removed greatest → False) → (inst.1 (inst_3.1 subset removed) greatest ∧ ∀ (element : Element), inst.1 (inst_3.1 subset removed) element → relation element greatest)

Logical form (Lean):

```lean
theorem GreatestElementRetainedByDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset removed : SetObject} {greatest : Element}
    (greatestIsGreatest : GreatestElement relation subset greatest)
    (greatestIsNotRemoved : greatest ∉ removed) :
    GreatestElement relation (subset \ removed) greatest
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
theorem GreatestElementRetainedByDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset removed : SetObject} {greatest : Element}
    (greatestIsGreatest : GreatestElement relation subset greatest)
    (greatestIsNotRemoved : greatest ∉ removed) :
    GreatestElement relation (subset \ removed) greatest := by
  sorry

/--
`GreatestElementRetainedBySymmetricDifference` TODO

Predicate logic:

  (∀ A B ∈ U ∀ x ∈ Element), (x ∈ (A ∆ B)) → GreatestElement(x, A ∆ B)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSymmDiff SetObject] [inst_2 : Union SetObject] [inst_3 : Inter SetObject] [inst_4 : SDiff SetObject] [inst_5 : EmptyCollection SetObject] [inst_6 : HasSubset SetObject], (LRA.Set.MembershipLaws Element SetObject ∧ LRA.Set.SymmDiffMembershipLaws Element SetObject) → ∀ {relation : Element → Element → Prop} {leftSubset rightSubset : SetObject} {greatest : Element}, ((inst.1 (inst_2.1 leftSubset rightSubset) greatest ∧ ∀ (element : Element), inst.1 (inst_2.1 leftSubset rightSubset) element → relation element greatest) ∧ inst.1 (inst_1.1 leftSubset rightSubset) greatest) → (inst.1 (inst_1.1 leftSubset rightSubset) greatest ∧ ∀ (element : Element), inst.1 (inst_1.1 leftSubset rightSubset) element → relation element greatest)

Logical form (Lean):

```lean
theorem GreatestElementRetainedBySymmetricDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [LRA.Set.HasSymmDiff SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    [LRA.Set.SymmDiffMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {greatest : Element}
    (greatestIsGreatestOfUnion : GreatestElement relation (leftSubset ∪ rightSubset) greatest)
    (greatestIsRetained : greatest ∈ (leftSubset ∆ rightSubset)) :
    GreatestElement relation (leftSubset ∆ rightSubset) greatest
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
theorem GreatestElementRetainedBySymmetricDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [LRA.Set.HasSymmDiff SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    [LRA.Set.SymmDiffMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {greatest : Element}
    (greatestIsGreatestOfUnion : GreatestElement relation (leftSubset ∪ rightSubset) greatest)
    (greatestIsRetained : greatest ∈ (leftSubset ∆ rightSubset)) :
    GreatestElement relation (leftSubset ∆ rightSubset) greatest := by
  sorry

/--
`GreatestElementOfUnion` TODO

Predicate logic:

  (∀ A B ∈ U ∀ x ∈ Element), GreatestElement(x, A ∪ B)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop} {leftSubset rightSubset : SetObject} {greatest : Element}, ((inst.1 leftSubset greatest ∧ ∀ (element : Element), inst.1 leftSubset element → relation element greatest) ∧ ∀ (element : Element), inst.1 rightSubset element → relation element greatest) → (inst.1 (inst_1.1 leftSubset rightSubset) greatest ∧ ∀ (element : Element), inst.1 (inst_1.1 leftSubset rightSubset) element → relation element greatest)

Logical form (Lean):

```lean
theorem GreatestElementOfUnion
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {greatest : Element}
    (greatestIsGreatestOfLeft : GreatestElement relation leftSubset greatest)
    (greatestBoundsRight : UpperBound relation rightSubset greatest) :
    GreatestElement relation (leftSubset ∪ rightSubset) greatest
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
theorem GreatestElementOfUnion
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {greatest : Element}
    (greatestIsGreatestOfLeft : GreatestElement relation leftSubset greatest)
    (greatestBoundsRight : UpperBound relation rightSubset greatest) :
    GreatestElement relation (leftSubset ∪ rightSubset) greatest := by
  sorry

end LRA.Order
