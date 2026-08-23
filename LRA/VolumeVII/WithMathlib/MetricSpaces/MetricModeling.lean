import Mathlib.Topology.MetricSpace.Basic

namespace LRA.Internal

   
                              

                                                                            
                                                                            
              
  

                                         

                                                                                
           

             

       
                                              
                                         
                                   
                                   
                                                        
                                                  
                                                                      
                               
                                                                 
                                                    
                                                                                 
   
  
structure ScratchMetric (Point : Type u) where
                                         
  distance : Point -> Point -> Real
                                   
  distance_nonnegative : ∀ x y : Point, 0 ≤ distance x y
                                                  
  distance_eq_zero_iff_equal : ∀ x y : Point, distance x y = 0 ↔ x = y
                               
  distance_symmetric : ∀ x y : Point, distance x y = distance y x
                                                    
  distance_triangle : ∀ x y z : Point, distance x z ≤ distance x y + distance y z

                                                                              

             

       
                                                   
                                                                     
                              
   
  
structure ScratchMetricSpace (Point : Type u) where
                                                                     
  metric : ScratchMetric Point

end LRA.Internal

namespace LRA.Internal.ScratchMetricSpace

variable {Point : Type u} (M : ScratchMetricSpace Point)

                                                    

             

       
                                    
                       
   
  
def distance (x y : Point) : Real :=
  M.metric.distance x y

                                                                          

             

       
                                                      
   
  
theorem distance_self (x : Point) : M.distance x x = 0 := by
  sorry

                                                                

             

       
                                 
                                                           
   
  
theorem equal_of_distance_eq_zero
    {x y : Point} (hypothesis : M.distance x y = 0) : x = y := by
  sorry

                                                              

             

       
                                 
                                                           
   
  
theorem distance_eq_zero_of_equal
    {x y : Point} (hypothesis : x = y) : M.distance x y = 0 := by
  sorry

                                                                               
                                      

                                                                       
                                                                              
                                                                               
                                    

             

       
                                      
                            
                          
                                 
                                                            
                               
                                   
              
                                
                                                
                                                   
                       
                                                
   
  
noncomputable def toMathlibMetricSpace
    [TopologicalSpace Point]
    (topology_compatible :
      ∀ s : Set Point, IsOpen s ↔
        ∀ x ∈ s, ∃ ε > 0, ∀ y, M.distance x y < ε → y ∈ s) :
    _root_.MetricSpace Point :=
  _root_.MetricSpace.ofDistTopology
    M.distance
    (fun x => M.distance_self x)
    (fun x y => M.metric.distance_symmetric x y)
    (fun x y z => M.metric.distance_triangle x y z)
    topology_compatible
    (fun _ _ h => M.equal_of_distance_eq_zero h)

end LRA.Internal.ScratchMetricSpace
