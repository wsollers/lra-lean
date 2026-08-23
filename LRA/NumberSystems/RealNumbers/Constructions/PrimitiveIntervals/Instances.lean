                                                                                
                                                                   
                

import LRA.NumberSystems.RationalNumbers.Definition
import LRA.NumberSystems.RealNumbers.Definition
import LRA.NumberSystems.RealNumbers.Constructions.PrimitiveIntervals.Behavior

namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervals

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers

                                                                             
                                                

                                                                          
                                                                             
                                                                          
                                                                            

             

       
                                                       
                                             
                     
                                                                           
                                                                         
   
  
theorem PrimitiveIntervalsRealizesRationalRealExtension
    (rationalSystem : RationalNumberSystem) :
    ∃ realExtension :
        LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem,
      realExtension.RealModel.Carrier = Carrier rationalSystem.FieldModel := by
  sorry

end LRA.NumberSystems.RealNumbers.PrimitiveIntervals
