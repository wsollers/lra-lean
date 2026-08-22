-- LRA/NumberSystems/RealNumbers/ConstructionModels.lean
-- Comparison models for alternate real constructions.

import LRA.UniversalAlgebra.Quotient.RepresentativeCompatibility
import LRA.VolumeII.NumberSystems.Models
import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions

namespace LRA.NumberSystems.RealNumbers

open LRA.NumberSystems.Models

/-!
Volume II label: alternate-real-constructions
Lean module: LRA.NumberSystems.RealNumbers.ConstructionModels
Blueprint label: alternate-real-constructions
Verification status: statement-accepted-proof-pending

Moved from `LRA.VolumeII.RealNumbers.ConstructionModels`, content unchanged
(its imports already pointed at the migrated `RationalQuotientFractions`
path and its declarations already used the `LRA.NumberSystems.RealNumbers`
namespace, so no repointing was needed). See `RealNumbers/ProofOrder.md`
for why this file is kept rather than deleted, mirroring the decision made
for `RationalNumbers/ComparisonModels.lean`.

The namespaces in this file name the mathematical construction families used
for comparison.  The authoritative Markdown-driven constructions live in the
dedicated construction modules.
-/

end LRA.NumberSystems.RealNumbers
namespace LRA.NumberSystems.RealNumbers.DedekindCuts
open LRA.NumberSystems.Models


/-- **[Definition — Dedekind Cut]**

Mathematical statement (Lean): `structure Cut (RationalCarrier : Type) (strict_order : RationalCarrier → RationalCarrier → Prop)`.


Logical form:

```lean
structure Cut (RationalCarrier : Type)
    (strict_order : RationalCarrier → RationalCarrier → Prop) where
  lower_set : RationalCarrier → Prop
  nonempty : ∃ rational_value, lower_set rational_value
  proper : ∃ rational_value, ¬ lower_set rational_value
  downward_closed :
    ∀ upper_value lower_value,
      lower_set upper_value →
      strict_order lower_value upper_value →
      lower_set lower_value
  has_no_greatest_element :
    ∀ rational_value,
      lower_set rational_value →
      ∃ greater_value,
        lower_set greater_value ∧
        strict_order rational_value greater_value
```
-/
structure Cut (RationalCarrier : Type)
    (strict_order : RationalCarrier → RationalCarrier → Prop) where
  lower_set : RationalCarrier → Prop
  nonempty : ∃ rational_value, lower_set rational_value
  proper : ∃ rational_value, ¬ lower_set rational_value
  downward_closed :
    ∀ upper_value lower_value,
      lower_set upper_value →
      strict_order lower_value upper_value →
      lower_set lower_value
  has_no_greatest_element :
    ∀ rational_value,
      lower_set rational_value →
      ∃ greater_value,
        lower_set greater_value ∧
        strict_order rational_value greater_value


/-- **[Theorem — Dedekind Real Model Exists]**

Mathematical statement (Lean): `theorem real_model_exists (rational_model : DenselyOrderedFieldModel) : Nonempty RealModel`.

*Proof status:* proof pending


Logical form:

```lean
theorem real_model_exists
    (rational_model : DenselyOrderedFieldModel) : Nonempty RealModel
```
-/
theorem real_model_exists
    (rational_model : DenselyOrderedFieldModel) : Nonempty RealModel := by
  sorry

/-- **[Definition — Dedekind Real Model]**

Mathematical statement (Lean): `noncomputable def real_model (rational_model : DenselyOrderedFieldModel) : RealModel`.


Logical form:

```lean
noncomputable def real_model
    (rational_model : DenselyOrderedFieldModel) : RealModel :=
  Classical.choice (real_model_exists rational_model)
```
-/
noncomputable def real_model
    (rational_model : DenselyOrderedFieldModel) : RealModel :=
  Classical.choice (real_model_exists rational_model)


/-- **[Theorem — Dedekind Real Extension Exists]**

Mathematical statement (Lean): `theorem real_extension_exists (rational_model : DenselyOrderedFieldModel) : Nonempty (RealExtension rational_model)`.

*Proof status:* proof pending


Logical form:

```lean
theorem real_extension_exists
    (rational_model : DenselyOrderedFieldModel) :
    Nonempty (RealExtension rational_model)
```
-/
theorem real_extension_exists
    (rational_model : DenselyOrderedFieldModel) :
    Nonempty (RealExtension rational_model) := by
  sorry

/-- **[Definition — Dedekind Real Extension]**

Mathematical statement (Lean): `noncomputable def real_extension (rational_model : DenselyOrderedFieldModel) : RealExtension rational_model`.


