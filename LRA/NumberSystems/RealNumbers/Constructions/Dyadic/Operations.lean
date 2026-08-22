-- LRA/NumberSystems/RealNumbers/Constructions/Dyadic/Operations.lean
-- Rational partial sums of a binary fractional expansion.

import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.WellFoundedness

namespace LRA.NumberSystems.RealNumbers.Dyadic

variable (dyadicData : RationalDyadicApproximationData)

/-- Rational partial sums of a binary fractional expansion.

`FractionalPartialSum digits n` is the sum of the first `n` binary fractional
terms, with digit `k` weighted by `2^{-(k+1)}`.
-/
def FractionalPartialSum
    (digits : FractionalDigits) :
    Nat → Rational dyadicData
  | 0 => 0
  | bound + 1 =>
      FractionalPartialSum digits bound +
        DigitValue dyadicData.RationalSystem (digits bound) *
          (PowerOfTwo dyadicData.RationalSystem (bound + 1))⁻¹

end LRA.NumberSystems.RealNumbers.Dyadic
