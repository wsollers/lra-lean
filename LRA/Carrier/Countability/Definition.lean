import LRA.Function.Properties

namespace LRA.Carrier

universe u

   
                                                               
                                                             
                                                                      
                                                               
                                                                    
                                                                   
                                
  

                                                                    
         

             

       
                                      
                                         
   
  
def IsCountable (A : Type u) : Prop :=
  ∃ f : A → Nat, LRA.Function.Injective f

                                                              

             

       
                                              
                                         
   
  
def IsCountablyInfinite (A : Type u) : Prop :=
  ∃ f : A → Nat, LRA.Function.Bijective f

                                                

             

       
                                        
                 
   
  
def IsUncountable (A : Type u) : Prop :=
  ¬ IsCountable A

end LRA.Carrier