Logical form:

```lean
noncomputable def real_extension
    (rational_model : DenselyOrderedFieldModel) :
    RealExtension rational_model :=
  Classical.choice (real_extension_exists rational_model)
```
-/
noncomputable def real_extension
    (rational_model : DenselyOrderedFieldModel) :
    RealExtension rational_model :=
  Classical.choice (real_extension_exists rational_model)

/--
**[Theorem — reals_are_complete]**

Mathematical statement (Lean): `theorem reals_are_complete (rational_model : DenselyOrderedFieldModel) : ∀ subset : (real_model rational_model).signature.carrier → Prop, (∃ member, subset member) → (∃ upper_bound, ∀ member, subset member → (real_model rational_model).signature.le member...`.


Logical form:

```lean
theorem reals_are_complete
    (rational_model : DenselyOrderedFieldModel) :
    ∀ subset : (real_model rational_model).signature.carrier → Prop,
      (∃ member, subset member) →
      (∃ upper_bound,
        ∀ member,
          subset member →
          (real_model rational_model).signature.le
            member upper_bound) →
      ∃ supremum,
        (∀ member,
          subset member →
          (real_model rational_model).signature.le
            member supremum) ∧
        (∀ upper_bound,
          (∀ member,
            subset member →
            (real_model rational_model).signature.le
              member upper_bound) →
          (real_model rational_model).signature.le
            supremum upper_bound)
```
-/
theorem reals_are_complete
    (rational_model : DenselyOrderedFieldModel) :
    ∀ subset : (real_model rational_model).signature.carrier → Prop,
      (∃ member, subset member) →
      (∃ upper_bound,
        ∀ member,
          subset member →
          (real_model rational_model).signature.le
            member upper_bound) →
      ∃ supremum,
        (∀ member,
          subset member →
          (real_model rational_model).signature.le
            member supremum) ∧
        (∀ upper_bound,
          (∀ member,
            subset member →
            (real_model rational_model).signature.le
              member upper_bound) →
          (real_model rational_model).signature.le
            supremum upper_bound) := by
  sorry

end LRA.NumberSystems.RealNumbers.DedekindCuts
namespace LRA.NumberSystems.RealNumbers
open LRA.NumberSystems.Models

end LRA.NumberSystems.RealNumbers
namespace LRA.NumberSystems.RealNumbers.CauchySequences
open LRA.NumberSystems.Models

/--
**[Def — Sequence]**

Mathematical statement (Lean): `def Sequence (Index RationalCarrier : Type)`.


Logical form:

```lean
def Sequence (Index RationalCarrier : Type) := Index → RationalCarrier
```
-/
def Sequence (Index RationalCarrier : Type) := Index → RationalCarrier

/--
**[Def — is_cauchy]**

Mathematical statement (Lean): `def is_cauchy {Index RationalCarrier : Type} (sequence : Sequence Index RationalCarrier) : Prop`.


Logical form:

```lean
def is_cauchy
    {Index RationalCarrier : Type}
    (sequence : Sequence Index RationalCarrier) : Prop :=
  ∀ first_index second_index : Index,
    sequence first_index = sequence second_index
```
-/
def is_cauchy
    {Index RationalCarrier : Type}
    (sequence : Sequence Index RationalCarrier) : Prop :=
  ∀ first_index second_index : Index,
    sequence first_index = sequence second_index

/--
**[Def — equivalent]**

Mathematical statement (Lean): `def equivalent {Index RationalCarrier : Type} (first second : Sequence Index RationalCarrier) : Prop`.


Logical form:

```lean
def equivalent
    {Index RationalCarrier : Type}
    (first second : Sequence Index RationalCarrier) : Prop :=
  ∀ index : Index, first index = second index
```
-/
def equivalent
    {Index RationalCarrier : Type}
    (first second : Sequence Index RationalCarrier) : Prop :=
  ∀ index : Index, first index = second index

/--
**[Theorem — equivalent_is_equivalence_relation]**

Mathematical statement (Lean): `theorem equivalent_is_equivalence_relation {Index RationalCarrier : Type} : Equivalence (@equivalent Index RationalCarrier)`.

*Proof status:* proof pending


Logical form:

```lean
theorem equivalent_is_equivalence_relation
    {Index RationalCarrier : Type} :
    Equivalence (@equivalent Index RationalCarrier)
```
-/
theorem equivalent_is_equivalence_relation
    {Index RationalCarrier : Type} :
    Equivalence (@equivalent Index RationalCarrier) := by
  sorry

