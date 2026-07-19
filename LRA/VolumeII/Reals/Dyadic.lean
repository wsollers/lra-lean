-- LRA/VolumeII/Reals/Dyadic.lean
-- Canonical signed binary expansions and transported real structure.

import LRA.VolumeII.Reals.Cauchy

namespace LRA
namespace VolumeII
namespace Reals
namespace Dyadic

open NumberSystems

/-!
Lean module: LRA.VolumeII.Reals.Dyadic
Source: docs/number-systems/gpt-08-reals-dyadic.md
Verification status: definitions complete; theorem proofs pending
-/

/-- Binary digits. -/
inductive Digit where
  | zero
  | one
  deriving DecidableEq

/-- A binary fractional digit sequence. -/
abbrev FractionalDigits := Nat → Digit

/-- Canonical digit strings are not eventually constantly one. -/
def IsCanonical (digits : FractionalDigits) : Prop :=
  ¬ ∃ threshold, ∀ index, threshold ≤ index → digits index = Digit.one

/-- Canonical fractional binary expansion. -/
structure CanonicalFraction where
  digits : FractionalDigits
  canonical : IsCanonical digits

/-- Finite binary numeral with a nonzero leading digit. -/
structure FiniteNumeral where
  digits : List Digit
  nonempty : digits ≠ []
  leading_digit_is_one : digits.getLast = Digit.one

/-- Unsigned binary expansion. -/
structure UnsignedExpansion where
  integer_part : FiniteNumeral
  fractional_part : CanonicalFraction

/-- Sign of a nonzero binary expansion. -/
inductive Sign where
  | negative
  | positive
  deriving DecidableEq

/-- Canonical signed binary reals. -/
inductive Expansion where
  | zero
  | nonzero (sign : Sign) (magnitude : UnsignedExpansion)

/-- Data already available from the rational, place-value, and Cauchy layers. -/
structure Context where
  rational_model : RationalModel
  digit_to_rational : Digit → rational_model.signature.carrier
  power_of_two : Nat → rational_model.signature.carrier
  finite_sum :
    (Nat → rational_model.signature.carrier) → Nat → rational_model.signature.carrier
  finite_numeral_value : FiniteNumeral → rational_model.signature.carrier
  rational_to_cauchy :
    rational_model.signature.carrier → Cauchy.Carrier rational_model
  cauchy_addition :
    Cauchy.Carrier rational_model →
      Cauchy.Carrier rational_model →
      Cauchy.Carrier rational_model
  cauchy_negation : Cauchy.Carrier rational_model → Cauchy.Carrier rational_model

variable (context : Context)

abbrev Rational := context.rational_model.signature.carrier
abbrev CauchyCarrier := Cauchy.Carrier context.rational_model

/-- Rational partial sum of a fractional binary expansion. -/
def fractionalPartialSum
    (digits : FractionalDigits)
    (bound : Nat) : Rational context :=
  context.finite_sum
    (fun index =>
      context.rational_model.signature.multiplication
        (context.digit_to_rational (digits index))
        (context.rational_model.signature.inverse
          (context.power_of_two (index + 1))))
    bound

/-- Fractional partial sums are Cauchy. -/
theorem fractional_partial_sums_are_cauchy
    (digits : FractionalDigits) :
    Cauchy.is_cauchy context.rational_model
      (fractionalPartialSum context digits) := by
  sorry

/-- The zero rational sequence is Cauchy. -/
theorem zero_sequence_is_cauchy :
    Cauchy.is_cauchy context.rational_model
      (fun _ => context.rational_model.signature.zero) := by
  sorry

/-- Cauchy value of a canonical fractional expansion. -/
def fractionalValue (fraction : CanonicalFraction) : CauchyCarrier context :=
  Quotient.mk _
    ⟨fractionalPartialSum context fraction.digits,
      fractional_partial_sums_are_cauchy context fraction.digits⟩

/-- Cauchy value of an unsigned binary expansion. -/
def unsignedValue (expansion : UnsignedExpansion) : CauchyCarrier context :=
  context.cauchy_addition
    (context.rational_to_cauchy
      (context.finite_numeral_value expansion.integer_part))
    (fractionalValue context expansion.fractional_part)

