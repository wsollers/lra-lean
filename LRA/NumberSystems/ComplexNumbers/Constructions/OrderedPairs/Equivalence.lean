                                                                               
                                                                      
                                                                         
                                                                         
                                                                         
                                                                 
                                                                      
                                                             

import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.Carrier

namespace LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs

variable {R : Type u}

                                                

             

       
                                            
                                                           
                            
                                                     
                  
   
  
theorem ext {first second : ComplexNumber R}
    (real_parts_equal : first.real_part = second.real_part)
    (imaginary_parts_equal :
      first.imaginary_part = second.imaginary_part) :
    first = second := by
  sorry

end LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs
