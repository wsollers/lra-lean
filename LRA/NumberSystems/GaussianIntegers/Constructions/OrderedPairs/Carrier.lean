                                                                             
                                                                 
                                               

import LRA.AlgebraicStructures

namespace LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs

open LRA.AlgebraicStructures

universe u

   
                                                                          
                                                        
                                                                   

                                                                         
                                                                        
                                                                        
                                                                          
                                                           
                                                                       
                                                                        
                                                                        
                                                       
                                                                      
                                              
                                                       
                                 

                                                                
                                                                      
                                                                     
                                                                      
  

                                            

             

       
                                            
              
                   
   
  
structure GaussianInteger (R : Type u) where
  realPart : R
  imaginaryPart : R

variable {R : Type u}

                  

instance [OfNat R 0] : OfNat (GaussianInteger R) 0 := ⟨⟨0, 0⟩⟩

instance [OfNat R 0] [OfNat R 1] : OfNat (GaussianInteger R) 1 := ⟨⟨1, 0⟩⟩

                                          

             

       
                                                                       
   
  
def imaginaryUnit [OfNat R 0] [OfNat R 1] : GaussianInteger R := ⟨0, 1⟩

end LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs
