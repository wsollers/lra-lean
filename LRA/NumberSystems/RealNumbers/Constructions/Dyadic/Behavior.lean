                                                                   
                                                   

import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.Laws

namespace LRA.NumberSystems.RealNumbers.Dyadic

variable (dyadicData : RationalDyadicApproximationData)

                                                                            
                       
theorem BinaryTailAmbiguity
    (digits : FractionalDigits)
    (eventuallyOne :
      ∃ threshold,
        ∀ index,
          threshold ≤ index → digits index = Digit.one) :
    ∃ terminating : CanonicalFraction,
      FractionalValue dyadicData terminating =
        Quotient.mk _
          ⟨FractionalPartialSum dyadicData digits,
            FractionalPartialSumsAreCauchy dyadicData digits⟩ ∧
      ∀ other : CanonicalFraction,
        FractionalValue dyadicData other =
            Quotient.mk _
              ⟨FractionalPartialSum dyadicData digits,
                FractionalPartialSumsAreCauchy dyadicData digits⟩ →
        other = terminating := by
  sorry

                                                         
theorem CanonicalFractionalUniqueness
    (first second : CanonicalFraction) :
    FractionalValue dyadicData first = FractionalValue dyadicData second ↔
      first = second := by
  sorry

   
                                                                           
                                                 
                                                                         
                                                                            
  

end LRA.NumberSystems.RealNumbers.Dyadic
