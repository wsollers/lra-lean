-- LRA/NumberSystems/RealNumbers/Constructions/Cauchy/Equivalence.lean
-- Null-difference equivalence restricted to Cauchy representatives, the
-- proof that it is an equivalence relation, the resulting setoid, and the
-- Cauchy real carrier as the quotient by that setoid.

import LRA.NumberSystems.RealNumbers.Constructions.Cauchy.Carrier

namespace LRA.NumberSystems.RealNumbers.Cauchy
open LRA.NumberSystems.Models

/-- Null-difference equivalence restricted to Cauchy representatives.

Mathematical statement (Lean): `def representative_equivalent (rational_model : RationalModel) (absolute_value_data : RationalMetricData rational_model) (first second : Representative rational_model absolute_value_data) : Prop`.


Logical form:

```lean
def representative_equivalent
    (rational_model : RationalModel)
    (absolute_value_data : RationalMetricData rational_model)
    (first second : Representative rational_model absolute_value_data) : Prop :=
  equivalent rational_model absolute_value_data first.sequence second.sequence
```
-/
def representative_equivalent
    (rational_model : RationalModel)
    (absolute_value_data : RationalMetricData rational_model)
    (first second : Representative rational_model absolute_value_data) : Prop :=
  equivalent rational_model absolute_value_data first.sequence second.sequence


/-- Cauchy equivalence is reflexive, symmetric, and transitive.

Mathematical statement (Lean): `theorem representative_equivalent_is_equivalence (rational_model : RationalModel) (absolute_value_data : RationalMetricData rational_model) : Equivalence (representative_equivalent rational_model absolute_value_data)`.

*Proof status:* proof pending


Logical form:

```lean
theorem representative_equivalent_is_equivalence
    (rational_model : RationalModel)
    (absolute_value_data : RationalMetricData rational_model) :
    Equivalence
      (representative_equivalent rational_model absolute_value_data)
```
-/
theorem representative_equivalent_is_equivalence
    (rational_model : RationalModel)
    (absolute_value_data : RationalMetricData rational_model) :
    Equivalence
      (representative_equivalent rational_model absolute_value_data) := by
  sorry

/-- The setoid used for the Cauchy quotient.

Mathematical statement (Lean): `def representative_setoid (rational_model : RationalModel) (absolute_value_data : RationalMetricData rational_model) : Setoid (Representative rational_model absolute_value_data)`.


Logical form:

```lean
def representative_setoid
    (rational_model : RationalModel)
    (absolute_value_data : RationalMetricData rational_model) :
    Setoid (Representative rational_model absolute_value_data) where
  r := representative_equivalent rational_model absolute_value_data
  iseqv := representative_equivalent_is_equivalence
    rational_model absolute_value_data
```
-/
def representative_setoid
    (rational_model : RationalModel)
    (absolute_value_data : RationalMetricData rational_model) :
    Setoid (Representative rational_model absolute_value_data) where
  r := representative_equivalent rational_model absolute_value_data
  iseqv := representative_equivalent_is_equivalence
    rational_model absolute_value_data


/-- The Cauchy real carrier is the quotient of rational Cauchy sequences.

Mathematical statement (Lean): `abbrev Carrier (rational_model : RationalModel) (absolute_value_data : RationalMetricData rational_model)`.


Logical form:

```lean
abbrev Carrier
    (rational_model : RationalModel)
    (absolute_value_data : RationalMetricData rational_model) :=
  Quotient (representative_setoid rational_model absolute_value_data)
```
-/
abbrev Carrier
    (rational_model : RationalModel)
    (absolute_value_data : RationalMetricData rational_model) :=
  Quotient (representative_setoid rational_model absolute_value_data)

end LRA.NumberSystems.RealNumbers.Cauchy
