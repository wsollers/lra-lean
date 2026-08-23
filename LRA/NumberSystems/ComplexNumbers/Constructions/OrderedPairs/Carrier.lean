                                                                           
                                                                 
                                               

import LRA.AlgebraicStructures

namespace LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs

open LRA.AlgebraicStructures
open LRA.Order

universe u

   
                                                                        
                                                             
                                                                   

                                                                  
                                                                         
                                                                    
                                                                     
                               

                                                                             
                                                                         
                                                                     
                                                                  
                                                                      
                                                                         
                                                             
                                                                  
        

                                                                    
                                                            
                                                                       
                                                                   
                                                                      
                                                              
                                    

                                                                    
                                                                     
                                                                 
                                                                      
                                        
  

                                                        
                                 

             

       
                                          
               
                    
   
  
structure ComplexNumber (R : Type u) where
  real_part : R
  imaginary_part : R

variable {R : Type u}

                                                             

instance [OfNat R 0] : OfNat (ComplexNumber R) 0 := ⟨⟨0, 0⟩⟩

instance [OfNat R 0] [OfNat R 1] : OfNat (ComplexNumber R) 1 := ⟨⟨1, 0⟩⟩

                           

             

       
                                                                     
   
  
def imaginaryUnit [OfNat R 0] [OfNat R 1] : ComplexNumber R := ⟨0, 1⟩

end LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs
