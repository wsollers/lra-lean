                                                                                     
                                                                          
                             

import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs.Operations

namespace LRA.NumberSystems.Integers.QuotientOrderedPairs

                                                 

                             

             

       
                                                    
                                                          
                                                           
                                        
                                          
   
  
theorem representative_addition_respects_equivalence
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      (representative_setoid whole_data)
      (representative_addition whole_data) := by
  sorry

                                                 

                             

             

       
                                                    
                                                          
                                                          
                                        
                                          
   
  
theorem representative_negation_respects_equivalence
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LRA.UniversalAlgebra.Quotient.unary_operation_respects
      (representative_setoid whole_data)
      (representative_negation whole_data) := by
  sorry

                                                       

                             

             

       
                                                          
                                                          
                                                           
                                        
                                                
   
  
theorem representative_multiplication_respects_equivalence
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      (representative_setoid whole_data)
      (representative_multiplication whole_data) := by
  sorry

                                        

                             

             

       
                                                 
                                                          
                                                   
                                        
                                                 
   
  
theorem representative_order_respects_equivalence
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LRA.UniversalAlgebra.Quotient.relation_respects
      (representative_setoid whole_data)
      (representative_nonstrict_order whole_data) := by
  sorry

                                                                               

             

       
                                
                                                          
                                                                              
                     
                                                               
                                                                         
   
  
theorem quotient_addition_exists
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    ∃ addition : Carrier whole_data → Carrier whole_data → Carrier whole_data,
      ∀ first second,
        addition (Quotient.mk _ first) (Quotient.mk _ second) =
          Quotient.mk _ (representative_addition whole_data first second) := by
  sorry

                                                                                     

             

       
                                      
                                                          
                                                                                    
                     
                                                                     
                                                                               
   
  
theorem quotient_multiplication_exists
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    ∃ multiplication : Carrier whole_data → Carrier whole_data → Carrier whole_data,
      ∀ first second,
        multiplication (Quotient.mk _ first) (Quotient.mk _ second) =
          Quotient.mk _ (representative_multiplication whole_data first second) := by
  sorry

                                                                            

             

       
                             
                                                          
                                                                       
                     
                                                                      
                                                                
   
  
theorem quotient_order_exists
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    ∃ nonstrict_order : Carrier whole_data → Carrier whole_data → Prop,
      ∀ first second,
        nonstrict_order (Quotient.mk _ first) (Quotient.mk _ second) ↔
          representative_nonstrict_order whole_data first second := by
  sorry

end LRA.NumberSystems.Integers.QuotientOrderedPairs
