                                                                          
                                                                        

import LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.WellDefinedness

namespace LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs

open LRA.AlgebraicStructures

variable {R : Type u}

section RingTheorems

variable [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1]
variable [CommutativeRingLaws R]

   
                                                         

             

       
                                                             
                             
   
  
theorem addition_is_associative (a b c : GaussianInteger R) :
    (a + b) + c = a + (b + c) := by
  sorry

   
                                                         

             

       
                                                           
                 
   
  
theorem addition_is_commutative (a b : GaussianInteger R) :
    a + b = b + a := by
  sorry

   
                                             

             

       
                                                             
   
  
theorem zero_add_gaussian (a : GaussianInteger R) : 0 + a = a := by
  sorry

   
                                             

             

       
                                                             
   
  
theorem add_zero_gaussian (a : GaussianInteger R) : a + 0 = a := by
  sorry

   
                                                         

             

       
                                                                    
   
  
theorem neg_add_cancel_gaussian (a : GaussianInteger R) : -a + a = 0 := by
  sorry

   
                                                         

             

       
                                                                    
   
  
theorem add_neg_cancel_gaussian (a : GaussianInteger R) : a + -a = 0 := by
  sorry

   
                                                                     

             

       
                                                                   
                             
   
  
theorem multiplication_is_associative (a b c : GaussianInteger R) :
    (a * b) * c = a * (b * c) := by
  sorry

   
                                                                     

             

       
                                                                 
                 
   
  
theorem multiplication_is_commutative (a b : GaussianInteger R) :
    a * b = b * a := by
  sorry

   
                                           

             

       
                                                            
   
  
theorem one_mul_gaussian (a : GaussianInteger R) : 1 * a = a := by
  sorry

   
                                           

             

       
                                                            
   
  
theorem mul_one_gaussian (a : GaussianInteger R) : a * 1 = a := by
  sorry

   
                                             

             

       
                                                             
   
  
theorem zero_mul_gaussian (a : GaussianInteger R) : 0 * a = 0 := by
  sorry

   
                                             

             

       
                                                             
   
  
theorem mul_zero_gaussian (a : GaussianInteger R) : a * 0 = 0 := by
  sorry

   
                                                               

             

       
                                                                
                               
   
  
theorem left_distributive_gaussian (a b c : GaussianInteger R) :
    a * (b + c) = a * b + a * c := by
  sorry

   
                                                                 

             

       
                                                                 
                               
   
  
theorem right_distributive_gaussian (a b c : GaussianInteger R) :
    (a + b) * c = a * c + b * c := by
  sorry

                                                        

             

       
                                
                                                            
   
  
theorem imaginary_unit_squared :
    imaginaryUnit * imaginaryUnit = -(1 : GaussianInteger R) := by
  sorry

end RingTheorems

end LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs
