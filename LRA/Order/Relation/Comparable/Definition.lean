import LRA.Relation.Definition

namespace LRA.Order

universe u

/-- Two elements are comparable with respect to a displayed relation. -/
def Comparable {alpha : Type u}
    (relation : LRA.Relation.Endorelation alpha)
    (left right : alpha) : Prop :=
  relation left right \/ relation right left

end LRA.Order
