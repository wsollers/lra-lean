-- LRA/NumberSystems/RationalNumbers/Constructions/RationalQuotientFractions/Laws.lean
-- The interface's law classes, discharged: additive group, multiplicative
-- and distributive laws, field structure, strict total order, and
-- ordered-field compatibility.

import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions.WellDefinedness

namespace LRA.NumberSystems.RationalNumbers.RationalQuotientFractions

/-- Proposition expressing the additive-group laws.

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

*Proof status:* proof pending

Logical form:

```lean
theorem additive_group_laws (rational_data : IntegerAndPositiveNaturalData) : AdditiveGroupLaws rational_data
```
-/
theorem additive_group_laws (rational_data : IntegerAndPositiveNaturalData) : AdditiveGroupLaws rational_data := by
  sorry

/-- Proposition expressing multiplicative and distributive laws.

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

*Proof status:* proof pending

Logical form:

```lean
theorem field_structure (rational_data : IntegerAndPositiveNaturalData) : FieldStructure rational_data
```
-/
theorem field_structure (rational_data : IntegerAndPositiveNaturalData) : FieldStructure rational_data := by
  sorry

/-- Proposition expressing strict total order.

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

*Proof status:* proof pending

Logical form:

```lean
theorem strict_total_order (rational_data : IntegerAndPositiveNaturalData) : StrictTotalOrder rational_data
```
-/
theorem strict_total_order (rational_data : IntegerAndPositiveNaturalData) : StrictTotalOrder rational_data := by
  sorry

/-- Proposition expressing ordered-field compatibility.

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

Logical form:

```lean
def OrderedFieldStructure (rational_data : IntegerAndPositiveNaturalData) : Prop :=
  FieldStructure rational_data ∧ StrictTotalOrder rational_data ∧ OrderedFieldCompatibility rational_data
```
-/
def OrderedFieldStructure (rational_data : IntegerAndPositiveNaturalData) : Prop :=
  FieldStructure rational_data ∧ StrictTotalOrder rational_data ∧ OrderedFieldCompatibility rational_data


/-- Theorem 3.5: the rationals form an ordered field.

*Proof status:* proof pending

Logical form:

```lean
theorem ordered_field_structure (rational_data : IntegerAndPositiveNaturalData) : OrderedFieldStructure rational_data
```
-/
theorem ordered_field_structure (rational_data : IntegerAndPositiveNaturalData) : OrderedFieldStructure rational_data := by
  sorry

end LRA.NumberSystems.RationalNumbers.RationalQuotientFractions
