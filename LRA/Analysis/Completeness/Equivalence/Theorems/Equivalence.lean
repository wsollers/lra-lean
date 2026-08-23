import Mathlib.Algebra.Order.Archimedean.Basic
import Mathlib.Data.List.TFAE
import Mathlib.Data.Real.Basic
import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.Order.MonotoneContinuity
import Mathlib.Topology.Order.OrderClosed
import LRA.Analysis.Completeness.Completeness.Definition
import LRA.Analysis.Completeness.NestedIntervalProperty

   
                                                                        
                                                                       
                                                                           
                                                                            

                                                                    

                                                                          
                                                                   
                                                                               
                                                                              
                                                                             
                     
  

namespace LRA.Analysis.Completeness

open LRA.Analysis.Bounds.Extrema
open LRA.Analysis.Bounds

variable (F : Type*)

                                                                             
                                                     

             

       
                                                                  
                                                                     
                                            
                                                                  
   
  
theorem HasLeastUpperBoundPropertyIffHasGreatestLowerBoundProperty
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    HasLeastUpperBoundProperty F ↔ HasGreatestLowerBoundProperty F := by
  sorry

                                                                       
                                                

             

       
                                                           
                                                                     
                                            
                                                           
   
  
theorem HasLeastUpperBoundPropertyIffNestedIntervalProperty
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    HasLeastUpperBoundProperty F ↔ NestedIntervalProperty F := by
  sorry

                                                                           
                                                

             

       
                                                               
                                                                     
                                            
                                                               
   
  
theorem HasLeastUpperBoundPropertyIffBolzanoWeierstrassProperty
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    HasLeastUpperBoundProperty F ↔ BolzanoWeierstrassProperty F := by
  sorry

                                                                      
                                                                

             

       
                                                         
                                                                     
                                            
                                  
                                           
                                                
   
  
theorem LubPropertyEquivalentToMonotoneProcessConvergence
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    [HasLeastUpperBoundProperty F,
      IncreasingBoundedProcessesConverge F,
      DecreasingBoundedProcessesConverge F].TFAE := by
  sorry

                                                                       
                                                            

             

       
                                                     
                                                                     
                                            
                                                                 
   
  
theorem LubPropertyEquivalentToNestedIntervalProperty
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    [HasLeastUpperBoundProperty F, NestedIntervalProperty F].TFAE := by
  sorry

                                                                          
                                                                

             

       
                                        
                                                                     
                                            
                                  
                                      
                                           
                                           
                               
                                        
   
  
theorem StandardCompletenessEquivalences
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    [HasLeastUpperBoundProperty F,
      HasGreatestLowerBoundProperty F,
      IncreasingBoundedProcessesConverge F,
      DecreasingBoundedProcessesConverge F,
      NestedIntervalProperty F,
      BolzanoWeierstrassProperty F].TFAE := by
  sorry

end LRA.Analysis.Completeness
