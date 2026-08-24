                                                                      
                                                                        
                                                                          
                                                      

import LRA.NumberSystems.RealNumbers.Constructions.Cauchy.Carrier

namespace LRA.NumberSystems.RealNumbers.Cauchy
open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers

                                                                     

                                                                                                                                                                                                                                           


             

       
                             
                                           
                                                             
                                                                                
                                                                              
   
  
def representative_equivalent
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) : Prop :=
  equivalent rationalSystem absolute_value_data first.sequence second.sequence


                                                               

                                                                                                                                                                                                                                                                 

                             


             

       
                                                
                                               
                                                               
               
                                                                    
   
  
theorem representative_equivalent_is_equivalence
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Equivalence
      (representative_equivalent rationalSystem absolute_value_data) := by
  sorry

                                            

                                                                                                                                                                                                                          


             

       
                         
                                           
                                                               
                                                                    
                                                                   
                                                   
                                      
   
  
def representative_setoid
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Setoid (Representative rationalSystem absolute_value_data) where
  r := representative_equivalent rationalSystem absolute_value_data
  iseqv := representative_equivalent_is_equivalence
    rationalSystem absolute_value_data


                                                                         

                                                                                                                                                  


             

       
              
                                           
                                                                
                                                                     
   
  
abbrev Carrier
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :=
  Quotient (representative_setoid rationalSystem absolute_value_data)

end LRA.NumberSystems.RealNumbers.Cauchy
