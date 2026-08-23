import LRA.Order.Relation.CoverRelation.Definition

namespace LRA.Order

universe u

                                                                   
                                                                    
def UpperCover
    {alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation alpha)
    (element cover : alpha) : Prop :=
  CoverRelation strictRelation element cover

end LRA.Order
