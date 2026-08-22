-- LRA/NumberSystems/RealNumbers/Constructions/Dyadic/Carrier.lean
-- Canonical binary expansions and the data needed to interpret them.

import LRA.VolumeII.NumberSystems.Models
import LRA.NumberSystems.RealNumbers.Constructions.Cauchy

namespace LRA.NumberSystems.RealNumbers.Dyadic

open LRA.NumberSystems.Models

/-!
A signed binary expansion must represent numbers in `(0,1)` as well as numbers
with nonzero whole part.  Accordingly, a positive finite numeral is separated
from a whole binary numeral, which has an explicit zero case.  The signed
`Expansion.nonzero` constructor carries a genuinely nonzero magnitude so that
zero has only the canonical `Expansion.zero` representation.
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

/-- Data required to interpret binary expansions through the existing Cauchy
real construction. -/
structure RationalDyadicApproximationData where
  rational_model : DenselyOrderedFieldModel
  absolute_value_data : Cauchy.RationalMetricData rational_model
  integer_carrier : Type
  whole_carrier : Type
  integer_to_rational : integer_carrier → rational_model.signature.carrier
  exponent_of_index : Nat → whole_carrier
  power_of_two : whole_carrier → rational_model.signature.carrier
  digit_to_rational : Digit → rational_model.signature.carrier
  finite_sum :
    (Nat → rational_model.signature.carrier) →
      Nat → rational_model.signature.carrier
  positive_numeral_value : PositiveBinaryNumeral → rational_model.signature.carrier
  rational_to_cauchy :
    rational_model.signature.carrier →
      Cauchy.Carrier rational_model absolute_value_data
  cauchy_zero : Cauchy.Carrier rational_model absolute_value_data
  cauchy_one : Cauchy.Carrier rational_model absolute_value_data
  cauchy_addition :
    Cauchy.Carrier rational_model absolute_value_data →
      Cauchy.Carrier rational_model absolute_value_data →
      Cauchy.Carrier rational_model absolute_value_data
  cauchy_negation :
    Cauchy.Carrier rational_model absolute_value_data →
      Cauchy.Carrier rational_model absolute_value_data
  cauchy_multiplication :
    Cauchy.Carrier rational_model absolute_value_data →
      Cauchy.Carrier rational_model absolute_value_data →
      Cauchy.Carrier rational_model absolute_value_data
  cauchy_inverse :
    Cauchy.Carrier rational_model absolute_value_data →
      Cauchy.Carrier rational_model absolute_value_data
  cauchy_strict_order :
    Cauchy.Carrier rational_model absolute_value_data →
      Cauchy.Carrier rational_model absolute_value_data → Prop
  cauchy_complete_archimedean_ordered_field : Prop

variable (dyadic_data : RationalDyadicApproximationData)

/-- Rational carrier used by the representation data. -/
abbrev Rational := dyadic_data.rational_model.signature.carrier

/-- Cauchy-real carrier used as the semantic target of binary expansions. -/
abbrev CauchyCarrier :=
  Cauchy.Carrier dyadic_data.rational_model dyadic_data.absolute_value_data

/-- A rational is dyadic when it has the form `m / 2^n`. -/
def IsDyadicRational (value : Rational dyadic_data) : Prop :=
  ∃ numerator : dyadic_data.integer_carrier,
    ∃ exponent : dyadic_data.whole_carrier,
      value = dyadic_data.rational_model.signature.multiply
        (dyadic_data.integer_to_rational numerator)
        (dyadic_data.rational_model.signature.inv
          (dyadic_data.power_of_two exponent))

end LRA.NumberSystems.RealNumbers.Dyadic
