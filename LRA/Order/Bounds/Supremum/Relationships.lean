import LRA.Relation.Interface.Operations.Converse.Definition
import LRA.Order.Bounds.Infimum.Definition
import LRA.Order.Bounds.Supremum.Definition
import LRA.Order.Bounds.BoundSets.Definition
import LRA.Set.Interface.Laws.Membership
import LRA.Relation.Interface.Laws.Definition

namespace LRA.Order

universe u v

/--
`SupremumOfConverseIffInfimum` TODO

Predicate logic:

  (∀ A ∈ U ∀ x ∈ Element), Supremum (LRA.Relation.Converse relation) A x ↔ Infimum relation A x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : Element → Element → Prop) (subset : SetObject) (candidate : Element), (∀ (element : Element), inst.1 subset element → relation candidate element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation bound element) → relation bound candidate) ↔ (∀ (element : Element), inst.1 subset element → relation candidate element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation bound element) → relation bound candidate)

Logical form (Lean):

```lean
theorem SupremumOfConverseIffInfimum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) :
    Supremum (LRA.Relation.Converse relation) subset candidate ↔
      Infimum relation subset candidate
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem SupremumOfConverseIffInfimum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) :
    Supremum (LRA.Relation.Converse relation) subset candidate ↔
      Infimum relation subset candidate := by
  sorry

/--
`SupremumOfEmptyIffBottom` TODO

Predicate logic:

  (∀ x ∈ Element), Supremum relation ∅ ∈ SetObject x ↔ forall element, relation x element

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ (relation : Element → Element → Prop) (candidate : Element), (∀ (element : Element), inst.1 inst_4.1 element → relation element candidate ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 inst_4.1 element → relation element bound) → relation candidate bound) ↔ ∀ (element : Element), relation candidate element

Logical form (Lean):

```lean
theorem SupremumOfEmptyIffBottom
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (candidate : Element) :
    Supremum relation (∅ : SetObject) candidate ↔
      forall element, relation candidate element
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
theorem SupremumOfEmptyIffBottom
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (candidate : Element) :
    Supremum relation (∅ : SetObject) candidate ↔
      forall element, relation candidate element := by
  sorry

/--
`SupremumIffInfimumOfUpperBounds` TODO

Predicate logic:

  (∀ A ∈ U ∀ x ∈ Element), Supremum relation A x ↔ Infimum relation (UpperBounds relation A) x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSeparation Element SetObject] [inst_2 : LRA.Set.HasUniversal SetObject] [inst_3 : LRA.Set.HasComplement SetObject], (LRA.Set.SeparationLaws Element SetObject ∧ LRA.Set.UniversalMembershipLaws Element SetObject) → ∀ (relation : Element → Element → Prop) (subset : SetObject) (candidate : Element), (∀ (element : Element), inst.1 subset element → relation element candidate ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation element bound) → relation candidate bound) ↔ (∀ (element : Element), inst.1 (inst_1.1 inst_2.1 fun bound => ∀ (element : Element), element ∈ subset → relation element bound) element → relation candidate element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 (inst_1.1 inst_2.1 fun bound => ∀ (element : Element), element ∈ subset → relation element bound) element → relation bound element) → relation bound candidate)

Logical form (Lean):

```lean
theorem SupremumIffInfimumOfUpperBounds
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [LRA.Set.HasSeparation Element SetObject]
    [LRA.Set.HasUniversal SetObject] [LRA.Set.HasComplement SetObject]
    [LRA.Set.SeparationLaws Element SetObject]
    [LRA.Set.UniversalMembershipLaws Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) :
    Supremum relation subset candidate ↔
      Infimum relation (UpperBounds relation subset) candidate
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem SupremumIffInfimumOfUpperBounds
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [LRA.Set.HasSeparation Element SetObject]
    [LRA.Set.HasUniversal SetObject] [LRA.Set.HasComplement SetObject]
    [LRA.Set.SeparationLaws Element SetObject]
    [LRA.Set.UniversalMembershipLaws Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) :
    Supremum relation subset candidate ↔
      Infimum relation (UpperBounds relation subset) candidate := by
  sorry

/--
`InfimumRelatedToSupremumOfNonemptySubset` TODO

Predicate logic:

  (∀ A ∈ U ∀ x y ∈ Element), (exists element, element ∈ A) → relation x y

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : Element → Element → Prop}, (∀ (x y z : Element), relation x y → relation y z → relation x z) → ∀ {subset : SetObject} {infimum supremum : Element}, (Exists fun element => inst.1 subset element ∧ ((∀ (element : Element), inst.1 subset element → relation infimum element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation bound element) → relation bound infimum) ∧ (∀ (element : Element), inst.1 subset element → relation element supremum ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation element bound) → relation supremum bound))) → relation infimum supremum

Logical form (Lean):

```lean
theorem InfimumRelatedToSupremumOfNonemptySubset
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    {subset : SetObject} {infimum supremum : Element}
    (subsetIsNonempty : exists element, element ∈ subset)
    (infimumIsInfimum : Infimum relation subset infimum)
    (supremumIsSupremum : Supremum relation subset supremum) :
    relation infimum supremum
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem InfimumRelatedToSupremumOfNonemptySubset
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    {subset : SetObject} {infimum supremum : Element}
    (subsetIsNonempty : exists element, element ∈ subset)
    (infimumIsInfimum : Infimum relation subset infimum)
    (supremumIsSupremum : Supremum relation subset supremum) :
    relation infimum supremum := by
  sorry

end LRA.Order
