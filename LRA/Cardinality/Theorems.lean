                                
                                                               
                                                                       
                 

import LRA.Cardinality.Definition

namespace LRA.Cardinality

universe u v w

   
                                    
                                     
                                                        

                                                                      
                                                             
                                                                     
                                                                    
                                                                     
                                                                      
                                                                 
     

                                                                
                                                               
                                                                   
  

                                         

                                                                  

             

       
                                                             
   
  
theorem EquinumerousReflexive (A : Type u) : Equinumerous A A := by
  sorry

                                         

                                                                     
          

             

       
                                                       
                                                        
   
  
theorem EquinumerousSymmetric (A : Type u) (B : Type v)
    (equinumerous : Equinumerous A B) : Equinumerous B A := by
  sorry

                                          

                                                 

             

       
                                                                     
                                          
                                                              
   
  
theorem EquinumerousTransitive (A : Type u) (B : Type v) (C : Type w)
    (firstEquinumerous : Equinumerous A B)
    (secondEquinumerous : Equinumerous B C) : Equinumerous A C := by
  sorry

                                      

                                                             

             

       
                                                       
   
  
theorem DominatesReflexive (A : Type u) : Dominates A A := by
  sorry

                                       

                                             

             

       
                                                                  
                                    
                                                     
   
  
theorem DominatesTransitive (A : Type u) (B : Type v) (C : Type w)
    (firstDominates : Dominates A B)
    (secondDominates : Dominates B C) : Dominates A C := by
  sorry

                                           

                                                                    
             

             

       
                                                         
                                                     
   
  
theorem DominatesOfEquinumerous (A : Type u) (B : Type v)
    (equinumerous : Equinumerous A B) : Dominates A B := by
  sorry

                                            

                                                                   
                                                                     
                                                                      
                                                     

                             

             

       
                                                          
                                                                        
                    
   
  
theorem CantorSchroederBernstein (A : Type u) (B : Type v)
    (firstDominates : Dominates A B) (secondDominates : Dominates B A) :
    Equinumerous A B := by
  sorry

                                 

                                                              
                                                                      
                                                   

                             

             

       
                                    
                                                     
   
  
theorem CantorTheorem (A : Type u) :
    ¬ ∃ f : A → (A → Prop), LRA.Function.Surjective f := by
  sorry

                                             

                                                                
                                                               
                        

                             

             

       
                                                
                                  
   
  
theorem StrictlyDominatesPowerset (A : Type u) :
    StrictlyDominates A (A → Prop) := by
  sorry

end LRA.Cardinality
