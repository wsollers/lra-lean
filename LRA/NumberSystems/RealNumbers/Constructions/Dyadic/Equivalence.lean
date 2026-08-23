                                                                      
                                                                          
                                                                         
                                                      

import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.Carrier

namespace LRA.NumberSystems.RealNumbers.Dyadic

   
                                                                           
                                                                        
                                                                   
                                                                           
                                                                          
                                                                       
                                                                           
                                                                           
                                                                 
                            
  

variable (dyadic_data : RationalDyadicApproximationData)

                                                               

                                                                                                                                                                                                                                                                                                      

                             


             

       
                        
                                                                            
                                                                           
                                           
                                          
                                           
                                  
                                                                  
                                    
                                          
                                  
                                                           
                                           
                                          
                                           
                                  
                                                                     
   
  
theorem dyadic_subring :
    IsDyadicRational dyadic_data dyadic_data.RationalSystem.FieldModel.signature.zero ∧
    IsDyadicRational dyadic_data dyadic_data.RationalSystem.FieldModel.signature.one ∧
    (∀ first second : Rational dyadic_data,
      IsDyadicRational dyadic_data first →
      IsDyadicRational dyadic_data second →
      IsDyadicRational dyadic_data
        (dyadic_data.RationalSystem.FieldModel.signature.add first second)) ∧
    (∀ value : Rational dyadic_data,
      IsDyadicRational dyadic_data value →
      IsDyadicRational dyadic_data
        (dyadic_data.RationalSystem.FieldModel.signature.neg value)) ∧
    (∀ first second : Rational dyadic_data,
      IsDyadicRational dyadic_data first →
      IsDyadicRational dyadic_data second →
      IsDyadicRational dyadic_data
        (dyadic_data.RationalSystem.FieldModel.signature.multiply first second)) := by
  sorry

                                                 

                                                                                                                                                                                                                                                                                                     

                             


             

       
                                  
                                         
                      
                                                                      
                                    
                                           
                                                                     
                                                                    
   
  
theorem dyadic_rationals_are_dense
    (first second : Rational dyadic_data)
    (first_lt_second :
      dyadic_data.RationalSystem.FieldModel.signature.StrictOrder first second) :
    ∃ dyadic : Rational dyadic_data,
      IsDyadicRational dyadic_data dyadic ∧
      dyadic_data.RationalSystem.FieldModel.signature.StrictOrder first dyadic ∧
      dyadic_data.RationalSystem.FieldModel.signature.StrictOrder dyadic second := by
  sorry

end LRA.NumberSystems.RealNumbers.Dyadic
