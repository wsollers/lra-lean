                                                                        
                                                                      

import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.WellDefinedness

namespace LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs

open LRA.AlgebraicStructures

variable {R : Type u}

section RingTheorems

variable [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1]
variable [CommutativeRingLaws R]

   
                                                         

             

       
                                                           
                             
   
  
theorem addition_is_associative (a b c : ComplexNumber R) :
    (a + b) + c = a + (b + c) := by
  sorry

   
                                                         

             

       
                                                         
                 
   
  
theorem addition_is_commutative (a b : ComplexNumber R) :
    a + b = b + a := by
  sorry

   
                                           

             

       
                                                          
   
  
theorem zero_add_complex (a : ComplexNumber R) : 0 + a = a := by
  sorry

   
                                           

             

       
                                                          
   
  
theorem add_zero_complex (a : ComplexNumber R) : a + 0 = a := by
  sorry

   
                                                       

             

       
                                                                 
   
  
theorem neg_add_cancel_complex (a : ComplexNumber R) : -a + a = 0 := by
  sorry

   
                                                       

             

       
                                                                 
   
  
theorem add_neg_cancel_complex (a : ComplexNumber R) : a + -a = 0 := by
  sorry

   
                                                                     

             

       
                                                                 
                             
   
  
theorem multiplication_is_associative (a b c : ComplexNumber R) :
    (a * b) * c = a * (b * c) := by
  sorry

   
                                                                     

             

       
                                                               
                 
   
  
theorem multiplication_is_commutative (a b : ComplexNumber R) :
    a * b = b * a := by
  sorry

   
                                         

             

       
                                                         
   
  
theorem one_mul_complex (a : ComplexNumber R) : 1 * a = a := by
  sorry

   
                                         

             

       
                                                         
   
  
theorem mul_one_complex (a : ComplexNumber R) : a * 1 = a := by
  sorry

   
                                           

             

       
                                                          
   
  
theorem zero_mul_complex (a : ComplexNumber R) : 0 * a = 0 := by
  sorry

   
                                           

             

       
                                                          
   
  
theorem mul_zero_complex (a : ComplexNumber R) : a * 0 = 0 := by
  sorry

   
                                                             

             

       
                                                             
                               
   
  
theorem left_distributive_complex (a b c : ComplexNumber R) :
    a * (b + c) = a * b + a * c := by
  sorry

   
                                                               

             

       
                                                              
                               
   
  
theorem right_distributive_complex (a b c : ComplexNumber R) :
    (a + b) * c = a * c + b * c := by
  sorry

                                     

             

       
                                
                                                          
   
  
theorem imaginary_unit_squared :
    imaginaryUnit * imaginaryUnit = -(1 : ComplexNumber R) := by
  sorry

end RingTheorems

section FieldTheorems

variable [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
variable [OrderedFieldLaws R]

   
                                                 

             

       
                                                       
   
  
theorem one_ne_zero_complex : (1 : ComplexNumber R) ≠ 0 := by
  sorry

   
                                                       

             

       
                              
                                                           
                       
   
  
theorem mul_inv_cancel_complex
    (value : ComplexNumber R) (value_nonzero : value ≠ 0) :
    value * value⁻¹ = 1 := by
  sorry

   
                                           

             

       
                                                      
   
  
theorem inv_zero_complex : (0 : ComplexNumber R)⁻¹ = 0 := by
  sorry

end FieldTheorems

end LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs
