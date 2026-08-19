-- LRA/NumberSystems/Integers/Constructions/QuotientOrderedPairs/Operations.lean
-- Addition, negation, multiplication, order, and the distinguished
-- representatives and embedding -- all defined on representatives.

import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs.WellFoundedness

namespace LRA.NumberSystems.Integers.QuotientOrderedPairs

/-- Raw addition of formal differences.

Logical form:

```lean
def representative_addition
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (first second : Representative whole_data) : Representative whole_data where
  positive_coordinate :=
    whole_data.addition first.positive_coordinate second.positive_coordinate
  negative_coordinate :=
    whole_data.addition first.negative_coordinate second.negative_coordinate
```
-/
def representative_addition
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (first second : Representative whole_data) : Representative whole_data where
  positive_coordinate :=
    whole_data.addition first.positive_coordinate second.positive_coordinate
  negative_coordinate :=
    whole_data.addition first.negative_coordinate second.negative_coordinate


/-- Raw negation swaps the coordinates.

Logical form:

```lean
def representative_negation
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (value : Representative whole_data) : Representative whole_data where
  positive_coordinate := value.negative_coordinate
  negative_coordinate := value.positive_coordinate
```
-/
def representative_negation
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (value : Representative whole_data) : Representative whole_data where
  positive_coordinate := value.negative_coordinate
  negative_coordinate := value.positive_coordinate


/-- Raw multiplication of formal differences.

Logical form:

```lean
def representative_multiplication
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (first second : Representative whole_data) : Representative whole_data where
  positive_coordinate :=
    whole_data.addition
      (whole_data.multiplication first.positive_coordinate second.positive_coordinate)
      (whole_data.multiplication first.negative_coordinate second.negative_coordinate)
  negative_coordinate :=
    whole_data.addition
      (whole_data.multiplication first.positive_coordinate second.negative_coordinate)
      (whole_data.multiplication first.negative_coordinate second.positive_coordinate)
```
-/
def representative_multiplication
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (first second : Representative whole_data) : Representative whole_data where
  positive_coordinate :=
    whole_data.addition
      (whole_data.multiplication first.positive_coordinate second.positive_coordinate)
      (whole_data.multiplication first.negative_coordinate second.negative_coordinate)
  negative_coordinate :=
    whole_data.addition
      (whole_data.multiplication first.positive_coordinate second.negative_coordinate)
      (whole_data.multiplication first.negative_coordinate second.positive_coordinate)


/-- Raw non-strict order on formal differences.

Logical form:

```lean
def representative_nonstrict_order
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (first second : Representative whole_data) : Prop :=
  whole_data.nonstrict_order
    (whole_data.addition first.positive_coordinate second.negative_coordinate)
    (whole_data.addition second.positive_coordinate first.negative_coordinate)
```
-/
def representative_nonstrict_order
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (first second : Representative whole_data) : Prop :=
  whole_data.nonstrict_order
    (whole_data.addition first.positive_coordinate second.negative_coordinate)
    (whole_data.addition second.positive_coordinate first.negative_coordinate)


/-- Zero representative.

Logical form:

```lean
def zero_representative (whole_data : WholeNumberArithmeticForQuotientPairs) : Representative whole_data where
  positive_coordinate := whole_data.zero
  negative_coordinate := whole_data.zero
```
-/
def zero_representative (whole_data : WholeNumberArithmeticForQuotientPairs) : Representative whole_data where
  positive_coordinate := whole_data.zero
  negative_coordinate := whole_data.zero


/-- One representative.

Logical form:

```lean
def one_representative (whole_data : WholeNumberArithmeticForQuotientPairs) : Representative whole_data where
  positive_coordinate := whole_data.one
  negative_coordinate := whole_data.zero
```
-/
def one_representative (whole_data : WholeNumberArithmeticForQuotientPairs) : Representative whole_data where
  positive_coordinate := whole_data.one
  negative_coordinate := whole_data.zero


/-- Canonical embedding of whole numbers into the integer quotient.

Logical form:

```lean
def embed
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (value : whole_data.carrier) : Carrier whole_data :=
  Quotient.mk _
    { positive_coordinate := value
      negative_coordinate := whole_data.zero }
```
-/
def embed
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (value : whole_data.carrier) : Carrier whole_data :=
  Quotient.mk _
    { positive_coordinate := value
      negative_coordinate := whole_data.zero }


/-- The whole-number embedding is injective.

*Proof status:* proof pending

Logical form:

```lean
theorem embedding_is_injective
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    ∀ first second,
      embed whole_data first = embed whole_data second → first = second
```
-/
theorem embedding_is_injective
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    ∀ first second,
      embed whole_data first = embed whole_data second → first = second := by
  sorry

end LRA.NumberSystems.Integers.QuotientOrderedPairs