/-- **[Theorem — Cauchy-Sequence Real Model Exists]**

Mathematical statement (Lean): `theorem real_model_exists (rational_model : DenselyOrderedFieldModel) : Nonempty RealModel`.

*Proof status:* proof pending


Logical form:

```lean
theorem real_model_exists
    (rational_model : DenselyOrderedFieldModel) : Nonempty RealModel
```
-/
theorem real_model_exists
    (rational_model : DenselyOrderedFieldModel) : Nonempty RealModel := by
  sorry

/-- **[Definition — Cauchy-Sequence Real Model]**

Mathematical statement (Lean): `noncomputable def real_model (rational_model : DenselyOrderedFieldModel) : RealModel`.


Logical form:

```lean
noncomputable def real_model
    (rational_model : DenselyOrderedFieldModel) : RealModel :=
  Classical.choice (real_model_exists rational_model)
```
-/
noncomputable def real_model
    (rational_model : DenselyOrderedFieldModel) : RealModel :=
  Classical.choice (real_model_exists rational_model)


/-- **[Theorem — Cauchy-Sequence Real Extension Exists]**

Mathematical statement (Lean): `theorem real_extension_exists (rational_model : DenselyOrderedFieldModel) : Nonempty (RealExtension rational_model)`.

*Proof status:* proof pending


Logical form:

```lean
theorem real_extension_exists
    (rational_model : DenselyOrderedFieldModel) :
    Nonempty (RealExtension rational_model)
```
-/
theorem real_extension_exists
    (rational_model : DenselyOrderedFieldModel) :
    Nonempty (RealExtension rational_model) := by
  sorry

/-- **[Definition — Cauchy-Sequence Real Extension]**

Mathematical statement (Lean): `noncomputable def real_extension (rational_model : DenselyOrderedFieldModel) : RealExtension rational_model`.


Logical form:

```lean
noncomputable def real_extension
    (rational_model : DenselyOrderedFieldModel) :
    RealExtension rational_model :=
  Classical.choice (real_extension_exists rational_model)
```
-/
noncomputable def real_extension
    (rational_model : DenselyOrderedFieldModel) :
    RealExtension rational_model :=
  Classical.choice (real_extension_exists rational_model)

end LRA.NumberSystems.RealNumbers.CauchySequences
namespace LRA.NumberSystems.RealNumbers
open LRA.NumberSystems.Models

end LRA.NumberSystems.RealNumbers
namespace LRA.NumberSystems.RealNumbers.CantorNestedIntervals
open LRA.NumberSystems.Models

/--
**[Structure — IntervalSequence]**

Mathematical statement (Lean): `structure IntervalSequence (Index RationalCarrier : Type)`.


Logical form:

```lean
structure IntervalSequence (Index RationalCarrier : Type) where
  left_endpoint : Index → RationalCarrier
  right_endpoint : Index → RationalCarrier
  is_nested : Prop
  widths_converge_to_zero : Prop
```
-/
structure IntervalSequence (Index RationalCarrier : Type) where
  left_endpoint : Index → RationalCarrier
  right_endpoint : Index → RationalCarrier
  is_nested : Prop
  widths_converge_to_zero : Prop


/-- **[Theorem — Cantor Nested-Interval Real Model Exists]**

Mathematical statement (Lean): `theorem real_model_exists (rational_model : DenselyOrderedFieldModel) : Nonempty RealModel`.

*Proof status:* proof pending


Logical form:

```lean
theorem real_model_exists
    (rational_model : DenselyOrderedFieldModel) : Nonempty RealModel
```
-/
theorem real_model_exists
    (rational_model : DenselyOrderedFieldModel) : Nonempty RealModel := by
  sorry

/-- **[Definition — Cantor Nested-Interval Real Model]**

Mathematical statement (Lean): `noncomputable def real_model (rational_model : DenselyOrderedFieldModel) : RealModel`.


Logical form:

```lean
noncomputable def real_model
    (rational_model : DenselyOrderedFieldModel) : RealModel :=
  Classical.choice (real_model_exists rational_model)
```
-/
noncomputable def real_model
    (rational_model : DenselyOrderedFieldModel) : RealModel :=
  Classical.choice (real_model_exists rational_model)

/--
**[Theorem — endpoint_sequences_determine_cauchy_class]**

Mathematical statement (Lean): `theorem endpoint_sequences_determine_cauchy_class (rational_model : DenselyOrderedFieldModel) {Index RationalCarrier : Type} (interval_sequence : IntervalSequence Index RationalCarrier) : CauchySequences.equivalent interval_sequence.left_endpoint interval_sequence.lef...`.

