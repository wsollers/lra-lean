                                                                     
                                                                      
                                                     

import LRA.NumberSystems.RealNumbers.Constructions.Cauchy.WellFoundedness

namespace LRA.NumberSystems.RealNumbers.Cauchy
open LRA.NumberSystems.Models
open LRA.NumberSystems.RationalNumbers

                                                            

                                                                                                                                                                                                                                                            


             

       
                           
                                           
                                                             
                                                                        
                              
              
                                           
                            
                             
   
  
def representative_addition
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) :
    Sequence rationalSystem :=
  fun index =>
    rationalSystem.FieldModel.signature.add
      (first.sequence index)
      (second.sequence index)


                                                             

                                                                                                                                                                                                                                                              


             

       
                           
                                           
                                                             
                                                                          
                              
              
                                                                           
   
  
def representative_negation
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (representative : Representative rationalSystem absolute_value_data) :
    Sequence rationalSystem :=
  fun index =>
    rationalSystem.FieldModel.signature.neg (representative.sequence index)


                                                                  

                                                                                                                                                                                                                                                                  


             

       
                                 
                                           
                                                             
                                                                        
                              
              
                                                
                            
                             
   
  
def representative_multiplication
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) :
    Sequence rationalSystem :=
  fun index =>
    rationalSystem.FieldModel.signature.multiply
      (first.sequence index)
      (second.sequence index)

end LRA.NumberSystems.RealNumbers.Cauchy
