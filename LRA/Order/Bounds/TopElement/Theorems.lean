import LRA.Order.Bounds.TopElement.Definition
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
`TopElementIffEveryRelationTo` TODO

Predicate logic:

  (∀ x ∈ Element), TopElement SetObject ∈ = SetObject relation x <-> forall element : Element, relation element x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasUniversal SetObject] [inst_2 : LRA.Set.HasComplement SetObject], LRA.Set.UniversalMembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop} {top : Element}, (inst.1 inst_1.1 top ∧ ∀ (element : Element), inst.1 inst_1.1 element → relation element top) ↔ ∀ (element : Element), relation element top

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
