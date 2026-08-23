                                                                    
                                                         

import LRA.NumberSystems.Integers.Constructions.Tao.Equivalence

namespace LRA.NumberSystems.Integers.Tao

   
                                                                           
                                                                           
                                                   
  

                                                                        
                                                                      
              
theorem induction_on_representatives
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (motive : Carrier whole_data → Prop)
    (onRepresentative :
      ∀ representative : FormalDifference whole_data,
        motive (Quotient.mk _ representative)) :
    ∀ value : Carrier whole_data, motive value := by
  sorry

end LRA.NumberSystems.Integers.Tao
