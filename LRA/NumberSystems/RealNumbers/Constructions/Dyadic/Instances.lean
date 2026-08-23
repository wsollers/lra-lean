                                                                    
                                                               
                  

import LRA.NumberSystems.RealNumbers.Definition
import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.Behavior

namespace LRA.NumberSystems.RealNumbers.Dyadic

open LRA.NumberSystems.Models

                                                                         
                                                                          
                             

                                                                            
                                                

             

       
                                           
                                                    
                     
                                                           
                                    
                                                 
   
  
theorem DyadicRealizesRationalRealExtension
    (dyadicData : RationalDyadicApproximationData) :
    ∃ realExtension :
        LRA.NumberSystems.RealNumbers.RationalRealExtension
          dyadicData.RationalSystem,
      realExtension.RealModel.Carrier = Expansion := by
  sorry

end LRA.NumberSystems.RealNumbers.Dyadic
