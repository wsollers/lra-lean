                                                                                      
                                                                    
                                                                      
                                                                        
                                                                        
                                                                       
                                                                      
                                                         
                                                                      
  
                                                               
                                                        
                                                                     
                                                                    
                                                                  
                                                   

import LRA.NumberSystems.RealNumbers.Constructions.PrimitiveIntervals.Operations

namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervals
open LRA.NumberSystems.Interface.ModelTheory

variable (rational_model : DenselyOrderedFieldModel)

                                               

                                                                                                                                                                                                                                                                

                             


             

       
                                    
                                                      
             
                                                        
              
                                                         
                      
   
  
theorem interval_sum_exists_uniquely
    (first second : RationalInterval rational_model) :
    ∃ result,
      IsIntervalSum rational_model first second result ∧
      ∀ other,
        IsIntervalSum rational_model first second other →
        other = result := by
  sorry

                                                

                                                                                                                                                        


             

       
                                   
                                                      
                                      
                                                                             
   
  
noncomputable def interval_addition
    (first second : RationalInterval rational_model) :
    RationalInterval rational_model :=
  Classical.choose (interval_sum_exists_uniquely rational_model first second)


                                         

                                                                                                                                                                                                                                                                   

                             


             

       
                                         
                                                  
             
                                                         
              
                                                          
                      
   
  
theorem interval_negation_exists_uniquely
    (interval : RationalInterval rational_model) :
    ∃ result,
      IsIntervalNegation rational_model interval result ∧
      ∀ other,
        IsIntervalNegation rational_model interval other →
        other = result := by
  sorry

                                      

                                                                                                                                                    


             

       
                                   
                                                  
                                      
                  
                                                               
   
  
noncomputable def interval_negation
    (interval : RationalInterval rational_model) :
    RationalInterval rational_model :=
  Classical.choose
    (interval_negation_exists_uniquely rational_model interval)


                                                         

                                                                                                                                                                                                                                                                            

                             


             

       
                                        
                                                      
             
                                                            
              
                                                             
                      
   
  
theorem interval_product_exists_uniquely
    (first second : RationalInterval rational_model) :
    ∃ result,
      IsIntervalProduct rational_model first second result ∧
      ∀ other,
        IsIntervalProduct rational_model first second other →
        other = result := by
  sorry

                                            

                                                                                                                                                              


             

       
                                         
                                                      
                                      
                  
                                                                  
   
  
noncomputable def interval_multiplication
    (first second : RationalInterval rational_model) :
    RationalInterval rational_model :=
  Classical.choose
    (interval_product_exists_uniquely rational_model first second)


                                                           

                                                                                                                                                                                                                                                                                      

                             


             

       
                                        
                                                    
                                             
              
                               
                                          
                                                          
   
  
theorem addition_preserves_admissibility
    (first second : Representative rational_model) :
    ∃ result : Representative rational_model,
      ∀ index,
        result.interval index =
          interval_addition rational_model
            (first.interval index) (second.interval index) := by
  sorry

                                                           

                                                                                                                                                                                                                                                                         

                             


             

       
                                        
                                                      
                                             
              
                               
                                          
                                           
   
  
theorem negation_preserves_admissibility
    (representative : Representative rational_model) :
    ∃ result : Representative rational_model,
      ∀ index,
        result.interval index =
          interval_negation rational_model
            (representative.interval index) := by
  sorry

                                                                

                                                                                                                                                                                                                                                                                        

                             


             

       
                                                        
                                                      
                  
                    
                                                                       
                                                 
                                               
   
  
theorem admissible_representatives_are_uniformly_bounded
    (representative : Representative rational_model) :
    ∃ lower upper,
      ∀ index value,
        contains rational_model (representative.interval index) value →
        rational_model.signature.le lower value ∧
        rational_model.signature.le value upper := by
  sorry

                                                                 

                                                                                                                                                                                                                                                                                                  

                             


             

       
                                              
                                                    
                                             
              
                               
                                                
                                                          
   
  
