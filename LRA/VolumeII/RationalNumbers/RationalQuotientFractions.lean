-- LRA/VolumeII/Rationals/RationalQuotientFractions.lean
-- Rational quotient-fraction construction from integers and positive naturals.

import LRA.VolumeII.Foundations.Quotients.Compatibility
import LRA.VolumeI.Algebra.Models.Models

namespace LRA.NumberSystems.RationalNumbers.RationalQuotientFractions

open LRA.Algebra.Models

/-!
Lean module: LRA.NumberSystems.RationalNumbers.RationalQuotientFractions
Source: docs/number-systems/gpt-03-RationalNumbers.md
Verification status: definitions and final theorem statements complete; proofs pending
-/

/--
**[Structure — IntegerAndPositiveNaturalData]**

Mathematical statement (Lean): `structure IntegerAndPositiveNaturalData`.


Logical form:

```lean
structure IntegerAndPositiveNaturalData where
  integer_model : IntegerModel
  natural_carrier : Type
  one : natural_carrier
  multiplication : natural_carrier → natural_carrier → natural_carrier
  to_integer : natural_carrier → integer_model.signature.carrier
  denominator_is_positive :
    ∀ denominator,
      integer_model.signature.StrictOrder
        integer_model.signature.zero
        (to_integer denominator)
  one_maps_to_one : to_integer one = integer_model.signature.one
  multiplication_is_preserved :
    ∀ first second,
      to_integer (multiplication first second) =
        integer_model.signature.multiplication
          (to_integer first)
          (to_integer second)
  absolute_numerator : integer_model.signature.carrier → natural_carrier
  gcd : natural_carrier → natural_carrier → natural_carrier
```
-/
structure IntegerAndPositiveNaturalData where
  integer_model : IntegerModel
  natural_carrier : Type
  one : natural_carrier
  multiplication : natural_carrier → natural_carrier → natural_carrier
  to_integer : natural_carrier → integer_model.signature.carrier
  denominator_is_positive :
    ∀ denominator,
      integer_model.signature.StrictOrder
        integer_model.signature.zero
        (to_integer denominator)
  one_maps_to_one : to_integer one = integer_model.signature.one
  multiplication_is_preserved :
    ∀ first second,
      to_integer (multiplication first second) =
        integer_model.signature.multiplication
          (to_integer first)
          (to_integer second)
  absolute_numerator : integer_model.signature.carrier → natural_carrier
  gcd : natural_carrier → natural_carrier → natural_carrier


/-- Definition 1.1: a formal fraction with positive denominator.

Mathematical statement (Lean): `structure Representative (rational_data : IntegerAndPositiveNaturalData)`.


Logical form:

```lean
structure Representative (rational_data : IntegerAndPositiveNaturalData) where
  numerator : rational_data.integer_model.signature.carrier
  denominator : rational_data.natural_carrier
```
-/
structure Representative (rational_data : IntegerAndPositiveNaturalData) where
  numerator : rational_data.integer_model.signature.carrier
  denominator : rational_data.natural_carrier


/-- Definition 1.2: cross-multiplication equivalence.

Mathematical statement (Lean): `def equivalent (rational_data : IntegerAndPositiveNaturalData) (first second : Representative rational_data) : Prop`.


Logical form:

```lean
def equivalent (rational_data : IntegerAndPositiveNaturalData)
    (first second : Representative rational_data) : Prop :=
  rational_data.integer_model.signature.multiplication
      first.numerator (rational_data.to_integer second.denominator) =
    rational_data.integer_model.signature.multiplication
      second.numerator (rational_data.to_integer first.denominator)
```
-/
def equivalent (rational_data : IntegerAndPositiveNaturalData)
    (first second : Representative rational_data) : Prop :=
  rational_data.integer_model.signature.multiplication
      first.numerator (rational_data.to_integer second.denominator) =
    rational_data.integer_model.signature.multiplication
      second.numerator (rational_data.to_integer first.denominator)


/-- Theorem 1.3: cross-multiplication is an equivalence relation.

Mathematical statement (Lean): `theorem equivalent_is_equivalence_relation (rational_data : IntegerAndPositiveNaturalData) : Equivalence (equivalent rational_data)`.

*Proof status:* proof pending


Logical form:

```lean
theorem equivalent_is_equivalence_relation (rational_data : IntegerAndPositiveNaturalData) :
    Equivalence (equivalent rational_data)
```
-/
theorem equivalent_is_equivalence_relation (rational_data : IntegerAndPositiveNaturalData) :
    Equivalence (equivalent rational_data) := by
  sorry


/-- Definition 1.4: the fraction setoid.

Mathematical statement (Lean): `def representative_setoid (rational_data : IntegerAndPositiveNaturalData) : Setoid (Representative rational_data)`.


Logical form:

```lean
def representative_setoid (rational_data : IntegerAndPositiveNaturalData) : Setoid (Representative rational_data) where
  r := equivalent rational_data
  iseqv := equivalent_is_equivalence_relation rational_data
```
-/
def representative_setoid (rational_data : IntegerAndPositiveNaturalData) : Setoid (Representative rational_data) where
  r := equivalent rational_data
  iseqv := equivalent_is_equivalence_relation rational_data


/-- Definition 1.5: the rational carrier.

Mathematical statement (Lean): `abbrev Carrier (rational_data : IntegerAndPositiveNaturalData)`.


Logical form:

```lean
abbrev Carrier (rational_data : IntegerAndPositiveNaturalData) := Quotient (representative_setoid rational_data)
```
-/
abbrev Carrier (rational_data : IntegerAndPositiveNaturalData) := Quotient (representative_setoid rational_data)


/-- Definition 2.1: raw fraction addition.

Mathematical statement (Lean): `def representative_addition (rational_data : IntegerAndPositiveNaturalData) (first second : Representative rational_data) : Representative rational_data`.


Logical form:

```lean
def representative_addition (rational_data : IntegerAndPositiveNaturalData)
    (first second : Representative rational_data) : Representative rational_data where
  numerator :=
    rational_data.integer_model.signature.addition
      (rational_data.integer_model.signature.multiplication
        first.numerator (rational_data.to_integer second.denominator))
      (rational_data.integer_model.signature.multiplication
        second.numerator (rational_data.to_integer first.denominator))
  denominator := rational_data.multiplication first.denominator second.denominator
```
-/
def representative_addition (rational_data : IntegerAndPositiveNaturalData)
    (first second : Representative rational_data) : Representative rational_data where
  numerator :=
    rational_data.integer_model.signature.addition
      (rational_data.integer_model.signature.multiplication
        first.numerator (rational_data.to_integer second.denominator))
      (rational_data.integer_model.signature.multiplication
        second.numerator (rational_data.to_integer first.denominator))
  denominator := rational_data.multiplication first.denominator second.denominator


