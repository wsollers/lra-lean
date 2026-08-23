                                                                                 
                                                                   

import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs.Carrier

namespace LRA.NumberSystems.Integers.QuotientOrderedPairs

                                                     

             

       
              
                                                        
                                                        
                                                                            
                                                                            
   
  
def equivalent
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (first second : Representative whole_data) : Prop :=
  whole_data.addition first.positive_coordinate second.negative_coordinate =
    whole_data.addition second.positive_coordinate first.negative_coordinate


                                                          

                             

             

       
                                          
                                                          
                                       
   
  
theorem equivalent_is_equivalence_relation
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Equivalence (equivalent whole_data) := by
  sorry

                                 

             

       
                                                                                
                                            
                            
                                                        
   
  
def representative_setoid (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Setoid (Representative whole_data) where
  r := equivalent whole_data
  iseqv := equivalent_is_equivalence_relation whole_data


                              

             

       
                                                                      
                                             
   
  
abbrev Carrier (whole_data : WholeNumberArithmeticForQuotientPairs) :=
  Quotient (representative_setoid whole_data)

end LRA.NumberSystems.Integers.QuotientOrderedPairs
