                                                                                             

import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions.Carrier

namespace LRA.NumberSystems.RationalNumbers.RationalQuotientFractions

                                                     

             

       
                                                              
                                                           
                                                       
                                                                     
                                                         
                                                                   
   
  
def equivalent (rational_data : IntegerAndPositiveNaturalData)
    (first second : Representative rational_data) : Prop :=
  rational_data.integer_system.Model.signature.multiply
      first.numerator (rational_data.to_integer second.denominator) =
    rational_data.integer_system.Model.signature.multiply
      second.numerator (rational_data.to_integer first.denominator)


                                                                 

                             

             

       
                                                                                            
                                          
   
  
theorem equivalent_is_equivalence_relation (rational_data : IntegerAndPositiveNaturalData) :
    Equivalence (equivalent rational_data) := by
  sorry

                                        

             

       
                                                                                                                       
                               
                                                           
   
  
def representative_setoid (rational_data : IntegerAndPositiveNaturalData) : Setoid (Representative rational_data) where
  r := equivalent rational_data
  iseqv := equivalent_is_equivalence_relation rational_data


                                         

             

       
                                                                                                                
   
  
abbrev Carrier (rational_data : IntegerAndPositiveNaturalData) := Quotient (representative_setoid rational_data)

end LRA.NumberSystems.RationalNumbers.RationalQuotientFractions
