                                                                    
                                                                              

import LRA.NumberSystems.RationalNumbers.Definition
import LRA.NumberSystems.RealNumbers.Definition
import LRA.NumberSystems.RealNumbers.Constructions.Cantor.Behavior

namespace LRA.NumberSystems.RealNumbers.Cantor

open LRA.NumberSystems.Models
open LRA.NumberSystems.RationalNumbers

                                                                             
                                                

                                                                              
                                                                             
                                                                               
                            

             

       
                                           
                                             
                     
                                                                           
                                                                         
   
  
theorem CantorRealizesRationalRealExtension
    (rationalSystem : RationalNumberSystem) :
    ∃ realExtension :
        LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem,
      realExtension.RealModel.Carrier = Carrier rationalSystem.FieldModel := by
  sorry

end LRA.NumberSystems.RealNumbers.Cantor
