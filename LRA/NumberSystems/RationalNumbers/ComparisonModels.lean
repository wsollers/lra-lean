-- LRA/NumberSystems/RationalNumbers/ComparisonModels.lean
-- Comparison models for alternate rational constructions.

import LRA.UniversalAlgebra.Quotient.RepresentativeCompatibility
import LRA.VolumeII.NumberSystems.Models

namespace LRA.NumberSystems.RationalNumbers

open LRA.NumberSystems.Models

/-!
Volume II label: alternate-rational-constructions
Lean module: LRA.NumberSystems.RationalNumbers.ComparisonModels
Blueprint label: alternate-rational-constructions
Verification status: statement-accepted-proof-pending

Moved from `LRA.VolumeII.RationalNumbers.ComparisonModels`, content
unchanged. Unlike `LRA.VolumeII.Integers.ConstructionModels` (deleted
during the Integer migration -- see `Integers/ProofOrder.md`), this file
is actively imported (via `RationalNumbers.lean`), and its three
namespaces (`QuotientFractionsComparison`, `Reduced`, `FractionField`)
are thin alternate-model existence claims (`Nonempty DenselyOrderedFieldModel`), not
full restatements of a concrete construction competing with
`RationalQuotientFractions`. Kept as system-level content, sibling to
`Constructions/`.
-/

/--
**[Definition — Order Completeness of a Rational Model]**

This predicate is stated separately because rational models deliberately do not
carry a completeness field.

Logical form:

```lean
def is_order_complete (rational_model : DenselyOrderedFieldModel) : Prop :=
  ∀ subset : rational_model.signature.carrier → Prop,
    (∃ member, subset member) →
    (∃ upper_bound,
      ∀ member,
        subset member →
        rational_model.signature.le member upper_bound) →
    ∃ supremum,
      (∀ member,
        subset member →
        rational_model.signature.le member supremum) ∧
      (∀ upper_bound,
        (∀ member,
          subset member →
          rational_model.signature.le member upper_bound) →
        rational_model.signature.le supremum upper_bound)
```
-/
def is_order_complete (rational_model : DenselyOrderedFieldModel) : Prop :=
  ∀ subset : rational_model.signature.carrier → Prop,
    (∃ member, subset member) →
    (∃ upper_bound,
      ∀ member,
        subset member →
        rational_model.signature.le member upper_bound) →
    ∃ supremum,
      (∀ member,
        subset member →
        rational_model.signature.le member supremum) ∧
      (∀ upper_bound,
        (∀ member,
          subset member →
          rational_model.signature.le member upper_bound) →
        rational_model.signature.le supremum upper_bound)

end LRA.NumberSystems.RationalNumbers
namespace LRA.NumberSystems.RationalNumbers.QuotientFractionsComparison
open LRA.NumberSystems.Models

/--
**[Definition — Rational Quotient-Fractions Representative]**

The denominator carrier is supplied separately so a one-based natural model can
make positivity and nonzeroness structural rather than proof fields.

Logical form:

```lean
structure Representative
    (IntegerCarrier NaturalCarrier : Type) where
  numerator : IntegerCarrier
  denominator : NaturalCarrier
```
-/
structure Representative
    (IntegerCarrier NaturalCarrier : Type) where
  numerator : IntegerCarrier
  denominator : NaturalCarrier


/-- **[Definition — Rational Quotient-Fractions Equality]**

Logical form:

```lean
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
```
-/
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


/-- **[Theorem — Rational Quotient-Fractions Equality Is an Equivalence]**

*Proof status:* proof pending

Logical form:

```lean
theorem equivalent_is_equivalence_relation
    {IntegerCarrier NaturalCarrier : Type}
    (integer_multiplication :
      IntegerCarrier → IntegerCarrier → IntegerCarrier)
    (natural_to_integer : NaturalCarrier → IntegerCarrier) :
    Equivalence
      (equivalent integer_multiplication natural_to_integer)
```
-/
theorem equivalent_is_equivalence_relation
    {IntegerCarrier NaturalCarrier : Type}
    (integer_multiplication :
      IntegerCarrier → IntegerCarrier → IntegerCarrier)
    (natural_to_integer : NaturalCarrier → IntegerCarrier) :
    Equivalence
      (equivalent integer_multiplication natural_to_integer) := by
  sorry

