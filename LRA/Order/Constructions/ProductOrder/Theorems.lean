import LRA.Order.Constructions.ProductOrder.Definition
import LRA.Order.OrderedSets.PartialOrder.Definition

namespace LRA.Order

universe u v

/--
`ProductOfPartialOrdersIsPartialOrder` TODO

Predicate logic:

  PartialOrder (ProductRelation leftRelation rightRelation)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {leftRelation : Alpha → Alpha → Prop} {rightRelation : Beta → Beta → Prop}, ((∀ (x : Alpha), leftRelation x x ∧ (∀ (x y : Alpha), leftRelation x y → leftRelation y x → x = y ∧ ∀ (x y z : Alpha), leftRelation x y → leftRelation y z → leftRelation x z)) ∧ (∀ (x : Beta), rightRelation x x ∧ (∀ (x y : Beta), rightRelation x y → rightRelation y x → x = y ∧ ∀ (x y z : Beta), rightRelation x y → rightRelation y z → rightRelation x z))) → (∀ (x : Prod Alpha Beta), (leftRelation x.1 x.1 ∧ rightRelation x.2 x.2) ∧ (∀ (x y : Prod Alpha Beta), (leftRelation x.1 y.1 ∧ rightRelation x.2 y.2) → (leftRelation y.1 x.1 ∧ rightRelation y.2 x.2) → x = y ∧ ∀ (x y z : Prod Alpha Beta), (leftRelation x.1 y.1 ∧ rightRelation x.2 y.2) → (leftRelation y.1 z.1 ∧ rightRelation y.2 z.2) → (leftRelation x.1 z.1 ∧ rightRelation x.2 z.2)))

Logical form (Lean):

```lean
theorem ProductOfPartialOrdersIsPartialOrder
    {Alpha : Type u} {Beta : Type v}
    {leftRelation : LRA.Relation.Endorelation Alpha}
    {rightRelation : LRA.Relation.Endorelation Beta}
    (leftIsPartialOrder : PartialOrder leftRelation)
    (rightIsPartialOrder : PartialOrder rightRelation) :
    PartialOrder (ProductRelation leftRelation rightRelation)
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
theorem ProductOfPartialOrdersIsPartialOrder
    {Alpha : Type u} {Beta : Type v}
    {leftRelation : LRA.Relation.Endorelation Alpha}
    {rightRelation : LRA.Relation.Endorelation Beta}
    (leftIsPartialOrder : PartialOrder leftRelation)
    (rightIsPartialOrder : PartialOrder rightRelation) :
    PartialOrder (ProductRelation leftRelation rightRelation) := by
  sorry
end LRA.Order
