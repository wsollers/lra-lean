
import LRA.UniversalAlgebra.Quotient.RepresentativeCompatibility
import LRA.NumberSystems.Integers.Interface.ModelTheory.Model
import LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.Model
import LRA.NumberSystems.RationalNumbers.Interface.Definition

namespace LRA.NumberSystems.RationalNumbers

open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers (ArchimedeanDenseOrderedFieldExtension)

/--
`is_order_complete` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (subset : rational_model.signature.carrier → Prop), (Exists fun member => subset member ∧ Exists fun upper_bound => ∀ (member : rational_model.signature.carrier), subset member → rational_model.signature.le member upper_bound) → Exists fun supremum => (∀ (member : rational_model.signature.carrier), subset member → rational_model.signature.le member supremum ∧ ∀ (upper_bound : rational_model.signature.carrier), (∀ (member : rational_model.signature.carrier), subset member → rational_model.signature.le member upper_bound) → rational_model.signature.le supremum upper_bound)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (subset : rational_model.signature.toCarrierBundle.1 → Prop), (Exists fun member => subset member ∧ Exists fun upper_bound => ∀ (member : rational_model.signature.toCarrierBundle.1), subset member → rational_model.signature.toOrderedRingConceptSignature.2 member upper_bound) → Exists fun supremum => (∀ (member : rational_model.signature.toCarrierBundle.1), subset member → rational_model.signature.toOrderedRingConceptSignature.2 member supremum ∧ ∀ (upper_bound : rational_model.signature.toCarrierBundle.1), (∀ (member : rational_model.signature.toCarrierBundle.1), subset member → rational_model.signature.toOrderedRingConceptSignature.2 member upper_bound) → rational_model.signature.toOrderedRingConceptSignature.2 supremum upper_bound)

Logical form (Lean):

```lean
def is_order_complete (rational_model : RationalModel) : Prop :=
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

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def is_order_complete (rational_model : RationalModel) : Prop :=
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
open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers (ArchimedeanDenseOrderedFieldExtension)

/--
`Representative` TODO

Predicate logic:

  structure Representative
    (IntegerCarrier NaturalCarrier : Type) where
  numerator : IntegerCarrier
  denominator : NaturalCarrier

Predicate logic (unfolded):

  structure Representative
    (IntegerCarrier NaturalCarrier : Type) where
  numerator : IntegerCarrier
  denominator : NaturalCarrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure Representative
    (IntegerCarrier NaturalCarrier : Type) where
  numerator : IntegerCarrier
  denominator : NaturalCarrier
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
structure Representative
    (IntegerCarrier NaturalCarrier : Type) where
  numerator : IntegerCarrier
  denominator : NaturalCarrier

/--
`equivalent` TODO

Predicate logic:

  ∀ {IntegerCarrier NaturalCarrier : Type} (integer_multiplication : IntegerCarrier → IntegerCarrier → IntegerCarrier) (natural_to_integer : NaturalCarrier → IntegerCarrier) (first second : LRA.NumberSystems.RationalNumbers.QuotientFractionsComparison.Representative IntegerCarrier NaturalCarrier), integer_multiplication first.numerator (natural_to_integer second.denominator) = integer_multiplication second.numerator (natural_to_integer first.denominator)

Predicate logic (unfolded):

  ∀ {IntegerCarrier NaturalCarrier : Type} (integer_multiplication : IntegerCarrier → IntegerCarrier → IntegerCarrier) (natural_to_integer : NaturalCarrier → IntegerCarrier) (first second : LRA.NumberSystems.RationalNumbers.QuotientFractionsComparison.Representative IntegerCarrier NaturalCarrier), integer_multiplication first.1 (natural_to_integer second.2) = integer_multiplication second.1 (natural_to_integer first.2)

Logical form (Lean):

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

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

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

/--
`equivalent_is_equivalence_relation` TODO

Predicate logic:

  (IntegerCarrier → IntegerCarrier → IntegerCarrier ∧ NaturalCarrier → IntegerCarrier) → Equivalence (equivalent integer_multiplication natural_to_integer)

Predicate logic (unfolded):

  ∀ {IntegerCarrier NaturalCarrier : Type} (integer_multiplication : IntegerCarrier → IntegerCarrier → IntegerCarrier) (natural_to_integer : NaturalCarrier → IntegerCarrier), Equivalence fun first second => integer_multiplication first.1 (natural_to_integer second.2) = integer_multiplication second.1 (natural_to_integer first.2)

Logical form (Lean):

```lean
theorem equivalent_is_equivalence_relation
    {IntegerCarrier NaturalCarrier : Type}
    (integer_multiplication :
      IntegerCarrier → IntegerCarrier → IntegerCarrier)
    (natural_to_integer : NaturalCarrier → IntegerCarrier) :
    Equivalence
      (equivalent integer_multiplication natural_to_integer)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem equivalent_is_equivalence_relation
    {IntegerCarrier NaturalCarrier : Type}
    (integer_multiplication :
      IntegerCarrier → IntegerCarrier → IntegerCarrier)
    (natural_to_integer : NaturalCarrier → IntegerCarrier) :
    Equivalence
      (equivalent integer_multiplication natural_to_integer) := by
  sorry

