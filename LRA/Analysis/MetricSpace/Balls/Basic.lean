import Mathlib.Topology.MetricSpace.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

namespace LRA.Analysis.MetricSpace

                                            

variable {X : Type u} [MetricSpace X]


                                                                               

                                                                                                                            

                             


             

       
                       
           
              
                               
                       
   
  
theorem center_mem_ball
    (x : X)
    {r : Real}
    (radius_positive : 0 < r) :
    x ∈ Metric.ball x r := by
  sorry

                                          

                                                                                                                                       

                             


             

       
                        
           
                
                         
                                     
   
  
theorem ball_subset_ball
    (x : X)
    {r s : Real}
    (radius_le : r ≤ s) :
    Metric.ball x r ⊆ Metric.ball x s := by
  sorry

                                                                            

                                                                                                                             

                             
       

             

       
                              
           
                
                                           
   
  
theorem ball_subset_closedBall
    (x : X)
    (r : Real) :
    Metric.ball x r ⊆ Metric.closedBall x r := by
  sorry

                                                                               

                                                                                                                                                                         

                             
                                    

             

       
                               
             
              
                                         
                                              
   
  
theorem ball_subset_ball_of_mem
    {x y : X}
    {r : Real}
    (pointInBall : y ∈ Metric.ball x r) :
    ∃ ε > 0, Metric.ball y ε ⊆ Metric.ball x r := by
  sorry

end LRA.Analysis.MetricSpace
