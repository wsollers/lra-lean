import LRA.Order.Relation.CoverRelation.Definition

namespace LRA.Order

universe u

/-- Two elements are adjacent when one covers the other -- the
Hasse-diagram-edge relation, the symmetric closure of `CoverRelation`. -/
def Adjacent
    {alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation alpha)
    (left right : alpha) : Prop :=
  CoverRelation strictRelation left right \/ CoverRelation strictRelation right left

end LRA.Order
