import Mathlib.Topology.MetricSpace.Basic
import Mathlib.Data.NNReal.Basic
import Mathlib.Tactic

   
                                                         
  

namespace LRA.Analysis.MetricSpace

universe u

variable {X : Type u} [MetricSpace X]

                                        

                                                                               
           

                                                                        


             

       
                                         
                                           
   
  
def pointFunction (z : X) : X → NNReal :=
  fun x => NNReal.mk (dist z x) dist_nonneg

                                                                          
                                                                          

   
                                 

                                                                                                                        


             

       
                                     
                                                    
   
  
@[simp]
theorem coe_pointFunction (z x : X) :
    ((pointFunction z x : NNReal) : Real) = dist z x := by
  sorry

   
                                  

                                                                                            


             

       
                                    
                         
   
  
@[simp]
theorem pointFunction_self (z : X) :
    pointFunction z z = 0 := by
  sorry

                                        

                                                 

                                                                                                    


             

       
                                                                     
                                    
   
  
def pointFunctions (X : Type u) [MetricSpace X] : Set (X → NNReal) :=
  Set.range (pointFunction (X := X))

                                            

                                                                                
                                                                               
                                       

                                                                       


             

       
                                        
            
                                            
                                            
   
  
def Pointlike (u : X → NNReal) : Prop :=
  ∀ a b : X,
    (u a : Real) - (u b : Real) ≤ dist a b ∧
      dist a b ≤ (u a : Real) + (u b : Real)


                                                           

                                                                                                                       


             

       
                                                  
                                      
   
  
theorem pointFunction_mem_pointFunctions (z : X) :
    pointFunction z ∈ pointFunctions X := by
  sorry

                                                         

                                                                               
          

                                                                                                                                                                                                                


             

       
                                         
                      
                                                                            
                                                  
   
  
theorem point_functions_identify_points :
    Function.Bijective
      (fun z : X => (⟨pointFunction z, pointFunction_mem_pointFunctions z⟩ :
        {u : X → NNReal // u ∈ pointFunctions X})) := by
  sorry

                                                     

                                                                               
           

                                                                                                                                                                                                                                                            


             

       
                                   
             
               
                                                                          
                                                                             
                           
   
  
theorem point_function_inequalities
    (z : X) :
    (∀ a b : X,
      (pointFunction z b : Real) - (pointFunction z a : Real) ≤ dist a b ∧
        dist a b ≤ (pointFunction z b : Real) + (pointFunction z a : Real)) ∧
      pointFunction z z = 0 := by
  sorry

                                      

                                                                                                       


             

       
                                         
                               
   
  
theorem pointFunction_pointlike (z : X) :
    Pointlike (pointFunction z) := by
  sorry

                                                       

                                                                        
                  

                                                                                                                                                                             


             

       
                                          
                    
                               
           
                           
                       
   
  
theorem pointlike_eq_pointFunction_of_zero
    {u : X → NNReal}
    (u_pointlike : Pointlike u)
    {w : X}
    (zero_at_w : u w = 0) :
    u = pointFunction w := by
  sorry

                                                                              
                                                                              
                                                          

                                                       

                                                                           
                                    

                                                                                                                                               


             

       
                                     
                      
                                                        
   
  
theorem pointlike_zero_point_function
    (u : X → NNReal) :
    u ∈ pointFunctions X ↔ Pointlike u ∧ 0 ∈ Set.range u := by
  sorry

                                                       

                                                              

                                                                                                                                                                                  


             

       
                             
                    
                               
               
                           
                             
           
   
  
theorem pointlike_zero_unique
    {u : X → NNReal}
    (u_pointlike : Pointlike u)
    {w₁ w₂ : X}
    (zero_at_w₁ : u w₁ = 0)
    (zero_at_w₂ : u w₂ = 0) :
    w₁ = w₂ := by
  sorry

end LRA.Analysis.MetricSpace
