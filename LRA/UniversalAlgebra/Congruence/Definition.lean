import LRA.Operation
import LRA.Relation.Structures.Definition

namespace LRA.UniversalAlgebra.Congruence

open LRA.Operation

universe u

   
                                           

                                                                 
  
def UnaryOperationCongruence {Carrier : Type u}
    (relation : LRA.Relation.Endorelation Carrier)
    (operation : UnaryEndoOperation Carrier) : Prop :=
  forall {left right : Carrier},
    relation left right -> relation (operation left) (operation right)

   
                                            

                                                                          
  
def BinaryOperationCongruence {Carrier : Type u}
    (relation : LRA.Relation.Endorelation Carrier)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall {left₁ left₂ right₁ right₂ : Carrier},
    relation left₁ left₂ -> relation right₁ right₂ ->
      relation (operation left₁ right₁) (operation left₂ right₂)

   
                                                     

                                                                            
                                                         
  
def UnaryOperationRelationRequirements {Carrier : Type u}
    (relation : LRA.Relation.Endorelation Carrier)
    (operation : UnaryEndoOperation Carrier) : Prop :=
  LRA.Relation.EquivalenceRelation relation /\
    UnaryOperationCongruence relation operation

   
                                                      

                                                                             
                                                                        
  
def BinaryOperationRelationRequirements {Carrier : Type u}
    (relation : LRA.Relation.Endorelation Carrier)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  LRA.Relation.EquivalenceRelation relation /\
    BinaryOperationCongruence relation operation

end LRA.UniversalAlgebra.Congruence
