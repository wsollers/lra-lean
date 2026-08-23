import LRA.Relation.Definition

namespace LRA.Order

universe u

                                                      
def StrictPart {alpha : Type u}
    (nonStrictRelation : LRA.Relation.Endorelation alpha) :
    LRA.Relation.Endorelation alpha :=
  fun left right => nonStrictRelation left right /\ left ≠ right

end LRA.Order
