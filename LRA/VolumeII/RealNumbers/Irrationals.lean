-- LRA/VolumeII/Reals/Irrationals.lean
-- Irrational numbers relative to a selected rational embedding.

import LRA.VolumeII.NumberSystems.Models

namespace LRA.NumberSystems.RealNumbers.Irrationals

open LRA.NumberSystems.Models

/-!
Lean module: LRA.NumberSystems.RealNumbers.Irrationals
Source: docs/number-systems/gpt-08e-irrational-numbers.md
Verification status: definitions complete; theorem proofs pending

Irrationality is always relative to the chosen embedding of a rational model into
its real extension. The mixed-arithmetic theorems include the necessary nonzero
hypotheses; in particular, zero times an irrational and zero divided by an
irrational are rational.
-/

variable
    (rational_model : RationalModel)
    (real_extension : RealExtension rational_model)

/--
**[Abbrev — RealCarrier]**

Mathematical statement (Lean): `abbrev RealCarrier`.


Logical form:

```lean
abbrev RealCarrier := real_extension.RealModel.signature.carrier
```
-/
abbrev RealCarrier := real_extension.RealModel.signature.carrier
/--
**[Abbrev — RationalCarrier]**

Mathematical statement (Lean): `abbrev RationalCarrier`.


Logical form:

```lean
abbrev RationalCarrier := rational_model.signature.carrier
```
-/
abbrev RationalCarrier := rational_model.signature.carrier


/-- The selected embedding of rationals into the real carrier.

Mathematical statement (Lean): `def embedRational (value : RationalCarrier rational_model) : RealCarrier rational_model real_extension`.


Logical form:

```lean
def embedRational (value : RationalCarrier rational_model) :
    RealCarrier rational_model real_extension :=
  real_extension.RationalEmbedding.ToReal value
```
-/
def embedRational (value : RationalCarrier rational_model) :
    RealCarrier rational_model real_extension :=
  real_extension.RationalEmbedding.ToReal value


/-- A real number is rational when it lies in the image of the selected embedding.

Mathematical statement (Lean): `def IsRational (value : RealCarrier rational_model real_extension) : Prop`.


Logical form:

```lean
def IsRational (value : RealCarrier rational_model real_extension) : Prop :=
  ∃ rational_value : RationalCarrier rational_model,
    embedRational rational_model real_extension rational_value = value
```
-/
def IsRational (value : RealCarrier rational_model real_extension) : Prop :=
  ∃ rational_value : RationalCarrier rational_model,
    embedRational rational_model real_extension rational_value = value


/-- A real number is irrational when it is not rational.

Mathematical statement (Lean): `def IsIrrational (value : RealCarrier rational_model real_extension) : Prop`.


Logical form:

```lean
def IsIrrational (value : RealCarrier rational_model real_extension) : Prop :=
  ¬ IsRational rational_model real_extension value
```
-/
def IsIrrational (value : RealCarrier rational_model real_extension) : Prop :=
  ¬ IsRational rational_model real_extension value


/-- The subtype of irrational real numbers.

Mathematical statement (Lean): `abbrev Carrier`.


Logical form:

```lean
abbrev Carrier :=
  { value : RealCarrier rational_model real_extension //
      IsIrrational rational_model real_extension value }
```
-/
abbrev Carrier :=
  { value : RealCarrier rational_model real_extension //
      IsIrrational rational_model real_extension value }


/-- Embedded rationals are rational.

Mathematical statement (Lean): `theorem embedded_rational_is_rational (value : RationalCarrier rational_model) : IsRational rational_model real_extension (embedRational rational_model real_extension value)`.

*Proof status:* proof pending


Logical form:

```lean
theorem embedded_rational_is_rational
    (value : RationalCarrier rational_model) :
    IsRational rational_model real_extension
      (embedRational rational_model real_extension value)
```
-/
theorem embedded_rational_is_rational
    (value : RationalCarrier rational_model) :
    IsRational rational_model real_extension
      (embedRational rational_model real_extension value) := by
  sorry


/-- Real zero is rational.

Mathematical statement (Lean): `theorem zero_is_rational : IsRational rational_model real_extension real_extension.RealModel.signature.zero`.