/-- Definition 2.2: raw fraction multiplication.

Mathematical statement (Lean): `def representative_multiplication (rational_data : IntegerAndPositiveNaturalData) (first second : Representative rational_data) : Representative rational_data`.


Logical form:

```lean
def representative_multiplication (rational_data : IntegerAndPositiveNaturalData)
    (first second : Representative rational_data) : Representative rational_data where
  numerator := rational_data.integer_model.signature.multiplication
    first.numerator second.numerator
  denominator := rational_data.multiplication first.denominator second.denominator
```
-/
def representative_multiplication (rational_data : IntegerAndPositiveNaturalData)
    (first second : Representative rational_data) : Representative rational_data where
  numerator := rational_data.integer_model.signature.multiplication
    first.numerator second.numerator
  denominator := rational_data.multiplication first.denominator second.denominator


/-- Definition 2.3: raw additive inverse.

Mathematical statement (Lean): `def representative_negation (rational_data : IntegerAndPositiveNaturalData) (representative : Representative rational_data) : Representative rational_data`.


Logical form:

```lean
def representative_negation (rational_data : IntegerAndPositiveNaturalData)
    (representative : Representative rational_data) : Representative rational_data where
  numerator := rational_data.integer_model.signature.negation representative.numerator
  denominator := representative.denominator
```
-/
def representative_negation (rational_data : IntegerAndPositiveNaturalData)
    (representative : Representative rational_data) : Representative rational_data where
  numerator := rational_data.integer_model.signature.negation representative.numerator
  denominator := representative.denominator


/-- Theorem 2.4: raw operations respect fraction equivalence.

Mathematical statement (Lean): `theorem representative_operations_respect_equivalence (rational_data : IntegerAndPositiveNaturalData) : Foundations.Quotients.binary_operation_respects (representative_setoid rational_data) (representative_addition rational_data) ∧ Foundations.Quotients.bin...`.

*Proof status:* proof pending


Logical form:

```lean
theorem representative_operations_respect_equivalence (rational_data : IntegerAndPositiveNaturalData) :
    Foundations.Quotients.binary_operation_respects
        (representative_setoid rational_data) (representative_addition rational_data) ∧
    Foundations.Quotients.binary_operation_respects
        (representative_setoid rational_data) (representative_multiplication rational_data) ∧
    Foundations.Quotients.unary_operation_respects
        (representative_setoid rational_data) (representative_negation rational_data)
```
-/
theorem representative_operations_respect_equivalence (rational_data : IntegerAndPositiveNaturalData) :
    Foundations.Quotients.binary_operation_respects
        (representative_setoid rational_data) (representative_addition rational_data) ∧
    Foundations.Quotients.binary_operation_respects
        (representative_setoid rational_data) (representative_multiplication rational_data) ∧
    Foundations.Quotients.unary_operation_respects
        (representative_setoid rational_data) (representative_negation rational_data) := by
  sorry


/-- Definition 2.5: quotient addition.

Mathematical statement (Lean): `noncomputable def addition (rational_data : IntegerAndPositiveNaturalData) : Carrier rational_data → Carrier rational_data → Carrier rational_data`.


Logical form:

```lean
noncomputable def addition (rational_data : IntegerAndPositiveNaturalData) :
    Carrier rational_data → Carrier rational_data → Carrier rational_data :=
  Classical.choose
    (Foundations.Quotients.induced_binary_operation_exists
      (representative_setoid rational_data)
      (representative_addition rational_data)
      (representative_operations_respect_equivalence rational_data).1)
```
-/
noncomputable def addition (rational_data : IntegerAndPositiveNaturalData) :
    Carrier rational_data → Carrier rational_data → Carrier rational_data :=
  Classical.choose
    (Foundations.Quotients.induced_binary_operation_exists
      (representative_setoid rational_data)
      (representative_addition rational_data)
      (representative_operations_respect_equivalence rational_data).1)


/-- Definition 2.6: quotient multiplication.

Mathematical statement (Lean): `noncomputable def multiplication (rational_data : IntegerAndPositiveNaturalData) : Carrier rational_data → Carrier rational_data → Carrier rational_data`.


Logical form:

```lean
noncomputable def multiplication (rational_data : IntegerAndPositiveNaturalData) :
    Carrier rational_data → Carrier rational_data → Carrier rational_data :=
  Classical.choose
    (Foundations.Quotients.induced_binary_operation_exists
      (representative_setoid rational_data)
      (representative_multiplication rational_data)
      (representative_operations_respect_equivalence rational_data).2.1)
```
-/
noncomputable def multiplication (rational_data : IntegerAndPositiveNaturalData) :
    Carrier rational_data → Carrier rational_data → Carrier rational_data :=
  Classical.choose
    (Foundations.Quotients.induced_binary_operation_exists
      (representative_setoid rational_data)
      (representative_multiplication rational_data)
      (representative_operations_respect_equivalence rational_data).2.1)


/-- Existence of quotient negation with the representative computation rule.

Mathematical statement (Lean): `theorem negation_exists (rational_data : IntegerAndPositiveNaturalData) : ∃ negation : Carrier rational_data → Carrier rational_data, ∀ representative : Representative rational_data, negation (Quotient.mk _ representative) = Quotient.mk _ (representative_ne...`.

*Proof status:* proof pending


Logical form:

```lean
theorem negation_exists (rational_data : IntegerAndPositiveNaturalData) :
    ∃ negation : Carrier rational_data → Carrier rational_data,
      ∀ representative : Representative rational_data,
        negation (Quotient.mk _ representative) =
          Quotient.mk _ (representative_negation rational_data representative)
```
-/
theorem negation_exists (rational_data : IntegerAndPositiveNaturalData) :
    ∃ negation : Carrier rational_data → Carrier rational_data,
      ∀ representative : Representative rational_data,
        negation (Quotient.mk _ representative) =
          Quotient.mk _ (representative_negation rational_data representative) := by
  sorry


/-- Definition 2.7: quotient additive inverse.

Mathematical statement (Lean): `noncomputable def negation (rational_data : IntegerAndPositiveNaturalData) : Carrier rational_data → Carrier rational_data`.


Logical form:

```lean
noncomputable def negation (rational_data : IntegerAndPositiveNaturalData) : Carrier rational_data → Carrier rational_data :=
  Classical.choose (negation_exists rational_data)
```
-/
noncomputable def negation (rational_data : IntegerAndPositiveNaturalData) : Carrier rational_data → Carrier rational_data :=
  Classical.choose (negation_exists rational_data)


/-- Definition 2.8: zero and one representatives.

Mathematical statement (Lean): `def zero_representative (rational_data : IntegerAndPositiveNaturalData) : Representative rational_data`.


Logical form:

```lean
def zero_representative (rational_data : IntegerAndPositiveNaturalData) : Representative rational_data where
  numerator := rational_data.integer_model.signature.zero
  denominator := rational_data.one
```
-/
def zero_representative (rational_data : IntegerAndPositiveNaturalData) : Representative rational_data where
  numerator := rational_data.integer_model.signature.zero
  denominator := rational_data.one

/--
**[Def — one_representative]**

Mathematical statement (Lean): `def one_representative (rational_data : IntegerAndPositiveNaturalData) : Representative rational_data`.


Logical form:

```lean
def one_representative (rational_data : IntegerAndPositiveNaturalData) : Representative rational_data where
  numerator := rational_data.integer_model.signature.one
  denominator := rational_data.one
```
-/
def one_representative (rational_data : IntegerAndPositiveNaturalData) : Representative rational_data where
  numerator := rational_data.integer_model.signature.one
  denominator := rational_data.one


/-- Definition 2.8: rational zero and one.

Mathematical statement (Lean): `def zero (rational_data : IntegerAndPositiveNaturalData) : Carrier rational_data`.


Logical form:

```lean
def zero (rational_data : IntegerAndPositiveNaturalData) : Carrier rational_data :=
  Quotient.mk _ (zero_representative rational_data)
```
-/
def zero (rational_data : IntegerAndPositiveNaturalData) : Carrier rational_data :=
  Quotient.mk _ (zero_representative rational_data)

/--
**[Def — one]**

Mathematical statement (Lean): `def one (rational_data : IntegerAndPositiveNaturalData) : Carrier rational_data`.


Logical form:

```lean
def one (rational_data : IntegerAndPositiveNaturalData) : Carrier rational_data :=
  Quotient.mk _ (one_representative rational_data)
```
-/
def one (rational_data : IntegerAndPositiveNaturalData) : Carrier rational_data :=
  Quotient.mk _ (one_representative rational_data)


/-- Proposition expressing the additive-group laws.

Mathematical statement (Lean): `def AdditiveGroupLaws (rational_data : IntegerAndPositiveNaturalData) : Prop`.


Logical form:

```lean
def AdditiveGroupLaws (rational_data : IntegerAndPositiveNaturalData) : Prop :=
  (∀ first second third : Carrier rational_data,
    addition rational_data (addition rational_data first second) third =
      addition rational_data first (addition rational_data second third)) ∧
  (∀ first second : Carrier rational_data,
    addition rational_data first second = addition rational_data second first) ∧
  (∀ value : Carrier rational_data,
    addition rational_data (zero rational_data) value = value ∧
    addition rational_data value (zero rational_data) = value) ∧
  (∀ value : Carrier rational_data,
    addition rational_data value (negation rational_data value) = zero rational_data ∧
    addition rational_data (negation rational_data value) value = zero rational_data)
```
-/
def AdditiveGroupLaws (rational_data : IntegerAndPositiveNaturalData) : Prop :=
  (∀ first second third : Carrier rational_data,
    addition rational_data (addition rational_data first second) third =
      addition rational_data first (addition rational_data second third)) ∧
  (∀ first second : Carrier rational_data,
    addition rational_data first second = addition rational_data second first) ∧
  (∀ value : Carrier rational_data,
    addition rational_data (zero rational_data) value = value ∧
    addition rational_data value (zero rational_data) = value) ∧
  (∀ value : Carrier rational_data,
    addition rational_data value (negation rational_data value) = zero rational_data ∧
    addition rational_data (negation rational_data value) value = zero rational_data)


/-- Theorem 2.9: additive group laws.

Mathematical statement (Lean): `theorem additive_group_laws (rational_data : IntegerAndPositiveNaturalData) : AdditiveGroupLaws rational_data`.

*Proof status:* proof pending


Logical form:

```lean
theorem additive_group_laws (rational_data : IntegerAndPositiveNaturalData) : AdditiveGroupLaws rational_data
```
-/
theorem additive_group_laws (rational_data : IntegerAndPositiveNaturalData) : AdditiveGroupLaws rational_data := by
  sorry


/-- Proposition expressing multiplicative and distributive laws.

Mathematical statement (Lean): `def MultiplicativeAndDistributiveLaws (rational_data : IntegerAndPositiveNaturalData) : Prop`.


Logical form:

```lean
def MultiplicativeAndDistributiveLaws (rational_data : IntegerAndPositiveNaturalData) : Prop :=
  (∀ first second third : Carrier rational_data,
    multiplication rational_data (multiplication rational_data first second) third =
      multiplication rational_data first (multiplication rational_data second third)) ∧
  (∀ first second : Carrier rational_data,
    multiplication rational_data first second = multiplication rational_data second first) ∧
  (∀ value : Carrier rational_data,
    multiplication rational_data (one rational_data) value = value ∧
    multiplication rational_data value (one rational_data) = value) ∧
  (∀ first second third : Carrier rational_data,
    multiplication rational_data first (addition rational_data second third) =
      addition rational_data
        (multiplication rational_data first second)
        (multiplication rational_data first third))
```
-/
def MultiplicativeAndDistributiveLaws (rational_data : IntegerAndPositiveNaturalData) : Prop :=
  (∀ first second third : Carrier rational_data,
    multiplication rational_data (multiplication rational_data first second) third =
      multiplication rational_data first (multiplication rational_data second third)) ∧
  (∀ first second : Carrier rational_data,
    multiplication rational_data first second = multiplication rational_data second first) ∧
  (∀ value : Carrier rational_data,
    multiplication rational_data (one rational_data) value = value ∧
    multiplication rational_data value (one rational_data) = value) ∧
  (∀ first second third : Carrier rational_data,
    multiplication rational_data first (addition rational_data second third) =
      addition rational_data
        (multiplication rational_data first second)
        (multiplication rational_data first third))


/-- Theorem 2.9: multiplicative and distributive laws.

Mathematical statement (Lean): `theorem multiplicative_and_distributive_laws (rational_data : IntegerAndPositiveNaturalData) : MultiplicativeAndDistributiveLaws rational_data`.

