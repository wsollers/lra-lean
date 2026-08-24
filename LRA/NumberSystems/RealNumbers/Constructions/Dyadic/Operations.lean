
import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.WellFoundedness

namespace LRA.NumberSystems.RealNumbers.Dyadic

variable (dyadicData : RationalDyadicApproximationData)

/--
`FractionalPartialSum` TODO

Predicate logic:

  def FractionalPartialSum
    (digits : FractionalDigits) :
    Nat → Rational dyadicData
  | 0 => 0
  | bound + 1 =>
      FractionalPartialSum digits bound +
        DigitValue dyadicData.RationalSystem (digits bound) *
          (PowerOfTwo dyadicData.RationalSystem (bound + 1))⁻¹

Predicate logic (unfolded):

  def FractionalPartialSum
    (digits : FractionalDigits) :
    Nat → Rational dyadicData
  | 0 => 0
  | bound + 1 =>
      FractionalPartialSum digits bound +
        DigitValue dyadicData.RationalSystem (digits bound) *
          (PowerOfTwo dyadicData.RationalSystem (bound + 1))⁻¹ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def FractionalPartialSum
    (digits : FractionalDigits) :
    Nat → Rational dyadicData
  | 0 => 0
  | bound + 1 =>
      FractionalPartialSum digits bound +
        DigitValue dyadicData.RationalSystem (digits bound) *
          (PowerOfTwo dyadicData.RationalSystem (bound + 1))⁻¹
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

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
