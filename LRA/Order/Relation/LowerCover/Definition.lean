import LRA.Order.Relation.CoverRelation.Definition

namespace LRA.Order

universe u

                                                                
                                                                      
def LowerCover
    {alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation alpha)
    (element cover : alpha) : Prop :=
  CoverRelation strictRelation cover element

end LRA.Order
