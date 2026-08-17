import LRA.Order.OrderedSets.StrictLinearOrder.Definition

namespace LRA.Order

universe u

/-- Exact trichotomy by itself forces irreflexivity. -/
theorem ExactlyTrichotomousImpliesIrreflexive
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsExactlyTrichotomous :
      LRA.Relation.ExactlyTrichotomous relation) :
    LRA.Relation.Irreflexive relation := by
  sorry

/-- Every strict linear order is a strict order. -/
theorem StrictLinearOrderIsStrictOrder
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsStrictLinearOrder : StrictLinearOrder relation) :
    StrictOrder relation :=
  relationIsStrictLinearOrder.1

/-- Every strict linear order satisfies exact trichotomy. -/
theorem StrictLinearOrderIsExactlyTrichotomous
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsStrictLinearOrder : StrictLinearOrder relation) :
    LRA.Relation.ExactlyTrichotomous relation :=
  relationIsStrictLinearOrder.2

end LRA.Order