*Proof status:* proof pending


Logical form:

```lean
theorem endpoint_sequences_determine_cauchy_class
    (rational_model : DenselyOrderedFieldModel)
    {Index RationalCarrier : Type}
    (interval_sequence : IntervalSequence Index RationalCarrier) :
    CauchySequences.equivalent
      interval_sequence.left_endpoint
      interval_sequence.left_endpoint
```
-/
theorem endpoint_sequences_determine_cauchy_class
    (rational_model : DenselyOrderedFieldModel)
    {Index RationalCarrier : Type}
    (interval_sequence : IntervalSequence Index RationalCarrier) :
    CauchySequences.equivalent
      interval_sequence.left_endpoint
      interval_sequence.left_endpoint := by
  sorry

end LRA.NumberSystems.RealNumbers.CantorNestedIntervals
namespace LRA.NumberSystems.RealNumbers
open LRA.NumberSystems.Models

end LRA.NumberSystems.RealNumbers
namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervalQuotient
open LRA.NumberSystems.Models

/--
**[Structure — RationalInterval]**

Mathematical statement (Lean): `structure RationalInterval (RationalCarrier : Type) (nonstrict_order : RationalCarrier → RationalCarrier → Prop)`.


Logical form:

```lean
structure RationalInterval (RationalCarrier : Type)
    (nonstrict_order : RationalCarrier → RationalCarrier → Prop) where
  left_endpoint : RationalCarrier
  right_endpoint : RationalCarrier
  endpoints_are_ordered :
    nonstrict_order left_endpoint right_endpoint
```
-/
structure RationalInterval (RationalCarrier : Type)
    (nonstrict_order : RationalCarrier → RationalCarrier → Prop) where
  left_endpoint : RationalCarrier
  right_endpoint : RationalCarrier
  endpoints_are_ordered :
    nonstrict_order left_endpoint right_endpoint

/--
**[Def — equivalent]**

Mathematical statement (Lean): `def equivalent {IntervalSequenceCarrier : Type} (first second : IntervalSequenceCarrier) : Prop`.


Logical form:

```lean
def equivalent
    {IntervalSequenceCarrier : Type}
    (first second : IntervalSequenceCarrier) : Prop :=
  first = second
```
-/
def equivalent
    {IntervalSequenceCarrier : Type}
    (first second : IntervalSequenceCarrier) : Prop :=
  first = second

/--
**[Theorem — equivalent_is_equivalence_relation]**

Mathematical statement (Lean): `theorem equivalent_is_equivalence_relation {IntervalSequenceCarrier : Type} : Equivalence (@equivalent IntervalSequenceCarrier)`.

*Proof status:* proof pending


Logical form:

```lean
theorem equivalent_is_equivalence_relation
    {IntervalSequenceCarrier : Type} :
    Equivalence (@equivalent IntervalSequenceCarrier)
```
-/
theorem equivalent_is_equivalence_relation
    {IntervalSequenceCarrier : Type} :
    Equivalence (@equivalent IntervalSequenceCarrier) := by
  sorry

/--
**[Theorem — representative_multiplication_respects_equivalence]**

Mathematical statement (Lean): `theorem representative_multiplication_respects_equivalence {IntervalSequenceCarrier : Type} (setoid : Setoid IntervalSequenceCarrier) (representative_multiplication : IntervalSequenceCarrier → IntervalSequenceCarrier → IntervalSequenceCarrier) : Foundations...`.

*Proof status:* proof pending


Logical form:

```lean
theorem representative_multiplication_respects_equivalence
    {IntervalSequenceCarrier : Type}
    (setoid : Setoid IntervalSequenceCarrier)
    (representative_multiplication :
      IntervalSequenceCarrier →
      IntervalSequenceCarrier →
      IntervalSequenceCarrier) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      setoid representative_multiplication
```
-/
theorem representative_multiplication_respects_equivalence
    {IntervalSequenceCarrier : Type}
    (setoid : Setoid IntervalSequenceCarrier)
    (representative_multiplication :
      IntervalSequenceCarrier →
      IntervalSequenceCarrier →
      IntervalSequenceCarrier) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      setoid representative_multiplication := by
  sorry

/--
**[Theorem — raw_interval_multiplication_is_not_distributive]**

Mathematical statement (Lean): `theorem raw_interval_multiplication_is_not_distributive {IntervalSequenceCarrier : Type} (representative_multiplication : IntervalSequenceCarrier → IntervalSequenceCarrier → IntervalSequenceCarrier) (representative_addition : IntervalSequenceCarrier → Inter...`.

