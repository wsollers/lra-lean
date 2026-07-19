-- LRA/VolumeII/Rationals/ComparisonModels.lean
-- Comparison models for alternate rational constructions.

import LRA.VolumeII.Foundations.Quotients.Compatibility
import LRA.VolumeII.NumberSystems.Models
import LRA.VolumeII.Integers.ConstructionModels

namespace LRA
namespace VolumeII
namespace Rationals

open NumberSystems

/-!
Volume II label: alternate-rational-constructions
 Lean module: LRA.VolumeII.Rationals.ComparisonModels
Blueprint label: alternate-rational-constructions
Verification status: statement-accepted-proof-pending
-/

/--
**[Definition — Order Completeness of a Rational Model]**

This predicate is stated separately because rational models deliberately do not
carry a completeness field.
-/
def is_order_complete (rational_model : RationalModel) : Prop :=
  ∀ subset : rational_model.signature.carrier → Prop,
    (∃ member, subset member) →
    (∃ upper_bound,
      ∀ member,
        subset member →
        rational_model.signature.nonstrict_order member upper_bound) →
    ∃ supremum,
      (∀ member,
        subset member →
        rational_model.signature.nonstrict_order member supremum) ∧
      (∀ upper_bound,
        (∀ member,
          subset member →
          rational_model.signature.nonstrict_order member upper_bound) →
        rational_model.signature.nonstrict_order supremum upper_bound)

namespace QuotientFractionsComparison

/--
**[Definition — Rational Quotient-Fractions Representative]**

The denominator carrier is supplied separately so a one-based natural model can
make positivity and nonzeroness structural rather than proof fields.
-/
structure Representative
    (IntegerCarrier NaturalCarrier : Type) where
  numerator : IntegerCarrier
  denominator : NaturalCarrier

/-- **[Definition — Rational Quotient-Fractions Equality]** -/
def equivalent
    {IntegerCarrier NaturalCarrier : Type}
    (integer_multiplication :
      IntegerCarrier → IntegerCarrier → IntegerCarrier)
    (natural_to_integer : NaturalCarrier → IntegerCarrier)
    (first second : Representative IntegerCarrier NaturalCarrier) : Prop :=
  integer_multiplication
      first.numerator
      (natural_to_integer second.denominator) =
    integer_multiplication
      second.numerator
      (natural_to_integer first.denominator)

/-- **[Theorem — Rational Quotient-Fractions Equality Is an Equivalence]** -/
theorem equivalent_is_equivalence_relation
    {IntegerCarrier NaturalCarrier : Type}
    (integer_multiplication :
      IntegerCarrier → IntegerCarrier → IntegerCarrier)
    (natural_to_integer : NaturalCarrier → IntegerCarrier) :
    Equivalence
      (equivalent integer_multiplication natural_to_integer) := by
  sorry

/-- **[Lemma — Rational Quotient-Fractions Addition Respects Equivalence]** -/
theorem representative_addition_respects_equivalence
    {RepresentativeCarrier : Type}
    (setoid : Setoid RepresentativeCarrier)
    (representative_addition :
      RepresentativeCarrier →
      RepresentativeCarrier →
      RepresentativeCarrier) :
    Foundations.Quotients.binary_operation_respects
      setoid representative_addition := by
  sorry

/-- **[Lemma — Rational Quotient-Fractions Multiplication Respects Equivalence]** -/
theorem representative_multiplication_respects_equivalence
    {RepresentativeCarrier : Type}
    (setoid : Setoid RepresentativeCarrier)
    (representative_multiplication :
      RepresentativeCarrier →
      RepresentativeCarrier →
      RepresentativeCarrier) :
    Foundations.Quotients.binary_operation_respects
      setoid representative_multiplication := by
  sorry

/-- **[Theorem — Rational Quotient-Fractions Model Exists]** -/
theorem rational_model_exists
    (integer_model : IntegerModel) : Nonempty RationalModel := by
  sorry

/-- **[Definition — Rational Quotient-Fractions Model]** -/
noncomputable def rational_model
    (integer_model : IntegerModel) : RationalModel :=
  Classical.choice (rational_model_exists integer_model)

/-- **[Theorem — Rational Quotient-Fractions Extension Exists]** -/
theorem rational_extension_exists
    (integer_model : IntegerModel) :
    Nonempty (RationalExtension integer_model) := by
  sorry

/-- **[Definition — Rational Quotient-Fractions Extension]** -/
noncomputable def rational_extension
    (integer_model : IntegerModel) :
    RationalExtension integer_model :=
  Classical.choice (rational_extension_exists integer_model)

/-- **[Proposition — Rational Quotient-Fractions Are Not Order Complete]** -/
theorem is_not_order_complete
    (integer_model : IntegerModel) :
    ¬ Rationals.is_order_complete (rational_model integer_model) := by
  sorry

end QuotientFractionsComparison

namespace Reduced

/-- **[Definition — Reduced Rational Representative]** -/
structure Representative
    (IntegerCarrier NaturalCarrier : Type) where
  numerator : IntegerCarrier
  denominator : NaturalCarrier
  is_reduced : Prop