/--
`representative_addition_respects_equivalence` TODO

Predicate logic:

  (RepresentativeCarrier → RepresentativeCarrier → RepresentativeCarrier) → LRA.UniversalAlgebra.Quotient.binary_operation_respects setoid representative_addition

Predicate logic (unfolded):

  ∀ {RepresentativeCarrier : Type} (setoid : Setoid RepresentativeCarrier) (representative_addition : RepresentativeCarrier → RepresentativeCarrier → RepresentativeCarrier) (first_representative first_replacement second_representative second_replacement : RepresentativeCarrier), (setoid.1 first_representative first_replacement ∧ setoid.1 second_representative second_replacement) → setoid.1 (representative_addition first_representative second_representative) (representative_addition first_replacement second_replacement)

Logical form (Lean):

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

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

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

/--
`representative_multiplication_respects_equivalence` TODO

Predicate logic:

  (RepresentativeCarrier → RepresentativeCarrier → RepresentativeCarrier) → LRA.UniversalAlgebra.Quotient.binary_operation_respects setoid representative_multiplication

Predicate logic (unfolded):

  ∀ {RepresentativeCarrier : Type} (setoid : Setoid RepresentativeCarrier) (representative_multiplication : RepresentativeCarrier → RepresentativeCarrier → RepresentativeCarrier) (first_representative first_replacement second_representative second_replacement : RepresentativeCarrier), (setoid.1 first_representative first_replacement ∧ setoid.1 second_representative second_replacement) → setoid.1 (representative_multiplication first_representative second_representative) (representative_multiplication first_replacement second_replacement)

Logical form (Lean):

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

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

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

/--
`rational_model_exists` TODO

Predicate logic:

  (∀ integer_model ∈ IntegerModel), Nonempty RationalModel

Predicate logic (unfolded):

  ∀ (a : LRA.NumberSystems.Integers.Interface.ModelTheory.IntegerModel), Nonempty LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel

Logical form (Lean):

```lean
theorem rational_model_exists
    (integer_model : IntegerModel) : Nonempty RationalModel
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem rational_model_exists
    (integer_model : IntegerModel) : Nonempty RationalModel := by
  sorry

/--
`rational_model` TODO

Predicate logic:

  noncomputable def rational_model
    (integer_model : IntegerModel) : RationalModel :=
  Classical.choice (rational_model_exists integer_model)

Predicate logic (unfolded):

  noncomputable def rational_model
    (integer_model : IntegerModel) : RationalModel :=
  Classical.choice (rational_model_exists integer_model) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def rational_model
    (integer_model : IntegerModel) : RationalModel :=
  Classical.choice (rational_model_exists integer_model)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
noncomputable def rational_model
    (integer_model : IntegerModel) : RationalModel :=
  Classical.choice (rational_model_exists integer_model)

/--
`rational_extension_exists` TODO

Predicate logic:

  (∀ integer_model ∈ IntegerModel), Nonempty (ArchimedeanDenseOrderedFieldExtension integer_model)

Predicate logic (unfolded):

  ∀ (integer_model : LRA.NumberSystems.Integers.Interface.ModelTheory.IntegerModel), Nonempty (LRA.NumberSystems.RationalNumbers.ArchimedeanDenseOrderedFieldExtension integer_model)

Logical form (Lean):

```lean
theorem rational_extension_exists
    (integer_model : IntegerModel) :
    Nonempty (ArchimedeanDenseOrderedFieldExtension integer_model)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem rational_extension_exists
    (integer_model : IntegerModel) :
    Nonempty (ArchimedeanDenseOrderedFieldExtension integer_model) := by
  sorry