theorem multiplication_preserves_admissibility
    (first second : Representative rational_model) :
    ∃ result : Representative rational_model,
      ∀ index,
        result.interval index =
          interval_multiplication rational_model
            (first.interval index) (second.interval index) := by
  sorry

                                     

                                                                                                                                                          


             

       
                                         
                                                    
                                    
                  
                                                                  
   
  
noncomputable def representative_addition
    (first second : Representative rational_model) :
    Representative rational_model :=
  Classical.choose
    (addition_preserves_admissibility rational_model first second)

   
                                   

                                                                                                                                                            


             

       
                                         
                                                      
                                    
                  
                                                                    
   
  
noncomputable def representative_negation
    (representative : Representative rational_model) :
    Representative rational_model :=
  Classical.choose
    (negation_preserves_admissibility rational_model representative)

   
                                         

                                                                                                                                                                


             

       
                                               
                                                    
                                    
                  
                                                                        
   
  
noncomputable def representative_multiplication
    (first second : Representative rational_model) :
    Representative rational_model :=
  Classical.choose
    (multiplication_preserves_admissibility rational_model first second)


                                                                      

                                                                                                                                                                                                                                                                                                                      

                             


             

       
                                                       
                                                           
                                              
                                                  
                                                          
                                              
                                                  
                                                           
                                              
                                                      
   
  
theorem representative_operations_respect_equivalence :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
        (representative_setoid rational_model)
        (representative_addition rational_model) ∧
    LRA.UniversalAlgebra.Quotient.unary_operation_respects
        (representative_setoid rational_model)
        (representative_negation rational_model) ∧
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
        (representative_setoid rational_model)
        (representative_multiplication rational_model) := by
  sorry

                                        

                                                                                                                                       


             

       
                            
                                                                               
                  
                                                                  
                                            
                                              
                                                                       
   
  
noncomputable def addition :
    Carrier rational_model → Carrier rational_model → Carrier rational_model :=
  Classical.choose
    (LRA.UniversalAlgebra.Quotient.induced_binary_operation_exists
      (representative_setoid rational_model)
      (representative_addition rational_model)
      (representative_operations_respect_equivalence rational_model).1)


                                                             

                                                                                                                                                                                                                                                                    

                             


             

       
                                  
                                                                 
                       
                                                 
                       
                                                                   
   
  
theorem quotient_negation_exists :
    ∃ negation : Carrier rational_model → Carrier rational_model,
      ∀ representative,
        negation (Quotient.mk _ representative) =
          Quotient.mk _
            (representative_negation rational_model representative) := by
  sorry

   
                    

                                                                                                              


             

       
                            
                                                      
                                                            
   
  
noncomputable def negation :
    Carrier rational_model → Carrier rational_model :=
  Classical.choose (quotient_negation_exists rational_model)

   
                          

                                                                                                                                             


             

       
                                  
                                                                               
                  
                                                                  
                                            
                                                    
                                                                         
   
  
noncomputable def multiplication :
    Carrier rational_model → Carrier rational_model → Carrier rational_model :=
  Classical.choose
    (LRA.UniversalAlgebra.Quotient.induced_binary_operation_exists
      (representative_setoid rational_model)
      (representative_multiplication rational_model)
      (representative_operations_respect_equivalence rational_model).2.2)


                                                                   

                                                                                                                                                                                                                                

                             


             

       
                                                          
                                                   
                                            
                                                  
   
  
theorem representative_strict_order_respects_equivalence :
    LRA.UniversalAlgebra.Quotient.relation_respects
      (representative_setoid rational_model)
      (representative_strict_order rational_model) := by
  sorry

                                                     

                                                                                                                         


             

       
                                
                                                             
                  
                                                          
                                            
                                                  
                                                                        
   
  
noncomputable def strict_order :
    Carrier rational_model → Carrier rational_model → Prop :=
  Classical.choose
    (LRA.UniversalAlgebra.Quotient.induced_relation_exists
      (representative_setoid rational_model)
      (representative_strict_order rational_model)
      (representative_strict_order_respects_equivalence rational_model))

end LRA.NumberSystems.RealNumbers.PrimitiveIntervals
