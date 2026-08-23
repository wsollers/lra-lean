                                                             
                                                             

import LRA.NumberSystems.Integers.Constructions.Tao.Laws

namespace LRA.NumberSystems.Integers.Tao

   
                                                                    
                                                                          
  

                                              
theorem whole_embedding_preserves_addition
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    ∀ first second : whole_data.carrier,
      whole_embedding whole_data (whole_data.addition first second) =
        Quotient.mk (setoid whole_data)
          (representative_addition whole_data
            (whole_embedding_representative whole_data first)
            (whole_embedding_representative whole_data second)) := by
  sorry

                                                                    
                            
theorem whole_embedding_zero_eq_zero_representative_class
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    whole_embedding whole_data whole_data.zero =
      Quotient.mk (setoid whole_data) (zero_representative whole_data) := by
  sorry

end LRA.NumberSystems.Integers.Tao
