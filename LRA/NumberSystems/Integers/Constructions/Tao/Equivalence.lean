                                                                

import LRA.NumberSystems.Integers.Constructions.Tao.Carrier

namespace LRA.NumberSystems.Integers.Tao

                                                       

             

       
              
                                                               
                                                          
                                                       
                                                       
   
  
def equivalent
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : Prop :=
  whole_data.addition first.minuend second.subtrahend =
    whole_data.addition second.minuend first.subtrahend


                                                         

                             

             

       
                                          
                                                                 
                                       
   
  
theorem equivalent_is_equivalence_relation
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    Equivalence (equivalent whole_data) := by
  sorry

   
                  

             

       
                                                                        
                                              
                            
                                                        
   
  
def setoid (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    Setoid (FormalDifference whole_data) where
  r := equivalent whole_data
  iseqv := equivalent_is_equivalence_relation whole_data


                                        

             

       
                                                                             
                              
   
  
abbrev Carrier (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :=
  Quotient (setoid whole_data)

end LRA.NumberSystems.Integers.Tao
