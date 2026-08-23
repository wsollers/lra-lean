                                                                 
                                                                               
                                                                  

import Mathlib.Data.NNReal.Basic
import Mathlib.Data.ENNReal.Basic
import LRA.NumberSystems.RealNumbers.NonNegative
import LRA.NumberSystems.Models

namespace LRA.NumberSystems.RealNumbers.Interop.Mathlib

open LRA.NumberSystems.Models
open LRA.NumberSystems.RealNumbers.NonNegative

   
                                                                 
                                                                         
                                                                        

                                                                            
                                                                          
                                                         
                                                                         
                             
  

                                                                       
                                                                     
     

                             

             

       
                                            
                                                           
                                                             
                                                      
                                                      
                                                         
                                           
                      
                                                      
                                           
   
  
theorem NonNegativeRealMathlibBridgeExists :
    ∃ toNNReal : NonNegativeReal mathlibRealModel → NNReal,
    ∃ fromNNReal : NNReal → NonNegativeReal mathlibRealModel,
      (∀ value, fromNNReal (toNNReal value) = value) ∧
      (∀ value, toNNReal (fromNNReal value) = value) ∧
      (∀ first second, le mathlibRealModel first second ↔
        toNNReal first ≤ toNNReal second) ∧
      (∀ first second,
        toNNReal (add mathlibRealModel first second) =
          toNNReal first + toNNReal second) := by
  sorry

                                                                      
                                                                       
             

                             

             

       
                                                    
                                                                     
                                                                       
                                                        
                                                        
                                                                 
                                             
                      
                                                               
                                             
   
  
theorem NonNegativeExtendedRealMathlibBridgeExists :
    ∃ toENNReal : NonNegativeExtendedReal mathlibRealModel → ENNReal,
    ∃ fromENNReal : ENNReal → NonNegativeExtendedReal mathlibRealModel,
      (∀ value, fromENNReal (toENNReal value) = value) ∧
      (∀ value, toENNReal (fromENNReal value) = value) ∧
      (∀ first second, leExtended mathlibRealModel first second ↔
        toENNReal first ≤ toENNReal second) ∧
      (∀ first second,
        toENNReal (addExtended mathlibRealModel first second) =
          toENNReal first + toENNReal second) := by
  sorry

end LRA.NumberSystems.RealNumbers.Interop.Mathlib