*Proof status:* proof pending


Logical form:

```lean
theorem multiplicative_and_distributive_laws (rational_data : IntegerAndPositiveNaturalData) :
    MultiplicativeAndDistributiveLaws rational_data
```
-/
theorem multiplicative_and_distributive_laws (rational_data : IntegerAndPositiveNaturalData) :
    MultiplicativeAndDistributiveLaws rational_data := by
  sorry


/-- Definition 2.10: reciprocal specification for a nonzero rational.

Mathematical statement (Lean): `def IsReciprocal (rational_data : IntegerAndPositiveNaturalData) (value reciprocal : Carrier rational_data) : Prop`.


Logical form:

```lean
def IsReciprocal (rational_data : IntegerAndPositiveNaturalData)
    (value reciprocal : Carrier rational_data) : Prop :=
  multiplication rational_data value reciprocal = one rational_data ∧
  multiplication rational_data reciprocal value = one rational_data
```
-/
def IsReciprocal (rational_data : IntegerAndPositiveNaturalData)
    (value reciprocal : Carrier rational_data) : Prop :=
  multiplication rational_data value reciprocal = one rational_data ∧
  multiplication rational_data reciprocal value = one rational_data


/-- Theorem 2.11: every nonzero rational has a unique reciprocal.

Mathematical statement (Lean): `theorem reciprocal_exists_uniquely (rational_data : IntegerAndPositiveNaturalData) (value : Carrier rational_data) (value_nonzero : value ≠ zero rational_data) : ∃ reciprocal : Carrier rational_data, IsReciprocal rational_data value reciprocal ∧ ∀ other, Is...`.

*Proof status:* proof pending


Logical form:

```lean
theorem reciprocal_exists_uniquely (rational_data : IntegerAndPositiveNaturalData)
    (value : Carrier rational_data) (value_nonzero : value ≠ zero rational_data) :
    ∃ reciprocal : Carrier rational_data,
      IsReciprocal rational_data value reciprocal ∧
      ∀ other, IsReciprocal rational_data value other → other = reciprocal
```
-/
theorem reciprocal_exists_uniquely (rational_data : IntegerAndPositiveNaturalData)
    (value : Carrier rational_data) (value_nonzero : value ≠ zero rational_data) :
    ∃ reciprocal : Carrier rational_data,
      IsReciprocal rational_data value reciprocal ∧
      ∀ other, IsReciprocal rational_data value other → other = reciprocal := by
  sorry


/-- Definition 2.10: rational reciprocal.

Mathematical statement (Lean): `noncomputable def inverse (rational_data : IntegerAndPositiveNaturalData) (value : Carrier rational_data) (value_nonzero : value ≠ zero rational_data) : Carrier rational_data`.


Logical form:

```lean
noncomputable def inverse (rational_data : IntegerAndPositiveNaturalData)
    (value : Carrier rational_data) (value_nonzero : value ≠ zero rational_data) : Carrier rational_data :=
  Classical.choose (reciprocal_exists_uniquely rational_data value value_nonzero)
```
-/
noncomputable def inverse (rational_data : IntegerAndPositiveNaturalData)
    (value : Carrier rational_data) (value_nonzero : value ≠ zero rational_data) : Carrier rational_data :=
  Classical.choose (reciprocal_exists_uniquely rational_data value value_nonzero)


/-- Theorem 2.11: reciprocal correctness.

Mathematical statement (Lean): `theorem inverse_is_two_sided (rational_data : IntegerAndPositiveNaturalData) (value : Carrier rational_data) (value_nonzero : value ≠ zero rational_data) : IsReciprocal rational_data value (inverse rational_data value value_nonzero)`.

*Proof status:* proof pending


Logical form:

```lean
theorem inverse_is_two_sided (rational_data : IntegerAndPositiveNaturalData)
    (value : Carrier rational_data) (value_nonzero : value ≠ zero rational_data) :
    IsReciprocal rational_data value (inverse rational_data value value_nonzero)
```
-/
theorem inverse_is_two_sided (rational_data : IntegerAndPositiveNaturalData)
    (value : Carrier rational_data) (value_nonzero : value ≠ zero rational_data) :
    IsReciprocal rational_data value (inverse rational_data value value_nonzero) := by
  sorry


/-- Proposition expressing the field structure.

Mathematical statement (Lean): `def FieldStructure (rational_data : IntegerAndPositiveNaturalData) : Prop`.


Logical form:

```lean
def FieldStructure (rational_data : IntegerAndPositiveNaturalData) : Prop :=
  AdditiveGroupLaws rational_data ∧
  MultiplicativeAndDistributiveLaws rational_data ∧
  zero rational_data ≠ one rational_data ∧
  (∀ value : Carrier rational_data,
    value ≠ zero rational_data → ∃ reciprocal, IsReciprocal rational_data value reciprocal)
```
-/
def FieldStructure (rational_data : IntegerAndPositiveNaturalData) : Prop :=
  AdditiveGroupLaws rational_data ∧
  MultiplicativeAndDistributiveLaws rational_data ∧
  zero rational_data ≠ one rational_data ∧
  (∀ value : Carrier rational_data,
    value ≠ zero rational_data → ∃ reciprocal, IsReciprocal rational_data value reciprocal)


/-- Theorem 2.12: the rationals form a field.

Mathematical statement (Lean): `theorem field_structure (rational_data : IntegerAndPositiveNaturalData) : FieldStructure rational_data`.

*Proof status:* proof pending


Logical form:

```lean
theorem field_structure (rational_data : IntegerAndPositiveNaturalData) : FieldStructure rational_data
```
-/
theorem field_structure (rational_data : IntegerAndPositiveNaturalData) : FieldStructure rational_data := by
  sorry


/-- Definition 3.1: representative strict order.

Mathematical statement (Lean): `def representative_strict_order (rational_data : IntegerAndPositiveNaturalData) (first second : Representative rational_data) : Prop`.


Logical form:

```lean
def representative_strict_order (rational_data : IntegerAndPositiveNaturalData)
    (first second : Representative rational_data) : Prop :=
  rational_data.integer_model.signature.StrictOrder
    (rational_data.integer_model.signature.multiplication
      first.numerator (rational_data.to_integer second.denominator))
    (rational_data.integer_model.signature.multiplication
      second.numerator (rational_data.to_integer first.denominator))
```
-/
def representative_strict_order (rational_data : IntegerAndPositiveNaturalData)
    (first second : Representative rational_data) : Prop :=
  rational_data.integer_model.signature.StrictOrder
    (rational_data.integer_model.signature.multiplication
      first.numerator (rational_data.to_integer second.denominator))
    (rational_data.integer_model.signature.multiplication
      second.numerator (rational_data.to_integer first.denominator))


