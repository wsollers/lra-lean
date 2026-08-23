import LRA.Function.Properties

namespace LRA.Carrier

universe u

   
                                                              
                                                                   
                                                                       
                                                                      
                                                                    
                
  

                                                                 

             

       
                                   
                                                      
   
  
def IsFinite (A : Type u) : Prop :=
  ∃ n : Nat, ∃ f : A → Fin n, LRA.Function.Bijective f

                                          

             

       
                                     
              
   
  
def IsInfinite (A : Type u) : Prop :=
  ¬ IsFinite A

end LRA.Carrier
