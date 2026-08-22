-- LRA/NumberSystems/RationalNumbers/Constructions/RationalQuotientFractions/Operations.lean
-- Addition, multiplication, negation, order, and the distinguished
-- representatives -- all defined on representatives.

import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions.WellFoundedness

namespace LRA.NumberSystems.RationalNumbers.RationalQuotientFractions

/-- Definition 2.1: raw fraction addition.

Logical form:

```lean
def representative_addition (rational_data : IntegerAndPositiveNaturalData)
    (first second : Representative rational_data) : Representative rational_data where
  numerator :=
    rational_data.integer_system.Model.signature.add
      (rational_data.integer_system.Model.signature.multiply
        first.numerator (rational_data.to_integer second.denominator))
      (rational_data.integer_system.Model.signature.multiply
        second.numerator (rational_data.to_integer first.denominator))
  denominator := rational_data.multiplication first.denominator second.denominator
```
-/
def representative_addition (rational_data : IntegerAndPositiveNaturalData)
    (first second : Representative rational_data) : Representative rational_data where
  numerator :=
    rational_data.integer_system.Model.signature.add
      (rational_data.integer_system.Model.signature.multiply
        first.numerator (rational_data.to_integer second.denominator))
      (rational_data.integer_system.Model.signature.multiply
        second.numerator (rational_data.to_integer first.denominator))
  denominator := rational_data.multiplication first.denominator second.denominator


/-- Definition 2.2: raw fraction multiplication.

Logical form:

```lean
def representative_multiplication (rational_data : IntegerAndPositiveNaturalData)
    (first second : Representative rational_data) : Representative rational_data where
  numerator := rational_data.integer_system.Model.signature.multiply
    first.numerator second.numerator
  denominator := rational_data.multiplication first.denominator second.denominator
```
-/
def representative_multiplication (rational_data : IntegerAndPositiveNaturalData)
    (first second : Representative rational_data) : Representative rational_data where
  numerator := rational_data.integer_system.Model.signature.multiply
    first.numerator second.numerator
  denominator := rational_data.multiplication first.denominator second.denominator


/-- Definition 2.3: raw additive inverse.

Logical form:

```lean
def representative_negation (rational_data : IntegerAndPositiveNaturalData)
    (representative : Representative rational_data) : Representative rational_data where
  numerator := rational_data.integer_system.Model.signature.neg representative.numerator
  denominator := representative.denominator
```
-/
def representative_negation (rational_data : IntegerAndPositiveNaturalData)
    (representative : Representative rational_data) : Representative rational_data where
  numerator := rational_data.integer_system.Model.signature.neg representative.numerator
  denominator := representative.denominator


/-- Definition 2.8: zero and one representatives.

Logical form:

```lean
def zero_representative (rational_data : IntegerAndPositiveNaturalData) : Representative rational_data where
  numerator := rational_data.integer_system.Model.signature.zero
  denominator := rational_data.one
```
-/
def zero_representative (rational_data : IntegerAndPositiveNaturalData) : Representative rational_data where
  numerator := rational_data.integer_system.Model.signature.zero
  denominator := rational_data.one

/--
**[Def — one_representative]**

Logical form:

```lean
def one_representative (rational_data : IntegerAndPositiveNaturalData) : Representative rational_data where
  numerator := rational_data.integer_system.Model.signature.one
  denominator := rational_data.one
```
-/
def one_representative (rational_data : IntegerAndPositiveNaturalData) : Representative rational_data where
  numerator := rational_data.integer_system.Model.signature.one
  denominator := rational_data.one


/-- Definition 2.8: rational zero and one.

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

Logical form:

```lean
def one (rational_data : IntegerAndPositiveNaturalData) : Carrier rational_data :=
  Quotient.mk _ (one_representative rational_data)
```
-/
def one (rational_data : IntegerAndPositiveNaturalData) : Carrier rational_data :=
  Quotient.mk _ (one_representative rational_data)


/-- Definition 3.1: representative strict order.

Logical form:

```lean
def representative_strict_order (rational_data : IntegerAndPositiveNaturalData)
    (first second : Representative rational_data) : Prop :=
  rational_data.integer_system.Model.signature.StrictOrder
    (rational_data.integer_system.Model.signature.multiply
      first.numerator (rational_data.to_integer second.denominator))
    (rational_data.integer_system.Model.signature.multiply
      second.numerator (rational_data.to_integer first.denominator))
```
-/
def representative_strict_order (rational_data : IntegerAndPositiveNaturalData)
    (first second : Representative rational_data) : Prop :=
  rational_data.integer_system.Model.signature.StrictOrder
    (rational_data.integer_system.Model.signature.multiply
      first.numerator (rational_data.to_integer second.denominator))
    (rational_data.integer_system.Model.signature.multiply
      second.numerator (rational_data.to_integer first.denominator))

end LRA.NumberSystems.RationalNumbers.RationalQuotientFractions
