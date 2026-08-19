import LRA.Relation.Definition

namespace LRA.Order

universe u

/-- Non-strict relation obtained by adjoining equality to a strict relation. -/
def LessThanOrEqual {alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation alpha) :
    LRA.Relation.Endorelation alpha :=
  fun left right => strictRelation left right \/ left = right

end LRA.Order