/-- **[Lemma — Rational Quotient-Fractions Addition Respects Equivalence]**

*Proof status:* proof pending

Logical form:

```lean
theorem representative_addition_respects_equivalence
    {RepresentativeCarrier : Type}
    (setoid : Setoid RepresentativeCarrier)
    (representative_addition :
      RepresentativeCarrier →
      RepresentativeCarrier →
      RepresentativeCarrier) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      setoid representative_addition
```
-/
theorem representative_addition_respects_equivalence
    {RepresentativeCarrier : Type}
    (setoid : Setoid RepresentativeCarrier)
    (representative_addition :
      RepresentativeCarrier →
      RepresentativeCarrier →
      RepresentativeCarrier) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      setoid representative_addition := by
  sorry

/-- **[Lemma — Rational Quotient-Fractions Multiplication Respects Equivalence]**

*Proof status:* proof pending

Logical form:

```lean
theorem representative_multiplication_respects_equivalence
    {RepresentativeCarrier : Type}
    (setoid : Setoid RepresentativeCarrier)
    (representative_multiplication :
      RepresentativeCarrier →
      RepresentativeCarrier →
      RepresentativeCarrier) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      setoid representative_multiplication
```
-/
theorem representative_multiplication_respects_equivalence
    {RepresentativeCarrier : Type}
    (setoid : Setoid RepresentativeCarrier)
    (representative_multiplication :
      RepresentativeCarrier →
      RepresentativeCarrier →
      RepresentativeCarrier) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      setoid representative_multiplication := by
  sorry

/-- **[Theorem — Rational Quotient-Fractions Model Exists]**

*Proof status:* proof pending

Logical form:

```lean
theorem rational_model_exists
    (integer_model : IntegerModel) : Nonempty DenselyOrderedFieldModel
```
-/
theorem rational_model_exists
    (integer_model : IntegerModel) : Nonempty DenselyOrderedFieldModel := by
  sorry

/-- **[Definition — Rational Quotient-Fractions Model]**

Logical form:

```lean
noncomputable def rational_model
    (integer_model : IntegerModel) : DenselyOrderedFieldModel :=
  Classical.choice (rational_model_exists integer_model)
```
-/
noncomputable def rational_model
    (integer_model : IntegerModel) : DenselyOrderedFieldModel :=
  Classical.choice (rational_model_exists integer_model)


/-- **[Theorem — Rational Quotient-Fractions Extension Exists]**

*Proof status:* proof pending

Logical form:

```lean
theorem rational_extension_exists
    (integer_model : IntegerModel) :
    Nonempty (RationalExtension integer_model)
```
-/
theorem rational_extension_exists
    (integer_model : IntegerModel) :
    Nonempty (RationalExtension integer_model) := by
  sorry

/-- **[Definition — Rational Quotient-Fractions Extension]**

Logical form:

```lean
noncomputable def rational_extension
    (integer_model : IntegerModel) :
    RationalExtension integer_model :=
  Classical.choice (rational_extension_exists integer_model)
```
-/
noncomputable def rational_extension
    (integer_model : IntegerModel) :
    RationalExtension integer_model :=
  Classical.choice (rational_extension_exists integer_model)


/-- **[Proposition — Rational Quotient-Fractions Are Not Order Complete]**

*Proof status:* proof pending

Logical form:

```lean
theorem is_not_order_complete
    (integer_model : IntegerModel) :
    ¬ RationalNumbers.is_order_complete (rational_model integer_model)
```
-/
theorem is_not_order_complete
    (integer_model : IntegerModel) :
    ¬ RationalNumbers.is_order_complete (rational_model integer_model) := by
  sorry

end LRA.NumberSystems.RationalNumbers.QuotientFractionsComparison
namespace LRA.NumberSystems.RationalNumbers
open LRA.NumberSystems.Models

end LRA.NumberSystems.RationalNumbers
namespace LRA.NumberSystems.RationalNumbers.Reduced
open LRA.NumberSystems.Models


/-- **[Definition — Reduced Rational Representative]**

Logical form:

```lean
structure Representative
    (IntegerCarrier NaturalCarrier : Type) where
  numerator : IntegerCarrier
  denominator : NaturalCarrier
  is_reduced : Prop
```
-/
structure Representative
    (IntegerCarrier NaturalCarrier : Type) where
  numerator : IntegerCarrier
  denominator : NaturalCarrier
  is_reduced : Prop


