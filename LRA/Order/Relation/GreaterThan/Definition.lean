import LRA.Relation.Definition

namespace LRA.Order

universe u

                                                                          
def GreaterThan {alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation alpha) :
    LRA.Relation.Endorelation alpha :=
  fun left right => strictRelation right left

end LRA.Order
