                                                                  
                                                                       
                                                    

import LRA.VolumeII.NumberSystems.Models

namespace LRA.NumberSystems.RealNumbers.Cantor
open LRA.NumberSystems.Models

   
                                             
                                                 
                                            
                                                     

                                                                          
                                                                 
                                                                          
                                                         
  

   
                                  

                                                                                                        


             

       
                                                                            
                                          
                                          
                  
                                           
   
  
structure EndpointInterval (rational_model : DenselyOrderedFieldModel) where
  lower : rational_model.signature.carrier
  upper : rational_model.signature.carrier
  lower_le_upper :
    rational_model.signature.le lower upper

   
                                        

                                                                                                              


             

       
                                                                                  
                                                  
          
                  
                                 
                                                               
                                 
                                                             
                           
                                                            
                                                                                             
                      
                                              
                                         
                                    
                                                                    
                              
   
  
structure NestedIntervalSequence (rational_model : DenselyOrderedFieldModel) where
  interval : Nat → EndpointInterval rational_model
  nested :
    ∀ index : Nat,
      rational_model.signature.le
        (interval index).lower ((interval (index + 1)).lower) ∧
      rational_model.signature.le
        ((interval (index + 1)).upper) (interval index).upper
  widths_converge_to_zero :
    ∀ positive_tolerance : rational_model.signature.carrier,
      rational_model.signature.StrictOrder rational_model.signature.zero positive_tolerance →
        ∃ index : Nat,
          rational_model.signature.StrictOrder
            (rational_model.signature.add
              (interval index).upper
              (rational_model.signature.neg (interval index).lower))
            positive_tolerance

end LRA.NumberSystems.RealNumbers.Cantor
