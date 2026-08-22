-- LRA/NumberSystems/RealNumbers/Constructions/Dyadic/WellDefinedness.lean
-- Semantic value maps and representation theorems for canonical binary
-- expansions.

import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.Operations

namespace LRA.NumberSystems.RealNumbers.Dyadic

variable (dyadic_data : RationalDyadicApproximationData)

/-- Binary fractional partial sums form a Cauchy sequence. -/
theorem fractional_partial_sums_are_cauchy
    (digits : FractionalDigits) :
    Cauchy.is_cauchy
      dyadic_data.rational_model
      dyadic_data.absolute_value_data
      (fractional_partial_sum dyadic_data digits) := by
  sorry

/-- Value of a canonical fractional expansion in the Cauchy-real carrier. -/
def fractional_value
    (fraction : CanonicalFraction) : CauchyCarrier dyadic_data :=
  Quotient.mk _
    ⟨fractional_partial_sum dyadic_data fraction.Digits,
      fractional_partial_sums_are_cauchy dyadic_data fraction.Digits⟩

/-- Semantic value of a finite whole binary numeral. -/
def whole_numeral_value : WholeBinaryNumeral → CauchyCarrier dyadic_data
  | WholeBinaryNumeral.zero => dyadic_data.cauchy_zero
  | WholeBinaryNumeral.positive numeral =>
      dyadic_data.rational_to_cauchy
        (dyadic_data.positive_numeral_value numeral)

/-- Value of an unsigned expansion. -/
def unsigned_value
    (expansion : UnsignedExpansion) : CauchyCarrier dyadic_data :=
  dyadic_data.cauchy_addition
    (whole_numeral_value dyadic_data expansion.IntegerPart)
    (fractional_value dyadic_data expansion.FractionalPart)

/-- Signed binary value map. -/
def value : Expansion → CauchyCarrier dyadic_data
  | Expansion.zero => dyadic_data.cauchy_zero
  | Expansion.nonzero Sign.positive magnitude =>
      unsigned_value dyadic_data magnitude.Magnitude
  | Expansion.nonzero Sign.negative magnitude =>
      dyadic_data.cauchy_negation
        (unsigned_value dyadic_data magnitude.Magnitude)

/-- Every Cauchy real has a canonical signed binary expansion. -/
theorem representation_exists
    (real_value : CauchyCarrier dyadic_data) :
    ∃ expansion : Expansion,
      value dyadic_data expansion = real_value := by
  sorry

/-- The canonical signed binary value map is injective. -/
theorem value_is_injective :
    ∀ first second : Expansion,
      value dyadic_data first = value dyadic_data second → first = second := by
  sorry

/-- The canonical signed binary value map is bijective. -/
theorem value_is_bijective :
    (∀ real_value : CauchyCarrier dyadic_data,
      ∃ expansion : Expansion,
        value dyadic_data expansion = real_value) ∧
    (∀ first second : Expansion,
      value dyadic_data first = value dyadic_data second → first = second) := by
  sorry

/-- A bijection between two carriers, given by mutually inverse maps. -/
structure Bijection (α β : Type) where
  forward : α → β
  inverse : β → α
  left_inverse : ∀ value : α, inverse (forward value) = value
  right_inverse : ∀ value : β, forward (inverse value) = value

/-- The binary representation theorem yields a bijection with the Cauchy-real
carrier. -/
theorem binary_real_bijection_exists :
    ∃ bridge : Bijection Expansion (CauchyCarrier dyadic_data),
      ∀ expansion : Expansion,
        bridge.forward expansion = value dyadic_data expansion := by
  sorry

/-- Selected binary/Cauchy-real bijection. -/
noncomputable def binaryRealBijection :
    Bijection Expansion (CauchyCarrier dyadic_data) :=
  Classical.choose (binary_real_bijection_exists dyadic_data)

end LRA.NumberSystems.RealNumbers.Dyadic
