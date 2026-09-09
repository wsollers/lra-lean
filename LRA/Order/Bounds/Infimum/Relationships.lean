import LRA.Relation.Interface.Operations.Converse.Definition
import LRA.Order.Bounds.Infimum.Definition
import LRA.Order.Bounds.Supremum.Definition
import LRA.Order.Bounds.BoundSets.Definition
import LRA.Set.Interface.Laws.Membership

namespace LRA.Order

universe u v

/--
`InfimumOfConverseIffSupremum` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject) (candidate : Element), LRA.Order.Infimum (LRA.Relation.Converse relation) subset candidate ↔ LRA.Order.Supremum relation subset candidate

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    subset : SetObject
    candidate : Element
  Prove
    LRA.Order.Infimum (LRA.Relation.Converse relation) subset candidate ↔ LRA.Order.Supremum relation subset candidate

Logical form (Lean):

```lean
theorem InfimumOfConverseIffSupremum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) :
    Infimum (LRA.Relation.Converse relation) subset candidate ↔
      Supremum relation subset candidate
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
theorem InfimumOfConverseIffSupremum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) :
    Infimum (LRA.Relation.Converse relation) subset candidate ↔
      Supremum relation subset candidate := by
  sorry
/--
`InfimumOfEmptyIffTop` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ (relation : LRA.Relation.Endorelation Element) (candidate : Element), LRA.Order.Infimum relation inst_4.emptyCollection candidate ↔ ∀ (element : Element), relation element candidate

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    candidate : Element
  Prove
    LRA.Set.MembershipLaws Element SetObject → ∀ (relation : LRA.Relation.Endorelation Element) (candidate : Element), LRA.Order.Infimum relation inst_4.emptyCollection candidate ↔ ∀ (element : Element), relation element candidate

Logical form (Lean):

```lean
theorem InfimumOfEmptyIffTop
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (candidate : Element) :
    Infimum relation (∅ : SetObject) candidate ↔
      forall element, relation element candidate
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
theorem InfimumOfEmptyIffTop
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (candidate : Element) :
    Infimum relation (∅ : SetObject) candidate ↔
      forall element, relation element candidate := by
  sorry
/--
`InfimumIffSupremumOfLowerBounds` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSeparation Element SetObject] [inst_2 : LRA.Set.HasUniversal SetObject] [inst_3 : LRA.Set.HasComplement SetObject], (LRA.Set.SeparationLaws Element SetObject ∧ LRA.Set.UniversalMembershipLaws Element SetObject) → ∀ (relation : LRA.Relation.Endorelation Element) (subset : SetObject) (candidate : Element), LRA.Order.Infimum relation subset candidate ↔ LRA.Order.Supremum relation (LRA.Order.LowerBounds relation subset) candidate

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    subset : SetObject
    candidate : Element
  Prove
    (LRA.Set.SeparationLaws Element SetObject ∧ LRA.Set.UniversalMembershipLaws Element SetObject) → ∀ (relation : LRA.Relation.Endorelation Element) (subset : SetObject) (candidate : Element), LRA.Order.Infimum relation subset candidate ↔ LRA.Order.Supremum relation (LRA.Order.LowerBounds relation subset) candidate

Logical form (Lean):

```lean
theorem InfimumIffSupremumOfLowerBounds
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [LRA.Set.HasSeparation Element SetObject]
    [LRA.Set.HasUniversal SetObject] [LRA.Set.HasComplement SetObject]
    [LRA.Set.SeparationLaws Element SetObject]
    [LRA.Set.UniversalMembershipLaws Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) :
    Infimum relation subset candidate ↔
      Supremum relation (LowerBounds relation subset) candidate
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
theorem InfimumIffSupremumOfLowerBounds
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [LRA.Set.HasSeparation Element SetObject]
    [LRA.Set.HasUniversal SetObject] [LRA.Set.HasComplement SetObject]
    [LRA.Set.SeparationLaws Element SetObject]
    [LRA.Set.UniversalMembershipLaws Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) :
    Infimum relation subset candidate ↔
      Supremum relation (LowerBounds relation subset) candidate := by
  sorry
end LRA.Order