/-- Theorem 3.2: representative strict order is independent of representatives.

Mathematical statement (Lean): `theorem representative_strict_order_respects_equivalence (rational_data : IntegerAndPositiveNaturalData) : Foundations.Quotients.relation_respects (representative_setoid rational_data) (representative_strict_order rational_data)`.

*Proof status:* proof pending


Logical form:

```lean
theorem representative_strict_order_respects_equivalence (rational_data : IntegerAndPositiveNaturalData) :
    Foundations.Quotients.relation_respects
      (representative_setoid rational_data)
      (representative_strict_order rational_data)
```
-/
theorem representative_strict_order_respects_equivalence (rational_data : IntegerAndPositiveNaturalData) :
    Foundations.Quotients.relation_respects
      (representative_setoid rational_data)
      (representative_strict_order rational_data) := by
  sorry


/-- Definition 3.1: rational strict order.

Mathematical statement (Lean): `noncomputable def strict_order (rational_data : IntegerAndPositiveNaturalData) : Carrier rational_data → Carrier rational_data → Prop`.


Logical form:

```lean
noncomputable def strict_order (rational_data : IntegerAndPositiveNaturalData) :
    Carrier rational_data → Carrier rational_data → Prop :=
  Classical.choose
    (Foundations.Quotients.induced_relation_exists
      (representative_setoid rational_data)
      (representative_strict_order rational_data)
      (representative_strict_order_respects_equivalence rational_data))
```
-/
noncomputable def strict_order (rational_data : IntegerAndPositiveNaturalData) :
    Carrier rational_data → Carrier rational_data → Prop :=
  Classical.choose
    (Foundations.Quotients.induced_relation_exists
      (representative_setoid rational_data)
      (representative_strict_order rational_data)
      (representative_strict_order_respects_equivalence rational_data))


/-- Rational non-strict order.

Mathematical statement (Lean): `def nonstrict_order (rational_data : IntegerAndPositiveNaturalData) (first second : Carrier rational_data) : Prop`.


Logical form:

```lean
def nonstrict_order (rational_data : IntegerAndPositiveNaturalData) (first second : Carrier rational_data) : Prop :=
  strict_order rational_data first second ∨ first = second
```
-/
def nonstrict_order (rational_data : IntegerAndPositiveNaturalData) (first second : Carrier rational_data) : Prop :=
  strict_order rational_data first second ∨ first = second


/-- Proposition expressing strict total order.

Mathematical statement (Lean): `def StrictTotalOrder (rational_data : IntegerAndPositiveNaturalData) : Prop`.


Logical form:

```lean
def StrictTotalOrder (rational_data : IntegerAndPositiveNaturalData) : Prop :=
  (∀ value : Carrier rational_data, ¬ strict_order rational_data value value) ∧
  (∀ first second third : Carrier rational_data,
    strict_order rational_data first second →
    strict_order rational_data second third →
    strict_order rational_data first third) ∧
  (∀ first second : Carrier rational_data,
    first ≠ second →
    strict_order rational_data first second ∨ strict_order rational_data second first)
```
-/
def StrictTotalOrder (rational_data : IntegerAndPositiveNaturalData) : Prop :=
  (∀ value : Carrier rational_data, ¬ strict_order rational_data value value) ∧
  (∀ first second third : Carrier rational_data,
    strict_order rational_data first second →
    strict_order rational_data second third →
    strict_order rational_data first third) ∧
  (∀ first second : Carrier rational_data,
    first ≠ second →
    strict_order rational_data first second ∨ strict_order rational_data second first)


/-- Theorem 3.3: rational strict order is a strict total order.

Mathematical statement (Lean): `theorem strict_total_order (rational_data : IntegerAndPositiveNaturalData) : StrictTotalOrder rational_data`.

*Proof status:* proof pending


Logical form:

```lean
theorem strict_total_order (rational_data : IntegerAndPositiveNaturalData) : StrictTotalOrder rational_data
```
-/
theorem strict_total_order (rational_data : IntegerAndPositiveNaturalData) : StrictTotalOrder rational_data := by
  sorry


/-- Proposition expressing ordered-field compatibility.

Mathematical statement (Lean): `def OrderedFieldCompatibility (rational_data : IntegerAndPositiveNaturalData) : Prop`.


Logical form:

```lean
def OrderedFieldCompatibility (rational_data : IntegerAndPositiveNaturalData) : Prop :=
  (∀ first second translation : Carrier rational_data,
    strict_order rational_data first second →
    strict_order rational_data
      (addition rational_data first translation)
      (addition rational_data second translation)) ∧
  (∀ first second : Carrier rational_data,
    strict_order rational_data (zero rational_data) first →
    strict_order rational_data (zero rational_data) second →
    strict_order rational_data (zero rational_data) (multiplication rational_data first second))
```
-/
def OrderedFieldCompatibility (rational_data : IntegerAndPositiveNaturalData) : Prop :=
  (∀ first second translation : Carrier rational_data,
    strict_order rational_data first second →
    strict_order rational_data
      (addition rational_data first translation)
      (addition rational_data second translation)) ∧
  (∀ first second : Carrier rational_data,
    strict_order rational_data (zero rational_data) first →
    strict_order rational_data (zero rational_data) second →
    strict_order rational_data (zero rational_data) (multiplication rational_data first second))


/-- Theorem 3.4: rational order is compatible with addition and positive multiplication.

Mathematical statement (Lean): `theorem ordered_field_compatibility (rational_data : IntegerAndPositiveNaturalData) : OrderedFieldCompatibility rational_data`.

*Proof status:* proof pending


Logical form:

```lean
theorem ordered_field_compatibility (rational_data : IntegerAndPositiveNaturalData) :
    OrderedFieldCompatibility rational_data
```
-/
theorem ordered_field_compatibility (rational_data : IntegerAndPositiveNaturalData) :
    OrderedFieldCompatibility rational_data := by
  sorry


/-- Proposition expressing ordered-field structure.

Mathematical statement (Lean): `def OrderedFieldStructure (rational_data : IntegerAndPositiveNaturalData) : Prop`.


Logical form:

```lean
def OrderedFieldStructure (rational_data : IntegerAndPositiveNaturalData) : Prop :=
  FieldStructure rational_data ∧ StrictTotalOrder rational_data ∧ OrderedFieldCompatibility rational_data
```
-/
def OrderedFieldStructure (rational_data : IntegerAndPositiveNaturalData) : Prop :=
  FieldStructure rational_data ∧ StrictTotalOrder rational_data ∧ OrderedFieldCompatibility rational_data


/-- Theorem 3.5: the rationals form an ordered field.

Mathematical statement (Lean): `theorem ordered_field_structure (rational_data : IntegerAndPositiveNaturalData) : OrderedFieldStructure rational_data`.

*Proof status:* proof pending


Logical form:

```lean
theorem ordered_field_structure (rational_data : IntegerAndPositiveNaturalData) : OrderedFieldStructure rational_data
```
-/
theorem ordered_field_structure (rational_data : IntegerAndPositiveNaturalData) : OrderedFieldStructure rational_data := by
  sorry


/-- Definition 4.1: integer representative with denominator one.

Mathematical statement (Lean): `def integer_representative (rational_data : IntegerAndPositiveNaturalData) (value : rational_data.integer_model.signature.carrier) : Representative rational_data`.


Logical form:

```lean
def integer_representative (rational_data : IntegerAndPositiveNaturalData)
    (value : rational_data.integer_model.signature.carrier) : Representative rational_data where
  numerator := value
  denominator := rational_data.one
```
-/
def integer_representative (rational_data : IntegerAndPositiveNaturalData)
    (value : rational_data.integer_model.signature.carrier) : Representative rational_data where
  numerator := value
  denominator := rational_data.one


/-- Definition 4.1: canonical integer embedding.

Mathematical statement (Lean): `def integer_embedding (rational_data : IntegerAndPositiveNaturalData) (value : rational_data.integer_model.signature.carrier) : Carrier rational_data`.


Logical form:

```lean
def integer_embedding (rational_data : IntegerAndPositiveNaturalData)
    (value : rational_data.integer_model.signature.carrier) : Carrier rational_data :=
  Quotient.mk _ (integer_representative rational_data value)
```
-/
def integer_embedding (rational_data : IntegerAndPositiveNaturalData)
    (value : rational_data.integer_model.signature.carrier) : Carrier rational_data :=
  Quotient.mk _ (integer_representative rational_data value)


/-- Theorem 4.2: the integer embedding preserves and reflects ordered-ring structure.

Mathematical statement (Lean): `theorem integer_embedding_properties (rational_data : IntegerAndPositiveNaturalData) : (∀ first second, integer_embedding rational_data first = integer_embedding rational_data second → first = second) ∧ integer_embedding rational_data rational_data.integer_...`.

*Proof status:* proof pending


Logical form:

```lean
theorem integer_embedding_properties (rational_data : IntegerAndPositiveNaturalData) :
    (∀ first second,
      integer_embedding rational_data first = integer_embedding rational_data second → first = second) ∧
    integer_embedding rational_data rational_data.integer_model.signature.zero = zero rational_data ∧
    integer_embedding rational_data rational_data.integer_model.signature.one = one rational_data ∧
    (∀ first second,
      integer_embedding rational_data
          (rational_data.integer_model.signature.addition first second) =
        addition rational_data (integer_embedding rational_data first) (integer_embedding rational_data second)) ∧
    (∀ first second,
      integer_embedding rational_data
          (rational_data.integer_model.signature.multiplication first second) =
        multiplication rational_data (integer_embedding rational_data first) (integer_embedding rational_data second)) ∧
    (∀ first second,
      strict_order rational_data (integer_embedding rational_data first) (integer_embedding rational_data second) ↔
        rational_data.integer_model.signature.StrictOrder first second)
```
-/
theorem integer_embedding_properties (rational_data : IntegerAndPositiveNaturalData) :
    (∀ first second,
      integer_embedding rational_data first = integer_embedding rational_data second → first = second) ∧
    integer_embedding rational_data rational_data.integer_model.signature.zero = zero rational_data ∧
    integer_embedding rational_data rational_data.integer_model.signature.one = one rational_data ∧
    (∀ first second,
      integer_embedding rational_data
          (rational_data.integer_model.signature.addition first second) =
        addition rational_data (integer_embedding rational_data first) (integer_embedding rational_data second)) ∧
    (∀ first second,
      integer_embedding rational_data
          (rational_data.integer_model.signature.multiplication first second) =
        multiplication rational_data (integer_embedding rational_data first) (integer_embedding rational_data second)) ∧
    (∀ first second,
      strict_order rational_data (integer_embedding rational_data first) (integer_embedding rational_data second) ↔
        rational_data.integer_model.signature.StrictOrder first second) := by
  sorry


/-- Definition 5.1: a representative is reduced when gcd(|a|,b)=1.

Mathematical statement (Lean): `def IsReduced (rational_data : IntegerAndPositiveNaturalData) (representative : Representative rational_data) : Prop`.


Logical form:

```lean
def IsReduced (rational_data : IntegerAndPositiveNaturalData) (representative : Representative rational_data) : Prop :=
  rational_data.gcd
      (rational_data.absolute_numerator representative.numerator)
      representative.denominator = rational_data.one
```
-/
def IsReduced (rational_data : IntegerAndPositiveNaturalData) (representative : Representative rational_data) : Prop :=
  rational_data.gcd
      (rational_data.absolute_numerator representative.numerator)
      representative.denominator = rational_data.one


/-- Theorem 5.2: every rational has a reduced representative.

Mathematical statement (Lean): `theorem reduced_representative_exists (rational_data : IntegerAndPositiveNaturalData) (value : Carrier rational_data) : ∃ representative : Representative rational_data, IsReduced rational_data representative ∧ Quotient.mk _ representative = value`.

*Proof status:* proof pending


Logical form:

```lean
theorem reduced_representative_exists (rational_data : IntegerAndPositiveNaturalData) (value : Carrier rational_data) :
    ∃ representative : Representative rational_data,
      IsReduced rational_data representative ∧ Quotient.mk _ representative = value
```
-/
theorem reduced_representative_exists (rational_data : IntegerAndPositiveNaturalData) (value : Carrier rational_data) :
    ∃ representative : Representative rational_data,
      IsReduced rational_data representative ∧ Quotient.mk _ representative = value := by
  sorry


/-- Theorem 5.3: reduced representatives are unique.

Mathematical statement (Lean): `theorem reduced_representative_unique (rational_data : IntegerAndPositiveNaturalData) (first second : Representative rational_data) (first_reduced : IsReduced rational_data first) (second_reduced : IsReduced rational_data second) (same_value : Quotient.mk (...`.