/-- **[Theorem — Reduced-Fraction Rational Model Exists]** -/
theorem rational_model_exists
    (integer_model : IntegerModel) : Nonempty RationalModel := by
  sorry

/-- **[Definition — Reduced-Fraction Rational Model]** -/
noncomputable def rational_model
    (integer_model : IntegerModel) : RationalModel :=
  Classical.choice (rational_model_exists integer_model)

end Reduced

namespace FractionField

/--
**[Definition — Integral-Domain Fraction-Field Data]**

The generic fraction-field construction consumes an integer model and its
no-zero-divisors law.
-/
structure IntegralDomainFractionFieldData where
  integer_model : IntegerModel

/-- **[Theorem — Fraction-Field Rational Model Exists]** -/
theorem rational_model_exists
    (fraction_field_data : IntegralDomainFractionFieldData) :
    Nonempty RationalModel := by
  sorry

/-- **[Definition — Fraction-Field Rational Model]** -/
noncomputable def rational_model
    (fraction_field_data : IntegralDomainFractionFieldData) :
    RationalModel :=
  Classical.choice (rational_model_exists fraction_field_data)

end FractionField

/-- **[Definition — Ordered-Field Model Isomorphism]** -/
structure ModelIsomorphism
    (first_model second_model : RationalModel) where
  to_function :
    first_model.signature.carrier →
      second_model.signature.carrier
  inverse_function :
    second_model.signature.carrier →
      first_model.signature.carrier
  left_inverse :
    ∀ value,
      inverse_function (to_function value) = value
  right_inverse :
    ∀ value,
      to_function (inverse_function value) = value
  preserves_zero :
    to_function first_model.signature.zero =
      second_model.signature.zero
  preserves_one :
    to_function first_model.signature.one =
      second_model.signature.one
  preserves_addition :
    ∀ first second,
      to_function
          (first_model.signature.addition first second) =
        second_model.signature.addition
          (to_function first)
          (to_function second)
  preserves_multiplication :
    ∀ first second,
      to_function
          (first_model.signature.multiplication first second) =
        second_model.signature.multiplication
          (to_function first)
          (to_function second)
  preserves_inverse :
    ∀ value,
      to_function
          (first_model.signature.inverse value) =
        second_model.signature.inverse (to_function value)
  preserves_and_reflects_order :
    ∀ first second,
      second_model.signature.nonstrict_order
          (to_function first)
          (to_function second) ↔
        first_model.signature.nonstrict_order first second

/-- **[Theorem — Rational Quotient-Fractions–Reduced Rational Isomorphism Exists]** -/
theorem rational_quotient_fractions_equiv_reduced_exists
    (integer_model : IntegerModel) :
    Nonempty
      (ModelIsomorphism
        (QuotientFractionsComparison.rational_model integer_model)
        (Reduced.rational_model integer_model)) := by
  sorry

/-- **[Definition — Rational Quotient-Fractions–Reduced Rational Isomorphism]** -/
noncomputable def rational_quotient_fractions_equiv_reduced
    (integer_model : IntegerModel) :
    ModelIsomorphism
      (QuotientFractionsComparison.rational_model integer_model)
      (Reduced.rational_model integer_model) :=
  Classical.choice (rational_quotient_fractions_equiv_reduced_exists integer_model)

/-- **[Theorem — Rational Quotient-Fractions and Reduced Rationals Are Isomorphic]** -/
theorem rational_quotient_fractions_and_reduced_are_isomorphic
    (integer_model : IntegerModel) :
    Nonempty
      (ModelIsomorphism
        (QuotientFractionsComparison.rational_model integer_model)
        (Reduced.rational_model integer_model)) :=
  ⟨rational_quotient_fractions_equiv_reduced integer_model⟩

/-- **[Theorem — Rational Quotient-Fractions–Fraction-Field Rational Isomorphism Exists]** -/
theorem rational_quotient_fractions_equiv_fraction_field_exists
    (integer_model : IntegerModel) :
    Nonempty
      (ModelIsomorphism
        (QuotientFractionsComparison.rational_model integer_model)
        (FractionField.rational_model ⟨integer_model⟩)) := by
  sorry

/-- **[Definition — Rational Quotient-Fractions–Fraction-Field Rational Isomorphism]** -/
noncomputable def rational_quotient_fractions_equiv_fraction_field
    (integer_model : IntegerModel) :
    ModelIsomorphism
      (QuotientFractionsComparison.rational_model integer_model)
      (FractionField.rational_model ⟨integer_model⟩) :=
  Classical.choice (rational_quotient_fractions_equiv_fraction_field_exists integer_model)

/-- **[Theorem — Rational Quotient-Fractions and Fraction-Field Rationals Are Isomorphic]** -/
theorem rational_quotient_fractions_and_fraction_field_are_isomorphic
    (integer_model : IntegerModel) :
    Nonempty
      (ModelIsomorphism
        (QuotientFractionsComparison.rational_model integer_model)
        (FractionField.rational_model ⟨integer_model⟩)) :=
  ⟨rational_quotient_fractions_equiv_fraction_field integer_model⟩

end Rationals
end VolumeII
end LRA
