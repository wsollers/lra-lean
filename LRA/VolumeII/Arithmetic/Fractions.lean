                                         
                                              

import LRA.VolumeII.Switches.NumberSystems
import LRA.AlgebraicStructures

namespace LRA.NumberSystems.Arithmetic.Fractions

   
                                           
                                                   
                                                  

                                                                            
                               
  

   
                

                                          


             

       
               
   
  
abbrev Z := Int
   
                

                                          


             

       
               
   
  
abbrev Q := Rat


                                                            

                                                            


             

       
                                   
   
  
abbrev toQ (value : Z) : Q := value


                                                                      

                                                                                                                                                   

                             


             

       
                                         
                                             
                                 
   
  
theorem CrossMultiplication {a b c d : Q}
    (b_nonzero : b ≠ 0) (d_nonzero : d ≠ 0) :
    a / b = c / d ↔ a * d = c * b := by
  sorry

                                                                        

                                                                                                                                                              

                             


             

       
                                        
                                             
                                             
   
  
theorem FractionCancellation {a m n : Z}
    (a_nonzero : a ≠ 0) (n_nonzero : n ≠ 0) :
    toQ (a * m) / toQ (a * n) = toQ m / toQ n := by
  sorry

                                                                             

                                                                                                                                                        

                             


             

       
                                                            
                         
                                       
   
  
theorem NegativeNumeratorEqualsNegativeDenominator {m n : Z}
    (n_nonzero : n ≠ 0) :
    toQ (-m) / toQ n = toQ m / toQ (-n) := by
  sorry

                                                               

                                                                                                                                                                                                          

                             


             

       
                                                  
                       
                       
                          
                            
                                 
   
  
theorem CancelCommonIntegerDivisor {d m n r s : Z}
    (d_nonzero : d ≠ 0)
    (n_nonzero : n ≠ 0)
    (m_factor : m = d * r)
    (n_factor : n = d * s) :
    toQ m / toQ n = toQ r / toQ s := by
  sorry

end LRA.NumberSystems.Arithmetic.Fractions
