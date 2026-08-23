import LRA.UniversalAlgebra.Congruence.Theorems
import LRA.Relation.Structures.Equivalence.QuotientSet

namespace LRA.UniversalAlgebra.Congruence

open LRA.Operation
open scoped LRA.Set

   
                                                                         
  

universe u v

   
                                                                           
                                                 
  
theorem UnaryOperationRelationRequirements.quotient_projection_respects_operation
    {Carrier : Type u} {SetObject : Type v}
    [Membership Carrier SetObject]
    [LRA.Set.HasSeparation Carrier SetObject]
    [LRA.Set.SeparationLaws Carrier SetObject]
    [LRA.Set.ExtensionalityLaw Carrier SetObject]
    {ambient : SetObject}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : UnaryEndoOperation Carrier}
    (requirements :
      UnaryOperationRelationRequirements relation operation)
    {left right : Carrier}
    (related : relation left right) :
    LRA.Relation.QuotientProjection ambient relation (operation left) =
      LRA.Relation.QuotientProjection ambient relation (operation right) := by
  sorry

   
                                                                            
                                                          
  
theorem BinaryOperationRelationRequirements.quotient_projection_respects_operation
    {Carrier : Type u} {SetObject : Type v}
    [Membership Carrier SetObject]
    [LRA.Set.HasSeparation Carrier SetObject]
    [LRA.Set.SeparationLaws Carrier SetObject]
    [LRA.Set.ExtensionalityLaw Carrier SetObject]
    {ambient : SetObject}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : BinaryEndoOperation Carrier}
    (requirements :
      BinaryOperationRelationRequirements relation operation)
    {left₁ left₂ right₁ right₂ : Carrier}
    (leftRelated : relation left₁ left₂)
    (rightRelated : relation right₁ right₂) :
    LRA.Relation.QuotientProjection
        ambient relation (operation left₁ right₁) =
      LRA.Relation.QuotientProjection
        ambient relation (operation left₂ right₂) := by
  sorry

end LRA.UniversalAlgebra.Congruence
