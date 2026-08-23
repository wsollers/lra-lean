import Mathlib.Topology.MetricSpace.Basic
import Mathlib.Data.Real.Archimedean

namespace LRA.Analysis.MetricSpace

                                     


                                                          

                                                                                                     


             

       
               
                
                   
                             
                                                               
   
  
def diameterSet
    {X : Type u}
    [MetricSpace X]
    (S : Set X) : Set Real :=
  { r : Real | ∃ x : X, x ∈ S ∧ ∃ y : X, y ∈ S ∧ r = dist x y }


                                                     

                                                                                                            


             

       
                          
                
                   
                         
                      
   
  
noncomputable def diameter
    {X : Type u}
    [MetricSpace X]
    (S : Set X) : Real :=
  sSup (diameterSet S)


                                                            

                                                                                                                                                             


             

       
                        
                
                   
                 
                             
                                 
   
  
theorem diameterSet_mono
    {X : Type u}
    [MetricSpace X]
    {A B : Set X}
    (set_inclusion : A ⊆ B) :
    diameterSet A ⊆ diameterSet B := by
  sorry

                                             

                                                                                                                                                                                                                                                                                


             

       
                                         
                
                   
                 
                           
                                                       
                                                         
                           
   
  
theorem diameter_monotone_under_inclusion
    {X : Type u}
    [MetricSpace X]
    {A B : Set X}
    (set_inclusion : A ⊆ B)
    (A_diameterSet_nonempty : (diameterSet A).Nonempty)
    (B_diameterSet_bddAbove : BddAbove (diameterSet B)) :
    diameter A ≤ diameter B := by
  sorry

end LRA.Analysis.MetricSpace
