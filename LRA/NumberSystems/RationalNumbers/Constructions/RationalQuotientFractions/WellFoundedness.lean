                                                                                                 
                                                         

import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions.Equivalence

namespace LRA.NumberSystems.RationalNumbers.RationalQuotientFractions

   
                                                                           
                                                                      
                                                                         
                                                                        
                                                                       
                                
  

                                                                         
                                                                    
              
theorem induction_on_representatives
    (rational_data : IntegerAndPositiveNaturalData)
    (motive : Carrier rational_data → Prop)
    (onRepresentative :
      ∀ representative : Representative rational_data,
        motive (Quotient.mk _ representative)) :
    ∀ value : Carrier rational_data, motive value := by
  sorry

end LRA.NumberSystems.RationalNumbers.RationalQuotientFractions
