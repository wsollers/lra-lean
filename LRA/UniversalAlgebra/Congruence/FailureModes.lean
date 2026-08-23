import LRA.UniversalAlgebra.Congruence.Definition

namespace LRA.UniversalAlgebra.Congruence

open LRA.Operation

universe u

   
                                                                              

                                                                           
                                                                             
                                       
  
def FailsUnaryRelationSubstitution {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : UnaryEndoOperation Carrier) : Prop :=
  Not (forall {left right : Carrier},
    relation left right -> operation left = operation right)

                                      
def SameParity (left right : Nat) : Prop :=
  left % 2 = right % 2

                                                        
def NaturalSuccessor : UnaryEndoOperation Nat :=
  fun number => number + 1

   
                                                                 

                                                                              
                                           
  
theorem SameParityFailsUnarySubstitutionForSuccessor :
    FailsUnaryRelationSubstitution SameParity NaturalSuccessor := by
  sorry

end LRA.UniversalAlgebra.Congruence
