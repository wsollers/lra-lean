                                                   
                                                                            

import LRA.AlgebraicStructures

namespace LRA.NumberSystems.Arithmetic.AlgebraicIdentities

open LRA.AlgebraicStructures

universe u

   
                                                      
                                                             
                                                     

                                                                  
                                                               
                                                                    
                                                                   
                                                                  
                                                                        
                              
  

                             

             

       
                                                                
   
  
def Square {R : Type u} [Mul R] (value : R) : R := value * value

                                                

                                                       

                             


             

       
                                  
                                           
                               
               
                                                         
   
  
theorem SqAddExpanded {R : Type u}
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1]
    [CommutativeSemiringLaws R]
    (a b : R) :
    (a + b) * (a + b) = a * a + (1 + 1) * (a * b) + b * b := by
  sorry

                                                  

                                                         

                             


             

       
                                    
                                                           
                                                           
               
                                     
   
  
theorem SqSubSqExpanded {R : Type u}
    [Add R] [Mul R] [Neg R] [Sub R] [OfNat R 0] [OfNat R 1]
    [CommutativeRingLaws R] [SubtractionCompatibilityLaw R]
    (a b : R) :
    a * a - b * b = (a + b) * (a - b) := by
  sorry

                                                   

                                                       

                             


             

       
                                  
                                                           
                                                           
               
                                                         
   
  
theorem SqSubExpanded {R : Type u}
    [Add R] [Mul R] [Neg R] [Sub R] [OfNat R 0] [OfNat R 1]
    [CommutativeRingLaws R] [SubtractionCompatibilityLaw R]
    (a b : R) :
    (a - b) * (a - b) = a * a - (1 + 1) * (a * b) + b * b := by
  sorry

   
                                                                    
                                                                     
                                            
  

example (a b : Int) :
    (a + b) * (a + b) = a * a + (1 + 1) * (a * b) + b * b :=
  SqAddExpanded a b

example (a b : Rat) : a * a - b * b = (a + b) * (a - b) :=
  SqSubSqExpanded a b

end LRA.NumberSystems.Arithmetic.AlgebraicIdentities
