import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.Order.MonotoneContinuity
import Mathlib.Topology.Order.OrderClosed
import LRA.Analysis.Bounds.Extrema.SupremaInfima
import LRA.Analysis.Completeness.Completeness.Definition

   
                                                                   
                                     
  

namespace LRA.Analysis.Completeness

open LRA.Analysis.Bounds.Extrema
open LRA.Analysis.Bounds

variable (F : Type*)

                                                                                                   
                                                                             

             

       
                                                      
                                                          
                                                              
                                        
   
  
theorem LubPropertyImpliesIncreasingProcessConvergence
    [LinearOrder F] [TopologicalSpace F] [OrderTopology F]
    (leastUpperBoundProperty : HasLeastUpperBoundProperty F) :
    IncreasingBoundedProcessesConverge F := by
  sorry

                                                                                                   
                                                                             

             

       
                                                      
                                                          
                                                              
                                        
   
  
theorem LubPropertyImpliesDecreasingProcessConvergence
    [LinearOrder F] [TopologicalSpace F] [OrderTopology F]
    (leastUpperBoundProperty : HasLeastUpperBoundProperty F) :
    DecreasingBoundedProcessesConverge F := by
  sorry

                                                                                    
                                                                                        
                                                                           

             

       
                                                    
                                                                     
                                          
                                                                                   
                                
   
  
theorem MonotoneProcessConvergenceImpliesLubProperty
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F]
    (monotoneProcessConvergenceHypothesis : IncreasingBoundedProcessesConverge F) :
    HasLeastUpperBoundProperty F := by
  sorry

end LRA.Analysis.Completeness
