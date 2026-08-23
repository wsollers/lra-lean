import Mathlib.Topology.MetricSpace.Basic
import Mathlib.Data.Real.Archimedean

namespace LRA.Analysis.MetricSpace

                                     


                                                             

                                                                                                             


             

       
               
                
                   
           
                             
                              
   
  
def distanceSet
    {X : Type u}
    [MetricSpace X]
    (x : X)
    (S : Set X) : Set Real :=
  (fun y : X => dist x y) '' S


                                                                  

                                                                                                                         


             

       
                               
                
                   
           
                         
                        
   
  
noncomputable def distanceToSet
    {X : Type u}
    [MetricSpace X]
    (x : X)
    (S : Set X) : Real :=
  sInf (distanceSet x S)


                                                                       

                                                                                                                                                                        

                             


             

       
                            
                
                   
           
               
                                 
                              
   
  
theorem distanceSet_nonempty
    {X : Type u}
    [MetricSpace X]
    (x : X)
    {S : Set X}
    (set_nonempty : S.Nonempty) :
    (distanceSet x S).Nonempty := by
  sorry

                                              

                                                                                                                                            


             

       
                            
                
                   
           
                 
                              
   
  
theorem distanceSet_bddBelow
    {X : Type u}
    [MetricSpace X]
    (x : X)
    (S : Set X) :
    BddBelow (distanceSet x S) := by
  sorry

                                                                               

                                                                                                                                                                                        

                             
                  

             

       
                           
                
                   
           
               
                                 
                                               
   
  
theorem distanceToSet_isGLB
    {X : Type u}
    [MetricSpace X]
    (x : X)
    {S : Set X}
    (set_nonempty : S.Nonempty) :
    IsGLB (distanceSet x S) (distanceToSet x S) := by
  sorry

                                                                             

                                                                                                                                                                                                  
                 

             

       
                                                 
                
                   
           
               
           
                            
                                
   
  
theorem distanceToSet_le_distance_to_point_of_mem
    {X : Type u}
    [MetricSpace X]
    (x : X)
    {A : Set X}
    {a : X}
    (point_in_set : a ∈ A) :
    distanceToSet x A ≤ dist x a := by
  sorry

                                                                            

                                                                                                                                                                      
    

             

       
                                    
                
                   
               
           
                            
                         
   
  
theorem distanceToSet_eq_zero_of_mem
    {X : Type u}
    [MetricSpace X]
    {A : Set X}
    {x : X}
    (point_in_set : x ∈ A) :
    distanceToSet x A = 0 := by
  sorry

end LRA.Analysis.MetricSpace
