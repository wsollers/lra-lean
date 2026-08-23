                                                                              
                                                             

import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs.Laws

namespace LRA.NumberSystems.Integers.QuotientOrderedPairs

   
                                                                       
                                                                          
                                                                        
                                                                       
                                                                    
  

                                                  
theorem embed_preserves_addition
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (addition : Carrier whole_data → Carrier whole_data → Carrier whole_data)
    (addition_computes :
      ∀ first second,
        addition (Quotient.mk _ first) (Quotient.mk _ second) =
          Quotient.mk _ (representative_addition whole_data first second)) :
    ∀ first second : whole_data.carrier,
      embed whole_data (whole_data.addition first second) =
        addition (embed whole_data first) (embed whole_data second) := by
  sorry

                                                             
theorem embed_one_eq_one_representative_class
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    embed whole_data whole_data.one = Quotient.mk _ (one_representative whole_data) := by
  sorry

                                                                       
                                   
theorem embed_zero_eq_zero_representative_class
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    embed whole_data whole_data.zero = Quotient.mk _ (zero_representative whole_data) := by
  sorry

end LRA.NumberSystems.Integers.QuotientOrderedPairs