*Proof status:* proof pending


Logical form:

```lean
theorem zero_is_rational :
    IsRational rational_model real_extension
      real_extension.RealModel.signature.zero
```
-/
theorem zero_is_rational :
    IsRational rational_model real_extension
      real_extension.RealModel.signature.zero := by
  sorry


/-- Real one is rational.

Mathematical statement (Lean): `theorem one_is_rational : IsRational rational_model real_extension real_extension.RealModel.signature.one`.

*Proof status:* proof pending


Logical form:

```lean
theorem one_is_rational :
    IsRational rational_model real_extension
      real_extension.RealModel.signature.one
```
-/
theorem one_is_rational :
    IsRational rational_model real_extension
      real_extension.RealModel.signature.one := by
  sorry


/-- Rational real numbers are closed under addition.

Mathematical statement (Lean): `theorem rational_addition_is_rational {first second : RealCarrier rational_model real_extension} (first_is_rational : IsRational rational_model real_extension first) (second_is_rational : IsRational rational_model real_extension second) : IsRational rationa...`.

*Proof status:* proof pending


Logical form:

```lean
theorem rational_addition_is_rational
    {first second : RealCarrier rational_model real_extension}
    (first_is_rational : IsRational rational_model real_extension first)
    (second_is_rational : IsRational rational_model real_extension second) :
    IsRational rational_model real_extension
      (real_extension.RealModel.signature.addition first second)
```
-/
theorem rational_addition_is_rational
    {first second : RealCarrier rational_model real_extension}
    (first_is_rational : IsRational rational_model real_extension first)
    (second_is_rational : IsRational rational_model real_extension second) :
    IsRational rational_model real_extension
      (real_extension.RealModel.signature.addition first second) := by
  sorry


/-- Rational real numbers are closed under negation.

Mathematical statement (Lean): `theorem rational_negation_is_rational {value : RealCarrier rational_model real_extension} (value_is_rational : IsRational rational_model real_extension value) : IsRational rational_model real_extension (real_extension.RealModel.signature.negation value)`.

*Proof status:* proof pending


Logical form:

```lean
theorem rational_negation_is_rational
    {value : RealCarrier rational_model real_extension}
    (value_is_rational : IsRational rational_model real_extension value) :
    IsRational rational_model real_extension
      (real_extension.RealModel.signature.negation value)
```
-/
theorem rational_negation_is_rational
    {value : RealCarrier rational_model real_extension}
    (value_is_rational : IsRational rational_model real_extension value) :
    IsRational rational_model real_extension
      (real_extension.RealModel.signature.negation value) := by
  sorry


/-- Rational real numbers are closed under subtraction.

Mathematical statement (Lean): `theorem rational_subtraction_is_rational {first second : RealCarrier rational_model real_extension} (first_is_rational : IsRational rational_model real_extension first) (second_is_rational : IsRational rational_model real_extension second) : IsRational rati...`.

*Proof status:* proof pending


Logical form:

```lean
theorem rational_subtraction_is_rational
    {first second : RealCarrier rational_model real_extension}
    (first_is_rational : IsRational rational_model real_extension first)
    (second_is_rational : IsRational rational_model real_extension second) :
    IsRational rational_model real_extension
      (real_extension.RealModel.signature.Subtraction first second)
```
-/
theorem rational_subtraction_is_rational
    {first second : RealCarrier rational_model real_extension}
    (first_is_rational : IsRational rational_model real_extension first)
    (second_is_rational : IsRational rational_model real_extension second) :
    IsRational rational_model real_extension
      (real_extension.RealModel.signature.Subtraction first second) := by
  sorry


/-- Rational real numbers are closed under multiplication.

Mathematical statement (Lean): `theorem rational_multiplication_is_rational {first second : RealCarrier rational_model real_extension} (first_is_rational : IsRational rational_model real_extension first) (second_is_rational : IsRational rational_model real_extension second) : IsRational r...`.

*Proof status:* proof pending


Logical form:

```lean
theorem rational_multiplication_is_rational
    {first second : RealCarrier rational_model real_extension}
    (first_is_rational : IsRational rational_model real_extension first)
    (second_is_rational : IsRational rational_model real_extension second) :
    IsRational rational_model real_extension
      (real_extension.RealModel.signature.multiplication first second)
```
-/
theorem rational_multiplication_is_rational
    {first second : RealCarrier rational_model real_extension}
    (first_is_rational : IsRational rational_model real_extension first)
    (second_is_rational : IsRational rational_model real_extension second) :
    IsRational rational_model real_extension
      (real_extension.RealModel.signature.multiplication first second) := by
  sorry


/-- A nonzero rational real has rational inverse.

Mathematical statement (Lean): `theorem rational_inverse_is_rational {value : RealCarrier rational_model real_extension} (value_is_rational : IsRational rational_model real_extension value) (value_is_nonzero : value ≠ real_extension.RealModel.signature.zero) : IsRational rational_model r...`.

*Proof status:* proof pending


Logical form:

```lean
theorem rational_inverse_is_rational
    {value : RealCarrier rational_model real_extension}
    (value_is_rational : IsRational rational_model real_extension value)
    (value_is_nonzero : value ≠ real_extension.RealModel.signature.zero) :
    IsRational rational_model real_extension
      (real_extension.RealModel.signature.inverse value)
```
-/
theorem rational_inverse_is_rational
    {value : RealCarrier rational_model real_extension}
    (value_is_rational : IsRational rational_model real_extension value)
    (value_is_nonzero : value ≠ real_extension.RealModel.signature.zero) :
    IsRational rational_model real_extension
      (real_extension.RealModel.signature.inverse value) := by
  sorry


/-- Rational real numbers are closed under division by a nonzero rational.

Mathematical statement (Lean): `theorem rational_division_is_rational {numerator denominator : RealCarrier rational_model real_extension} (numerator_is_rational : IsRational rational_model real_extension numerator) (denominator_is_rational : IsRational rational_model real_extension denomi...`.

*Proof status:* proof pending


Logical form:

```lean
theorem rational_division_is_rational
    {numerator denominator : RealCarrier rational_model real_extension}
    (numerator_is_rational : IsRational rational_model real_extension numerator)
    (denominator_is_rational : IsRational rational_model real_extension denominator)
    (denominator_is_nonzero : denominator ≠ real_extension.RealModel.signature.zero) :
    IsRational rational_model real_extension
      (real_extension.RealModel.signature.multiplication
        numerator
        (real_extension.RealModel.signature.inverse denominator))
```
-/
theorem rational_division_is_rational
    {numerator denominator : RealCarrier rational_model real_extension}
    (numerator_is_rational : IsRational rational_model real_extension numerator)
    (denominator_is_rational : IsRational rational_model real_extension denominator)
    (denominator_is_nonzero : denominator ≠ real_extension.RealModel.signature.zero) :
    IsRational rational_model real_extension
      (real_extension.RealModel.signature.multiplication
        numerator
        (real_extension.RealModel.signature.inverse denominator)) := by
  sorry


/-- The negation of an irrational is irrational.

Mathematical statement (Lean): `theorem negation_is_irrational {value : RealCarrier rational_model real_extension} (value_is_irrational : IsIrrational rational_model real_extension value) : IsIrrational rational_model real_extension (real_extension.RealModel.signature.negation value)`.

*Proof status:* proof pending


Logical form:

```lean
theorem negation_is_irrational
    {value : RealCarrier rational_model real_extension}
    (value_is_irrational : IsIrrational rational_model real_extension value) :
    IsIrrational rational_model real_extension
      (real_extension.RealModel.signature.negation value)
```
-/
theorem negation_is_irrational
    {value : RealCarrier rational_model real_extension}
    (value_is_irrational : IsIrrational rational_model real_extension value) :
    IsIrrational rational_model real_extension
      (real_extension.RealModel.signature.negation value) := by
  sorry


/-- Rational plus irrational is irrational.

Mathematical statement (Lean): `theorem rational_add_irrational_is_irrational {rational_value irrational_value : RealCarrier rational_model real_extension} (rational_is_rational : IsRational rational_model real_extension rational_value) (irrational_is_irrational : IsIrrational rational_mo...`.

*Proof status:* proof pending


Logical form:

```lean
theorem rational_add_irrational_is_irrational
    {rational_value irrational_value : RealCarrier rational_model real_extension}
    (rational_is_rational : IsRational rational_model real_extension rational_value)
    (irrational_is_irrational : IsIrrational rational_model real_extension irrational_value) :
    IsIrrational rational_model real_extension
      (real_extension.RealModel.signature.addition rational_value irrational_value)
```
-/
theorem rational_add_irrational_is_irrational
    {rational_value irrational_value : RealCarrier rational_model real_extension}
    (rational_is_rational : IsRational rational_model real_extension rational_value)
    (irrational_is_irrational : IsIrrational rational_model real_extension irrational_value) :
    IsIrrational rational_model real_extension
      (real_extension.RealModel.signature.addition rational_value irrational_value) := by
  sorry


/-- Irrational plus rational is irrational.

Mathematical statement (Lean): `theorem irrational_add_rational_is_irrational {irrational_value rational_value : RealCarrier rational_model real_extension} (irrational_is_irrational : IsIrrational rational_model real_extension irrational_value) (rational_is_rational : IsRational rational_...`.

*Proof status:* proof pending


Logical form:

```lean
theorem irrational_add_rational_is_irrational
    {irrational_value rational_value : RealCarrier rational_model real_extension}
    (irrational_is_irrational : IsIrrational rational_model real_extension irrational_value)
    (rational_is_rational : IsRational rational_model real_extension rational_value) :
    IsIrrational rational_model real_extension
      (real_extension.RealModel.signature.addition irrational_value rational_value)
```
-/
theorem irrational_add_rational_is_irrational
    {irrational_value rational_value : RealCarrier rational_model real_extension}
    (irrational_is_irrational : IsIrrational rational_model real_extension irrational_value)
    (rational_is_rational : IsRational rational_model real_extension rational_value) :
    IsIrrational rational_model real_extension
      (real_extension.RealModel.signature.addition irrational_value rational_value) := by
  sorry


/-- Rational minus irrational is irrational.

Mathematical statement (Lean): `theorem rational_sub_irrational_is_irrational {rational_value irrational_value : RealCarrier rational_model real_extension} (rational_is_rational : IsRational rational_model real_extension rational_value) (irrational_is_irrational : IsIrrational rational_mo...`.

*Proof status:* proof pending


Logical form:

```lean
theorem rational_sub_irrational_is_irrational
    {rational_value irrational_value : RealCarrier rational_model real_extension}
    (rational_is_rational : IsRational rational_model real_extension rational_value)
    (irrational_is_irrational : IsIrrational rational_model real_extension irrational_value) :
    IsIrrational rational_model real_extension
      (real_extension.RealModel.signature.Subtraction rational_value irrational_value)
```
-/
theorem rational_sub_irrational_is_irrational
    {rational_value irrational_value : RealCarrier rational_model real_extension}
    (rational_is_rational : IsRational rational_model real_extension rational_value)
    (irrational_is_irrational : IsIrrational rational_model real_extension irrational_value) :
    IsIrrational rational_model real_extension
      (real_extension.RealModel.signature.Subtraction rational_value irrational_value) := by
  sorry


/-- Irrational minus rational is irrational.

Mathematical statement (Lean): `theorem irrational_sub_rational_is_irrational {irrational_value rational_value : RealCarrier rational_model real_extension} (irrational_is_irrational : IsIrrational rational_model real_extension irrational_value) (rational_is_rational : IsRational rational_...`.

*Proof status:* proof pending


Logical form:

```lean
theorem irrational_sub_rational_is_irrational
    {irrational_value rational_value : RealCarrier rational_model real_extension}
    (irrational_is_irrational : IsIrrational rational_model real_extension irrational_value)
    (rational_is_rational : IsRational rational_model real_extension rational_value) :
    IsIrrational rational_model real_extension
      (real_extension.RealModel.signature.Subtraction irrational_value rational_value)
```
-/
theorem irrational_sub_rational_is_irrational
    {irrational_value rational_value : RealCarrier rational_model real_extension}
    (irrational_is_irrational : IsIrrational rational_model real_extension irrational_value)
    (rational_is_rational : IsRational rational_model real_extension rational_value) :
    IsIrrational rational_model real_extension
      (real_extension.RealModel.signature.Subtraction irrational_value rational_value) := by
  sorry


