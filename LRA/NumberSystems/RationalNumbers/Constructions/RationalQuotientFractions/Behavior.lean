-- LRA/NumberSystems/RationalNumbers/Constructions/RationalQuotientFractions/Behavior.lean
-- The operations compute as expected on the intended values: the integer
-- embedding preserves and reflects ordered-ring structure, every rational
-- has a unique lowest-term form, the order is dense and Archimedean, no
-- rational squares to two, and the final structural summary.

import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions.Laws

namespace LRA.NumberSystems.RationalNumbers.RationalQuotientFractions

/-- Definition 4.1: integer representative with denominator one.

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
          (rational_data.integer_model.signature.add first second) =
        addition rational_data (integer_embedding rational_data first) (integer_embedding rational_data second)) ∧
    (∀ first second,
      integer_embedding rational_data
          (rational_data.integer_model.signature.multiply first second) =
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
          (rational_data.integer_model.signature.add first second) =
        addition rational_data (integer_embedding rational_data first) (integer_embedding rational_data second)) ∧
    (∀ first second,
      integer_embedding rational_data
          (rational_data.integer_model.signature.multiply first second) =
        multiplication rational_data (integer_embedding rational_data first) (integer_embedding rational_data second)) ∧
    (∀ first second,
      strict_order rational_data (integer_embedding rational_data first) (integer_embedding rational_data second) ↔
        rational_data.integer_model.signature.StrictOrder first second) := by
  sorry


/-- Definition 5.1: a representative is reduced when gcd(|a|,b)=1.

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

*Proof status:* proof pending

Logical form:

```lean
theorem integer_part_bounds (rational_data : IntegerAndPositiveNaturalData) (value : Carrier rational_data) :
    ∃ integer : rational_data.integer_model.signature.carrier,
      nonstrict_order rational_data (integer_embedding rational_data integer) value ∧
      strict_order rational_data value
        (integer_embedding rational_data
          (rational_data.integer_model.signature.add
            integer rational_data.integer_model.signature.one))
```
-/
theorem integer_part_bounds (rational_data : IntegerAndPositiveNaturalData) (value : Carrier rational_data) :
    ∃ integer : rational_data.integer_model.signature.carrier,
      nonstrict_order rational_data (integer_embedding rational_data integer) value ∧
      strict_order rational_data value
        (integer_embedding rational_data
          (rational_data.integer_model.signature.add
            integer rational_data.integer_model.signature.one)) := by
  sorry


/-- Definition 7.1: the rational square-root cut for two.

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

*Proof status:* proof pending

Logical form:

```lean
theorem not_order_complete (rational_data : IntegerAndPositiveNaturalData) : NotOrderComplete rational_data
```
-/
theorem not_order_complete (rational_data : IntegerAndPositiveNaturalData) : NotOrderComplete rational_data := by
  sorry


/-- Proposition expressing the final structural summary.

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