/--
`rational_extension` TODO

Predicate logic:

  noncomputable def rational_extension
    (integer_model : IntegerModel) :
    ArchimedeanDenseOrderedFieldExtension integer_model :=
  Classical.choice (rational_extension_exists integer_model)

Predicate logic (unfolded):

  noncomputable def rational_extension
    (integer_model : IntegerModel) :
    ArchimedeanDenseOrderedFieldExtension integer_model :=
  Classical.choice (rational_extension_exists integer_model) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def rational_extension
    (integer_model : IntegerModel) :
    ArchimedeanDenseOrderedFieldExtension integer_model :=
  Classical.choice (rational_extension_exists integer_model)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
noncomputable def rational_extension
    (integer_model : IntegerModel) :
    ArchimedeanDenseOrderedFieldExtension integer_model :=
  Classical.choice (rational_extension_exists integer_model)

/--
`is_not_order_complete` TODO

Predicate logic:

  (∀ integer_model ∈ IntegerModel), ¬ RationalNumbers.is_order_complete (rational_model integer_model)

Predicate logic (unfolded):

  ∀ (integer_model : LRA.NumberSystems.Integers.Interface.ModelTheory.IntegerModel), (∀ (subset : (LRA.NumberSystems.RationalNumbers.QuotientFractionsComparison.rational_model integer_model).signature.toCarrierBundle.1 → Prop), (Exists fun member => subset member) → (Exists fun upper_bound => ∀ (member : (LRA.NumberSystems.RationalNumbers.QuotientFractionsComparison.rational_model integer_model).signature.toCarrierBundle.1), subset member → (LRA.NumberSystems.RationalNumbers.QuotientFractionsComparison.rational_model integer_model).signature.toOrderedRingConceptSignature.2 member upper_bound) → Exists fun supremum => (∀ (member : (LRA.NumberSystems.RationalNumbers.QuotientFractionsComparison.rational_model integer_model).signature.toCarrierBundle.1), subset member → (LRA.NumberSystems.RationalNumbers.QuotientFractionsComparison.rational_model integer_model).signature.toOrderedRingConceptSignature.2 member supremum ∧ ∀ (upper_bound : (LRA.NumberSystems.RationalNumbers.QuotientFractionsComparison.rational_model integer_model).signature.toCarrierBundle.1), (∀ (member : (LRA.NumberSystems.RationalNumbers.QuotientFractionsComparison.rational_model integer_model).signature.toCarrierBundle.1), subset member → (LRA.NumberSystems.RationalNumbers.QuotientFractionsComparison.rational_model integer_model).signature.toOrderedRingConceptSignature.2 member upper_bound) → (LRA.NumberSystems.RationalNumbers.QuotientFractionsComparison.rational_model integer_model).signature.toOrderedRingConceptSignature.2 supremum upper_bound)) → False

Logical form (Lean):

