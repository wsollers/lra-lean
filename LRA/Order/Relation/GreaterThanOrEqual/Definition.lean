import LRA.Order.Relation.GreaterThan.Definition

namespace LRA.Order

universe u

   
                                                               

             

       
                                       
                                                        
                                      
                                                                         
   
  
def GreaterThanOrEqual {alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation alpha) :
    LRA.Relation.Endorelation alpha :=
  fun left right => GreaterThan strictRelation left right \/ left = right

end LRA.Order
