-- LRA/VolumeII/Reals/Dyadic.lean
-- Canonical signed binary expansions and transported real structure.

import LRA.VolumeI.Algebra.Models.Models
import LRA.VolumeII.RealNumbers.Cauchy

namespace LRA
namespace VolumeII
namespace RealNumbers
namespace Dyadic

open LRA.VolumeI.Algebra.Models

/-!
Lean module: LRA.VolumeII.RealNumbers.Dyadic
Source: docs/number-systems/gpt-08-reals-dyadic.md
Verification status: definitions and final theorem statements complete; proofs pending
-/

/--
**[Inductive — Digit]**

Mathematical statement (Lean): `inductive Digit`.
-/
inductive Digit where
  | zero
  | one
  deriving DecidableEq

/--
**[Abbrev — FractionalDigits]**

Mathematical statement (Lean): `abbrev FractionalDigits`.
-/
abbrev FractionalDigits := Nat → Digit


/-- Definition 2.1: every term is a binary digit.

Mathematical statement (Lean): `def IsBinaryDigitSequence (digits : FractionalDigits) : Prop`.
-/
def IsBinaryDigitSequence (digits : FractionalDigits) : Prop :=
  ∀ index, digits index = Digit.zero ∨ digits index = Digit.one


/-- Definition 2.2: canonical sequences are not eventually constantly one.

Mathematical statement (Lean): `def IsCanonical (digits : FractionalDigits) : Prop`.
-/
def IsCanonical (digits : FractionalDigits) : Prop :=
  IsBinaryDigitSequence digits ∧
  ¬ ∃ threshold,
    ∀ index,
      threshold ≤ index → digits index = Digit.one

/--
**[Structure — CanonicalFraction]**

Mathematical statement (Lean): `structure CanonicalFraction`.
-/
structure CanonicalFraction where
  digits : FractionalDigits
  canonical : IsCanonical digits

/--
**[Structure — FiniteNumeral]**

Mathematical statement (Lean): `structure FiniteNumeral`.
-/
structure FiniteNumeral where
  highest_exponent : Nat
  digit : Fin (highest_exponent + 1) → Digit
  leading_digit_is_one :
    digit ⟨highest_exponent, Nat.lt_succ_self highest_exponent⟩ = Digit.one

/--
**[Structure — UnsignedExpansion]**

Mathematical statement (Lean): `structure UnsignedExpansion`.
-/
structure UnsignedExpansion where
  integer_part : FiniteNumeral
  fractional_part : CanonicalFraction

/--
**[Inductive — Sign]**

Mathematical statement (Lean): `inductive Sign`.
-/
inductive Sign where
  | negative
  | positive
  deriving DecidableEq

/--
**[Inductive — Expansion]**

Mathematical statement (Lean): `inductive Expansion`.
-/
inductive Expansion where
  | zero
  | nonzero (sign : Sign) (magnitude : UnsignedExpansion)

/--
**[Structure — RationalDyadicApproximationData]**

Mathematical statement (Lean): `structure RationalDyadicApproximationData`.
-/
structure RationalDyadicApproximationData where
  rational_model : RationalModel
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
  finite_numeral_value : FiniteNumeral → rational_model.signature.carrier
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

/--
**[Abbrev — Rational]**

Mathematical statement (Lean): `abbrev Rational`.
-/
abbrev Rational := dyadic_data.rational_model.signature.carrier
/--
**[Abbrev — CauchyCarrier]**

Mathematical statement (Lean): `abbrev CauchyCarrier`.
-/
abbrev CauchyCarrier :=
  Cauchy.Carrier dyadic_data.rational_model dyadic_data.absolute_value_data


/-- Definition 1.1: predicate for dyadic rationals m / 2^n.

