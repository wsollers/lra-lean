import LRA.Order.Constructions.LexicographicOrder.Definition
import LRA.Order.OrderedSets.StrictLinearOrder.Definition

namespace LRA.Order

universe u v

/--
`LexicographicProductIsStrictLinearOrder` TODO

Predicate logic:

  StrictLinearOrder (LexicographicRelation leftRelation rightRelation)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {leftRelation : Alpha → Alpha → Prop} {rightRelation : Beta → Beta → Prop}, (((∀ (x : Alpha), leftRelation x x → False ∧ ∀ (x y z : Alpha), leftRelation x y → leftRelation y z → leftRelation x z) ∧ ∀ (x y : Alpha), Or ((leftRelation x y ∧ (x = y → False ∧ leftRelation y x → False))) (Or ((x = y ∧ (leftRelation x y → False ∧ leftRelation y x → False))) ((leftRelation y x ∧ (leftRelation x y → False ∧ x = y → False))))) ∧ ((∀ (x : Beta), rightRelation x x → False ∧ ∀ (x y z : Beta), rightRelation x y → rightRelation y z → rightRelation x z) ∧ ∀ (x y : Beta), Or ((rightRelation x y ∧ (x = y → False ∧ rightRelation y x → False))) (Or ((x = y ∧ (rightRelation x y → False ∧ rightRelation y x → False))) ((rightRelation y x ∧ (rightRelation x y → False ∧ x = y → False)))))) → ((∀ (x : Prod Alpha Beta), Or (leftRelation x.1 x.1) ((x.1 = x.1 ∧ rightRelation x.2 x.2)) → False ∧ ∀ (x y z : Prod Alpha Beta), Or (leftRelation x.1 y.1) ((x.1 = y.1 ∧ rightRelation x.2 y.2)) → Or (leftRelation y.1 z.1) ((y.1 = z.1 ∧ rightRelation y.2 z.2)) → Or (leftRelation x.1 z.1) ((x.1 = z.1 ∧ rightRelation x.2 z.2))) ∧ ∀ (x y : Prod Alpha Beta), Or ((Or (leftRelation x.1 y.1) ((x.1 = y.1 ∧ rightRelation x.2 y.2)) ∧ (x = y → False ∧ Or (leftRelation y.1 x.1) ((y.1 = x.1 ∧ rightRelation y.2 x.2)) → False))) (Or ((x = y ∧ (Or (leftRelation x.1 y.1) ((x.1 = y.1 ∧ rightRelation x.2 y.2)) → False ∧ Or (leftRelation y.1 x.1) ((y.1 = x.1 ∧ rightRelation y.2 x.2)) → False))) ((Or (leftRelation y.1 x.1) ((y.1 = x.1 ∧ rightRelation y.2 x.2)) ∧ (Or (leftRelation x.1 y.1) ((x.1 = y.1 ∧ rightRelation x.2 y.2)) → False ∧ x = y → False)))))

Logical form (Lean):

```lean
theorem LexicographicProductIsStrictLinearOrder
    {Alpha : Type u} {Beta : Type v}
    {leftRelation : LRA.Relation.Endorelation Alpha}
    {rightRelation : LRA.Relation.Endorelation Beta}
    (leftIsStrictLinear : StrictLinearOrder leftRelation)
    (rightIsStrictLinear : StrictLinearOrder rightRelation) :
    StrictLinearOrder (LexicographicRelation leftRelation rightRelation)
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
theorem LexicographicProductIsStrictLinearOrder
    {Alpha : Type u} {Beta : Type v}
    {leftRelation : LRA.Relation.Endorelation Alpha}
    {rightRelation : LRA.Relation.Endorelation Beta}
    (leftIsStrictLinear : StrictLinearOrder leftRelation)
    (rightIsStrictLinear : StrictLinearOrder rightRelation) :
    StrictLinearOrder (LexicographicRelation leftRelation rightRelation) := by
  sorry
end LRA.Order
