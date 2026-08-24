                                                              
                                                                         
                                    

import Mathlib.Data.EReal.Basic
import LRA.NumberSystems.RealNumbers.Extended
import LRA.NumberSystems.Interface.ModelTheory.Model

namespace LRA.NumberSystems.RealNumbers.Interop.Mathlib

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Extended

   
                                                                 
                                                                       
                                                                     
                                                                          
                                                                             
                                                                             
                                                                        
                                                                     
                                                             

                                                                         
                                                                        
                                                                      
                                                                        
  

                                                                        
                                                                     
                                                                    
                                                          

                             

             

       
                                         
                                                      
                                                        
                                                    
                                                    
                      
                                                       
                                         
   
  
theorem ExtendedRealMathlibBridgeExists :
    ∃ toEReal : ExtendedReal mathlibRealModel → EReal,
    ∃ fromEReal : EReal → ExtendedReal mathlibRealModel,
      (∀ value, fromEReal (toEReal value) = value) ∧
      (∀ value, toEReal (fromEReal value) = value) ∧
      (∀ first second,
        nonstrict_order mathlibRealModel first second ↔
          toEReal first ≤ toEReal second) := by
  sorry

end LRA.NumberSystems.RealNumbers.Interop.Mathlib
