                                                                                                 
                                                                     
                                         

import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions.Operations

namespace LRA.NumberSystems.RationalNumbers.RationalQuotientFractions

                                                             

                             

             

       
                                                                                                       
                                                           
                                                                                       
                                                           
                                                                                             
                                                          
                                                                                     
   
  
theorem representative_operations_respect_equivalence (rational_data : IntegerAndPositiveNaturalData) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
        (representative_setoid rational_data) (representative_addition rational_data) ∧
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
        (representative_setoid rational_data) (representative_multiplication rational_data) ∧
    LRA.UniversalAlgebra.Quotient.unary_operation_respects
        (representative_setoid rational_data) (representative_negation rational_data) := by
  sorry

                                      

             

       
                                                                            
                                                                            
                  
                                                                  
                                           
                                             
                                                                      
   
  
noncomputable def addition (rational_data : IntegerAndPositiveNaturalData) :
    Carrier rational_data → Carrier rational_data → Carrier rational_data :=
  Classical.choose
    (LRA.UniversalAlgebra.Quotient.induced_binary_operation_exists
      (representative_setoid rational_data)
      (representative_addition rational_data)
      (representative_operations_respect_equivalence rational_data).1)


                                            

             

       
                                                                                  
                                                                            
                  
                                                                  
                                           
                                                   
                                                                        
   
  
noncomputable def multiplication (rational_data : IntegerAndPositiveNaturalData) :
    Carrier rational_data → Carrier rational_data → Carrier rational_data :=
  Classical.choose
    (LRA.UniversalAlgebra.Quotient.induced_binary_operation_exists
      (representative_setoid rational_data)
      (representative_multiplication rational_data)
      (representative_operations_respect_equivalence rational_data).2.1)


                                                                            

                             

             

       
                                                                         
                                                               
                                                      
                                                 
                                                                              
   
  
theorem negation_exists (rational_data : IntegerAndPositiveNaturalData) :
    ∃ negation : Carrier rational_data → Carrier rational_data,
      ∀ representative : Representative rational_data,
        negation (Quotient.mk _ representative) =
          Quotient.mk _ (representative_negation rational_data representative) := by
  sorry

                                              

             

       
                                                                                                                             
                                                  
   
  
noncomputable def negation (rational_data : IntegerAndPositiveNaturalData) : Carrier rational_data → Carrier rational_data :=
  Classical.choose (negation_exists rational_data)


                                                                               

                             

             

       
                                                                                                          
                                                   
                                           
                                                 
   
  
theorem representative_strict_order_respects_equivalence (rational_data : IntegerAndPositiveNaturalData) :
    LRA.UniversalAlgebra.Quotient.relation_respects
      (representative_setoid rational_data)
      (representative_strict_order rational_data) := by
  sorry

                                          

             

       
                                                                                
                                                           
                  
                                                          
                                           
                                                 
                                                                       
   
  
noncomputable def strict_order (rational_data : IntegerAndPositiveNaturalData) :
    Carrier rational_data → Carrier rational_data → Prop :=
  Classical.choose
    (LRA.UniversalAlgebra.Quotient.induced_relation_exists
      (representative_setoid rational_data)
      (representative_strict_order rational_data)
      (representative_strict_order_respects_equivalence rational_data))


                              

             

       
                                                                                                                    
                                                          
   
  
def nonstrict_order (rational_data : IntegerAndPositiveNaturalData) (first second : Carrier rational_data) : Prop :=
  strict_order rational_data first second ∨ first = second

end LRA.NumberSystems.RationalNumbers.RationalQuotientFractions
