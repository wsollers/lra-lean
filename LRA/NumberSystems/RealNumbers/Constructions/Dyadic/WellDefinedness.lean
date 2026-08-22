-- LRA/NumberSystems/RealNumbers/Constructions/Dyadic/WellDefinedness.lean
-- Semantic value maps and representation theorems for canonical binary
-- expansions.

import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.Operations

namespace LRA.NumberSystems.RealNumbers.Dyadic

variable (dyadicData : RationalDyadicApproximationData)

/-- Binary fractional partial sums form a Cauchy sequence. -/
theorem FractionalPartialSumsAreCauchy
    (digits : FractionalDigits) :
    Cauchy.is_cauchy
      dyadicData.RationalSystem.FieldModel
      dyadicData.AbsoluteValueData
      (FractionalPartialSum dyadicData digits) := by
  sorry

/-- Value of a canonical fractional expansion in the Cauchy-real carrier. -/
def FractionalValue
    (fraction : CanonicalFraction) : CauchyCarrier dyadicData :=
  Quotient.mk _
    ⟨FractionalPartialSum dyadicData fraction.Digits,
      FractionalPartialSumsAreCauchy dyadicData fraction.Digits⟩

/-- Semantic value of a finite whole binary numeral. -/
def WholeNumeralValue : WholeBinaryNumeral → CauchyCarrier dyadicData
  | WholeBinaryNumeral.zero => dyadicData.CauchyZero
  | WholeBinaryNumeral.positive numeral =>
      dyadicData.RationalToCauchy
        (PositiveBinaryNumeralValue dyadicData.RationalSystem numeral)

/-- Value of an unsigned expansion. -/
def UnsignedValue
    (expansion : UnsignedExpansion) : CauchyCarrier dyadicData :=
  dyadicData.CauchyAddition
    (WholeNumeralValue dyadicData expansion.IntegerPart)
    (FractionalValue dyadicData expansion.FractionalPart)

/-- Signed binary value map. -/
def Value : Expansion → CauchyCarrier dyadicData
  | Expansion.zero => dyadicData.CauchyZero
  | Expansion.nonzero Sign.positive magnitude =>
      UnsignedValue dyadicData magnitude.Magnitude
  | Expansion.nonzero Sign.negative magnitude =>
      dyadicData.CauchyNegation
        (UnsignedValue dyadicData magnitude.Magnitude)

/-- Every Cauchy real has a canonical signed binary expansion. -/
theorem RepresentationExists
    (realValue : CauchyCarrier dyadicData) :
    ∃ expansion : Expansion,
      Value dyadicData expansion = realValue := by
  sorry

/-- The canonical signed binary value map is injective. -/
theorem ValueIsInjective :
    ∀ first second : Expansion,
      Value dyadicData first = Value dyadicData second → first = second := by
  sorry

/-- The canonical signed binary value map is bijective. -/
theorem ValueIsBijective :
    (∀ realValue : CauchyCarrier dyadicData,
      ∃ expansion : Expansion,
        Value dyadicData expansion = realValue) ∧
    (∀ first second : Expansion,
      Value dyadicData first = Value dyadicData second → first = second) := by
  sorry

/-- A bijection between two carriers, given by mutually inverse maps. -/
structure Bijection (α β : Type) where
  Forward : α → β
  Inverse : β → α
  LeftInverse : ∀ value : α, Inverse (Forward value) = value
  RightInverse : ∀ value : β, Forward (Inverse value) = value

/-- The binary representation theorem yields a bijection with the Cauchy-real
carrier. -/
theorem BinaryRealBijectionExists :
    ∃ bridge : Bijection Expansion (CauchyCarrier dyadicData),
      ∀ expansion : Expansion,
        bridge.Forward expansion = Value dyadicData expansion := by
  sorry

/-- Selected binary/Cauchy-real bijection. -/
noncomputable def BinaryRealBijection :
    Bijection Expansion (CauchyCarrier dyadicData) :=
  Classical.choose (BinaryRealBijectionExists dyadicData)

end LRA.NumberSystems.RealNumbers.Dyadic
