                                                                          
                                                         

import LRA.NumberSystems.Integers.Constructions.Mendelson.Equivalence

namespace LRA.NumberSystems.Integers.Mendelson

   
                                                                           
                                                                           
                                                   
  

                                                                          
                                                                
              
theorem induction_on_representatives
    (positive_data : PositiveNaturalPairData)
    (motive : Carrier positive_data → Prop)
    (onRepresentative :
      ∀ representative : PositivePair positive_data,
        motive (Quotient.mk _ representative)) :
    ∀ value : Carrier positive_data, motive value := by
  sorry

end LRA.NumberSystems.Integers.Mendelson
