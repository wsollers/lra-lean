-- LRA/VolumeII/Reals/Irrationals.lean
-- Irrational numbers relative to a selected rational embedding.

import LRA.VolumeII.NumberSystems.Models

namespace LRA
namespace VolumeII
namespace Reals
namespace Irrationals

open NumberSystems

/-!
Lean module: LRA.VolumeII.Reals.Irrationals
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

abbrev RealCarrier := real_extension.real_model.signature.carrier
abbrev RationalCarrier := rational_model.signature.carrier

/-- The selected embedding of rationals into the real carrier. -/
def embedRational (value : RationalCarrier rational_model) :
    RealCarrier rational_model real_extension :=
  real_extension.rational_embedding.to_real value

/-- A real number is rational when it lies in the image of the selected embedding. -/
def IsRational (value : RealCarrier rational_model real_extension) : Prop :=
  ∃ rational_value : RationalCarrier rational_model,
    embedRational rational_model real_extension rational_value = value

/-- A real number is irrational when it is not rational. -/
def IsIrrational (value : RealCarrier rational_model real_extension) : Prop :=
  ¬ IsRational rational_model real_extension value

/-- The subtype of irrational real numbers. -/
abbrev Carrier :=
  { value : RealCarrier rational_model real_extension //
      IsIrrational rational_model real_extension value }

/-- Embedded rationals are rational. -/
theorem embedded_rational_is_rational
    (value : RationalCarrier rational_model) :
    IsRational rational_model real_extension
      (embedRational rational_model real_extension value) := by
  sorry

/-- Real zero is rational. -/
theorem zero_is_rational :
    IsRational rational_model real_extension
      real_extension.real_model.signature.zero := by
  sorry

/-- Real one is rational. -/
theorem one_is_rational :
    IsRational rational_model real_extension
      real_extension.real_model.signature.one := by
  sorry

/-- Rational real numbers are closed under addition. -/
theorem rational_addition_is_rational
    {first second : RealCarrier rational_model real_extension}
    (first_is_rational : IsRational rational_model real_extension first)
    (second_is_rational : IsRational rational_model real_extension second) :
    IsRational rational_model real_extension
      (real_extension.real_model.signature.addition first second) := by
  sorry

/-- Rational real numbers are closed under negation. -/
theorem rational_negation_is_rational
    {value : RealCarrier rational_model real_extension}
    (value_is_rational : IsRational rational_model real_extension value) :
    IsRational rational_model real_extension
      (real_extension.real_model.signature.negation value) := by
  sorry

/-- Rational real numbers are closed under subtraction. -/
theorem rational_subtraction_is_rational
    {first second : RealCarrier rational_model real_extension}
    (first_is_rational : IsRational rational_model real_extension first)
    (second_is_rational : IsRational rational_model real_extension second) :
    IsRational rational_model real_extension
      (real_extension.real_model.signature.subtraction first second) := by
  sorry

/-- Rational real numbers are closed under multiplication. -/
theorem rational_multiplication_is_rational
    {first second : RealCarrier rational_model real_extension}
    (first_is_rational : IsRational rational_model real_extension first)
    (second_is_rational : IsRational rational_model real_extension second) :
    IsRational rational_model real_extension
      (real_extension.real_model.signature.multiplication first second) := by
  sorry

/-- A nonzero rational real has rational inverse. -/
theorem rational_inverse_is_rational
    {value : RealCarrier rational_model real_extension}
    (value_is_rational : IsRational rational_model real_extension value)
    (value_is_nonzero : value ≠ real_extension.real_model.signature.zero) :
    IsRational rational_model real_extension
      (real_extension.real_model.signature.inverse value) := by
  sorry

/-- Rational real numbers are closed under division by a nonzero rational. -/
theorem rational_division_is_rational
    {numerator denominator : RealCarrier rational_model real_extension}
    (numerator_is_rational : IsRational rational_model real_extension numerator)
    (denominator_is_rational : IsRational rational_model real_extension denominator)
    (denominator_is_nonzero : denominator ≠ real_extension.real_model.signature.zero) :
    IsRational rational_model real_extension
      (real_extension.real_model.signature.multiplication
        numerator
        (real_extension.real_model.signature.inverse denominator)) := by
  sorry

/-- The negation of an irrational is irrational. -/
theorem negation_is_irrational
    {value : RealCarrier rational_model real_extension}
    (value_is_irrational : IsIrrational rational_model real_extension value) :
    IsIrrational rational_model real_extension
      (real_extension.real_model.signature.negation value) := by
  sorry

/-- Rational plus irrational is irrational. -/
theorem rational_add_irrational_is_irrational
    {rational_value irrational_value : RealCarrier rational_model real_extension}
    (rational_is_rational : IsRational rational_model real_extension rational_value)
    (irrational_is_irrational : IsIrrational rational_model real_extension irrational_value) :
    IsIrrational rational_model real_extension
      (real_extension.real_model.signature.addition rational_value irrational_value) := by
  sorry

/-- Irrational plus rational is irrational. -/
theorem irrational_add_rational_is_irrational
    {irrational_value rational_value : RealCarrier rational_model real_extension}
    (irrational_is_irrational : IsIrrational rational_model real_extension irrational_value)
    (rational_is_rational : IsRational rational_model real_extension rational_value) :
    IsIrrational rational_model real_extension
      (real_extension.real_model.signature.addition irrational_value rational_value) := by
  sorry

/-- Rational minus irrational is irrational. -/
theorem rational_sub_irrational_is_irrational
    {rational_value irrational_value : RealCarrier rational_model real_extension}
    (rational_is_rational : IsRational rational_model real_extension rational_value)
    (irrational_is_irrational : IsIrrational rational_model real_extension irrational_value) :
    IsIrrational rational_model real_extension
      (real_extension.real_model.signature.subtraction rational_value irrational_value) := by
  sorry

