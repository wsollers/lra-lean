import LRA.Morphism.Properties.PreservesRelation.Definition

namespace LRA.Order

universe u v

                                                                     

                                                                            
                                                                          
                                                             
                                                                                
def Monotone
    {Alpha : Type u} {Beta : Type v}
    (sourceRelation : LRA.Relation.Endorelation Alpha)
    (targetRelation : LRA.Relation.Endorelation Beta)
    (map : Alpha → Beta) : Prop :=
  LRA.Morphism.PreservesRelation map sourceRelation targetRelation

end LRA.Order
