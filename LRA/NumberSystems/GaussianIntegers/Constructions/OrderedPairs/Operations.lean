                                                                                
                                                                    
                                                                    
                        

import LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.WellFoundedness

namespace LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs

variable {R : Type u}

instance [Add R] : Add (GaussianInteger R) :=
  ⟨fun first second =>
    ⟨first.realPart + second.realPart,
     first.imaginaryPart + second.imaginaryPart⟩⟩

instance [Neg R] : Neg (GaussianInteger R) :=
  ⟨fun value => ⟨-value.realPart, -value.imaginaryPart⟩⟩

instance [Add R] [Neg R] : Sub (GaussianInteger R) :=
  ⟨fun first second => first + -second⟩

instance [Add R] [Mul R] [Neg R] : Mul (GaussianInteger R) :=
  ⟨fun first second =>
    ⟨first.realPart * second.realPart +
       -(first.imaginaryPart * second.imaginaryPart),
     first.realPart * second.imaginaryPart +
       first.imaginaryPart * second.realPart⟩⟩

                                              

             

       
                                                                          
                                        
   
  
def conjugation [Neg R] (value : GaussianInteger R) : GaussianInteger R :=
  ⟨value.realPart, -value.imaginaryPart⟩

                                                                

             

       
                                                                  
                                   
                                             
   
  
def normSquared [Add R] [Mul R] (value : GaussianInteger R) : R :=
  value.realPart * value.realPart +
    value.imaginaryPart * value.imaginaryPart

end LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs
