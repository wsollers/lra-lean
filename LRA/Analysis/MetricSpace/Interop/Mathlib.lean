import Mathlib.Topology.MetricSpace.Basic
import LRA.Analysis.MetricSpace.Definition.MetricSpace
import LRA.Analysis.MetricSpace.Definition.InitialTheorems

   
                                                                           
    
  

namespace LRA.Analysis.MetricSpace

universe u

namespace MetricDefinition

                                                                       

             

       
                                                                    
                             
                         
                                                   
                               
                                  
   
  
@[implicit_reducible]
def ToPseudoMetricSpace {X : Type u} (metric : MetricDefinition X) :
    PseudoMetricSpace X where
  dist := metric.distance
  dist_self := MetricDefinition.DistanceSelf metric
  dist_comm := metric.symmetric
  dist_triangle := metric.triangle

                                                                 

                                                                            
                               

             

       
                                                   
                                         
   
  
@[implicit_reducible]
def ToMathlibMetricSpace {X : Type u} (metric : MetricDefinition X) :
    MetricSpace X where
  toPseudoMetricSpace := metric.ToPseudoMetricSpace
  eq_of_dist_eq_zero := by
    intro x y distanceEqZero
    exact (metric.positive x y).2.1 distanceEqZero

                                                                            
            

             

       
                                                                        
                      
   
  
@[implicit_reducible]
def InducedTopologicalSpace {X : Type u} (metric : MetricDefinition X) :
    TopologicalSpace X := by
  letI : MetricSpace X := metric.ToMathlibMetricSpace
  infer_instance

                                                                            
                           

             

       
                                                                                
                                                       
                                  
   
  
theorem ToMathlibDistance {X : Type u} (metric : MetricDefinition X) (x y : X) :
    letI : MetricSpace X := metric.ToMathlibMetricSpace
    dist x y = metric.distance x y := by
  sorry

                                                                              

             

       
                                                                       
   
  
def FromMathlibMetric (X : Type u) [MetricSpace X] : MetricDefinition X := by
  refine ⟨(@Dist.dist X (inferInstance : Dist X)), ?_, ?_, ?_⟩
  · intro x y
    exact ⟨dist_nonneg, dist_eq_zero⟩
  · intro x y
    exact dist_comm x y
  · intro x y z
    exact dist_triangle x y z

end MetricDefinition

                                                                              
                                           

             

       
                                                              
                                           
                                                                            
   
  
def IsCompatibleWithMathlibMetric {X : Type u} [MetricSpace X]
    (metric : MetricDefinition X) : Prop :=
  ∀ x y : X, metric.distance x y = @Dist.dist X (inferInstance : Dist X) x y

                                                                             
                 

             

       
                                                      
                                  
                                                                        
   
  
theorem FromMathlibMetricIsCompatibleWithMathlibMetric
    {X : Type u} [MetricSpace X] :
    IsCompatibleWithMathlibMetric (MetricDefinition.FromMathlibMetric X) := by
  sorry

                                                                        
                       

             

       
                                                         
                                
                                 
                                                                    
                 
                                                                     
   
  
theorem ReverseTriangleInequalityFromMathlibCompatibility
    {X : Type u} [MetricSpace X]
    (metric : MetricDefinition X)
    (compatibilityHypothesis : IsCompatibleWithMathlibMetric metric)
    (x y z : X) :
    |metric.distance x z - metric.distance y z| ≤ metric.distance x y := by
  sorry

namespace MetricSpaceDefinition

                                                                            
      

             

       
                                                              
                                
                                   
   
  
@[implicit_reducible]
def ToMathlibMetricSpace (space : MetricSpaceDefinition.{u}) :
    MetricSpace space.Carrier :=
  space.metric.ToMathlibMetricSpace

                                                                             
                     

                                                                   
                                                                    
                                                                                 
instance instMathlibMetricSpace (space : MetricSpaceDefinition.{u}) :
    MetricSpace space.Carrier :=
  space.ToMathlibMetricSpace

end MetricSpaceDefinition

end LRA.Analysis.MetricSpace
