-- LRA/NumberSystems/RealNumbers/Constructions/Dyadic/Operations.lean
-- Rational partial sums of a binary fractional expansion.

import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.WellFoundedness

namespace LRA.NumberSystems.RealNumbers.Dyadic

variable (dyadicData : RationalDyadicApproximationData)

/-- Rational partial sums of a binary fractional expansion. -/
def FractionalPartialSum
    (digits : FractionalDigits)
    (bound : Nat) : Rational dyadicData :=
  dyadicData.finite_sum
    (fun index =>
      dyadicData.rational_model.signature.multiply
        (dyadicData.digit_to_rational (digits index))
        (dyadicData.rational_model.signature.inv
          (dyadicData.power_of_two (dyadicData.exponent_of_index index))))
    bound

end LRA.NumberSystems.RealNumbers.Dyadic
