-- LRA/NumberSystems/RealNumbers/Constructions/Dyadic/Carrier.lean
-- Canonical binary expansions and the data needed to interpret them.

import LRA.NumberSystems.RationalNumbers.Definition
import LRA.NumberSystems.RealNumbers.Definition
import LRA.NumberSystems.RealNumbers.Constructions.Cauchy

namespace LRA.NumberSystems.RealNumbers.Dyadic

open LRA.NumberSystems.Models
open LRA.NumberSystems.RationalNumbers

universe u

/-!
A signed binary expansion must represent numbers in `(0,1)` as well as numbers
with nonzero whole part. A positive finite numeral is therefore separated from
a whole binary numeral, which has an explicit zero case. The signed
`Expansion.nonzero` constructor carries a genuinely nonzero magnitude so that
zero has only the canonical `Expansion.zero` representation.

The interpretation data are anchored to an actual `RationalNumberSystem`.
Binary digits, powers of two, finite binary numerals, and dyadic rationals are
then defined from that rational system rather than supplied as unrelated
carriers or arbitrary functions.
-/

/-- A binary digit. -/
inductive Digit where
  | zero
  | one
  deriving DecidableEq

/-- Infinite digits after the binary point. -/
abbrev FractionalDigits := Nat → Digit

/-- Every entry of a fractional digit sequence is binary. -/
def IsBinaryDigitSequence (digits : FractionalDigits) : Prop :=
  ∀ index, digits index = Digit.zero ∨ digits index = Digit.one

/-- A canonical binary fractional expansion is not eventually constantly one.

This chooses the terminating-zero representation instead of the alternative
trailing-one representation at dyadic rationals.
-/
def IsCanonicalFractionalDigits (digits : FractionalDigits) : Prop :=
  IsBinaryDigitSequence digits ∧
  ¬ ∃ threshold,
    ∀ index,
      threshold ≤ index → digits index = Digit.one

/-- A canonical fractional binary expansion. -/
structure CanonicalFraction where
  Digits : FractionalDigits
  IsCanonical : IsCanonicalFractionalDigits Digits

/-- A positive finite binary numeral.

The highest represented digit is required to be one, so this structure never
represents zero.
-/
structure PositiveBinaryNumeral where
  HighestExponent : Nat
  DigitAt : Fin (HighestExponent + 1) → Digit
  LeadingDigitIsOne :
    DigitAt ⟨HighestExponent, Nat.lt_succ_self HighestExponent⟩ = Digit.one

/-- A finite whole-number binary numeral, including zero. -/
inductive WholeBinaryNumeral where
  | zero
  | positive (Numeral : PositiveBinaryNumeral)

/-- The fractional part is identically zero. -/
def IsZeroCanonicalFraction (fraction : CanonicalFraction) : Prop :=
  ∀ index, fraction.Digits index = Digit.zero

/-- An unsigned binary expansion consists of a whole part and a canonical
fractional part. -/
structure UnsignedExpansion where
  IntegerPart : WholeBinaryNumeral
  FractionalPart : CanonicalFraction

/-- An unsigned expansion represents zero exactly when both its whole and
fractional parts are zero. -/
def IsZeroUnsignedExpansion (expansion : UnsignedExpansion) : Prop :=
  expansion.IntegerPart = WholeBinaryNumeral.zero ∧
    IsZeroCanonicalFraction expansion.FractionalPart

/-- A nonzero unsigned binary magnitude. -/
structure NonzeroUnsignedExpansion where
  Magnitude : UnsignedExpansion
  IsNonzero : ¬ IsZeroUnsignedExpansion Magnitude

/-- Sign of a nonzero real binary expansion. -/
inductive Sign where
  | negative
  | positive
  deriving DecidableEq

/-- Canonical signed binary expansion.

Zero is represented only by `zero`; every signed branch carries a proof that
its magnitude is nonzero.
-/
inductive Expansion where
  | zero
  | nonzero (Sign : Sign) (Magnitude : NonzeroUnsignedExpansion)

/-- Interpret a binary digit in the rational field. -/
def DigitValue
    (rationalSystem : RationalNumberSystem.{u}) :
    Digit → rationalSystem.FieldModel.Carrier
  | Digit.zero => 0
  | Digit.one => 1

/-- The canonical rational power `2^exponent`. -/
def PowerOfTwo
    (rationalSystem : RationalNumberSystem.{u}) :
    Nat → rationalSystem.FieldModel.Carrier
  | 0 => 1
  | exponent + 1 =>
      PowerOfTwo rationalSystem exponent * (1 + 1)

/-- Sum the first `count` digits of a positive finite binary numeral. -/
def PositiveBinaryNumeralPartialValue
    (rationalSystem : RationalNumberSystem.{u})
    (numeral : PositiveBinaryNumeral) :
    Nat → rationalSystem.FieldModel.Carrier
  | 0 => 0
  | count + 1 =>
      if indexBound : count < numeral.HighestExponent + 1 then
        PositiveBinaryNumeralPartialValue rationalSystem numeral count +
          DigitValue rationalSystem (numeral.DigitAt ⟨count, indexBound⟩) *
            PowerOfTwo rationalSystem count
      else
        PositiveBinaryNumeralPartialValue rationalSystem numeral count

/-- Canonical rational value of a positive finite binary numeral. -/
def PositiveBinaryNumeralValue
    (rationalSystem : RationalNumberSystem.{u})
    (numeral : PositiveBinaryNumeral) :
    rationalSystem.FieldModel.Carrier :=
  PositiveBinaryNumeralPartialValue rationalSystem numeral
    (numeral.HighestExponent + 1)