*Proof status:* proof pending


Logical form:

```lean
theorem reduced_representative_unique (rational_data : IntegerAndPositiveNaturalData)
    (first second : Representative rational_data)
    (first_reduced : IsReduced rational_data first)
    (second_reduced : IsReduced rational_data second)
    (same_value : Quotient.mk (representative_setoid rational_data) first =
      Quotient.mk (representative_setoid rational_data) second) :
    first.numerator = second.numerator ∧
    first.denominator = second.denominator
```
-/
theorem reduced_representative_unique (rational_data : IntegerAndPositiveNaturalData)
    (first second : Representative rational_data)
    (first_reduced : IsReduced rational_data first)
    (second_reduced : IsReduced rational_data second)
    (same_value : Quotient.mk (representative_setoid rational_data) first =
      Quotient.mk (representative_setoid rational_data) second) :
    first.numerator = second.numerator ∧
    first.denominator = second.denominator := by
  sorry


/-- Corollary 5.4: every rational has a unique lowest-term form.

Mathematical statement (Lean): `theorem unique_lowest_term_form (rational_data : IntegerAndPositiveNaturalData) (value : Carrier rational_data) : ∃ representative : Representative rational_data, IsReduced rational_data representative ∧ Quotient.mk _ representative = value ∧ ∀ other : Repr...`.

*Proof status:* proof pending


Logical form:

```lean
theorem unique_lowest_term_form (rational_data : IntegerAndPositiveNaturalData) (value : Carrier rational_data) :
    ∃ representative : Representative rational_data,
      IsReduced rational_data representative ∧
      Quotient.mk _ representative = value ∧
      ∀ other : Representative rational_data,
        IsReduced rational_data other →
        Quotient.mk _ other = value →
        other.numerator = representative.numerator ∧
        other.denominator = representative.denominator
```
-/
theorem unique_lowest_term_form (rational_data : IntegerAndPositiveNaturalData) (value : Carrier rational_data) :
    ∃ representative : Representative rational_data,
      IsReduced rational_data representative ∧
      Quotient.mk _ representative = value ∧
      ∀ other : Representative rational_data,
        IsReduced rational_data other →
        Quotient.mk _ other = value →
        other.numerator = representative.numerator ∧
        other.denominator = representative.denominator := by
  sorry


/-- Theorem 6.1: density of the RationalNumbers.

Mathematical statement (Lean): `theorem density (rational_data : IntegerAndPositiveNaturalData) (first second : Carrier rational_data) (first_lt_second : strict_order rational_data first second) : ∃ middle, strict_order rational_data first middle ∧ strict_order rational_data middle second`.

*Proof status:* proof pending


Logical form:

```lean
theorem density (rational_data : IntegerAndPositiveNaturalData)
    (first second : Carrier rational_data)
    (first_lt_second : strict_order rational_data first second) :
    ∃ middle,
      strict_order rational_data first middle ∧ strict_order rational_data middle second
```
-/
theorem density (rational_data : IntegerAndPositiveNaturalData)
    (first second : Carrier rational_data)
    (first_lt_second : strict_order rational_data first second) :
    ∃ middle,
      strict_order rational_data first middle ∧ strict_order rational_data middle second := by
  sorry


/-- Theorem 6.2: Archimedean property of the RationalNumbers.

Mathematical statement (Lean): `theorem archimedean_property (rational_data : IntegerAndPositiveNaturalData) (value : Carrier rational_data) : ∃ natural : rational_data.natural_carrier, strict_order rational_data value (integer_embedding rational_data (rational_data.to_integer natural))`.

*Proof status:* proof pending


Logical form:

```lean
theorem archimedean_property (rational_data : IntegerAndPositiveNaturalData) (value : Carrier rational_data) :
    ∃ natural : rational_data.natural_carrier,
      strict_order rational_data value
        (integer_embedding rational_data (rational_data.to_integer natural))
```
-/
theorem archimedean_property (rational_data : IntegerAndPositiveNaturalData) (value : Carrier rational_data) :
    ∃ natural : rational_data.natural_carrier,
      strict_order rational_data value
        (integer_embedding rational_data (rational_data.to_integer natural)) := by
  sorry


/-- Corollary 6.3: integer-part bounds.

Mathematical statement (Lean): `theorem integer_part_bounds (rational_data : IntegerAndPositiveNaturalData) (value : Carrier rational_data) : ∃ integer : rational_data.integer_model.signature.carrier, nonstrict_order rational_data (integer_embedding rational_data integer) value ∧ strict_o...`.

*Proof status:* proof pending


Logical form:

```lean
theorem integer_part_bounds (rational_data : IntegerAndPositiveNaturalData) (value : Carrier rational_data) :
    ∃ integer : rational_data.integer_model.signature.carrier,
      nonstrict_order rational_data (integer_embedding rational_data integer) value ∧
      strict_order rational_data value
        (integer_embedding rational_data
          (rational_data.integer_model.signature.addition
            integer rational_data.integer_model.signature.one))
```
-/
theorem integer_part_bounds (rational_data : IntegerAndPositiveNaturalData) (value : Carrier rational_data) :
    ∃ integer : rational_data.integer_model.signature.carrier,
      nonstrict_order rational_data (integer_embedding rational_data integer) value ∧
      strict_order rational_data value
        (integer_embedding rational_data
          (rational_data.integer_model.signature.addition
            integer rational_data.integer_model.signature.one)) := by
  sorry


/-- Definition 7.1: the rational square-root cut for two.

Mathematical statement (Lean): `def square_root_two_cut (rational_data : IntegerAndPositiveNaturalData) (two : Carrier rational_data) : Carrier rational_data → Prop`.


Logical form:

```lean
def square_root_two_cut (rational_data : IntegerAndPositiveNaturalData)
    (two : Carrier rational_data) : Carrier rational_data → Prop :=
  fun value =>
    strict_order rational_data value (zero rational_data) ∨
    strict_order rational_data (multiplication rational_data value value) two
```
-/
def square_root_two_cut (rational_data : IntegerAndPositiveNaturalData)
    (two : Carrier rational_data) : Carrier rational_data → Prop :=
  fun value =>
    strict_order rational_data value (zero rational_data) ∨
    strict_order rational_data (multiplication rational_data value value) two


/-- Theorem 7.2: the rational square-root cut is nonempty and bounded above.