Mathematical statement (Lean): `def IsDyadicRational (value : Rational dyadic_data) : Prop`.
-/
def IsDyadicRational (value : Rational dyadic_data) : Prop :=
  ∃ numerator : dyadic_data.integer_carrier,
    ∃ exponent : dyadic_data.whole_carrier,
      value = dyadic_data.rational_model.signature.multiplication
        (dyadic_data.integer_to_rational numerator)
        (dyadic_data.rational_model.signature.inverse
          (dyadic_data.power_of_two exponent))


/-- Theorem 1.2: dyadic rationals form an ordered subring of Q.

Mathematical statement (Lean): `theorem dyadic_subring : IsDyadicRational dyadic_data dyadic_data.rational_model.signature.zero ∧ IsDyadicRational dyadic_data dyadic_data.rational_model.signature.one ∧ (∀ first second : Rational dyadic_data, IsDyadicRational dyadic_data first → IsDyadicRa...`.

*Proof status:* proof pending
-/
theorem dyadic_subring :
    IsDyadicRational dyadic_data dyadic_data.rational_model.signature.zero ∧
    IsDyadicRational dyadic_data dyadic_data.rational_model.signature.one ∧
    (∀ first second : Rational dyadic_data,
      IsDyadicRational dyadic_data first →
      IsDyadicRational dyadic_data second →
      IsDyadicRational dyadic_data
        (dyadic_data.rational_model.signature.addition first second)) ∧
    (∀ value : Rational dyadic_data,
      IsDyadicRational dyadic_data value →
      IsDyadicRational dyadic_data
        (dyadic_data.rational_model.signature.negation value)) ∧
    (∀ first second : Rational dyadic_data,
      IsDyadicRational dyadic_data first →
      IsDyadicRational dyadic_data second →
      IsDyadicRational dyadic_data
        (dyadic_data.rational_model.signature.multiplication first second)) := by
  sorry


/-- Theorem 1.3: dyadic rationals are dense in Q.

Mathematical statement (Lean): `theorem dyadic_rationals_are_dense (first second : Rational dyadic_data) (first_lt_second : dyadic_data.rational_model.signature.StrictOrder first second) : ∃ dyadic : Rational dyadic_data, IsDyadicRational dyadic_data dyadic ∧ dyadic_data.rational_model.s...`.

*Proof status:* proof pending
-/
theorem dyadic_rationals_are_dense
    (first second : Rational dyadic_data)
    (first_lt_second :
      dyadic_data.rational_model.signature.StrictOrder first second) :
    ∃ dyadic : Rational dyadic_data,
      IsDyadicRational dyadic_data dyadic ∧
      dyadic_data.rational_model.signature.StrictOrder first dyadic ∧
      dyadic_data.rational_model.signature.StrictOrder dyadic second := by
  sorry


/-- Definition 2.3: rational partial sums of a binary fractional expansion.

Mathematical statement (Lean): `def fractional_partial_sum (digits : FractionalDigits) (bound : Nat) : Rational dyadic_data`.
-/
def fractional_partial_sum
    (digits : FractionalDigits)
    (bound : Nat) : Rational dyadic_data :=
  dyadic_data.finite_sum
    (fun index =>
      dyadic_data.rational_model.signature.multiplication
        (dyadic_data.digit_to_rational (digits index))
        (dyadic_data.rational_model.signature.inverse
          (dyadic_data.power_of_two (dyadic_data.exponent_of_index index))))
    bound


/-- Theorem 2.4: binary partial sums are Cauchy.

Mathematical statement (Lean): `theorem fractional_partial_sums_are_cauchy (digits : FractionalDigits) : Cauchy.is_cauchy dyadic_data.rational_model dyadic_data.absolute_value_data (fractional_partial_sum dyadic_data digits)`.

*Proof status:* proof pending
-/
theorem fractional_partial_sums_are_cauchy
    (digits : FractionalDigits) :
    Cauchy.is_cauchy
      dyadic_data.rational_model
      dyadic_data.absolute_value_data
      (fractional_partial_sum dyadic_data digits) := by
  sorry


/-- Definition 2.5: value of a canonical fractional expansion.

Mathematical statement (Lean): `def fractional_value (fraction : CanonicalFraction) : CauchyCarrier dyadic_data`.
-/
def fractional_value
    (fraction : CanonicalFraction) : CauchyCarrier dyadic_data :=
  Quotient.mk _
    ⟨fractional_partial_sum dyadic_data fraction.digits,
      fractional_partial_sums_are_cauchy dyadic_data fraction.digits⟩


/-- Theorem 2.6: every eventually-one tail carries to a unique terminating expansion.

Mathematical statement (Lean): `theorem binary_tail_ambiguity (digits : FractionalDigits) (eventually_one : ∃ threshold, ∀ index, threshold ≤ index → digits index = Digit.one) : ∃ terminating : CanonicalFraction, fractional_value dyadic_data terminating = Quotient.mk _ ⟨fractional_partial...`.

*Proof status:* proof pending
-/
theorem binary_tail_ambiguity
    (digits : FractionalDigits)
    (eventually_one :
      ∃ threshold,
        ∀ index,
          threshold ≤ index → digits index = Digit.one) :
    ∃ terminating : CanonicalFraction,
      fractional_value dyadic_data terminating =
        Quotient.mk _
          ⟨fractional_partial_sum dyadic_data digits,
            fractional_partial_sums_are_cauchy dyadic_data digits⟩ ∧
      ∀ other : CanonicalFraction,
        fractional_value dyadic_data other =
            Quotient.mk _
              ⟨fractional_partial_sum dyadic_data digits,
                fractional_partial_sums_are_cauchy dyadic_data digits⟩ →
        other = terminating := by
  sorry


/-- Theorem 2.7: canonical fractional expansions are unique.

Mathematical statement (Lean): `theorem canonical_fractional_uniqueness (first second : CanonicalFraction) : fractional_value dyadic_data first = fractional_value dyadic_data second ↔ first = second`.

*Proof status:* proof pending
-/
theorem canonical_fractional_uniqueness
    (first second : CanonicalFraction) :
    fractional_value dyadic_data first = fractional_value dyadic_data second ↔
      first = second := by
  sorry


/-- Definition 3.2: value of an unsigned expansion.

Mathematical statement (Lean): `def unsigned_value (expansion : UnsignedExpansion) : CauchyCarrier dyadic_data`.
-/
def unsigned_value
    (expansion : UnsignedExpansion) : CauchyCarrier dyadic_data :=
  dyadic_data.cauchy_addition
    (dyadic_data.rational_to_cauchy
      (dyadic_data.finite_numeral_value expansion.integer_part))
    (fractional_value dyadic_data expansion.fractional_part)


/-- Definition 3.4: the signed value map V.

Mathematical statement (Lean): `def value : Expansion → CauchyCarrier dyadic_data | Expansion.zero => dyadic_data.cauchy_zero | Expansion.nonzero Sign.positive magnitude => unsigned_value dyadic_data magnitude | Expansion.nonzero Sign.negative magnitude => dyadic_data.cauchy_negation (uns...`.
-/
def value : Expansion → CauchyCarrier dyadic_data
  | Expansion.zero => dyadic_data.cauchy_zero
  | Expansion.nonzero Sign.positive magnitude =>
      unsigned_value dyadic_data magnitude
  | Expansion.nonzero Sign.negative magnitude =>
      dyadic_data.cauchy_negation (unsigned_value dyadic_data magnitude)


/-- Theorem 3.5: every Cauchy real has a canonical binary expansion.

Mathematical statement (Lean): `theorem representation_exists (real_value : CauchyCarrier dyadic_data) : ∃ expansion : Expansion, value dyadic_data expansion = real_value`.

*Proof status:* proof pending
-/
theorem representation_exists
    (real_value : CauchyCarrier dyadic_data) :
    ∃ expansion : Expansion,
      value dyadic_data expansion = real_value := by
  sorry


/-- Theorem 3.6: V is injective.

Mathematical statement (Lean): `theorem value_is_injective : ∀ first second : Expansion, value dyadic_data first = value dyadic_data second → first = second`.

*Proof status:* proof pending
-/
theorem value_is_injective :
    ∀ first second : Expansion,
      value dyadic_data first = value dyadic_data second → first = second := by
  sorry


/-- Theorem 3.7: V is bijective.

Mathematical statement (Lean): `theorem value_is_bijective : (∀ real_value : CauchyCarrier dyadic_data, ∃ expansion : Expansion, value dyadic_data expansion = real_value) ∧ (∀ first second : Expansion, value dyadic_data first = value dyadic_data second → first = second)`.

*Proof status:* proof pending
-/
theorem value_is_bijective :
    (∀ real_value : CauchyCarrier dyadic_data,
      ∃ expansion : Expansion,
        value dyadic_data expansion = real_value) ∧
    (∀ first second : Expansion,
      value dyadic_data first = value dyadic_data second → first = second) := by
  sorry


/-- A bijection between two carriers, given by mutually inverse maps.

Mathematical statement (Lean): `structure Bijection (α β : Type)`.
-/
structure Bijection (α β : Type) where
  forward : α → β
  inverse : β → α
  left_inverse : ∀ value : α, inverse (forward value) = value
  right_inverse : ∀ value : β, forward (inverse value) = value


/-- The representation theorem yields a bijection with Cauchy RealNumbers.

Mathematical statement (Lean): `theorem binary_real_bijection_exists : ∃ bridge : Bijection Expansion (CauchyCarrier dyadic_data), ∀ expansion : Expansion, bridge.forward expansion = value dyadic_data expansion`.

*Proof status:* proof pending
-/
theorem binary_real_bijection_exists :
    ∃ bridge : Bijection Expansion (CauchyCarrier dyadic_data),
      ∀ expansion : Expansion,
        bridge.forward expansion = value dyadic_data expansion := by
  sorry

/--
**[Def — binaryRealBijection]**

Mathematical statement (Lean): `noncomputable def binaryRealBijection : Bijection Expansion (CauchyCarrier dyadic_data)`.
-/
noncomputable def binaryRealBijection :
    Bijection Expansion (CauchyCarrier dyadic_data) :=
  Classical.choose (binary_real_bijection_exists dyadic_data)


/-- Definition 4.1: transported constants and operations.

Mathematical statement (Lean): `noncomputable def zero : Expansion`.
-/
noncomputable def zero : Expansion :=
  (binaryRealBijection dyadic_data).inverse dyadic_data.cauchy_zero

/--
**[Def — one]**

Mathematical statement (Lean): `noncomputable def one : Expansion`.
-/
noncomputable def one : Expansion :=
  (binaryRealBijection dyadic_data).inverse dyadic_data.cauchy_one

/--
**[Def — addition]**

Mathematical statement (Lean): `noncomputable def addition (first second : Expansion) : Expansion`.
-/
noncomputable def addition (first second : Expansion) : Expansion :=
  (binaryRealBijection dyadic_data).inverse
    (dyadic_data.cauchy_addition
      ((binaryRealBijection dyadic_data).forward first)
      ((binaryRealBijection dyadic_data).forward second))

/--
**[Def — negation]**

Mathematical statement (Lean): `noncomputable def negation (expansion : Expansion) : Expansion`.
-/
noncomputable def negation (expansion : Expansion) : Expansion :=
  (binaryRealBijection dyadic_data).inverse
    (dyadic_data.cauchy_negation
      ((binaryRealBijection dyadic_data).forward expansion))

/--
**[Def — multiplication]**

Mathematical statement (Lean): `noncomputable def multiplication (first second : Expansion) : Expansion`.
-/
noncomputable def multiplication (first second : Expansion) : Expansion :=
  (binaryRealBijection dyadic_data).inverse
    (dyadic_data.cauchy_multiplication
      ((binaryRealBijection dyadic_data).forward first)
      ((binaryRealBijection dyadic_data).forward second))

/--
**[Def — inverse]**

Mathematical statement (Lean): `noncomputable def inverse (expansion : Expansion) : Expansion`.
-/
noncomputable def inverse (expansion : Expansion) : Expansion :=
  (binaryRealBijection dyadic_data).inverse
    (dyadic_data.cauchy_inverse
      ((binaryRealBijection dyadic_data).forward expansion))


/-- Definition 4.1: transported strict order.

Mathematical statement (Lean): `def strict_order (first second : Expansion) : Prop`.
-/
def strict_order (first second : Expansion) : Prop :=
  dyadic_data.cauchy_strict_order
    ((binaryRealBijection dyadic_data).forward first)
    ((binaryRealBijection dyadic_data).forward second)


/-- Proposition expressing that V is an ordered-field isomorphism.

Mathematical statement (Lean): `def OrderedFieldIsomorphism : Prop`.
-/
def OrderedFieldIsomorphism : Prop :=
  (binaryRealBijection dyadic_data).forward (zero dyadic_data) = dyadic_data.cauchy_zero ∧
  (binaryRealBijection dyadic_data).forward (one dyadic_data) = dyadic_data.cauchy_one ∧
  (∀ first second : Expansion,
    (binaryRealBijection dyadic_data).forward (addition dyadic_data first second) =
      dyadic_data.cauchy_addition
        ((binaryRealBijection dyadic_data).forward first)
        ((binaryRealBijection dyadic_data).forward second)) ∧
  (∀ expansion : Expansion,
    (binaryRealBijection dyadic_data).forward (negation dyadic_data expansion) =
      dyadic_data.cauchy_negation
        ((binaryRealBijection dyadic_data).forward expansion)) ∧
  (∀ first second : Expansion,
    (binaryRealBijection dyadic_data).forward (multiplication dyadic_data first second) =
      dyadic_data.cauchy_multiplication
        ((binaryRealBijection dyadic_data).forward first)
        ((binaryRealBijection dyadic_data).forward second)) ∧
  (∀ expansion : Expansion,
    (binaryRealBijection dyadic_data).forward (inverse dyadic_data expansion) =
      dyadic_data.cauchy_inverse
        ((binaryRealBijection dyadic_data).forward expansion)) ∧
  (∀ first second : Expansion,
    strict_order dyadic_data first second ↔
      dyadic_data.cauchy_strict_order
        ((binaryRealBijection dyadic_data).forward first)
        ((binaryRealBijection dyadic_data).forward second))


/-- Theorem 4.2: V is an ordered-field isomorphism.

Mathematical statement (Lean): `theorem ordered_field_isomorphism : OrderedFieldIsomorphism dyadic_data`.

*Proof status:* proof pending
-/
theorem ordered_field_isomorphism : OrderedFieldIsomorphism dyadic_data := by
  sorry


/-- Proposition expressing complete Archimedean ordered-field structure.

Mathematical statement (Lean): `def CompleteArchimedeanOrderedField : Prop`.
-/
def CompleteArchimedeanOrderedField : Prop :=
  OrderedFieldIsomorphism dyadic_data ∧
  dyadic_data.cauchy_complete_archimedean_ordered_field


/-- Corollary 4.3: binary reals are a complete Archimedean ordered field.

Mathematical statement (Lean): `theorem complete_archimedean_ordered_field : CompleteArchimedeanOrderedField dyadic_data`.

*Proof status:* proof pending
-/
theorem complete_archimedean_ordered_field :
    CompleteArchimedeanOrderedField dyadic_data := by
  sorry

end Dyadic
end RealNumbers
end VolumeII
end LRA
