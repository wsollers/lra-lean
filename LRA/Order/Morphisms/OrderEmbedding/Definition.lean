import LRA.Morphism.Properties.RelationEmbedding.Definition
import LRA.Order.Morphisms.Monotone.Definition

namespace LRA.Order

universe u v

                                                                     

                                                                           
                                             
                                                                            
                                                                           
                                                                     
              
def OrderEmbedding
    {Alpha : Type u} {Beta : Type v}
    (sourceRelation : LRA.Relation.Endorelation Alpha)
    (targetRelation : LRA.Relation.Endorelation Beta)
    (map : Alpha → Beta) : Prop :=
  LRA.Morphism.PreservesAndReflectsRelation map sourceRelation targetRelation

end LRA.Order
