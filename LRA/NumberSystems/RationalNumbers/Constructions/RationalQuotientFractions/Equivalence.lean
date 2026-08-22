-- LRA/NumberSystems/RationalNumbers/Constructions/RationalQuotientFractions/Equivalence.lean

import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions.Carrier

namespace LRA.NumberSystems.RationalNumbers.RationalQuotientFractions

/-- Definition 1.2: cross-multiplication equivalence.

Logical form:

```lean
def equivalent (rational_data : IntegerAndPositiveNaturalData)
    (first second : Representative rational_data) : Prop :=
  rational_data.integer_system.Model.signature.multiply
      first.numerator (rational_data.to_integer second.denominator) =
    rational_data.integer_system.Model.signature.multiply
      second.numerator (rational_data.to_integer first.denominator)
```
-/
def equivalent (rational_data : IntegerAndPositiveNaturalData)
    (first second : Representative rational_data) : Prop :=
  rational_data.integer_system.Model.signature.multiply
      first.numerator (rational_data.to_integer second.denominator) =
    rational_data.integer_system.Model.signature.multiply
      second.numerator (rational_data.to_integer first.denominator)


/-- Theorem 1.3: cross-multiplication is an equivalence relation.

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

Logical form:

```lean
abbrev Carrier (rational_data : IntegerAndPositiveNaturalData) := Quotient (representative_setoid rational_data)
```
-/
abbrev Carrier (rational_data : IntegerAndPositiveNaturalData) := Quotient (representative_setoid rational_data)

end LRA.NumberSystems.RationalNumbers.RationalQuotientFractions
