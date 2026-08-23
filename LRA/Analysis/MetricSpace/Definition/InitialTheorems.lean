import Mathlib.Topology.MetricSpace.Basic
import Mathlib.Analysis.Complex.Basic
import LRA.Analysis.MetricSpace.Definition.Metric
import LRA.Analysis.MetricSpace.Definition.Metrics

   
                                                        
  

namespace LRA.Analysis.MetricSpace

universe u

                                                                            
                                                                          
                                              

             

       
                              
                                          
   
  
theorem EuclideanDistanceIsAMetric :
    ∃ metric : MetricDefinition ℝ,
      ∀ a b : ℝ, metric.distance a b = |a - b| := by
  sorry

                                                                         
                                      

             

       
                                       
   
  
theorem EmptySetIsAMetricSpace {X : Type u} :
    Nonempty (MetricDefinition (∅ : Set X)) := by
  sorry

                                                                          
                               

             

       
                                             
   
  
theorem SingletonSetIsAMetricSpace {X : Type u} (point : X) :
    Nonempty (MetricDefinition ({point} : Set X)) := by
  sorry

                                                                            
                                                                        
                                          

             

       
                              
                                          
   
  
theorem ModulusIsAMetricOnTheComplexNumbers :
    ∃ metric : MetricDefinition ℂ,
      ∀ a b : ℂ, metric.distance a b = ‖a - b‖ := by
  sorry

                                                                            
                                                                          
                                   

             

       
                                         
                                                               
                                            
   
  
theorem CircleAdmitsChordAsMetric :
    ∀ (center : ℂ) (radius : ℝ), 0 < radius →
      ∃ metric : MetricDefinition {z : ℂ // ‖z - center‖ = radius},
        ∀ a b, metric.distance a b = ‖a.1 - b.1‖ := by
  sorry

namespace MetricDefinition

                                    

             

       
                                                                         
                           
   
  
theorem DistanceSelf {X : Type u} (metric : MetricDefinition X) (x : X) :
    metric.distance x x = 0 := by
  sorry

                                      

             

       
                                                                                  
                           
   
  
theorem DistanceNonnegative {X : Type u} (metric : MetricDefinition X) (x y : X) :
    0 ≤ metric.distance x y := by
  sorry

                                              

             

       
                                                                                
                                   
   
  
theorem DistanceEqZeroIff {X : Type u} (metric : MetricDefinition X) (x y : X) :
    metric.distance x y = 0 ↔ x = y := by
  sorry

                          

             

       
                                                                                
                                             
   
  
theorem DistanceSymmetric {X : Type u} (metric : MetricDefinition X) (x y : X) :
    metric.distance x y = metric.distance y x := by
  sorry

                                               

             

       
                                                                                   
                                                                   
   
  
theorem TriangleInequality {X : Type u} (metric : MetricDefinition X) (x y z : X) :
    metric.distance x z ≤ metric.distance x y + metric.distance y z := by
  sorry

                                                       

             

       
                                                                                          
                                                                     
   
  
theorem ReverseTriangleInequality {X : Type u} (metric : MetricDefinition X) (x y z : X) :
    |metric.distance x z - metric.distance y z| ≤ metric.distance x y := by
  sorry

end MetricDefinition

                                                       

                                                               
                          

                                                                                                                                                                                                                          


             

       
                                                             
                
                                 
                 
                                                                     
   
  
theorem RearrangementOfTriangleInequalityFromMetricDefinition
    {X : Type u}
    (metric : MetricDefinition X)
    (a b c : X) :
    |metric.distance a b - metric.distance b c| ≤ metric.distance a c := by
  sorry

                                                       

                                                                             
                                                           

                                                                                                                                                          


             

       
                                            
                
                   
                 
                                    
   
  
theorem rearrangement_of_triangle_inequality
    {X : Type u}
    [MetricSpace X]
    (a b c : X) :
    |dist a b - dist b c| ≤ dist a c := by
  sorry

end LRA.Analysis.MetricSpace