```lean
theorem is_not_order_complete
    (integer_model : IntegerModel) :
    ¬ RationalNumbers.is_order_complete (rational_model integer_model)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem is_not_order_complete
    (integer_model : IntegerModel) :
    ¬ RationalNumbers.is_order_complete (rational_model integer_model) := by
  sorry

end LRA.NumberSystems.RationalNumbers.QuotientFractionsComparison
namespace LRA.NumberSystems.RationalNumbers
open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers (ArchimedeanDenseOrderedFieldExtension)

end LRA.NumberSystems.RationalNumbers
namespace LRA.NumberSystems.RationalNumbers.Reduced
open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers (ArchimedeanDenseOrderedFieldExtension)

/--
`Representative` TODO

Predicate logic:

  structure Representative
    (IntegerCarrier NaturalCarrier : Type) where
  numerator : IntegerCarrier
  denominator : NaturalCarrier
  is_reduced : Prop

Predicate logic (unfolded):

  structure Representative
    (IntegerCarrier NaturalCarrier : Type) where
  numerator : IntegerCarrier
  denominator : NaturalCarrier
  is_reduced : Prop (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure Representative
    (IntegerCarrier NaturalCarrier : Type) where
  numerator : IntegerCarrier
  denominator : NaturalCarrier
  is_reduced : Prop
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
structure Representative
    (IntegerCarrier NaturalCarrier : Type) where
  numerator : IntegerCarrier
  denominator : NaturalCarrier
  is_reduced : Prop

/--
`rational_model_exists` TODO

Predicate logic:

  (∀ integer_model ∈ IntegerModel), Nonempty RationalModel

Predicate logic (unfolded):

  ∀ (a : LRA.NumberSystems.Integers.Interface.ModelTheory.IntegerModel), Nonempty LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel

Logical form (Lean):

```lean
theorem rational_model_exists
    (integer_model : IntegerModel) : Nonempty RationalModel
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem rational_model_exists
    (integer_model : IntegerModel) : Nonempty RationalModel := by
  sorry

/--
`rational_model` TODO

Predicate logic:

  noncomputable def rational_model
    (integer_model : IntegerModel) : RationalModel :=
  Classical.choice (rational_model_exists integer_model)

Predicate logic (unfolded):

  noncomputable def rational_model
    (integer_model : IntegerModel) : RationalModel :=
  Classical.choice (rational_model_exists integer_model) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def rational_model
    (integer_model : IntegerModel) : RationalModel :=
  Classical.choice (rational_model_exists integer_model)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
noncomputable def rational_model
    (integer_model : IntegerModel) : RationalModel :=
  Classical.choice (rational_model_exists integer_model)

end LRA.NumberSystems.RationalNumbers.Reduced
namespace LRA.NumberSystems.RationalNumbers
open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers (ArchimedeanDenseOrderedFieldExtension)

end LRA.NumberSystems.RationalNumbers
namespace LRA.NumberSystems.RationalNumbers.FractionField
open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers (ArchimedeanDenseOrderedFieldExtension)

/--
`IntegralDomainFractionFieldData` TODO

Predicate logic:

  structure IntegralDomainFractionFieldData where
  integer_model : IntegerModel

Predicate logic (unfolded):

  structure IntegralDomainFractionFieldData where
  integer_model : IntegerModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure IntegralDomainFractionFieldData where
  integer_model : IntegerModel
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
structure IntegralDomainFractionFieldData where
  integer_model : IntegerModel

/--
`rational_model_exists` TODO

Predicate logic:

  (∀ fraction_field_data ∈ IntegralDomainFractionFieldData), Nonempty RationalModel

Predicate logic (unfolded):

  ∀ (a : LRA.NumberSystems.Integers.Interface.ModelTheory.IntegerModel), Nonempty LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel

Logical form (Lean):

