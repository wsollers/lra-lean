                                                                                     
                                                         

import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs.Equivalence

namespace LRA.NumberSystems.Integers.QuotientOrderedPairs

   
                                                                           
                                                                   
                                                                           
                                                                         
                                                                
                         
  

                                                                        
                                                                      
              
theorem induction_on_representatives
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (motive : Carrier whole_data → Prop)
    (onRepresentative :
      ∀ representative : Representative whole_data,
        motive (Quotient.mk _ representative)) :
    ∀ value : Carrier whole_data, motive value := by
  sorry

end LRA.NumberSystems.Integers.QuotientOrderedPairs