/-- Data still needed to interpret canonical binary expansions through the
existing Cauchy-real construction.

The arithmetic source is an actual rational number system, and its Cauchy input
now includes the stronger ordered-field absolute-value and epsilon-splitting
surface. The Dyadic semantics are not allowed to choose arbitrary Cauchy-carrier
operations: instead they are derived from a selected carrier-tied
`RationalRealExtension` whose real carrier is explicitly identified with the
corresponding Cauchy quotient carrier. No independent completeness proposition
is stored here.
-/
structure RationalDyadicApproximationData where
  RationalSystem : RationalNumberSystem.{u}
  AbsoluteValueData : Cauchy.RationalMetricData RationalSystem
  CauchyRealExtension :
    LRA.NumberSystems.RealNumbers.RationalRealExtension RationalSystem
  CauchyCarrierEq :
    CauchyRealExtension.RealModel.Carrier =
      Cauchy.Carrier RationalSystem AbsoluteValueData

variable (dyadicData : RationalDyadicApproximationData.{u})

/-- Rational carrier used by the representation data. -/
abbrev Rational := dyadicData.RationalSystem.FieldModel.Carrier

/-- Integer carrier selected by the rational number system. -/
abbrev Integer := dyadicData.RationalSystem.IntegerSystem.Model.Carrier

/-- Cauchy-real carrier used as the semantic target of binary expansions. -/
abbrev CauchyCarrier :=
  Cauchy.Carrier dyadicData.RationalSystem dyadicData.AbsoluteValueData

/-- Real carrier selected to interpret the Dyadic representation. -/
abbrev RationalDyadicApproximationData.SelectedRealCarrier
    (dyadicData : RationalDyadicApproximationData.{u}) :=
  dyadicData.CauchyRealExtension.RealModel.Carrier

/-- Transport a selected real-carrier value into the identified Cauchy carrier. -/
def RationalDyadicApproximationData.ToCauchyCarrier
    (dyadicData : RationalDyadicApproximationData.{u}) :
    dyadicData.SelectedRealCarrier → CauchyCarrier dyadicData :=
  cast dyadicData.CauchyCarrierEq

/-- Transport an identified Cauchy-carrier value back to the selected real
carrier. -/
def RationalDyadicApproximationData.FromCauchyCarrier
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData → dyadicData.SelectedRealCarrier :=
  cast dyadicData.CauchyCarrierEq.symm

/-- Rational values embed into the Cauchy carrier through the selected
carrier-tied real extension. -/
def RationalDyadicApproximationData.RationalToCauchy
    (dyadicData : RationalDyadicApproximationData.{u}) :
    Rational dyadicData → CauchyCarrier dyadicData :=
  fun value =>
    dyadicData.ToCauchyCarrier
      (LRA.NumberSystems.RealNumbers.RationalRealExtension.EmbedRational
        dyadicData.CauchyRealExtension value)

/-- Zero in the Cauchy carrier, transported from the selected real extension. -/
def RationalDyadicApproximationData.CauchyZero
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData :=
  dyadicData.ToCauchyCarrier (0 : dyadicData.SelectedRealCarrier)

/-- One in the Cauchy carrier, transported from the selected real extension. -/
def RationalDyadicApproximationData.CauchyOne
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData :=
  dyadicData.ToCauchyCarrier (1 : dyadicData.SelectedRealCarrier)

/-- Addition on the Cauchy carrier, transported from the selected real
extension. -/
def RationalDyadicApproximationData.CauchyAddition
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData →
      CauchyCarrier dyadicData →
      CauchyCarrier dyadicData :=
  fun first second =>
    dyadicData.ToCauchyCarrier
      (dyadicData.FromCauchyCarrier first +
        dyadicData.FromCauchyCarrier second)

/-- Negation on the Cauchy carrier, transported from the selected real
extension. -/
def RationalDyadicApproximationData.CauchyNegation
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData →
      CauchyCarrier dyadicData :=
  fun value =>
    dyadicData.ToCauchyCarrier (-dyadicData.FromCauchyCarrier value)

/-- Multiplication on the Cauchy carrier, transported from the selected real
extension. -/
def RationalDyadicApproximationData.CauchyMultiplication
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData →
      CauchyCarrier dyadicData →
      CauchyCarrier dyadicData :=
  fun first second =>
    dyadicData.ToCauchyCarrier
      (dyadicData.FromCauchyCarrier first *
        dyadicData.FromCauchyCarrier second)

/-- Inversion on the Cauchy carrier, transported from the selected real
extension. -/
def RationalDyadicApproximationData.CauchyInverse
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData →
      CauchyCarrier dyadicData :=
  fun value =>
    dyadicData.ToCauchyCarrier (dyadicData.FromCauchyCarrier value)⁻¹

/-- Strict order on the Cauchy carrier, transported from the selected real
extension. -/
def RationalDyadicApproximationData.CauchyStrictOrder
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData →
      CauchyCarrier dyadicData → Prop :=
  fun first second =>
    dyadicData.FromCauchyCarrier first <
      dyadicData.FromCauchyCarrier second

/-- A rational is dyadic when it has the form `m / 2^n`. -/
def IsDyadicRational (value : Rational dyadicData) : Prop :=
  ∃ numerator : Integer dyadicData,
    ∃ exponent : Nat,
      value =
        dyadicData.RationalSystem.IntegerEmbedding.ToField numerator *
          (PowerOfTwo dyadicData.RationalSystem exponent)⁻¹

end LRA.NumberSystems.RealNumbers.Dyadic
