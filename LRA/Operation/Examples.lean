import LRA.Operation

   
                                       

                                                                        
                                                                              
                                             

                                                              
                                                                             
                                                                             
                                                                  
  

universe u v

                         

namespace LRA.Operation.Laws.Absorbing

open LRA.Operation

                                                                   
def BooleanAndOperation : BinaryEndoOperation Bool :=
  fun left right => left && right

   
                                                     

                                                                 
  
theorem BooleanFalseIsTwoSidedAbsorbingForAnd :
    TwoSidedAbsorbing BooleanAndOperation false := by
  sorry

                                                                   
def BooleanOrOperation : BinaryEndoOperation Bool :=
  fun left right => left || right

   
                                                   

                                                                
  
theorem BooleanTrueIsTwoSidedAbsorbingForOr :
    TwoSidedAbsorbing BooleanOrOperation true := by
  sorry

end LRA.Operation.Laws.Absorbing

                          

namespace LRA.Operation.Laws.Absorption

open LRA.Operation

                                                             
def BooleanOrOperation : BinaryEndoOperation Bool :=
  fun left right => left || right

                                                             
def BooleanAndOperation : BinaryEndoOperation Bool :=
  fun left right => left && right

   
                                            

                                                              
  
theorem BooleanOrAndMutualAbsorption :
    MutualAbsorptionLaw BooleanOrOperation BooleanAndOperation := by
  sorry

   
                                             

                                                             
  
theorem NaturalMaxMinMutualAbsorption :
    MutualAbsorptionLaw NaturalMaxOperation NaturalMinOperation := by
  sorry

end LRA.Operation.Laws.Absorption

                           

namespace LRA.Operation.Laws.Associative

open LRA.Operation

   
                                          

                                       
  
theorem NaturalAdditionAssociative :
    Associative NaturalAddition := by
  sorry

end LRA.Operation.Laws.Associative

                            

namespace LRA.Operation.Laws.Cancellation

open LRA.Operation

   
                                                   

                                                  
  
theorem NaturalAdditionTwoSidedCancellative :
    TwoSidedCancellative NaturalAddition := by
  sorry

                                                                          
def NaturalMultiplicationForRestrictedCancellation : BinaryEndoOperation Nat :=
  fun left right => left * right

                                                                               
theorem NaturalMultiplicationLeftCancellativeOnNonzero :
    LeftCancellativeOn
      (fun fixed : Nat => fixed ≠ 0)
      NaturalMultiplicationForRestrictedCancellation := by
  sorry

                                                                                
theorem NaturalMultiplicationRightCancellativeOnNonzero :
    RightCancellativeOn
      (fun fixed : Nat => fixed ≠ 0)
      NaturalMultiplicationForRestrictedCancellation := by
  sorry

end LRA.Operation.Laws.Cancellation

                       

namespace LRA.Operation.Laws.Closure

open LRA.Operation

   
                                                  

                                                                     
  
theorem NaturalAdditionClosedOnFullCarrier :
    BinaryEndoClosedOn (fun _ : Nat => True) NaturalAddition := by
  sorry

end LRA.Operation.Laws.Closure

                           

namespace LRA.Operation.Laws.Commutative

open LRA.Operation

   
                                          

                                       
  
theorem NaturalAdditionCommutative :
    Commutative NaturalAddition := by
  sorry

end LRA.Operation.Laws.Commutative

                            

namespace LRA.Operation.Laws.Distributive

open LRA.Operation

   
                                                            

                                                                       
  
theorem NaturalMultiplicationDistributesOverAddition :
    TwoSidedDistributive NaturalMultiplication NaturalAddition := by
  sorry

end LRA.Operation.Laws.Distributive

                          

namespace LRA.Operation.Laws.Idempotent

open LRA.Operation

                                                             
def BooleanOrOperation : BinaryEndoOperation Bool :=
  fun left right => left || right

   
                                   

                                  
  
theorem BooleanOrIdempotent :
    Idempotent BooleanOrOperation := by
  sorry

                                                             
def BooleanAndOperation : BinaryEndoOperation Bool :=
  fun left right => left && right

   
                                    

                                  
  
theorem BooleanAndIdempotent :
    Idempotent BooleanAndOperation := by
  sorry

end LRA.Operation.Laws.Idempotent

                        

namespace LRA.Operation.Laws.Identity

open LRA.Operation

                                                              
def BooleanOrOperation : BinaryEndoOperation Bool :=
  fun left right => left || right

   
                                                   

                                                        
  
theorem BooleanFalseIsTwoSidedIdentityForOr :
    TwoSidedIdentity BooleanOrOperation false := by
  sorry

                                                              
def BooleanAndOperation : BinaryEndoOperation Bool :=
  fun left right => left && right

   
                                                   

                                                       
  
theorem BooleanTrueIsTwoSidedIdentityForAnd :
    TwoSidedIdentity BooleanAndOperation true := by
  sorry

end LRA.Operation.Laws.Identity

                       

namespace LRA.Operation.Laws.Inverse

open LRA.Operation

                                                                    
def BooleanXorOperation : BinaryEndoOperation Bool :=
  fun left right => Bool.xor left right

                                                                      
def BooleanXorInverse : UnaryEndoOperation Bool :=
  fun element => element

   
                                     

                                                                          
  
theorem BooleanXorSelfInverse :
    TwoSidedInverse BooleanXorOperation false BooleanXorInverse := by
  sorry

                                                               
def IntegerAdditionForInverseExample : BinaryEndoOperation Int :=
  fun left right => left + right

                                                              
def IntegerAdditiveInverse : UnaryEndoOperation Int :=
  fun element => -element

                                                                             
theorem IntegerAdditionNegationTwoSidedInverse :
    TwoSidedInverse IntegerAdditionForInverseExample 0 IntegerAdditiveInverse := by
  sorry

end LRA.Operation.Laws.Inverse

                         

namespace LRA.Operation.Laws.Nilpotent

open LRA.Operation

                                                                                
def NaturalMultiplicationForNilpotenceExample : BinaryEndoOperation Nat :=
  fun left right => left * right

   
                                                       

                                                      
  
theorem NaturalZeroNilpotentUnderMultiplication :
    NilpotentElement NaturalMultiplicationForNilpotenceExample 0 0 := by
  sorry

end LRA.Operation.Laws.Nilpotent
