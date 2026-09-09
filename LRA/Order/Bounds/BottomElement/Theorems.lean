import LRA.Order.Bounds.BottomElement.Definition
import LRA.Set.Interface.Laws.Membership

namespace LRA.Order

open scoped LRA.Set

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [LRA.Set.HasUniversal SetObject]
variable [LRA.Set.HasComplement SetObject]
variable [LRA.Set.UniversalMembershipLaws Element SetObject]

/--
`BottomElementIffRelationToEvery` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasUniversal SetObject] [inst_2 : LRA.Set.HasComplement SetObject], LRA.Set.UniversalMembershipLaws Element SetObject → ∀ {relation : LRA.Relation.Endorelation Element} {bottom : Element}, LRA.Order.BottomElement relation bottom ↔ ∀ (element : Element), relation bottom element

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    bottom : Element
  Prove
    LRA.Set.UniversalMembershipLaws Element SetObject → ∀ {relation : LRA.Relation.Endorelation Element} {bottom : Element}, LRA.Order.BottomElement relation bottom ↔ ∀ (element : Element), relation bottom element

Logical form (Lean):

```lean
theorem BottomElementIffRelationToEvery
    {relation : LRA.Relation.Endorelation Element}
    {bottom : Element} :
    BottomElement (SetObject := SetObject) relation bottom <->
      forall element : Element, relation bottom element
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
theorem BottomElementIffRelationToEvery
    {relation : LRA.Relation.Endorelation Element}
    {bottom : Element} :
    BottomElement (SetObject := SetObject) relation bottom <->
      forall element : Element, relation bottom element := by
  sorry
end LRA.Order
