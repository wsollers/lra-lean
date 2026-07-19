-- LRA/VolumeII/Rationals/ConstructionModels.lean
-- Canonical and alternate rational construction statements.

import LRA.VolumeII.Foundations.Quotients.Compatibility
import LRA.VolumeII.NumberSystems.Models
import LRA.VolumeII.Integers.ConstructionModels

namespace LRA
namespace VolumeII
namespace Rationals

open NumberSystems

/-!
Volume II label: alternate-rational-constructions
Lean module: LRA.VolumeII.Rationals.ConstructionModels
Blueprint label: alternate-rational-constructions
Verification status: statement-accepted-proof-pending
-/

namespace Canonical

/--
**[Definition — Canonical Rational Representative]**

The denominator carrier is supplied separately so a one-based natural model can
make positivity and nonzeroness structural rather than proof fields.
-/
structure Representative
    (IntegerCarrier NaturalCarrier : Type) where
  numerator : IntegerCarrier
  denominator : NaturalCarrier

/-- **[Definition — Canonical Cross-Multiplication Relation]** -/
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

/-- **[Theorem — Canonical Rational Relation Is an Equivalence]** -/
theorem equivalent_is_equivalence_relation
    {IntegerCarrier NaturalCarrier : Type}
    (integer_multiplication :
      IntegerCarrier → IntegerCarrier → IntegerCarrier)
    (natural_to_integer : NaturalCarrier → IntegerCarrier) :
    Equivalence
      (equivalent integer_multiplication natural_to_integer) := by
  sorry

/-- **[Lemma — Canonical Representative Addition Respects Equivalence]** -/
lemma representative_addition_respects_equivalence
    {RepresentativeCarrier : Type}
    (setoid : Setoid RepresentativeCarrier)
    (representative_addition :
      RepresentativeCarrier →
      RepresentativeCarrier →
      RepresentativeCarrier) :
    Foundations.Quotients.binary_operation_respects
      setoid representative_addition := by
  sorry

/-- **[Lemma — Canonical Representative Multiplication Respects Equivalence]** -/
lemma representative_multiplication_respects_equivalence
    {RepresentativeCarrier : Type}
    (setoid : Setoid RepresentativeCarrier)
    (representative_multiplication :
      RepresentativeCarrier →
      RepresentativeCarrier →
      RepresentativeCarrier) :
    Foundations.Quotients.binary_operation_respects
      setoid representative_multiplication := by
  sorry

/-- **[Theorem — Canonical Rational Model]** -/
noncomputable def rational_model
    (integer_model : IntegerModel) : RationalModel := by
  sorry

/-- **[Theorem — Canonical Rational Extension]** -/
noncomputable def rational_extension
    (integer_model : IntegerModel) :
    RationalExtension integer_model := by
  sorry

/-- **[Proposition — Canonical Rationals Are Not Order Complete]** -/
theorem is_not_order_complete
    (integer_model : IntegerModel) : Prop := by
  sorry

end Canonical

namespace Reduced

/-- **[Definition — Reduced Rational Representative]** -/
structure Representative
    (IntegerCarrier NaturalCarrier : Type) where
  numerator : IntegerCarrier
  denominator : NaturalCarrier
  is_reduced : Prop

/-- **[Theorem — Reduced-Fraction Rational Model]** -/
noncomputable def rational_model
    (integer_model : IntegerModel) : RationalModel := by
  sorry

end Reduced

namespace FractionField

/--
**[Definition — Fraction-Field Input]**

The generic fraction-field construction consumes an integer model and its
no-zero-divisors law.
-/
structure Input where
  integer_model : IntegerModel

/-- **[Theorem — Fraction-Field Rational Model]** -/
noncomputable def rational_model
    (input : Input) : RationalModel := by
  sorry

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

/-- **[Theorem — Canonical and Reduced Rationals Are Isomorphic]** -/
theorem canonical_equiv_reduced
    (integer_model : IntegerModel) :
    ModelIsomorphism
      (Canonical.rational_model integer_model)
      (Reduced.rational_model integer_model) := by
  sorry

/-- **[Theorem — Canonical and Fraction-Field Rationals Are Isomorphic]** -/
theorem canonical_equiv_fraction_field
    (integer_model : IntegerModel) :
    ModelIsomorphism
      (Canonical.rational_model integer_model)
      (FractionField.rational_model ⟨integer_model⟩) := by
  sorry

end Rationals
end VolumeII
end LRA
