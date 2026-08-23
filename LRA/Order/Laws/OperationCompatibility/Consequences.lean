import LRA.Order.Laws.OperationCompatibility.Definition
import LRA.Order.Morphisms.Monotone.Definition
import LRA.Relation.Properties.Definition

namespace LRA.Order

universe u

   
                                                               
  

                                                                               
theorem LeftTranslationPreservesRelationIffMonotoneTranslations
    {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) :
    LeftTranslationPreservesRelation relation operation <->
      forall fixed,
        LRA.Order.Monotone relation relation
          (fun value => operation fixed value) := by
  sorry

                                                                                 
theorem RightTranslationPreservesRelationIffMonotoneTranslations
    {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) :
    RightTranslationPreservesRelation relation operation <->
      forall fixed,
        LRA.Order.Monotone relation relation
          (fun value => operation value fixed) := by
  sorry

                                                                                          
theorem CoordinatewisePreservesRelation.left_translation
    {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    (coordinatewise :
      CoordinatewisePreservesRelation relation operation) :
    LeftTranslationPreservesRelation relation operation := by
  sorry

                                                                                           
theorem CoordinatewisePreservesRelation.right_translation
    {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    (coordinatewise :
      CoordinatewisePreservesRelation relation operation) :
    RightTranslationPreservesRelation relation operation := by
  sorry

end LRA.Order
