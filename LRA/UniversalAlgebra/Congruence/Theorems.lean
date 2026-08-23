import LRA.UniversalAlgebra.Congruence.Definition

namespace LRA.UniversalAlgebra.Congruence

open LRA.Operation

universe u

                                        
theorem UnaryOperationCongruence.apply {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : UnaryEndoOperation Carrier}
    (law : UnaryOperationCongruence relation operation)
    {left right : Carrier}
    (related_inputs : relation left right) :
    relation (operation left) (operation right) := by
  sorry

                                         
theorem BinaryOperationCongruence.apply {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : BinaryEndoOperation Carrier}
    (law : BinaryOperationCongruence relation operation)
    {left₁ left₂ right₁ right₂ : Carrier}
    (related_left_inputs : relation left₁ left₂)
    (related_right_inputs : relation right₁ right₂) :
    relation (operation left₁ right₁) (operation left₂ right₂) := by
  sorry

                                                                                    
theorem UnaryOperationRelationRequirements.relation_is_equivalence {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : UnaryEndoOperation Carrier}
    (requirements : UnaryOperationRelationRequirements relation operation) :
    LRA.Relation.EquivalenceRelation relation := by
  sorry

                                                                          
theorem UnaryOperationRelationRequirements.operation_congruence {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : UnaryEndoOperation Carrier}
    (requirements : UnaryOperationRelationRequirements relation operation) :
    UnaryOperationCongruence relation operation := by
  sorry

                                                                                     
theorem BinaryOperationRelationRequirements.relation_is_equivalence {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : BinaryEndoOperation Carrier}
    (requirements : BinaryOperationRelationRequirements relation operation) :
    LRA.Relation.EquivalenceRelation relation := by
  sorry

                                                                           
theorem BinaryOperationRelationRequirements.operation_congruence {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : BinaryEndoOperation Carrier}
    (requirements : BinaryOperationRelationRequirements relation operation) :
    BinaryOperationCongruence relation operation := by
  sorry

end LRA.UniversalAlgebra.Congruence
