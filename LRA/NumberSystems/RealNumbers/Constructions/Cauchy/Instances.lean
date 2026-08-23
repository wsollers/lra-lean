                                                                    
                                                                       

import LRA.NumberSystems.RationalNumbers.Definition
import LRA.NumberSystems.RealNumbers.Definition
import LRA.NumberSystems.RealNumbers.Constructions.Cauchy.Behavior

namespace LRA.NumberSystems.RealNumbers.Cauchy

open LRA.NumberSystems.Models
open LRA.NumberSystems.RationalNumbers

                                                                        
                                     

                                                                             
                                                                         
                                                                    
                                                                           
                                                                            
                                                                              
                                                        

             

       
                                           
                                           
                                                             
                     
                                                                           
                                       
                                                
   
  
theorem CauchyRealizesRationalRealExtension
    (rationalSystem : RationalNumberSystem)
    (absoluteValueData : RationalMetricData rationalSystem) :
    ∃ realExtension :
        LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem,
      realExtension.RealModel.Carrier =
        Carrier rationalSystem absoluteValueData := by
  sorry

end LRA.NumberSystems.RealNumbers.Cauchy