/-- **[Theorem — Reduced-Fraction Rational Model Exists]**

*Proof status:* proof pending

Logical form:

```lean
theorem rational_model_exists
    (integer_model : IntegerModel) : Nonempty DenselyOrderedFieldModel
```
-/
theorem rational_model_exists
    (integer_model : IntegerModel) : Nonempty DenselyOrderedFieldModel := by
  sorry

/-- **[Definition — Reduced-Fraction Rational Model]**

Logical form:

```lean
noncomputable def rational_model
    (integer_model : IntegerModel) : DenselyOrderedFieldModel :=
  Classical.choice (rational_model_exists integer_model)
```
-/
noncomputable def rational_model
    (integer_model : IntegerModel) : DenselyOrderedFieldModel :=
  Classical.choice (rational_model_exists integer_model)

end LRA.NumberSystems.RationalNumbers.Reduced
namespace LRA.NumberSystems.RationalNumbers
open LRA.NumberSystems.Models

end LRA.NumberSystems.RationalNumbers
namespace LRA.NumberSystems.RationalNumbers.FractionField
open LRA.NumberSystems.Models

/--
**[Definition — Integral-Domain Fraction-Field Data]**

The generic fraction-field construction consumes an integer model and its
no-zero-divisors law.

Logical form:

```lean
structure IntegralDomainFractionFieldData where
  integer_model : IntegerModel
```
-/
structure IntegralDomainFractionFieldData where
  integer_model : IntegerModel


/-- **[Theorem — Fraction-Field Rational Model Exists]**

*Proof status:* proof pending

Logical form:

```lean
theorem rational_model_exists
    (fraction_field_data : IntegralDomainFractionFieldData) :
    Nonempty DenselyOrderedFieldModel
```
-/
theorem rational_model_exists
    (fraction_field_data : IntegralDomainFractionFieldData) :
    Nonempty DenselyOrderedFieldModel := by
  sorry

/-- **[Definition — Fraction-Field Rational Model]**

Logical form:

```lean
noncomputable def rational_model
    (fraction_field_data : IntegralDomainFractionFieldData) :
    DenselyOrderedFieldModel :=
  Classical.choice (rational_model_exists fraction_field_data)
```
-/
noncomputable def rational_model
    (fraction_field_data : IntegralDomainFractionFieldData) :
    DenselyOrderedFieldModel :=
  Classical.choice (rational_model_exists fraction_field_data)

end LRA.NumberSystems.RationalNumbers.FractionField
namespace LRA.NumberSystems.RationalNumbers
open LRA.NumberSystems.Models


/-- **[Definition — Ordered-Field Model Isomorphism]**

Logical form:

```lean
structure ModelIsomorphism
    (first_model second_model : DenselyOrderedFieldModel) where
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
          (first_model.signature.add first second) =
        second_model.signature.add
          (to_function first)
          (to_function second)
  preserves_multiplication :
    ∀ first second,
      to_function
          (first_model.signature.multiply first second) =
        second_model.signature.multiply
          (to_function first)
          (to_function second)
  preserves_inverse :
    ∀ value,
      to_function
          (first_model.signature.inv value) =
        second_model.signature.inv (to_function value)
  preserves_and_reflects_order :
    ∀ first second,
      second_model.signature.le
          (to_function first)
          (to_function second) ↔
        first_model.signature.le first second
```
-/
structure ModelIsomorphism
    (first_model second_model : DenselyOrderedFieldModel) where
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
          (first_model.signature.add first second) =
        second_model.signature.add
          (to_function first)
          (to_function second)
  preserves_multiplication :
    ∀ first second,
      to_function
          (first_model.signature.multiply first second) =
        second_model.signature.multiply
          (to_function first)
          (to_function second)
  preserves_inverse :
    ∀ value,
      to_function
          (first_model.signature.inv value) =
        second_model.signature.inv (to_function value)
  preserves_and_reflects_order :
    ∀ first second,
      second_model.signature.le
          (to_function first)
          (to_function second) ↔
        first_model.signature.le first second


/-- **[Theorem — Rational Quotient-Fractions–Reduced Rational Isomorphism Exists]**

*Proof status:* proof pending

Logical form:

```lean
theorem rational_quotient_fractions_equiv_reduced_exists
    (integer_model : IntegerModel) :
    Nonempty
      (ModelIsomorphism
        (QuotientFractionsComparison.rational_model integer_model)
        (Reduced.rational_model integer_model))
```
-/
theorem rational_quotient_fractions_equiv_reduced_exists
    (integer_model : IntegerModel) :
    Nonempty
      (ModelIsomorphism
        (QuotientFractionsComparison.rational_model integer_model)
        (Reduced.rational_model integer_model)) := by
  sorry

/-- **[Definition — Rational Quotient-Fractions–Reduced Rational Isomorphism]**

Logical form:

```lean
noncomputable def rational_quotient_fractions_equiv_reduced
    (integer_model : IntegerModel) :
    ModelIsomorphism
      (QuotientFractionsComparison.rational_model integer_model)
      (Reduced.rational_model integer_model) :=
  Classical.choice (rational_quotient_fractions_equiv_reduced_exists integer_model)
```
-/
noncomputable def rational_quotient_fractions_equiv_reduced
    (integer_model : IntegerModel) :
    ModelIsomorphism
      (QuotientFractionsComparison.rational_model integer_model)
      (Reduced.rational_model integer_model) :=
  Classical.choice (rational_quotient_fractions_equiv_reduced_exists integer_model)


/-- **[Theorem — Rational Quotient-Fractions and Reduced Rationals Are Isomorphic]**

Logical form:

```lean
theorem rational_quotient_fractions_and_reduced_are_isomorphic
    (integer_model : IntegerModel) :
    Nonempty
      (ModelIsomorphism
        (QuotientFractionsComparison.rational_model integer_model)
        (Reduced.rational_model integer_model))
```
-/
theorem rational_quotient_fractions_and_reduced_are_isomorphic
    (integer_model : IntegerModel) :
    Nonempty
      (ModelIsomorphism
        (QuotientFractionsComparison.rational_model integer_model)
        (Reduced.rational_model integer_model)) := by
  sorry

/-- **[Theorem — Rational Quotient-Fractions–Fraction-Field Rational Isomorphism Exists]**

*Proof status:* proof pending

Logical form:

```lean
theorem rational_quotient_fractions_equiv_fraction_field_exists
    (integer_model : IntegerModel) :
    Nonempty
      (ModelIsomorphism
        (QuotientFractionsComparison.rational_model integer_model)
        (FractionField.rational_model ⟨integer_model⟩))
```
-/
theorem rational_quotient_fractions_equiv_fraction_field_exists
    (integer_model : IntegerModel) :
    Nonempty
      (ModelIsomorphism
        (QuotientFractionsComparison.rational_model integer_model)
        (FractionField.rational_model ⟨integer_model⟩)) := by
  sorry

/-- **[Definition — Rational Quotient-Fractions–Fraction-Field Rational Isomorphism]**

Logical form:

```lean
noncomputable def rational_quotient_fractions_equiv_fraction_field
    (integer_model : IntegerModel) :
    ModelIsomorphism
      (QuotientFractionsComparison.rational_model integer_model)
      (FractionField.rational_model ⟨integer_model⟩) :=
  Classical.choice (rational_quotient_fractions_equiv_fraction_field_exists integer_model)
```
-/
noncomputable def rational_quotient_fractions_equiv_fraction_field
    (integer_model : IntegerModel) :
    ModelIsomorphism
      (QuotientFractionsComparison.rational_model integer_model)
      (FractionField.rational_model ⟨integer_model⟩) :=
  Classical.choice (rational_quotient_fractions_equiv_fraction_field_exists integer_model)


/-- **[Theorem — Rational Quotient-Fractions and Fraction-Field Rationals Are Isomorphic]**

Logical form:

```lean
theorem rational_quotient_fractions_and_fraction_field_are_isomorphic
    (integer_model : IntegerModel) :
    Nonempty
      (ModelIsomorphism
        (QuotientFractionsComparison.rational_model integer_model)
        (FractionField.rational_model ⟨integer_model⟩))
```
-/
theorem rational_quotient_fractions_and_fraction_field_are_isomorphic
    (integer_model : IntegerModel) :
    Nonempty
      (ModelIsomorphism
        (QuotientFractionsComparison.rational_model integer_model)
        (FractionField.rational_model ⟨integer_model⟩)) := by
  sorry

end LRA.NumberSystems.RationalNumbers