/-- Irrational minus rational is irrational. -/
theorem irrational_sub_rational_is_irrational
    {irrational_value rational_value : RealCarrier rational_model real_extension}
    (irrational_is_irrational : IsIrrational rational_model real_extension irrational_value)
    (rational_is_rational : IsRational rational_model real_extension rational_value) :
    IsIrrational rational_model real_extension
      (real_extension.real_model.signature.subtraction irrational_value rational_value) := by
  sorry

/-- A nonzero rational times an irrational is irrational. -/
theorem nonzero_rational_mul_irrational_is_irrational
    {rational_value irrational_value : RealCarrier rational_model real_extension}
    (rational_is_rational : IsRational rational_model real_extension rational_value)
    (rational_is_nonzero : rational_value ≠ real_extension.real_model.signature.zero)
    (irrational_is_irrational : IsIrrational rational_model real_extension irrational_value) :
    IsIrrational rational_model real_extension
      (real_extension.real_model.signature.multiplication rational_value irrational_value) := by
  sorry

/-- An irrational times a nonzero rational is irrational. -/
theorem irrational_mul_nonzero_rational_is_irrational
    {irrational_value rational_value : RealCarrier rational_model real_extension}
    (irrational_is_irrational : IsIrrational rational_model real_extension irrational_value)
    (rational_is_rational : IsRational rational_model real_extension rational_value)
    (rational_is_nonzero : rational_value ≠ real_extension.real_model.signature.zero) :
    IsIrrational rational_model real_extension
      (real_extension.real_model.signature.multiplication irrational_value rational_value) := by
  sorry

/-- An irrational divided by a nonzero rational is irrational. -/
theorem irrational_div_nonzero_rational_is_irrational
    {irrational_value rational_value : RealCarrier rational_model real_extension}
    (irrational_is_irrational : IsIrrational rational_model real_extension irrational_value)
    (rational_is_rational : IsRational rational_model real_extension rational_value)
    (rational_is_nonzero : rational_value ≠ real_extension.real_model.signature.zero) :
    IsIrrational rational_model real_extension
      (real_extension.real_model.signature.multiplication
        irrational_value
        (real_extension.real_model.signature.inverse rational_value)) := by
  sorry

/-- A nonzero rational divided by an irrational is irrational. -/
theorem nonzero_rational_div_irrational_is_irrational
    {rational_value irrational_value : RealCarrier rational_model real_extension}
    (rational_is_rational : IsRational rational_model real_extension rational_value)
    (rational_is_nonzero : rational_value ≠ real_extension.real_model.signature.zero)
    (irrational_is_irrational : IsIrrational rational_model real_extension irrational_value) :
    IsIrrational rational_model real_extension
      (real_extension.real_model.signature.multiplication
        rational_value
        (real_extension.real_model.signature.inverse irrational_value)) := by
  sorry

/-- Every irrational real is nonzero because zero is rational. -/
theorem irrational_is_nonzero
    {value : RealCarrier rational_model real_extension}
    (value_is_irrational : IsIrrational rational_model real_extension value) :
    value ≠ real_extension.real_model.signature.zero := by
  sorry

/-- Data witnessing a chosen square root of the embedded rational number two. -/
structure SquareRootTwoWitness where
  value : RealCarrier rational_model real_extension
  square_is_two :
    real_extension.real_model.signature.multiplication value value =
      embedRational rational_model real_extension
        (rational_model.signature.addition
          rational_model.signature.one
          rational_model.signature.one)
  is_irrational : IsIrrational rational_model real_extension value

/-- Irrationals are not closed under addition: α + (-α) = 0. -/
theorem irrationals_not_closed_under_addition
    (witness : SquareRootTwoWitness rational_model real_extension) :
    ∃ first second : RealCarrier rational_model real_extension,
      IsIrrational rational_model real_extension first ∧
      IsIrrational rational_model real_extension second ∧
      IsRational rational_model real_extension
        (real_extension.real_model.signature.addition first second) := by
  sorry

/-- Irrationals are not closed under subtraction: α - α = 0. -/
theorem irrationals_not_closed_under_subtraction
    (witness : SquareRootTwoWitness rational_model real_extension) :
    ∃ first second : RealCarrier rational_model real_extension,
      IsIrrational rational_model real_extension first ∧
      IsIrrational rational_model real_extension second ∧
      IsRational rational_model real_extension
        (real_extension.real_model.signature.subtraction first second) := by
  sorry

/-- Irrationals are not closed under multiplication: √2 · √2 = 2. -/
theorem irrationals_not_closed_under_multiplication
    (witness : SquareRootTwoWitness rational_model real_extension) :
    ∃ first second : RealCarrier rational_model real_extension,
      IsIrrational rational_model real_extension first ∧
      IsIrrational rational_model real_extension second ∧
      IsRational rational_model real_extension
        (real_extension.real_model.signature.multiplication first second) := by
  sorry

/-- Irrationals are not closed under division: √2 / √2 = 1. -/
theorem irrationals_not_closed_under_division
    (witness : SquareRootTwoWitness rational_model real_extension) :
    ∃ first second : RealCarrier rational_model real_extension,
      IsIrrational rational_model real_extension first ∧
      IsIrrational rational_model real_extension second ∧
      IsRational rational_model real_extension
        (real_extension.real_model.signature.multiplication
          first
          (real_extension.real_model.signature.inverse second)) := by
  sorry

end Irrationals
end Reals
end VolumeII
end LRA
