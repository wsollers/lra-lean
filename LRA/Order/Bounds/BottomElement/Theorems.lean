import LRA.Order.Bounds.BottomElement.Definition
import LRA.Set.Interface.Membership

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

  (∀ x ∈ Element), BottomElement SetObject ∈ = SetObject relation x <-> forall element : Element, relation x element

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasUniversal SetObject] [inst_2 : LRA.Set.HasComplement SetObject], LRA.Set.UniversalMembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop} {bottom : Element}, (inst.1 inst_1.1 bottom ∧ ∀ (element : Element), inst.1 inst_1.1 element → relation bottom element) ↔ ∀ (element : Element), relation bottom element

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
