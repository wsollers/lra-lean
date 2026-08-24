                                                                               
                                                            

import LRA.NumberSystems.RealNumbers.Constructions.PrimitiveIntervals.Laws
import LRA.NumberSystems.RealNumbers.Constructions.Cauchy
import LRA.NumberSystems.RationalNumbers.Definition

namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervals

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers

variable (rationalSystem : RationalNumberSystem)

                                                                          
                                                                       

                                                                            
                                                                        
                                                                

             

       
                                                    
                                                                  
                                                               
                                                       
                                                     
                     
                                                         
                                                
                                                  
   
  
theorem PersistentOverlapIffEndpointDifferenceIsNull
    (absoluteValueData : Cauchy.RationalMetricData rationalSystem)
    (first second : Representative rationalSystem.FieldModel) :
    equivalent rationalSystem.FieldModel first second ↔
      Cauchy.is_null rationalSystem absoluteValueData
        (fun index =>
          rationalSystem.FieldModel.signature.Subtraction
            (first.interval index).left_endpoint
            (second.interval index).left_endpoint) := by
  sorry

   
                                                                          
                                                                               
                                                                     

                                                                              
                                                                     
                                                                 
                                                                        
                 
  

end LRA.NumberSystems.RealNumbers.PrimitiveIntervals
