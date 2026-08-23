                                                                              
                                                                        
                                                                  
                                                                     

import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.WellFoundedness

namespace LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs

variable {R : Type u}

instance [Add R] : Add (ComplexNumber R) :=
  ⟨fun first second =>
    ⟨first.real_part + second.real_part,
     first.imaginary_part + second.imaginary_part⟩⟩

instance [Neg R] : Neg (ComplexNumber R) :=
  ⟨fun value => ⟨-value.real_part, -value.imaginary_part⟩⟩

instance [Add R] [Neg R] : Sub (ComplexNumber R) :=
  ⟨fun first second => first + -second⟩

instance [Add R] [Mul R] [Neg R] : Mul (ComplexNumber R) :=
  ⟨fun first second =>
    ⟨first.real_part * second.real_part +
       -(first.imaginary_part * second.imaginary_part),
     first.real_part * second.imaginary_part +
       first.imaginary_part * second.real_part⟩⟩

                                             

             

       
                                                                      
                                          
   
  
def conjugation [Neg R] (value : ComplexNumber R) : ComplexNumber R :=
  ⟨value.real_part, -value.imaginary_part⟩

                                                          

             

       
                                                                
                                     
                                               
   
  
def normSquared [Add R] [Mul R] (value : ComplexNumber R) : R :=
  value.real_part * value.real_part +
    value.imaginary_part * value.imaginary_part

                                                                  
                                                               
         
instance [Add R] [Mul R] [Neg R] [Inv R] : Inv (ComplexNumber R) :=
  ⟨fun value =>
    ⟨value.real_part * (normSquared value)⁻¹,
     -(value.imaginary_part * (normSquared value)⁻¹)⟩⟩

                                            

             

       
                                                                   
   
  
def of_real [OfNat R 0] (value : R) : ComplexNumber R := ⟨value, 0⟩

end LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs
