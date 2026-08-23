                                                                            
                                                                        
                                                                           

import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.Laws

namespace LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs

open LRA.AlgebraicStructures
open LRA.Order

variable {R : Type u}

section EmbeddingTheorems

variable [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1]
variable [CommutativeRingLaws R]

   
                                                       

             

       
                                                                        
   
  
theorem of_real_preserves_zero : of_real (0 : R) = (0 : ComplexNumber R) := by
  sorry

   
                                                     

             

       
                                                                       
   
  
theorem of_real_preserves_one : of_real (1 : R) = (1 : ComplexNumber R) := by
  sorry

   
                                                               

             

       
                                                       
                                                             
   
  
theorem of_real_preserves_addition (first second : R) :
    of_real (first + second) = of_real first + of_real second := by
  sorry

   
                                                               

             

       
                                                
                                       
   
  
theorem of_real_preserves_negation (value : R) :
    of_real (-value) = -(of_real value) := by
  sorry

   
                                                                           

             

       
                                                             
                                                             
   
  
theorem of_real_preserves_multiplication (first second : R) :
    of_real (first * second) = of_real first * of_real second := by
  sorry

   
                                                   

             

       
                                               
                                                                    
   
  
theorem of_real_is_injective (first second : R)
    (images_equal : of_real first = of_real second) : first = second := by
  sorry

end EmbeddingTheorems

                                                          

                                                             

             

       
                                                   
              
                                                  
                               
                                                                  
   
  
structure Polynomial (R : Type u) [OfNat R 0] where
  degree : Nat
  coefficient : Fin (degree + 1) → ComplexNumber R
  leading_coefficient_nonzero :
    degree ≠ 0 → coefficient ⟨degree, Nat.lt_succ_self degree⟩ ≠ 0

                          

             

       
                                                   
                               
                                               
   
  
def Polynomial.evaluate [OfNat R 0] [Add R] [Mul R]
    (polynomial : Polynomial R)
    (input : ComplexNumber R) : ComplexNumber R :=
  sorry

                             

             

       
                                                                            
                       
   
  
def Polynomial.nonconstant [OfNat R 0] (polynomial : Polynomial R) : Prop :=
  polynomial.degree ≠ 0

   
                                                                
                                                                    
                                                                 


             

       
                                    
                                                                  
                                                          
                               
                                                       
                             
                                                      
   
  
theorem algebraic_closure_obligation
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
    [OrderedFieldLaws R] [OrderCompletenessLaws R (Set R)]
    (polynomial : Polynomial R)
    (polynomial_nonconstant : Polynomial.nonconstant polynomial) :
    ∃ root : ComplexNumber R,
      Polynomial.evaluate polynomial root = (0 : ComplexNumber R) := by
  sorry

end LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs
