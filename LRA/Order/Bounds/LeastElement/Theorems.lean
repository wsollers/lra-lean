import LRA.Order.Bounds.LeastElement.Definition
import LRA.Relation.Interface.Laws.Definition
import LRA.Set.Interface.Laws.Membership

namespace LRA.Order

universe u v

/--
`LeastElementUnique` TODO

Predicate logic:

  (∀ A ∈ U ∀ x y ∈ Element), x = y

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : Element → Element → Prop}, (∀ (x y : Element), relation x y → relation y x → x = y) → ∀ {subset : SetObject} {first second : Element}, ((inst.1 subset first ∧ ∀ (element : Element), inst.1 subset element → relation first element) ∧ (inst.1 subset second ∧ ∀ (element : Element), inst.1 subset element → relation second element)) → first = second

Logical form (Lean):

```lean
theorem LeastElementUnique
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {subset : SetObject} {first second : Element}
    (firstIsLeast : LeastElement relation subset first)
    (secondIsLeast : LeastElement relation subset second) :
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
theorem LeastElementUnique
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {subset : SetObject} {first second : Element}
    (firstIsLeast : LeastElement relation subset first)
    (secondIsLeast : LeastElement relation subset second) :
    first = second := by
  sorry
open scoped LRA.Set

/--
`LeastElementRetainedByIntersection` TODO

Predicate logic:

  (∀ A B ∈ U ∀ x ∈ Element), (x ∈ B) → LeastElement(x, A ∩ B)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop} {subset retainedBy : SetObject} {least : Element}, ((inst.1 subset least ∧ ∀ (element : Element), inst.1 subset element → relation least element) ∧ inst.1 retainedBy least) → (inst.1 (inst_2.1 subset retainedBy) least ∧ ∀ (element : Element), inst.1 (inst_2.1 subset retainedBy) element → relation least element)

Logical form (Lean):

```lean
theorem LeastElementRetainedByIntersection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset retainedBy : SetObject} {least : Element}
    (leastIsLeast : LeastElement relation subset least)
    (leastIsRetained : least ∈ retainedBy) :
    LeastElement relation (subset ∩ retainedBy) least
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
theorem LeastElementRetainedByIntersection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset retainedBy : SetObject} {least : Element}
    (leastIsLeast : LeastElement relation subset least)
    (leastIsRetained : least ∈ retainedBy) :
    LeastElement relation (subset ∩ retainedBy) least := by
  sorry
/--
`LeastElementRetainedByDifference` TODO

Predicate logic:

  (∀ A B ∈ U ∀ x ∈ Element), LeastElement(x, A \ B)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop} {subset removed : SetObject} {least : Element}, ((inst.1 subset least ∧ ∀ (element : Element), inst.1 subset element → relation least element) ∧ inst.1 removed least → False) → (inst.1 (inst_3.1 subset removed) least ∧ ∀ (element : Element), inst.1 (inst_3.1 subset removed) element → relation least element)

Logical form (Lean):

```lean
theorem LeastElementRetainedByDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset removed : SetObject} {least : Element}
    (leastIsLeast : LeastElement relation subset least)
    (leastIsNotRemoved : least ∉ removed) :
    LeastElement relation (subset \ removed) least
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
theorem LeastElementRetainedByDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset removed : SetObject} {least : Element}
    (leastIsLeast : LeastElement relation subset least)
    (leastIsNotRemoved : least ∉ removed) :
    LeastElement relation (subset \ removed) least := by
  sorry
/--
`LeastElementRetainedBySymmetricDifference` TODO

Predicate logic:

  (∀ A B ∈ U ∀ x ∈ Element), (x ∈ (A ∆ B)) → LeastElement(x, A ∆ B)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSymmDiff SetObject] [inst_2 : Union SetObject] [inst_3 : Inter SetObject] [inst_4 : SDiff SetObject] [inst_5 : EmptyCollection SetObject] [inst_6 : HasSubset SetObject], (LRA.Set.MembershipLaws Element SetObject ∧ LRA.Set.SymmDiffMembershipLaws Element SetObject) → ∀ {relation : Element → Element → Prop} {leftSubset rightSubset : SetObject} {least : Element}, ((inst.1 (inst_2.1 leftSubset rightSubset) least ∧ ∀ (element : Element), inst.1 (inst_2.1 leftSubset rightSubset) element → relation least element) ∧ inst.1 (inst_1.1 leftSubset rightSubset) least) → (inst.1 (inst_1.1 leftSubset rightSubset) least ∧ ∀ (element : Element), inst.1 (inst_1.1 leftSubset rightSubset) element → relation least element)

Logical form (Lean):

```lean
theorem LeastElementRetainedBySymmetricDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [LRA.Set.HasSymmDiff SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    [LRA.Set.SymmDiffMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {least : Element}
    (leastIsLeastOfUnion : LeastElement relation (leftSubset ∪ rightSubset) least)
    (leastIsRetained : least ∈ (leftSubset ∆ rightSubset)) :
    LeastElement relation (leftSubset ∆ rightSubset) least
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
theorem LeastElementRetainedBySymmetricDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [LRA.Set.HasSymmDiff SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    [LRA.Set.SymmDiffMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {least : Element}
    (leastIsLeastOfUnion : LeastElement relation (leftSubset ∪ rightSubset) least)
    (leastIsRetained : least ∈ (leftSubset ∆ rightSubset)) :
    LeastElement relation (leftSubset ∆ rightSubset) least := by
  sorry
/--
`LeastElementOfUnion` TODO

Predicate logic:

  (∀ A B ∈ U ∀ x ∈ Element), LeastElement(x, A ∪ B)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop} {leftSubset rightSubset : SetObject} {least : Element}, ((inst.1 leftSubset least ∧ ∀ (element : Element), inst.1 leftSubset element → relation least element) ∧ ∀ (element : Element), inst.1 rightSubset element → relation least element) → (inst.1 (inst_1.1 leftSubset rightSubset) least ∧ ∀ (element : Element), inst.1 (inst_1.1 leftSubset rightSubset) element → relation least element)

Logical form (Lean):

```lean
theorem LeastElementOfUnion
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {least : Element}
    (leastIsLeastOfLeft : LeastElement relation leftSubset least)
    (leastBoundsRight : LowerBound relation rightSubset least) :
    LeastElement relation (leftSubset ∪ rightSubset) least
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
theorem LeastElementOfUnion
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {least : Element}
    (leastIsLeastOfLeft : LeastElement relation leftSubset least)
    (leastBoundsRight : LowerBound relation rightSubset least) :
    LeastElement relation (leftSubset ∪ rightSubset) least := by
  sorry
end LRA.Order
