import LRA.Morphism.Properties.PreservesRelation.Definition

namespace LRA.Order

universe u v

/-- A function is monotone when it preserves the displayed relations.

Monotonicity is the order-theoretic *specialization* of the generic morphism
primitive, not an independent notion: it adds constraints on the displayed
relations rather than data, so it is a definition in terms of
`LRA.Morphism.PreservesRelation` rather than a restatement of the quantifier. -/
def Monotone
    {Alpha : Type u} {Beta : Type v}
    (sourceRelation : LRA.Relation.Endorelation Alpha)
    (targetRelation : LRA.Relation.Endorelation Beta)
    (map : Alpha → Beta) : Prop :=
  LRA.Morphism.PreservesRelation map sourceRelation targetRelation

end LRA.Order
