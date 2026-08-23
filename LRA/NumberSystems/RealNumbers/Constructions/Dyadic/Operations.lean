                                                                     
                                                          

import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.WellFoundedness

namespace LRA.NumberSystems.RealNumbers.Dyadic

variable (dyadicData : RationalDyadicApproximationData)

                                                           

                                                                             
                                               
  
def FractionalPartialSum
    (digits : FractionalDigits) :
    Nat → Rational dyadicData
  | 0 => 0
  | bound + 1 =>
      FractionalPartialSum digits bound +
        DigitValue dyadicData.RationalSystem (digits bound) *
          (PowerOfTwo dyadicData.RationalSystem (bound + 1))⁻¹

end LRA.NumberSystems.RealNumbers.Dyadic
