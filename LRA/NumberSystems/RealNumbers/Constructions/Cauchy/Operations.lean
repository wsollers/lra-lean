-- LRA/NumberSystems/RealNumbers/Constructions/Cauchy/Operations.lean
-- Pointwise addition, negation, and multiplication of Cauchy-sequence
-- representatives -- all defined on representatives.

import LRA.NumberSystems.RealNumbers.Constructions.Cauchy.WellFoundedness

namespace LRA.NumberSystems.RealNumbers.Cauchy
open LRA.NumberSystems.Models

/-- Pointwise addition of rational-sequence representatives.

Mathematical statement (Lean): `def representative_addition (rational_model : DenselyOrderedFieldModel) (absolute_value_data : RationalMetricData rational_model) (first second : Representative rational_model absolute_value_data) : Sequence rational_model`.


Logical form:

```lean
def representative_addition
    (rational_model : DenselyOrderedFieldModel)
    (absolute_value_data : RationalMetricData rational_model)
    (first second : Representative rational_model absolute_value_data) :
    Sequence rational_model :=
  fun index =>
    rational_model.signature.add
      (first.sequence index)
      (second.sequence index)
```
-/
def representative_addition
    (rational_model : DenselyOrderedFieldModel)
    (absolute_value_data : RationalMetricData rational_model)
    (first second : Representative rational_model absolute_value_data) :
    Sequence rational_model :=
  fun index =>
    rational_model.signature.add
      (first.sequence index)
      (second.sequence index)


/-- Pointwise negation of a rational-sequence representative.

Mathematical statement (Lean): `def representative_negation (rational_model : DenselyOrderedFieldModel) (absolute_value_data : RationalMetricData rational_model) (representative : Representative rational_model absolute_value_data) : Sequence rational_model`.


Logical form:

```lean
def representative_negation
    (rational_model : DenselyOrderedFieldModel)
    (absolute_value_data : RationalMetricData rational_model)
    (representative : Representative rational_model absolute_value_data) :
    Sequence rational_model :=
  fun index =>
    rational_model.signature.neg (representative.sequence index)
```
-/
def representative_negation
    (rational_model : DenselyOrderedFieldModel)
    (absolute_value_data : RationalMetricData rational_model)
    (representative : Representative rational_model absolute_value_data) :
    Sequence rational_model :=
  fun index =>
    rational_model.signature.neg (representative.sequence index)


/-- Pointwise multiplication of rational-sequence representatives.

Mathematical statement (Lean): `def representative_multiplication (rational_model : DenselyOrderedFieldModel) (absolute_value_data : RationalMetricData rational_model) (first second : Representative rational_model absolute_value_data) : Sequence rational_model`.


Logical form:

```lean
def representative_multiplication
    (rational_model : DenselyOrderedFieldModel)
    (absolute_value_data : RationalMetricData rational_model)
    (first second : Representative rational_model absolute_value_data) :
    Sequence rational_model :=
  fun index =>
    rational_model.signature.multiply
      (first.sequence index)
      (second.sequence index)
```
-/
def representative_multiplication
    (rational_model : DenselyOrderedFieldModel)
    (absolute_value_data : RationalMetricData rational_model)
    (first second : Representative rational_model absolute_value_data) :
    Sequence rational_model :=
  fun index =>
    rational_model.signature.multiply
      (first.sequence index)
      (second.sequence index)

end LRA.NumberSystems.RealNumbers.Cauchy
