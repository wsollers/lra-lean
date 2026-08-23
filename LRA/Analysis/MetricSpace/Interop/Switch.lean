import LRA.Analysis.MetricSpace.Interop.Mathlib

   
                                                                       
                                                                            
                   
  

namespace LRA.Analysis.MetricSpace

universe u

                                                        

             

       
                                  
                                                                                
                               
                                                              
                         
                            
   
  
inductive MetricSpaceBackend where
                                                                                
  | inducedFromMetricDefinition
                                                              
  | existingMathlibMetric
  deriving DecidableEq, Repr

                                                                    

             

       
                                                     
                              
   
  
def DefaultMetricSpaceBackend : MetricSpaceBackend :=
  .inducedFromMetricDefinition

                                                                               

                                           

       
                                                               
   

                                                                              
                                                              

             

       
                                                                       
                    
                             
   
  
@[implicit_reducible]
def UseTextbookMetricSpace {X : Type u} (metric : MetricDefinition X) :
    MetricSpace X :=
  metric.ToMathlibMetricSpace

                                                          

             

       
                                                              
                                    
                    
               
   
  
@[implicit_reducible]
def UseExistingMathlibMetricSpace {X : Type u} [MetricSpace X]
    (_metric : MetricDefinition X) :
    MetricSpace X :=
  inferInstance

                                                                  

             

       
                                         
                                  
                                 
                                           
                    
                    
                                                               
                                                 
   
  
@[implicit_reducible]
def SelectMathlibMetricSpace {X : Type u}
    (backend : MetricSpaceBackend)
    (metric : MetricDefinition X)
    [existingMetricSpace : MetricSpace X] :
    MetricSpace X :=
  match backend with
  | .inducedFromMetricDefinition => metric.ToMathlibMetricSpace
  | .existingMathlibMetric => existingMetricSpace

                                                                                
                                 

             

       
                                                            
                                 
                   
               
                           
                                                                  
                                  
   
  
theorem SelectMathlibMetricSpaceDistanceInduced {X : Type u}
    (metric : MetricDefinition X)
    [MetricSpace X]
    (x y : X) :
    letI : MetricSpace X :=
      SelectMathlibMetricSpace .inducedFromMetricDefinition metric
    dist x y = metric.distance x y := by
  sorry

end LRA.Analysis.MetricSpace
