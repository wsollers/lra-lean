                                                      
                                                          

import LRA.VolumeII.Switches.NumberSystems
import LRA.AlgebraicStructures

namespace LRA.NumberSystems.Arithmetic.MultiplicativeInverses

   
                                                         
                                                                
                                                  
  

   
                

                                          


             

       
               
   
  
abbrev Q := Rat


                                                                         

                                                                                                                                 

                             


             

       
                                                                     
                             
   
  
theorem NonzeroHasMultiplicativeInverse {a : Q} (a_nonzero : a ≠ 0) :
    a⁻¹ * a = 1 ∧ a * a⁻¹ = 1 := by
  sorry

                                                                        

                                                                                                                                   

                             


             

       
                                       
                       
                                 
           
   
  
theorem RightInverseIsInverse {a b : Q}
    (a_nonzero : a ≠ 0)
    (right_inverse : a * b = 1) :
    b = a⁻¹ := by
  sorry

                                           

                                                                                                                   

                             


             

       
                                      
                                
                 
   
  
theorem MulEqZeroImpliesZero {a b : Q}
    (product_zero : a * b = 0) :
    a = 0 ∨ b = 0 := by
  sorry

                                                  

                                                                                                                                   

                             


             

       
                                          
                       
                                
         
   
  
theorem EqZeroOfNonzeroMulEqZero {a b : Q}
    (a_nonzero : a ≠ 0)
    (product_zero : a * b = 0) :
    b = 0 := by
  sorry

end LRA.NumberSystems.Arithmetic.MultiplicativeInverses
