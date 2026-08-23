                                                            
                                       

import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs

namespace LRA.NumberSystems.Integers.Tao

   
                                          
                                                   
                                                   
                                                         

                                                                            
                                                                       
                                                                              
                                                                              
                                                                            
                         

                                                                         
                                                                        
                                                                         
                                                                           
                                                                    
                                                         
                         
  

   
                                                           

                                                                              
                                                                        
                                                                           
                                                                                        

             

       
                                                      
                                                            
   
  
abbrev WholeNumberArithmeticForTaoFormalDifferences :=
  QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs


                                                           

             

       
                                                                                            
                              
                                 
   
  
structure FormalDifference (whole_data : WholeNumberArithmeticForTaoFormalDifferences) where
  minuend : whole_data.carrier
  subtrahend : whole_data.carrier

end LRA.NumberSystems.Integers.Tao