*Proof status:* proof pending


Logical form:

```lean
theorem raw_interval_multiplication_is_not_distributive
    {IntervalSequenceCarrier : Type}
    (representative_multiplication :
      IntervalSequenceCarrier →
      IntervalSequenceCarrier →
      IntervalSequenceCarrier)
    (representative_addition :
      IntervalSequenceCarrier →
      IntervalSequenceCarrier →
      IntervalSequenceCarrier) :
    ¬ ∀ first second third,
      representative_multiplication
          first
          (representative_addition second third) =
        representative_addition
          (representative_multiplication first second)
          (representative_multiplication first third)
```
-/
theorem raw_interval_multiplication_is_not_distributive
    {IntervalSequenceCarrier : Type}
    (representative_multiplication :
      IntervalSequenceCarrier →
      IntervalSequenceCarrier →
      IntervalSequenceCarrier)
    (representative_addition :
      IntervalSequenceCarrier →
      IntervalSequenceCarrier →
      IntervalSequenceCarrier) :
    ¬ ∀ first second third,
      representative_multiplication
          first
          (representative_addition second third) =
        representative_addition
          (representative_multiplication first second)
          (representative_multiplication first third) := by
  sorry

/--
**[Theorem — quotient_multiplication_is_distributive]**

Mathematical statement (Lean): `theorem quotient_multiplication_is_distributive {RealCarrier : Type} (multiplication addition : RealCarrier → RealCarrier → RealCarrier) : ∀ first second third, multiplication first (addition second third) = addition (multiplication first second) (multiplic...`.

*Proof status:* proof pending


Logical form:

```lean
theorem quotient_multiplication_is_distributive
    {RealCarrier : Type}
    (multiplication addition : RealCarrier → RealCarrier → RealCarrier) :
    ∀ first second third,
      multiplication first (addition second third) =
        addition (multiplication first second) (multiplication first third)
```
-/
theorem quotient_multiplication_is_distributive
    {RealCarrier : Type}
    (multiplication addition : RealCarrier → RealCarrier → RealCarrier) :
    ∀ first second third,
      multiplication first (addition second third) =
        addition (multiplication first second) (multiplication first third) := by
  sorry

/-- **[Theorem — Primitive Interval-Quotient Real Model Exists]**

Mathematical statement (Lean): `theorem real_model_exists (rational_model : DenselyOrderedFieldModel) : Nonempty RealModel`.

*Proof status:* proof pending


Logical form:

```lean
theorem real_model_exists
    (rational_model : DenselyOrderedFieldModel) : Nonempty RealModel
```
-/
theorem real_model_exists
    (rational_model : DenselyOrderedFieldModel) : Nonempty RealModel := by
  sorry

/-- **[Definition — Primitive Interval-Quotient Real Model]**

Mathematical statement (Lean): `noncomputable def real_model (rational_model : DenselyOrderedFieldModel) : RealModel`.


Logical form:

```lean
noncomputable def real_model
    (rational_model : DenselyOrderedFieldModel) : RealModel :=
  Classical.choice (real_model_exists rational_model)
```
-/
noncomputable def real_model
    (rational_model : DenselyOrderedFieldModel) : RealModel :=
  Classical.choice (real_model_exists rational_model)

end LRA.NumberSystems.RealNumbers.PrimitiveIntervalQuotient
namespace LRA.NumberSystems.RealNumbers
open LRA.NumberSystems.Models

end LRA.NumberSystems.RealNumbers
namespace LRA.NumberSystems.RealNumbers.DyadicExpansions
open LRA.NumberSystems.Models

/--
**[Structure — Expansion]**

Mathematical statement (Lean): `structure Expansion (Digit : Type)`.


Logical form:

```lean
structure Expansion (Digit : Type) where
  integer_part : Digit → Prop
  fractional_digits : Nat → Digit
```
-/
structure Expansion (Digit : Type) where
  integer_part : Digit → Prop
  fractional_digits : Nat → Digit

/--
**[Def — equivalent]**

Mathematical statement (Lean): `def equivalent {Digit : Type} (first second : Expansion Digit) : Prop`.


Logical form:

```lean
def equivalent
    {Digit : Type}
    (first second : Expansion Digit) : Prop :=
  first.integer_part = second.integer_part ∧
    first.fractional_digits = second.fractional_digits
```
-/
def equivalent
    {Digit : Type}
    (first second : Expansion Digit) : Prop :=
  first.integer_part = second.integer_part ∧
    first.fractional_digits = second.fractional_digits

