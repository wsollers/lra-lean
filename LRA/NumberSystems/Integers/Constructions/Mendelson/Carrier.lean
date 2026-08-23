                                                                  
                                         

import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs

namespace LRA.NumberSystems.Integers.Mendelson

   
                                                
                                                         
                                                         
                                                         

                                                                           
                                                                      
                                                            
                                       
                                                                      
                                                                       
                                                          

                                                                   
                                                                              
                                                             
  

   
                                      

                                                                              
                                                                              
                                                                           
                                                                                        

             

       
                                 
                                                            
   
  
abbrev PositiveNaturalPairData :=
  QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs


                                                                              

             

       
                                                                      
                              
                               
   
  
structure PositivePair (positive_data : PositiveNaturalPairData) where
  left : positive_data.carrier
  right : positive_data.carrier

end LRA.NumberSystems.Integers.Mendelson
