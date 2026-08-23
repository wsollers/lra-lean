import LRA.Morphism.Properties.PreservesRelation.Definition
import LRA.Relation.Operations.Converse.Definition

namespace LRA.Order

universe u v

                                                                    

                                                                             
                                                                           
                    
def Antitone
    {Alpha : Type u} {Beta : Type v}
    (sourceRelation : LRA.Relation.Endorelation Alpha)
    (targetRelation : LRA.Relation.Endorelation Beta)
    (map : Alpha → Beta) : Prop :=
  LRA.Morphism.PreservesRelation map sourceRelation
    (LRA.Relation.Converse targetRelation)

end LRA.Order