/--
**[Theorem — equivalent_is_equivalence_relation]**

Mathematical statement (Lean): `theorem equivalent_is_equivalence_relation {Digit : Type} : Equivalence (@equivalent Digit)`.

*Proof status:* proof pending


Logical form:

```lean
theorem equivalent_is_equivalence_relation
    {Digit : Type} :
    Equivalence (@equivalent Digit)
```
-/
theorem equivalent_is_equivalence_relation
    {Digit : Type} :
    Equivalence (@equivalent Digit) := by
  sorry

/-- **[Theorem — Dyadic-Expansion Real Model Exists]**

Mathematical statement (Lean): `theorem real_model_exists (rational_model : DenselyOrderedFieldModel) : Nonempty RealModel`.

*Proof status:* proof pending


Logical form:

```lean
theorem real_model_exists
    (rational_model : DenselyOrderedFieldModel) : Nonempty RealModel
```
-/
theorem real_model_exists
    (rational_model : DenselyOrderedFieldModel) : Nonempty RealModel := by
  sorry

/-- **[Definition — Dyadic-Expansion Real Model]**

Mathematical statement (Lean): `noncomputable def real_model (rational_model : DenselyOrderedFieldModel) : RealModel`.


Logical form:

```lean
noncomputable def real_model
    (rational_model : DenselyOrderedFieldModel) : RealModel :=
  Classical.choice (real_model_exists rational_model)
```
-/
noncomputable def real_model
    (rational_model : DenselyOrderedFieldModel) : RealModel :=
  Classical.choice (real_model_exists rational_model)

end LRA.NumberSystems.RealNumbers.DyadicExpansions
namespace LRA.NumberSystems.RealNumbers
open LRA.NumberSystems.Models

/--
**[Structure — ModelIsomorphism]**

Mathematical statement (Lean): `structure ModelIsomorphism (first_model second_model : RealModel)`.


Logical form:

```lean
structure ModelIsomorphism
    (first_model second_model : RealModel) where
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
  preserves_and_reflects_order :
    ∀ first second,
      second_model.signature.le
          (to_function first)
          (to_function second) ↔
        first_model.signature.le first second
```
-/
structure ModelIsomorphism
    (first_model second_model : RealModel) where
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
  preserves_and_reflects_order :
    ∀ first second,
      second_model.signature.le
          (to_function first)
          (to_function second) ↔
        first_model.signature.le first second

/--
**[Theorem — complete_archimedean_ordered_fields_are_uniquely_isomorphic]**

Mathematical statement (Lean): `theorem complete_archimedean_ordered_fields_are_uniquely_isomorphic (first_model second_model : RealModel) : ∃ isomorphism : ModelIsomorphism first_model second_model, ∀ other_isomorphism : ModelIsomorphism first_model second_model, ∀ value, other_isomorphi...`.

*Proof status:* proof pending


Logical form:

```lean
theorem complete_archimedean_ordered_fields_are_uniquely_isomorphic
    (first_model second_model : RealModel) :
    ∃ isomorphism : ModelIsomorphism first_model second_model,
      ∀ other_isomorphism : ModelIsomorphism first_model second_model,
        ∀ value,
          other_isomorphism.to_function value =
            isomorphism.to_function value
```
-/
theorem complete_archimedean_ordered_fields_are_uniquely_isomorphic
    (first_model second_model : RealModel) :
    ∃ isomorphism : ModelIsomorphism first_model second_model,
      ∀ other_isomorphism : ModelIsomorphism first_model second_model,
        ∀ value,
          other_isomorphism.to_function value =
            isomorphism.to_function value := by
  sorry

/-- **[Theorem — Dedekind-Cauchy Real Isomorphism Exists]**

Mathematical statement (Lean): `theorem dedekind_equiv_cauchy_exists (rational_model : DenselyOrderedFieldModel) : Nonempty (ModelIsomorphism (DedekindCuts.real_model rational_model) (CauchySequences.real_model rational_model))`.

*Proof status:* proof pending


Logical form:

```lean
theorem dedekind_equiv_cauchy_exists
    (rational_model : DenselyOrderedFieldModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (CauchySequences.real_model rational_model))
```
-/
theorem dedekind_equiv_cauchy_exists
    (rational_model : DenselyOrderedFieldModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (CauchySequences.real_model rational_model)) := by
  sorry

/--
**[Def — dedekind_equiv_cauchy]**

Mathematical statement (Lean): `noncomputable def dedekind_equiv_cauchy (rational_model : DenselyOrderedFieldModel) : ModelIsomorphism (DedekindCuts.real_model rational_model) (CauchySequences.real_model rational_model)`.