/-- A nonzero rational times an irrational is irrational.

Mathematical statement (Lean): `theorem nonzero_rational_mul_irrational_is_irrational {rational_value irrational_value : RealCarrier rational_model real_extension} (rational_is_rational : IsRational rational_model real_extension rational_value) (rational_is_nonzero : rational_value ≠ real...`.

*Proof status:* proof pending


Logical form:

```lean
theorem nonzero_rational_mul_irrational_is_irrational
    {rational_value irrational_value : RealCarrier rational_model real_extension}
    (rational_is_rational : IsRational rational_model real_extension rational_value)
    (rational_is_nonzero : rational_value ≠ real_extension.RealModel.signature.zero)
    (irrational_is_irrational : IsIrrational rational_model real_extension irrational_value) :
    IsIrrational rational_model real_extension
      (real_extension.RealModel.signature.multiplication rational_value irrational_value)
```
-/
theorem nonzero_rational_mul_irrational_is_irrational
    {rational_value irrational_value : RealCarrier rational_model real_extension}
    (rational_is_rational : IsRational rational_model real_extension rational_value)
    (rational_is_nonzero : rational_value ≠ real_extension.RealModel.signature.zero)
    (irrational_is_irrational : IsIrrational rational_model real_extension irrational_value) :
    IsIrrational rational_model real_extension
      (real_extension.RealModel.signature.multiplication rational_value irrational_value) := by
  sorry


/-- An irrational times a nonzero rational is irrational.

Mathematical statement (Lean): `theorem irrational_mul_nonzero_rational_is_irrational {irrational_value rational_value : RealCarrier rational_model real_extension} (irrational_is_irrational : IsIrrational rational_model real_extension irrational_value) (rational_is_rational : IsRational r...`.

*Proof status:* proof pending


Logical form:

```lean
theorem irrational_mul_nonzero_rational_is_irrational
    {irrational_value rational_value : RealCarrier rational_model real_extension}
    (irrational_is_irrational : IsIrrational rational_model real_extension irrational_value)
    (rational_is_rational : IsRational rational_model real_extension rational_value)
    (rational_is_nonzero : rational_value ≠ real_extension.RealModel.signature.zero) :
    IsIrrational rational_model real_extension
      (real_extension.RealModel.signature.multiplication irrational_value rational_value)
```
-/
theorem irrational_mul_nonzero_rational_is_irrational
    {irrational_value rational_value : RealCarrier rational_model real_extension}
    (irrational_is_irrational : IsIrrational rational_model real_extension irrational_value)
    (rational_is_rational : IsRational rational_model real_extension rational_value)
    (rational_is_nonzero : rational_value ≠ real_extension.RealModel.signature.zero) :
    IsIrrational rational_model real_extension
      (real_extension.RealModel.signature.multiplication irrational_value rational_value) := by
  sorry


/-- An irrational divided by a nonzero rational is irrational.

Mathematical statement (Lean): `theorem irrational_div_nonzero_rational_is_irrational {irrational_value rational_value : RealCarrier rational_model real_extension} (irrational_is_irrational : IsIrrational rational_model real_extension irrational_value) (rational_is_rational : IsRational r...`.

*Proof status:* proof pending


Logical form:

```lean
theorem irrational_div_nonzero_rational_is_irrational
    {irrational_value rational_value : RealCarrier rational_model real_extension}
    (irrational_is_irrational : IsIrrational rational_model real_extension irrational_value)
    (rational_is_rational : IsRational rational_model real_extension rational_value)
    (rational_is_nonzero : rational_value ≠ real_extension.RealModel.signature.zero) :
    IsIrrational rational_model real_extension
      (real_extension.RealModel.signature.multiplication
        irrational_value
        (real_extension.RealModel.signature.inverse rational_value))
```
-/
theorem irrational_div_nonzero_rational_is_irrational
    {irrational_value rational_value : RealCarrier rational_model real_extension}
    (irrational_is_irrational : IsIrrational rational_model real_extension irrational_value)
    (rational_is_rational : IsRational rational_model real_extension rational_value)
    (rational_is_nonzero : rational_value ≠ real_extension.RealModel.signature.zero) :
    IsIrrational rational_model real_extension
      (real_extension.RealModel.signature.multiplication
        irrational_value
        (real_extension.RealModel.signature.inverse rational_value)) := by
  sorry