/-- Cauchy value of a canonical signed binary expansion. -/
def value : Expansion → CauchyCarrier context
  | Expansion.zero =>
      Quotient.mk _
        ⟨fun _ => context.rational_model.signature.zero,
          zero_sequence_is_cauchy context⟩
  | Expansion.nonzero Sign.positive magnitude =>
      unsignedValue context magnitude
  | Expansion.nonzero Sign.negative magnitude =>
      context.cauchy_negation (unsignedValue context magnitude)

/-- Eventually-one tails carry to a unique terminating canonical expansion. -/
theorem binary_tail_ambiguity
    (digits : FractionalDigits)
    (eventually_one : ∃ threshold, ∀ index, threshold ≤ index → digits index = Digit.one) :
    ∃! terminating : CanonicalFraction,
      fractionalValue context terminating =
        Quotient.mk _
          ⟨fractionalPartialSum context digits,
            fractional_partial_sums_are_cauchy context digits⟩ := by
  sorry

/-- Canonical fractional expansions are value-unique. -/
theorem canonical_fractional_uniqueness
    (first second : CanonicalFraction) :
    fractionalValue context first = fractionalValue context second ↔
      first = second := by
  sorry

/-- Every Cauchy real has a canonical signed binary expansion. -/
theorem representation_exists
    (real_value : CauchyCarrier context) :
    ∃ expansion, value context expansion = real_value := by
  sorry

/-- The signed value map is injective. -/
theorem value_is_injective :
    ∀ first second,
      value context first = value context second → first = second := by
  sorry

/-- Chosen canonical expansion of a Cauchy real. -/
noncomputable def expansionOf
    (real_value : CauchyCarrier context) : Expansion :=
  Classical.choose (representation_exists context real_value)

/-- Chosen expansions evaluate to their source real. -/
theorem value_expansionOf (real_value : CauchyCarrier context) :
    value context (expansionOf context real_value) = real_value :=
  Classical.choose_spec (representation_exists context real_value)

/-- Canonical signed binary expansions are equivalent to Cauchy reals. -/
noncomputable def equivalence : Expansion ≃ CauchyCarrier context where
  toFun := value context
  invFun := expansionOf context
  left_inv := by
    intro expansion
    apply value_is_injective context
    exact value_expansionOf context (value context expansion)
  right_inv := value_expansionOf context

/-- Transported addition. -/
noncomputable def addition
    (first second : Expansion) : Expansion :=
  (equivalence context).symm
    (context.cauchy_addition
      (equivalence context first)
      (equivalence context second))

/-- Transported negation. -/
noncomputable def negation (value : Expansion) : Expansion :=
  (equivalence context).symm
    (context.cauchy_negation (equivalence context value))

/-- Transported multiplication from a supplied Cauchy multiplication. -/
noncomputable def multiplication
    (cauchy_multiplication :
      CauchyCarrier context → CauchyCarrier context → CauchyCarrier context)
    (first second : Expansion) : Expansion :=
  (equivalence context).symm
    (cauchy_multiplication
      (equivalence context first)
      (equivalence context second))

/-- Transported strict order. -/
def strictOrder
    (cauchy_strict_order :
      CauchyCarrier context → CauchyCarrier context → Prop)
    (first second : Expansion) : Prop :=
  cauchy_strict_order
    (equivalence context first)
    (equivalence context second)

/-- The value equivalence preserves the transported structure. -/
theorem transported_structure_obligations
    (cauchy_multiplication :
      CauchyCarrier context → CauchyCarrier context → CauchyCarrier context)
    (cauchy_strict_order :
      CauchyCarrier context → CauchyCarrier context → Prop) :
    (∀ first second,
      equivalence context (addition context first second) =
        context.cauchy_addition
          (equivalence context first)
          (equivalence context second)) ∧
    (∀ value,
      equivalence context (negation context value) =
        context.cauchy_negation (equivalence context value)) ∧
    (∀ first second,
      equivalence context
          (multiplication context cauchy_multiplication first second) =
        cauchy_multiplication
          (equivalence context first)
          (equivalence context second)) ∧
    (∀ first second,
      strictOrder context cauchy_strict_order first second ↔
        cauchy_strict_order
          (equivalence context first)
          (equivalence context second)) := by
  sorry

end Dyadic
end Reals
end VolumeII
end LRA