Logical form:

```lean
noncomputable def dedekind_equiv_cauchy
    (rational_model : DenselyOrderedFieldModel) :
    ModelIsomorphism
      (DedekindCuts.real_model rational_model)
      (CauchySequences.real_model rational_model) :=
  Classical.choice (dedekind_equiv_cauchy_exists rational_model)
```
-/
noncomputable def dedekind_equiv_cauchy
    (rational_model : DenselyOrderedFieldModel) :
    ModelIsomorphism
      (DedekindCuts.real_model rational_model)
      (CauchySequences.real_model rational_model) :=
  Classical.choice (dedekind_equiv_cauchy_exists rational_model)

/--
**[Theorem — dedekind_and_cauchy_are_isomorphic]**

Mathematical statement (Lean): `theorem dedekind_and_cauchy_are_isomorphic (rational_model : DenselyOrderedFieldModel) : Nonempty (ModelIsomorphism (DedekindCuts.real_model rational_model) (CauchySequences.real_model rational_model))`.


Logical form:

```lean
theorem dedekind_and_cauchy_are_isomorphic
    (rational_model : DenselyOrderedFieldModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (CauchySequences.real_model rational_model))
```
-/
theorem dedekind_and_cauchy_are_isomorphic
    (rational_model : DenselyOrderedFieldModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (CauchySequences.real_model rational_model)) := by
  sorry

/-- **[Theorem — Dedekind-Cantor Real Isomorphism Exists]**

Mathematical statement (Lean): `theorem dedekind_equiv_cantor_exists (rational_model : DenselyOrderedFieldModel) : Nonempty (ModelIsomorphism (DedekindCuts.real_model rational_model) (CantorNestedIntervals.real_model rational_model))`.

*Proof status:* proof pending


Logical form:

```lean
theorem dedekind_equiv_cantor_exists
    (rational_model : DenselyOrderedFieldModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (CantorNestedIntervals.real_model rational_model))
```
-/
theorem dedekind_equiv_cantor_exists
    (rational_model : DenselyOrderedFieldModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (CantorNestedIntervals.real_model rational_model)) := by
  sorry

/--
**[Def — dedekind_equiv_cantor]**

Mathematical statement (Lean): `noncomputable def dedekind_equiv_cantor (rational_model : DenselyOrderedFieldModel) : ModelIsomorphism (DedekindCuts.real_model rational_model) (CantorNestedIntervals.real_model rational_model)`.


Logical form:

```lean
noncomputable def dedekind_equiv_cantor
    (rational_model : DenselyOrderedFieldModel) :
    ModelIsomorphism
      (DedekindCuts.real_model rational_model)
      (CantorNestedIntervals.real_model rational_model) :=
  Classical.choice (dedekind_equiv_cantor_exists rational_model)
```
-/
noncomputable def dedekind_equiv_cantor
    (rational_model : DenselyOrderedFieldModel) :
    ModelIsomorphism
      (DedekindCuts.real_model rational_model)
      (CantorNestedIntervals.real_model rational_model) :=
  Classical.choice (dedekind_equiv_cantor_exists rational_model)

/--
**[Theorem — dedekind_and_cantor_are_isomorphic]**

Mathematical statement (Lean): `theorem dedekind_and_cantor_are_isomorphic (rational_model : DenselyOrderedFieldModel) : Nonempty (ModelIsomorphism (DedekindCuts.real_model rational_model) (CantorNestedIntervals.real_model rational_model))`.


Logical form:

```lean
theorem dedekind_and_cantor_are_isomorphic
    (rational_model : DenselyOrderedFieldModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (CantorNestedIntervals.real_model rational_model))
```
-/
theorem dedekind_and_cantor_are_isomorphic
    (rational_model : DenselyOrderedFieldModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (CantorNestedIntervals.real_model rational_model)) := by
  sorry

/-- **[Theorem — Dedekind-Interval-Quotient Real Isomorphism Exists]**

Mathematical statement (Lean): `theorem dedekind_equiv_interval_quotient_exists (rational_model : DenselyOrderedFieldModel) : Nonempty (ModelIsomorphism (DedekindCuts.real_model rational_model) (PrimitiveIntervalQuotient.real_model rational_model))`.

*Proof status:* proof pending


Logical form:

