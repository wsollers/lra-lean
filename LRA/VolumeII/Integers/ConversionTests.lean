                                             
                                                       

import LRA.VolumeII.Integers.Conversion

namespace LRA.NumberSystems.Integers.ConversionTests

open LRA.AlgebraicStructures
open Conversion

   
                                          
                                                       
                                                                 

                                                                       
                                                                    
                                   
  

example : ofNat 0 = (0 : Z) := rfl

example : ofNat 1 = Succ 0 := rfl

example : ofNat 2 = Succ (Succ 0) := rfl

example : four = Succ (Succ (Succ (Succ 0))) := rfl

example : ofInt 0 = (0 : Z) := rfl

example : ofInt 4 = four := rfl

example : ofInt (-1) = -one := rfl

example : ofInt (-2) = -two := rfl

example : four = Succ three := rfl

example : negative_two = -two := rfl

example : Pred one = zero := PredSucc zero

end LRA.NumberSystems.Integers.ConversionTests
