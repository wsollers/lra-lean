                                                                      
                                                               

import LRA.NumberSystems.RationalNumbers.Definition
import LRA.NumberSystems.RealNumbers.Definition
import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.Behavior

namespace LRA.NumberSystems.RealNumbers.Dedekind

open LRA.NumberSystems.Models
open LRA.NumberSystems.RationalNumbers

                                                                              
                        

                                                                             
                                                                        
                                                                          
                                                                        

             

       
                                             
                                             
                     
                                                                           
                                                                     
   
  
theorem DedekindRealizesRationalRealExtension
    (rationalSystem : RationalNumberSystem) :
    ∃ realExtension :
        LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem,
      realExtension.RealModel.Carrier = Cut rationalSystem.FieldModel := by
  sorry

end LRA.NumberSystems.RealNumbers.Dedekind