/-- A nonzero rational divided by an irrational is irrational.

Mathematical statement (Lean): `theorem nonzero_rational_div_irrational_is_irrational {rational_value irrational_value : RealCarrier rational_model real_extension} (rational_is_rational : IsRational rational_model real_extension rational_value) (rational_is_nonzero : rational_value ≠ real...`.

*Proof status:* proof pending


Logical form:

```lean
theorem nonzero_rational_div_irrational_is_irrational
    {rational_value irrational_value : RealCarrier rational_model real_extension}
    (rational_is_rational : IsRational rational_model real_extension rational_value)
    (rational_is_nonzero : rational_value ≠ real_extension.RealModel.signature.zero)
    (irrational_is_irrational : IsIrrational rational_model real_extension irrational_value) :
    IsIrrational rational_model real_extension
      (real_extension.RealModel.signature.multiplication
        rational_value
        (real_extension.RealModel.signature.inverse irrational_value))
```
-/
theorem nonzero_rational_div_irrational_is_irrational
    {rational_value irrational_value : RealCarrier rational_model real_extension}
    (rational_is_rational : IsRational rational_model real_extension rational_value)
    (rational_is_nonzero : rational_value ≠ real_extension.RealModel.signature.zero)
    (irrational_is_irrational : IsIrrational rational_model real_extension irrational_value) :
    IsIrrational rational_model real_extension
      (real_extension.RealModel.signature.multiplication
        rational_value
        (real_extension.RealModel.signature.inverse irrational_value)) := by
  sorry


/-- Every irrational real is nonzero because zero is rational.

Mathematical statement (Lean): `theorem irrational_is_nonzero {value : RealCarrier rational_model real_extension} (value_is_irrational : IsIrrational rational_model real_extension value) : value ≠ real_extension.RealModel.signature.zero`.

*Proof status:* proof pending


Logical form:

```lean
theorem irrational_is_nonzero
    {value : RealCarrier rational_model real_extension}
    (value_is_irrational : IsIrrational rational_model real_extension value) :
    value ≠ real_extension.RealModel.signature.zero
```
-/
theorem irrational_is_nonzero
    {value : RealCarrier rational_model real_extension}
    (value_is_irrational : IsIrrational rational_model real_extension value) :
    value ≠ real_extension.RealModel.signature.zero := by
  sorry


/-- Data witnessing a chosen square root of the embedded rational number two.

Mathematical statement (Lean): `structure SquareRootTwoWitness`.


Logical form:

```lean
structure SquareRootTwoWitness where
  value : RealCarrier rational_model real_extension
  square_is_two :
    real_extension.RealModel.signature.multiplication value value =
      embedRational rational_model real_extension
        (rational_model.signature.addition
          rational_model.signature.one
          rational_model.signature.one)
  is_irrational : IsIrrational rational_model real_extension value
```
-/
structure SquareRootTwoWitness where
  value : RealCarrier rational_model real_extension
  square_is_two :
    real_extension.RealModel.signature.multiplication value value =
      embedRational rational_model real_extension
        (rational_model.signature.addition
          rational_model.signature.one
          rational_model.signature.one)
  is_irrational : IsIrrational rational_model real_extension value


/-- Irrationals are not closed under addition: α + (-α) = 0.

Mathematical statement (Lean): `theorem irrationals_not_closed_under_addition (witness : SquareRootTwoWitness rational_model real_extension) : ∃ first second : RealCarrier rational_model real_extension, IsIrrational rational_model real_extension first ∧ IsIrrational rational_model real_ex...`.

*Proof status:* proof pending


Logical form:

