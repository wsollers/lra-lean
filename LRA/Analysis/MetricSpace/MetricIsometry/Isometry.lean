import Mathlib.Topology.MetricSpace.Basic

   
                  
  

namespace LRA.Analysis.MetricSpace.MetricIsometry

universe u v

                                                          

                                                                               
                       

                                                                                                                                   


             

       
                    
                
                
                   
                   
                 
           
                                        
   
  
def IsMetricIsometry
    {X : Type u}
    {Y : Type v}
    [MetricSpace X]
    [MetricSpace Y]
    (φ : X → Y) :
    Prop :=
  ∀ a b : X, dist (φ a) (φ b) = dist a b


                                                             

                                                                                                 


             

       
                  
                
                
                 
           
                              
   
  
def IsInjectiveMap
    {X : Type u}
    {Y : Type v}
    (φ : X → Y) :
    Prop :=
  ∀ a b : X, φ a = φ b → a = b

                                           

                                                                       
                                                                          
          

                                                                                                                                                                                                                                                 


             

       
                                  
                
                
                   
                   
                          
                                                                   
                               
   
  
theorem isMetricIsometry_injective
    {X : Type u}
    {Y : Type v}
    [MetricSpace X]
    [MetricSpace Y]
    {isometricMap : X → Y}
    (isometry_preserves_distance : IsMetricIsometry isometricMap) :
    IsInjectiveMap isometricMap := by
  sorry

                                                                            

                                                                                                                                                                                                                                                                                                  
                                

             

       
                                                          
                    
                                                
                                     
                                                                                                
                              
   
  
theorem positiveOpenRay_isMetricIsometry_negativeOpenRay :
    IsMetricIsometry
      (fun positivePoint : Set.Ioi (0 : Real) =>
        (⟨-(positivePoint : Real), by
          exact neg_lt_zero.mpr (show 0 < (positivePoint : Real) from positivePoint.property)⟩ :
          Set.Iio (0 : Real))) := by
  sorry

                                                          

                                                                              
                     

                                                                                                                                


             

       
                 
                
                
                   
                   
                 
           
                                                   
   
  
def IsometricCopy
    (X : Type u)
    {Y : Type v}
    [MetricSpace X]
    [MetricSpace Y]
    (Z : Set Y) :
    Prop :=
  ∃ φ : X → Y, IsMetricIsometry φ ∧ Set.range φ = Z

end LRA.Analysis.MetricSpace.MetricIsometry
