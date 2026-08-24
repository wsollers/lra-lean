                                                                          
                                                                        
                                       

import LRA.NumberSystems.RealNumbers.Constructions.Cauchy.Operations

namespace LRA.NumberSystems.RealNumbers.Cauchy
open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers

                                                     

                                                                                                                                                                                                                                                                                                             

                             


             

       
                                         
                                           
                                                             
                                                                        
                                                
                                                                               
   
  
theorem representative_addition_is_cauchy
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) :
    is_cauchy rationalSystem absolute_value_data
      (representative_addition rationalSystem absolute_value_data first second) := by
  sorry

                                                     

                                                                                                                                                                                                                                                                                                             

                             


             

       
                                         
                                           
                                                             
                                                                          
                                                
                                                                                 
   
  
theorem representative_negation_is_cauchy
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (representative : Representative rationalSystem absolute_value_data) :
    is_cauchy rationalSystem absolute_value_data
      (representative_negation rationalSystem absolute_value_data representative) := by
  sorry

                                                           

                                                                                                                                                                                                                                                                                                             

                             


             

       
                                               
                                           
                                                             
                                                                        
                                                
                                                                                     
   
  
theorem representative_multiplication_is_cauchy
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) :
    is_cauchy rationalSystem absolute_value_data
      (representative_multiplication rationalSystem absolute_value_data first second) := by
  sorry

                                                                    

                                                                                                                                                                                                                                                                                                                     

                             


             

       
                                                    
                                           
                                                               
                                                           
                                                                
                          
                                                                                 
                                           
                                                             
   
  
theorem representative_addition_respects_equivalence
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      (representative_setoid rationalSystem absolute_value_data)
      (fun first second =>
        ⟨representative_addition rationalSystem absolute_value_data first second,
          representative_addition_is_cauchy
            rationalSystem absolute_value_data first second⟩) := by
  sorry

                                                                          

                                                                                                                                                                                                                                                                                                                     

                             


             

       
                                                          
                                           
                                                               
                                                           
                                                                
                          
                                                                                       
                                                 
                                                             
   
  
theorem representative_multiplication_respects_equivalence
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      (representative_setoid rationalSystem absolute_value_data)
      (fun first second =>
        ⟨representative_multiplication rationalSystem absolute_value_data first second,
          representative_multiplication_is_cauchy
            rationalSystem absolute_value_data first second⟩) := by
  sorry

/--
The previously-missing counterpart to `representative_addition_respects_equivalence`
and `representative_multiplication_respects_equivalence` — `negation` never had
this stated at all. -/
theorem representative_negation_respects_equivalence
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.UniversalAlgebra.Quotient.unary_operation_respects
      (representative_setoid rationalSystem absolute_value_data)
      (fun representative =>
        ⟨representative_negation rationalSystem absolute_value_data representative,
          representative_negation_is_cauchy
            rationalSystem absolute_value_data representative⟩) := by
  sorry

end LRA.NumberSystems.RealNumbers.Cauchy