Mathematical statement (Lean): `theorem square_root_two_cut_nonempty_bounded (rational_data : IntegerAndPositiveNaturalData) (two : Carrier rational_data) : (∃ value, square_root_two_cut rational_data two value) ∧ (∃ upper, ∀ value, square_root_two_cut rational_data two value → nonstrict_...`.

*Proof status:* proof pending


Logical form:

```lean
theorem square_root_two_cut_nonempty_bounded (rational_data : IntegerAndPositiveNaturalData)
    (two : Carrier rational_data) :
    (∃ value, square_root_two_cut rational_data two value) ∧
    (∃ upper,
      ∀ value,
        square_root_two_cut rational_data two value →
        nonstrict_order rational_data value upper)
```
-/
theorem square_root_two_cut_nonempty_bounded (rational_data : IntegerAndPositiveNaturalData)
    (two : Carrier rational_data) :
    (∃ value, square_root_two_cut rational_data two value) ∧
    (∃ upper,
      ∀ value,
        square_root_two_cut rational_data two value →
        nonstrict_order rational_data value upper) := by
  sorry


/-- Theorem 7.3: no rational squares to two.

Mathematical statement (Lean): `theorem no_rational_square_root_two (rational_data : IntegerAndPositiveNaturalData) (two : Carrier rational_data) : ¬ ∃ value, multiplication rational_data value value = two`.

*Proof status:* proof pending


Logical form:

```lean
theorem no_rational_square_root_two (rational_data : IntegerAndPositiveNaturalData) (two : Carrier rational_data) :
    ¬ ∃ value, multiplication rational_data value value = two
```
-/
theorem no_rational_square_root_two (rational_data : IntegerAndPositiveNaturalData) (two : Carrier rational_data) :
    ¬ ∃ value, multiplication rational_data value value = two := by
  sorry


/-- Theorem 7.4: the square-root cut has no rational supremum.

Mathematical statement (Lean): `theorem square_root_two_cut_has_no_supremum (rational_data : IntegerAndPositiveNaturalData) (two : Carrier rational_data) : ¬ ∃ supremum, (∀ value, square_root_two_cut rational_data two value → nonstrict_order rational_data value supremum) ∧ (∀ upper, (∀ va...`.

*Proof status:* proof pending


Logical form:

```lean
theorem square_root_two_cut_has_no_supremum (rational_data : IntegerAndPositiveNaturalData)
    (two : Carrier rational_data) :
    ¬ ∃ supremum,
      (∀ value,
        square_root_two_cut rational_data two value →
        nonstrict_order rational_data value supremum) ∧
      (∀ upper,
        (∀ value,
          square_root_two_cut rational_data two value →
          nonstrict_order rational_data value upper) →
        nonstrict_order rational_data supremum upper)
```
-/
theorem square_root_two_cut_has_no_supremum (rational_data : IntegerAndPositiveNaturalData)
    (two : Carrier rational_data) :
    ¬ ∃ supremum,
      (∀ value,
        square_root_two_cut rational_data two value →
        nonstrict_order rational_data value supremum) ∧
      (∀ upper,
        (∀ value,
          square_root_two_cut rational_data two value →
          nonstrict_order rational_data value upper) →
        nonstrict_order rational_data supremum upper) := by
  sorry


/-- Proposition expressing failure of order completeness.

Mathematical statement (Lean): `def NotOrderComplete (rational_data : IntegerAndPositiveNaturalData) : Prop`.


Logical form:

```lean
def NotOrderComplete (rational_data : IntegerAndPositiveNaturalData) : Prop :=
  ∃ subset : Carrier rational_data → Prop,
    (∃ value, subset value) ∧
    (∃ upper,
      ∀ value, subset value → nonstrict_order rational_data value upper) ∧
    ¬ ∃ supremum,
      (∀ value, subset value → nonstrict_order rational_data value supremum) ∧
      (∀ upper,
        (∀ value, subset value → nonstrict_order rational_data value upper) →
        nonstrict_order rational_data supremum upper)
```
-/
def NotOrderComplete (rational_data : IntegerAndPositiveNaturalData) : Prop :=
  ∃ subset : Carrier rational_data → Prop,
    (∃ value, subset value) ∧
    (∃ upper,
      ∀ value, subset value → nonstrict_order rational_data value upper) ∧
    ¬ ∃ supremum,
      (∀ value, subset value → nonstrict_order rational_data value supremum) ∧
      (∀ upper,
        (∀ value, subset value → nonstrict_order rational_data value upper) →
        nonstrict_order rational_data supremum upper)


/-- Corollary 7.5: the rationals are not order-complete.

Mathematical statement (Lean): `theorem not_order_complete (rational_data : IntegerAndPositiveNaturalData) : NotOrderComplete rational_data`.

*Proof status:* proof pending


Logical form:

```lean
theorem not_order_complete (rational_data : IntegerAndPositiveNaturalData) : NotOrderComplete rational_data
```
-/
theorem not_order_complete (rational_data : IntegerAndPositiveNaturalData) : NotOrderComplete rational_data := by
  sorry


/-- Proposition expressing the final structural summary.

Mathematical statement (Lean): `def StructureOfTheRationals (rational_data : IntegerAndPositiveNaturalData) : Prop`.


Logical form:

```lean
def StructureOfTheRationals (rational_data : IntegerAndPositiveNaturalData) : Prop :=
  OrderedFieldStructure rational_data ∧
  (∀ first second : Carrier rational_data,
    strict_order rational_data first second →
    ∃ middle,
      strict_order rational_data first middle ∧ strict_order rational_data middle second) ∧
  NotOrderComplete rational_data
```
-/
def StructureOfTheRationals (rational_data : IntegerAndPositiveNaturalData) : Prop :=
  OrderedFieldStructure rational_data ∧
  (∀ first second : Carrier rational_data,
    strict_order rational_data first second →
    ∃ middle,
      strict_order rational_data first middle ∧ strict_order rational_data middle second) ∧
  NotOrderComplete rational_data


/-- Theorem 8.1: final structural summary.

Mathematical statement (Lean): `theorem structure_of_the_rationals (rational_data : IntegerAndPositiveNaturalData) : StructureOfTheRationals rational_data`.

*Proof status:* proof pending


Logical form:

```lean
theorem structure_of_the_rationals (rational_data : IntegerAndPositiveNaturalData) :
    StructureOfTheRationals rational_data
```
-/
theorem structure_of_the_rationals (rational_data : IntegerAndPositiveNaturalData) :
    StructureOfTheRationals rational_data := by
  sorry

end LRA.NumberSystems.RationalNumbers.RationalQuotientFractions
