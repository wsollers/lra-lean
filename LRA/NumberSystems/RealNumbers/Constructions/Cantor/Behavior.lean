                                                                   
                                                                      
                                             

import LRA.NumberSystems.RealNumbers.Constructions.Cantor.Laws
import LRA.NumberSystems.RealNumbers.Constructions.Cauchy
import LRA.Function.Properties.Definition
import LRA.NumberSystems.RationalNumbers.Definition

namespace LRA.NumberSystems.RealNumbers.Cantor
open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers

   
                                                           

                                                                                                                                                                                                                                                                                                                        

                             


             

       
                                                   
                                           
                                                              
                  
                                         
                                                  
                                       
   
  
theorem cantor_reals_are_isomorphic_to_cauchy_reals
    (rationalSystem : RationalNumberSystem)
    (metric_data : Cauchy.RationalMetricData rationalSystem) :
    ∃ comparison :
      Carrier rationalSystem.FieldModel →
        Cauchy.Carrier rationalSystem metric_data,
      LRA.Function.Bijective comparison := by
  sorry

end LRA.NumberSystems.RealNumbers.Cantor
