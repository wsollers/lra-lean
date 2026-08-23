                                                                          
                                                         

import LRA.NumberSystems.RealNumbers.Constructions.Cauchy.Equivalence

namespace LRA.NumberSystems.RealNumbers.Cauchy
open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers

   
                                                                           
                                                                
                                                                         
                                                                      
                                                                         
                                                              
  

                                                                            
                                                                          
           

             

       
                                  
                                           
                                                             
                                                                
                       
                                                                           
                                                
                                                                      
   
  
theorem InductionOnRepresentatives
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (motive : Carrier rationalSystem absolute_value_data → Prop)
    (onRepresentative :
      ∀ representative : Representative rationalSystem absolute_value_data,
        motive (Quotient.mk _ representative)) :
    ∀ value : Carrier rationalSystem absolute_value_data, motive value := by
  sorry

end LRA.NumberSystems.RealNumbers.Cauchy