```lean
theorem rational_model_exists
    (fraction_field_data : IntegralDomainFractionFieldData) :
    Nonempty RationalModel
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem rational_model_exists
    (fraction_field_data : IntegralDomainFractionFieldData) :
    Nonempty RationalModel := by
  sorry

/--
`rational_model` TODO

Predicate logic:

  noncomputable def rational_model
    (fraction_field_data : IntegralDomainFractionFieldData) :
    RationalModel :=
  Classical.choice (rational_model_exists fraction_field_data)

Predicate logic (unfolded):

  noncomputable def rational_model
    (fraction_field_data : IntegralDomainFractionFieldData) :
    RationalModel :=
  Classical.choice (rational_model_exists fraction_field_data) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def rational_model
    (fraction_field_data : IntegralDomainFractionFieldData) :
    RationalModel :=
  Classical.choice (rational_model_exists fraction_field_data)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
noncomputable def rational_model
    (fraction_field_data : IntegralDomainFractionFieldData) :
    RationalModel :=
  Classical.choice (rational_model_exists fraction_field_data)

end LRA.NumberSystems.RationalNumbers.FractionField
namespace LRA.NumberSystems.RationalNumbers
open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers (ArchimedeanDenseOrderedFieldExtension)

/--
`ModelIsomorphism` TODO

Predicate logic:

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

Predicate logic (unfolded):

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
        first_model.signature.le first second (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
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

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
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

/--
`rational_quotient_fractions_equiv_reduced_exists` TODO

Predicate logic:

  (∀ integer_model ∈ IntegerModel), Nonempty (ModelIsomorphism (QuotientFractionsComparison.rational_model integer_model) (Reduced.rational_model integer_model))

Predicate logic (unfolded):

  ∀ (integer_model : LRA.NumberSystems.Integers.Interface.ModelTheory.IntegerModel), Nonempty (LRA.NumberSystems.RationalNumbers.ModelIsomorphism (Classical.choice ⋯) (Classical.choice ⋯))

Logical form (Lean):

```lean
theorem rational_quotient_fractions_equiv_reduced_exists
    (integer_model : IntegerModel) :
    Nonempty
      (ModelIsomorphism
        (QuotientFractionsComparison.rational_model integer_model)
        (Reduced.rational_model integer_model))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem rational_quotient_fractions_equiv_reduced_exists
    (integer_model : IntegerModel) :
    Nonempty
      (ModelIsomorphism
        (QuotientFractionsComparison.rational_model integer_model)
        (Reduced.rational_model integer_model)) := by
  sorry

/--
`rational_quotient_fractions_equiv_reduced` TODO

Predicate logic:

  noncomputable def rational_quotient_fractions_equiv_reduced
    (integer_model : IntegerModel) :
    ModelIsomorphism
      (QuotientFractionsComparison.rational_model integer_model)
      (Reduced.rational_model integer_model) :=
  Classical.choice (rational_quotient_fractions_equiv_reduced_exists integer_model)

Predicate logic (unfolded):

  noncomputable def rational_quotient_fractions_equiv_reduced
    (integer_model : IntegerModel) :
    ModelIsomorphism
      (QuotientFractionsComparison.rational_model integer_model)
      (Reduced.rational_model integer_model) :=
  Classical.choice (rational_quotient_fractions_equiv_reduced_exists integer_model) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def rational_quotient_fractions_equiv_reduced
    (integer_model : IntegerModel) :
    ModelIsomorphism
      (QuotientFractionsComparison.rational_model integer_model)
      (Reduced.rational_model integer_model) :=
  Classical.choice (rational_quotient_fractions_equiv_reduced_exists integer_model)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
noncomputable def rational_quotient_fractions_equiv_reduced
    (integer_model : IntegerModel) :
    ModelIsomorphism
      (QuotientFractionsComparison.rational_model integer_model)
      (Reduced.rational_model integer_model) :=
  Classical.choice (rational_quotient_fractions_equiv_reduced_exists integer_model)

/--
`rational_quotient_fractions_and_reduced_are_isomorphic` TODO

Predicate logic:

  (∀ integer_model ∈ IntegerModel), Nonempty (ModelIsomorphism (QuotientFractionsComparison.rational_model integer_model) (Reduced.rational_model integer_model))

Predicate logic (unfolded):

  ∀ (integer_model : LRA.NumberSystems.Integers.Interface.ModelTheory.IntegerModel), Nonempty (LRA.NumberSystems.RationalNumbers.ModelIsomorphism (Classical.choice ⋯) (Classical.choice ⋯))

Logical form (Lean):

