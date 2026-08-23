import Mathlib.Topology.MetricSpace.Basic

   
                                        
  

namespace LRA.Analysis.MetricSpace.SubSuperSpaces

universe u


                                                     

                                                                                                                


             

       
                      
                
                   
                 
                   
                                 
   
  
def restrictedDistance
    {Y : Type u}
    [MetricSpace Y]
    (X : Set Y) :
    X → X → Real :=
  fun x y => dist (x : Y) (y : Y)

                                                          

                                     

                                                                           
                                                                         
                          

                                                                                                             


             

       
                                  
                
                   
                     
                                          
                        
                                                                    
             
                                  
                                                  
   
  
structure MetricSubspaceDefinition
    (Y : Type u)
    [MetricSpace Y]
    (X : Set Y) where
                                          
  metric : MetricSpace X
                                                                    
  restricts :
    letI : MetricSpace X := metric
    ∀ x y : X, dist x y = restrictedDistance X x y

                                                          

                                       

                                                                              
                                                                               
                                        

                                                                                                   


             

       
                                    
                
                         
                                                                      
                 
                                               
                                               
   
  
structure MetricSuperspaceDefinition
    (Y : Type u)
    [MetricSpace Y] where
                                                                      
  carrier : Set Y
                                               
  subspace : MetricSubspaceDefinition Y carrier

                                                          

                                                                          
                                                                            
                            

                                                                                                                      


             

       
                    
                
                   
               
                     
           
                                                
   
  
def IsMetricSubspace
    {Y : Type u}
    [MetricSpace Y]
    (X : Set Y)
    [MetricSpace X] :
    Prop :=
  ∀ x y : X, dist x y = restrictedDistance X x y

                                                          

                                                                            
                                             

                                                                                                                        


             

       
                      
                
                   
               
                     
           
                    
   
  
def IsMetricSuperspace
    (Y : Type u)
    [MetricSpace Y]
    (X : Set Y)
    [MetricSpace X] :
    Prop :=
  IsMetricSubspace X

                                                                           

                                                                                                                       
                          

             

       
                                             
                                           
   
  
theorem closedUnitInterval_isMetricSubspace :
    IsMetricSubspace (Set.Icc (0 : Real) 1) := by
  sorry

                                                                              

                                                                                                                                     


             

       
                                                    
                                                  
   
  
theorem real_isMetricSuperspace_closedUnitInterval :
    IsMetricSuperspace Real (Set.Icc (0 : Real) 1) := by
  sorry

end LRA.Analysis.MetricSpace.SubSuperSpaces
