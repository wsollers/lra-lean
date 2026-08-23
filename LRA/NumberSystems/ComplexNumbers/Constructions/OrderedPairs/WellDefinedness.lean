                                                                                   
                                                                       
                                                                     
                    

import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.Operations

namespace LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs

open LRA.AlgebraicStructures

variable {R : Type u}

section FieldTheorems

variable [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
variable [OrderedFieldLaws R]

                                                                     
                                                           

                             

             

       
                                       
                                                           
                               
   
  
theorem norm_squared_ne_zero_of_nonzero
    (value : ComplexNumber R) (value_nonzero : value ≠ 0) :
    normSquared value ≠ (0 : R) := by
  sorry

end FieldTheorems

end LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs
