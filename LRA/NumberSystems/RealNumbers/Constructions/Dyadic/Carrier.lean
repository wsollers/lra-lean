-- LRA/NumberSystems/RealNumbers/Constructions/Dyadic/Carrier.lean
-- Binary digits, fractional digit sequences, canonical fractions, finite
-- numerals, unsigned and signed expansions, the bundle of rational and
-- transported Cauchy-real data this construction depends on, and the
-- dyadic-rational predicate on that bundle's rational carrier.

import LRA.VolumeII.NumberSystems.Models
import LRA.NumberSystems.RealNumbers.Constructions.Cauchy

namespace LRA.NumberSystems.RealNumbers.Dyadic

open LRA.NumberSystems.Models

/-!
Lean module: LRA.NumberSystems.RealNumbers.Dyadic
Source: docs/number-systems/gpt-08-reals-dyadic.md
Verification status: definitions and final theorem statements complete; proofs pending

Moved from `LRA.VolumeII.RealNumbers.Dyadic` (previously one file covering
the whole pipeline); split per §1.6.1 into `Carrier` (this file),
`Equivalence`, `WellFoundedness`, `Operations`, `WellDefinedness`, `Laws`,
`Behavior`, `Instances`. See `RealNumbers/ProofOrder.md`.

This construction transports a full ordered-field structure onto binary
signed expansions through a bijection with the already-constructed
`Cauchy.Carrier` (see `LRA.NumberSystems.RealNumbers.Cauchy`), so every
reference to the Cauchy construction below is repointed to
`LRA.NumberSystems.RealNumbers.Cauchy.*` at its new location under
`LRA.NumberSystems.RealNumbers.Constructions.Cauchy`.
-/

/--
**[Inductive — Digit]**

Mathematical statement (Lean): `inductive Digit`.


Logical form:

```lean
inductive Digit where
  | zero
  | one
  deriving DecidableEq
```
-/
inductive Digit where
  | zero
  | one
  deriving DecidableEq

/--
**[Abbrev — FractionalDigits]**

Mathematical statement (Lean): `abbrev FractionalDigits`.


Logical form:

```lean
abbrev FractionalDigits := Nat → Digit
```
-/
abbrev FractionalDigits := Nat → Digit


/-- Definition 2.1: every term is a binary digit.

Mathematical statement (Lean): `def IsBinaryDigitSequence (digits : FractionalDigits) : Prop`.


Logical form:

```lean
def IsBinaryDigitSequence (digits : FractionalDigits) : Prop :=
  ∀ index, digits index = Digit.zero ∨ digits index = Digit.one
```
-/
def IsBinaryDigitSequence (digits : FractionalDigits) : Prop :=
  ∀ index, digits index = Digit.zero ∨ digits index = Digit.one


/-- Definition 2.2: canonical sequences are not eventually constantly one.

Mathematical statement (Lean): `def IsCanonical (digits : FractionalDigits) : Prop`.


Logical form:

```lean
def IsCanonical (digits : FractionalDigits) : Prop :=
  IsBinaryDigitSequence digits ∧
  ¬ ∃ threshold,
    ∀ index,
      threshold ≤ index → digits index = Digit.one
```
-/
def IsCanonical (digits : FractionalDigits) : Prop :=
  IsBinaryDigitSequence digits ∧
  ¬ ∃ threshold,
    ∀ index,
      threshold ≤ index → digits index = Digit.one

/--
**[Structure — CanonicalFraction]**

Mathematical statement (Lean): `structure CanonicalFraction`.


Logical form:

```lean
structure CanonicalFraction where
  digits : FractionalDigits
  canonical : IsCanonical digits
```
-/
structure CanonicalFraction where
  digits : FractionalDigits
  canonical : IsCanonical digits

/--
**[Structure — FiniteNumeral]**

Mathematical statement (Lean): `structure FiniteNumeral`.


Logical form:

```lean
structure FiniteNumeral where
  highest_exponent : Nat
  digit : Fin (highest_exponent + 1) → Digit
  leading_digit_is_one :
    digit ⟨highest_exponent, Nat.lt_succ_self highest_exponent⟩ = Digit.one
```
-/
structure FiniteNumeral where
  highest_exponent : Nat
  digit : Fin (highest_exponent + 1) → Digit
  leading_digit_is_one :
    digit ⟨highest_exponent, Nat.lt_succ_self highest_exponent⟩ = Digit.one

/--
**[Structure — UnsignedExpansion]**

Mathematical statement (Lean): `structure UnsignedExpansion`.


Logical form:

```lean
structure UnsignedExpansion where
  integer_part : FiniteNumeral
  fractional_part : CanonicalFraction
```
-/
structure UnsignedExpansion where
  integer_part : FiniteNumeral
  fractional_part : CanonicalFraction

/--
**[Inductive — Sign]**

Mathematical statement (Lean): `inductive Sign`.


Logical form:

```lean
inductive Sign where
  | negative
  | positive
  deriving DecidableEq
```
-/
inductive Sign where
  | negative
  | positive
  deriving DecidableEq

/--
**[Inductive — Expansion]**

Mathematical statement (Lean): `inductive Expansion`.


Logical form:

```lean
inductive Expansion where
  | zero
  | nonzero (sign : Sign) (magnitude : UnsignedExpansion)
```
-/
inductive Expansion where
  | zero
  | nonzero (sign : Sign) (magnitude : UnsignedExpansion)

/--
**[Structure — RationalDyadicApproximationData]**

Mathematical statement (Lean): `structure RationalDyadicApproximationData`.


Logical form:

```lean
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
```
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


Logical form:

```lean
abbrev Rational := dyadic_data.rational_model.signature.carrier
```
-/
abbrev Rational := dyadic_data.rational_model.signature.carrier
/--
**[Abbrev — CauchyCarrier]**

Mathematical statement (Lean): `abbrev CauchyCarrier`.


Logical form:

```lean
abbrev CauchyCarrier :=
  Cauchy.Carrier dyadic_data.rational_model dyadic_data.absolute_value_data
```
-/
abbrev CauchyCarrier :=
  Cauchy.Carrier dyadic_data.rational_model dyadic_data.absolute_value_data


/-- Definition 1.1: predicate for dyadic rationals m / 2^n.

Mathematical statement (Lean): `def IsDyadicRational (value : Rational dyadic_data) : Prop`.


Logical form:

```lean
def IsDyadicRational (value : Rational dyadic_data) : Prop :=
  ∃ numerator : dyadic_data.integer_carrier,
    ∃ exponent : dyadic_data.whole_carrier,
      value = dyadic_data.rational_model.signature.multiply
        (dyadic_data.integer_to_rational numerator)
        (dyadic_data.rational_model.signature.inv
          (dyadic_data.power_of_two exponent))
```
-/
def IsDyadicRational (value : Rational dyadic_data) : Prop :=
  ∃ numerator : dyadic_data.integer_carrier,
    ∃ exponent : dyadic_data.whole_carrier,
      value = dyadic_data.rational_model.signature.multiply
        (dyadic_data.integer_to_rational numerator)
        (dyadic_data.rational_model.signature.inv
          (dyadic_data.power_of_two exponent))

end LRA.NumberSystems.RealNumbers.Dyadic
