import LRA.Order.Bounds.TopElement.Definition
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
`TopElementIffEveryRelationTo` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasUniversal SetObject] [inst_2 : LRA.Set.HasComplement SetObject], LRA.Set.UniversalMembershipLaws Element SetObject → ∀ {relation : LRA.Relation.Endorelation Element} {top : Element}, LRA.Order.TopElement relation top ↔ ∀ (element : Element), relation element top

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    top : Element
  Prove
    LRA.Set.UniversalMembershipLaws Element SetObject → ∀ {relation : LRA.Relation.Endorelation Element} {top : Element}, LRA.Order.TopElement relation top ↔ ∀ (element : Element), relation element top

Logical form (Lean):

```lean
theorem TopElementIffEveryRelationTo
    {relation : LRA.Relation.Endorelation Element}
    {top : Element} :
    TopElement (SetObject := SetObject) relation top <->
      forall element : Element, relation element top
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
theorem TopElementIffEveryRelationTo
    {relation : LRA.Relation.Endorelation Element}
    {top : Element} :
    TopElement (SetObject := SetObject) relation top <->
      forall element : Element, relation element top := by
  sorry
end LRA.Order