```lean
theorem rational_quotient_fractions_and_reduced_are_isomorphic
    (integer_model : IntegerModel) :
    Nonempty
      (ModelIsomorphism
        (QuotientFractionsComparison.rational_model integer_model)
        (Reduced.rational_model integer_model))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem rational_quotient_fractions_and_reduced_are_isomorphic
    (integer_model : IntegerModel) :
    Nonempty
      (ModelIsomorphism
        (QuotientFractionsComparison.rational_model integer_model)
        (Reduced.rational_model integer_model)) := by
  sorry

/--
`rational_quotient_fractions_equiv_fraction_field_exists` TODO

Predicate logic:

  (∀ integer_model ∈ IntegerModel), Nonempty (ModelIsomorphism (QuotientFractionsComparison.rational_model integer_model) (FractionField.rational_model ⟨integer_model⟩))

Predicate logic (unfolded):

  ∀ (integer_model : LRA.NumberSystems.Integers.Interface.ModelTheory.IntegerModel), Nonempty (LRA.NumberSystems.RationalNumbers.ModelIsomorphism (Classical.choice ⋯) (Classical.choice ⋯))

Logical form (Lean):

```lean
theorem rational_quotient_fractions_equiv_fraction_field_exists
    (integer_model : IntegerModel) :
    Nonempty
      (ModelIsomorphism
        (QuotientFractionsComparison.rational_model integer_model)
        (FractionField.rational_model ⟨integer_model⟩))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem rational_quotient_fractions_equiv_fraction_field_exists
    (integer_model : IntegerModel) :
    Nonempty
      (ModelIsomorphism
        (QuotientFractionsComparison.rational_model integer_model)
        (FractionField.rational_model ⟨integer_model⟩)) := by
  sorry

/--
`rational_quotient_fractions_equiv_fraction_field` TODO

Predicate logic:

  noncomputable def rational_quotient_fractions_equiv_fraction_field
    (integer_model : IntegerModel) :
    ModelIsomorphism
      (QuotientFractionsComparison.rational_model integer_model)
      (FractionField.rational_model ⟨integer_model⟩) :=
  Classical.choice (rational_quotient_fractions_equiv_fraction_field_exists integer_model)

Predicate logic (unfolded):

  noncomputable def rational_quotient_fractions_equiv_fraction_field
    (integer_model : IntegerModel) :
    ModelIsomorphism
      (QuotientFractionsComparison.rational_model integer_model)
      (FractionField.rational_model ⟨integer_model⟩) :=
  Classical.choice (rational_quotient_fractions_equiv_fraction_field_exists integer_model) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def rational_quotient_fractions_equiv_fraction_field
    (integer_model : IntegerModel) :
    ModelIsomorphism
      (QuotientFractionsComparison.rational_model integer_model)
      (FractionField.rational_model ⟨integer_model⟩) :=
  Classical.choice (rational_quotient_fractions_equiv_fraction_field_exists integer_model)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
noncomputable def rational_quotient_fractions_equiv_fraction_field
    (integer_model : IntegerModel) :
    ModelIsomorphism
      (QuotientFractionsComparison.rational_model integer_model)
      (FractionField.rational_model ⟨integer_model⟩) :=
  Classical.choice (rational_quotient_fractions_equiv_fraction_field_exists integer_model)

/--
`rational_quotient_fractions_and_fraction_field_are_isomorphic` TODO

Predicate logic:

  (∀ integer_model ∈ IntegerModel), Nonempty (ModelIsomorphism (QuotientFractionsComparison.rational_model integer_model) (FractionField.rational_model ⟨integer_model⟩))

Predicate logic (unfolded):

  ∀ (integer_model : LRA.NumberSystems.Integers.Interface.ModelTheory.IntegerModel), Nonempty (LRA.NumberSystems.RationalNumbers.ModelIsomorphism (Classical.choice ⋯) (Classical.choice ⋯))

Logical form (Lean):

```lean
theorem rational_quotient_fractions_and_fraction_field_are_isomorphic
    (integer_model : IntegerModel) :
    Nonempty
      (ModelIsomorphism
        (QuotientFractionsComparison.rational_model integer_model)
        (FractionField.rational_model ⟨integer_model⟩))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem rational_quotient_fractions_and_fraction_field_are_isomorphic
    (integer_model : IntegerModel) :
    Nonempty
      (ModelIsomorphism
        (QuotientFractionsComparison.rational_model integer_model)
        (FractionField.rational_model ⟨integer_model⟩)) := by
  sorry

end LRA.NumberSystems.RationalNumbers
