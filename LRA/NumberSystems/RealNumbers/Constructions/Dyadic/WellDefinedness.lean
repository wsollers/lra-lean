-- LRA/NumberSystems/RealNumbers/Constructions/Dyadic/WellDefinedness.lean
-- The Cauchy property of binary partial sums; the value maps built from it
-- (fractional, unsigned, signed); the representation, injectivity, and
-- bijectivity of the signed value map; and the resulting bijection between
-- `Expansion` and `CauchyCarrier`.

import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.Operations

namespace LRA.NumberSystems.RealNumbers.Dyadic

/-!
Judgment call: `fractional_value`, `unsigned_value`, and `value` are moved
here from their textual position in the source (immediately after
`fractional_partial_sum`), because each needs
`fractional_partial_sums_are_cauchy` -- a well-definedness fact that could
not yet be stated in `Operations.lean` without reaching forward past this
stage. See the note in `Operations.lean`. Content and order within this
file otherwise follow the source exactly.
-/

variable (dyadic_data : RationalDyadicApproximationData)

/-- Theorem 2.4: binary partial sums are Cauchy.

Mathematical statement (Lean): `theorem fractional_partial_sums_are_cauchy (digits : FractionalDigits) : Cauchy.is_cauchy dyadic_data.rational_model dyadic_data.absolute_value_data (fractional_partial_sum dyadic_data digits)`.

*Proof status:* proof pending


Logical form:

```lean
theorem fractional_partial_sums_are_cauchy
    (digits : FractionalDigits) :
    Cauchy.is_cauchy
      dyadic_data.rational_model
      dyadic_data.absolute_value_data
      (fractional_partial_sum dyadic_data digits)
```
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


Logical form:

```lean
def fractional_value
    (fraction : CanonicalFraction) : CauchyCarrier dyadic_data :=
  Quotient.mk _
    ⟨fractional_partial_sum dyadic_data fraction.digits,
      fractional_partial_sums_are_cauchy dyadic_data fraction.digits⟩
```
-/
def fractional_value
    (fraction : CanonicalFraction) : CauchyCarrier dyadic_data :=
  Quotient.mk _
    ⟨fractional_partial_sum dyadic_data fraction.digits,
      fractional_partial_sums_are_cauchy dyadic_data fraction.digits⟩


/-- Definition 3.2: value of an unsigned expansion.

Mathematical statement (Lean): `def unsigned_value (expansion : UnsignedExpansion) : CauchyCarrier dyadic_data`.


Logical form:

```lean
def unsigned_value
    (expansion : UnsignedExpansion) : CauchyCarrier dyadic_data :=
  dyadic_data.cauchy_addition
    (dyadic_data.rational_to_cauchy
      (dyadic_data.finite_numeral_value expansion.integer_part))
    (fractional_value dyadic_data expansion.fractional_part)
```
-/
def unsigned_value
    (expansion : UnsignedExpansion) : CauchyCarrier dyadic_data :=
  dyadic_data.cauchy_addition
    (dyadic_data.rational_to_cauchy
      (dyadic_data.finite_numeral_value expansion.integer_part))
    (fractional_value dyadic_data expansion.fractional_part)


/-- Definition 3.4: the signed value map V.

Mathematical statement (Lean): `def value : Expansion → CauchyCarrier dyadic_data | Expansion.zero => dyadic_data.cauchy_zero | Expansion.nonzero Sign.positive magnitude => unsigned_value dyadic_data magnitude | Expansion.nonzero Sign.negative magnitude => dyadic_data.cauchy_negation (uns...`.


Logical form:

```lean
def value : Expansion → CauchyCarrier dyadic_data
  | Expansion.zero => dyadic_data.cauchy_zero
  | Expansion.nonzero Sign.positive magnitude =>
      unsigned_value dyadic_data magnitude
  | Expansion.nonzero Sign.negative magnitude =>
      dyadic_data.cauchy_negation (unsigned_value dyadic_data magnitude)
```
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


Logical form:

```lean
theorem representation_exists
    (real_value : CauchyCarrier dyadic_data) :
    ∃ expansion : Expansion,
      value dyadic_data expansion = real_value
```
-/
theorem representation_exists
    (real_value : CauchyCarrier dyadic_data) :
    ∃ expansion : Expansion,
      value dyadic_data expansion = real_value := by
  sorry

/-- Theorem 3.6: V is injective.

Mathematical statement (Lean): `theorem value_is_injective : ∀ first second : Expansion, value dyadic_data first = value dyadic_data second → first = second`.

*Proof status:* proof pending


Logical form:

```lean
theorem value_is_injective :
    ∀ first second : Expansion,
      value dyadic_data first = value dyadic_data second → first = second
```
-/
theorem value_is_injective :
    ∀ first second : Expansion,
      value dyadic_data first = value dyadic_data second → first = second := by
  sorry

/-- Theorem 3.7: V is bijective.

Mathematical statement (Lean): `theorem value_is_bijective : (∀ real_value : CauchyCarrier dyadic_data, ∃ expansion : Expansion, value dyadic_data expansion = real_value) ∧ (∀ first second : Expansion, value dyadic_data first = value dyadic_data second → first = second)`.

*Proof status:* proof pending


Logical form:

```lean
theorem value_is_bijective :
    (∀ real_value : CauchyCarrier dyadic_data,
      ∃ expansion : Expansion,
        value dyadic_data expansion = real_value) ∧
    (∀ first second : Expansion,
      value dyadic_data first = value dyadic_data second → first = second)
```
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


Logical form:

```lean
structure Bijection (α β : Type) where
  forward : α → β
  inverse : β → α
  left_inverse : ∀ value : α, inverse (forward value) = value
  right_inverse : ∀ value : β, forward (inverse value) = value
```
-/
structure Bijection (α β : Type) where
  forward : α → β
  inverse : β → α
  left_inverse : ∀ value : α, inverse (forward value) = value
  right_inverse : ∀ value : β, forward (inverse value) = value


/-- The representation theorem yields a bijection with Cauchy RealNumbers.

Mathematical statement (Lean): `theorem binary_real_bijection_exists : ∃ bridge : Bijection Expansion (CauchyCarrier dyadic_data), ∀ expansion : Expansion, bridge.forward expansion = value dyadic_data expansion`.

*Proof status:* proof pending


Logical form:

```lean
theorem binary_real_bijection_exists :
    ∃ bridge : Bijection Expansion (CauchyCarrier dyadic_data),
      ∀ expansion : Expansion,
        bridge.forward expansion = value dyadic_data expansion
```
-/
theorem binary_real_bijection_exists :
    ∃ bridge : Bijection Expansion (CauchyCarrier dyadic_data),
      ∀ expansion : Expansion,
        bridge.forward expansion = value dyadic_data expansion := by
  sorry

/--
**[Def — binaryRealBijection]**

Mathematical statement (Lean): `noncomputable def binaryRealBijection : Bijection Expansion (CauchyCarrier dyadic_data)`.


Logical form:

```lean
noncomputable def binaryRealBijection :
    Bijection Expansion (CauchyCarrier dyadic_data) :=
  Classical.choose (binary_real_bijection_exists dyadic_data)
```
-/
noncomputable def binaryRealBijection :
    Bijection Expansion (CauchyCarrier dyadic_data) :=
  Classical.choose (binary_real_bijection_exists dyadic_data)

end LRA.NumberSystems.RealNumbers.Dyadic