```lean
theorem irrationals_not_closed_under_addition
    (witness : SquareRootTwoWitness rational_model real_extension) :
    ∃ first second : RealCarrier rational_model real_extension,
      IsIrrational rational_model real_extension first ∧
      IsIrrational rational_model real_extension second ∧
      IsRational rational_model real_extension
        (real_extension.RealModel.signature.addition first second)
```
-/
theorem irrationals_not_closed_under_addition
    (witness : SquareRootTwoWitness rational_model real_extension) :
    ∃ first second : RealCarrier rational_model real_extension,
      IsIrrational rational_model real_extension first ∧
      IsIrrational rational_model real_extension second ∧
      IsRational rational_model real_extension
        (real_extension.RealModel.signature.addition first second) := by
  sorry


/-- Irrationals are not closed under subtraction: α - α = 0.

Mathematical statement (Lean): `theorem irrationals_not_closed_under_subtraction (witness : SquareRootTwoWitness rational_model real_extension) : ∃ first second : RealCarrier rational_model real_extension, IsIrrational rational_model real_extension first ∧ IsIrrational rational_model real...`.

*Proof status:* proof pending


Logical form:

```lean
theorem irrationals_not_closed_under_subtraction
    (witness : SquareRootTwoWitness rational_model real_extension) :
    ∃ first second : RealCarrier rational_model real_extension,
      IsIrrational rational_model real_extension first ∧
      IsIrrational rational_model real_extension second ∧
      IsRational rational_model real_extension
        (real_extension.RealModel.signature.Subtraction first second)
```
-/
theorem irrationals_not_closed_under_subtraction
    (witness : SquareRootTwoWitness rational_model real_extension) :
    ∃ first second : RealCarrier rational_model real_extension,
      IsIrrational rational_model real_extension first ∧
      IsIrrational rational_model real_extension second ∧
      IsRational rational_model real_extension
        (real_extension.RealModel.signature.Subtraction first second) := by
  sorry


/-- Irrationals are not closed under multiplication: √2 · √2 = 2.

Mathematical statement (Lean): `theorem irrationals_not_closed_under_multiplication (witness : SquareRootTwoWitness rational_model real_extension) : ∃ first second : RealCarrier rational_model real_extension, IsIrrational rational_model real_extension first ∧ IsIrrational rational_model r...`.

*Proof status:* proof pending


Logical form:

```lean
theorem irrationals_not_closed_under_multiplication
    (witness : SquareRootTwoWitness rational_model real_extension) :
    ∃ first second : RealCarrier rational_model real_extension,
      IsIrrational rational_model real_extension first ∧
      IsIrrational rational_model real_extension second ∧
      IsRational rational_model real_extension
        (real_extension.RealModel.signature.multiplication first second)
```
-/
theorem irrationals_not_closed_under_multiplication
    (witness : SquareRootTwoWitness rational_model real_extension) :
    ∃ first second : RealCarrier rational_model real_extension,
      IsIrrational rational_model real_extension first ∧
      IsIrrational rational_model real_extension second ∧
      IsRational rational_model real_extension
        (real_extension.RealModel.signature.multiplication first second) := by
  sorry


/-- Irrationals are not closed under division: √2 / √2 = 1.

Mathematical statement (Lean): `theorem irrationals_not_closed_under_division (witness : SquareRootTwoWitness rational_model real_extension) : ∃ first second : RealCarrier rational_model real_extension, IsIrrational rational_model real_extension first ∧ IsIrrational rational_model real_ex...`.

*Proof status:* proof pending


Logical form:

```lean
theorem irrationals_not_closed_under_division
    (witness : SquareRootTwoWitness rational_model real_extension) :
    ∃ first second : RealCarrier rational_model real_extension,
      IsIrrational rational_model real_extension first ∧
      IsIrrational rational_model real_extension second ∧
      IsRational rational_model real_extension
        (real_extension.RealModel.signature.multiplication
          first
          (real_extension.RealModel.signature.inverse second))
```
-/
theorem irrationals_not_closed_under_division
    (witness : SquareRootTwoWitness rational_model real_extension) :
    ∃ first second : RealCarrier rational_model real_extension,
      IsIrrational rational_model real_extension first ∧
      IsIrrational rational_model real_extension second ∧
      IsRational rational_model real_extension
        (real_extension.RealModel.signature.multiplication
          first
          (real_extension.RealModel.signature.inverse second)) := by
  sorry

end LRA.NumberSystems.RealNumbers.Irrationals