```lean
theorem dedekind_equiv_interval_quotient_exists
    (rational_model : DenselyOrderedFieldModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (PrimitiveIntervalQuotient.real_model rational_model))
```
-/
theorem dedekind_equiv_interval_quotient_exists
    (rational_model : DenselyOrderedFieldModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (PrimitiveIntervalQuotient.real_model rational_model)) := by
  sorry

/--
**[Def — dedekind_equiv_interval_quotient]**

Mathematical statement (Lean): `noncomputable def dedekind_equiv_interval_quotient (rational_model : DenselyOrderedFieldModel) : ModelIsomorphism (DedekindCuts.real_model rational_model) (PrimitiveIntervalQuotient.real_model rational_model)`.


Logical form:

```lean
noncomputable def dedekind_equiv_interval_quotient
    (rational_model : DenselyOrderedFieldModel) :
    ModelIsomorphism
      (DedekindCuts.real_model rational_model)
      (PrimitiveIntervalQuotient.real_model rational_model) :=
  Classical.choice (dedekind_equiv_interval_quotient_exists rational_model)
```
-/
noncomputable def dedekind_equiv_interval_quotient
    (rational_model : DenselyOrderedFieldModel) :
    ModelIsomorphism
      (DedekindCuts.real_model rational_model)
      (PrimitiveIntervalQuotient.real_model rational_model) :=
  Classical.choice (dedekind_equiv_interval_quotient_exists rational_model)

/--
**[Theorem — dedekind_and_interval_quotient_are_isomorphic]**

Mathematical statement (Lean): `theorem dedekind_and_interval_quotient_are_isomorphic (rational_model : DenselyOrderedFieldModel) : Nonempty (ModelIsomorphism (DedekindCuts.real_model rational_model) (PrimitiveIntervalQuotient.real_model rational_model))`.


Logical form:

```lean
theorem dedekind_and_interval_quotient_are_isomorphic
    (rational_model : DenselyOrderedFieldModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (PrimitiveIntervalQuotient.real_model rational_model))
```
-/
theorem dedekind_and_interval_quotient_are_isomorphic
    (rational_model : DenselyOrderedFieldModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (PrimitiveIntervalQuotient.real_model rational_model)) := by
  sorry

/-- **[Theorem — Dedekind-Dyadic Real Isomorphism Exists]**

Mathematical statement (Lean): `theorem dedekind_equiv_dyadic_exists (rational_model : DenselyOrderedFieldModel) : Nonempty (ModelIsomorphism (DedekindCuts.real_model rational_model) (DyadicExpansions.real_model rational_model))`.

*Proof status:* proof pending


Logical form:

```lean
theorem dedekind_equiv_dyadic_exists
    (rational_model : DenselyOrderedFieldModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (DyadicExpansions.real_model rational_model))
```
-/
theorem dedekind_equiv_dyadic_exists
    (rational_model : DenselyOrderedFieldModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (DyadicExpansions.real_model rational_model)) := by
  sorry

/--
**[Def — dedekind_equiv_dyadic]**

Mathematical statement (Lean): `noncomputable def dedekind_equiv_dyadic (rational_model : DenselyOrderedFieldModel) : ModelIsomorphism (DedekindCuts.real_model rational_model) (DyadicExpansions.real_model rational_model)`.


Logical form:

```lean
noncomputable def dedekind_equiv_dyadic
    (rational_model : DenselyOrderedFieldModel) :
    ModelIsomorphism
      (DedekindCuts.real_model rational_model)
      (DyadicExpansions.real_model rational_model) :=
  Classical.choice (dedekind_equiv_dyadic_exists rational_model)
```
-/
noncomputable def dedekind_equiv_dyadic
    (rational_model : DenselyOrderedFieldModel) :
    ModelIsomorphism
      (DedekindCuts.real_model rational_model)
      (DyadicExpansions.real_model rational_model) :=
  Classical.choice (dedekind_equiv_dyadic_exists rational_model)

/--
**[Theorem — dedekind_and_dyadic_are_isomorphic]**

Mathematical statement (Lean): `theorem dedekind_and_dyadic_are_isomorphic (rational_model : DenselyOrderedFieldModel) : Nonempty (ModelIsomorphism (DedekindCuts.real_model rational_model) (DyadicExpansions.real_model rational_model))`.


Logical form:

```lean
theorem dedekind_and_dyadic_are_isomorphic
    (rational_model : DenselyOrderedFieldModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (DyadicExpansions.real_model rational_model))
```
-/
theorem dedekind_and_dyadic_are_isomorphic
    (rational_model : DenselyOrderedFieldModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (DyadicExpansions.real_model rational_model)) := by
  sorry

end LRA.NumberSystems.RealNumbers
