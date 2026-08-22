-- LRA/NumberSystems/RealNumbers/Constructions/Cauchy/Equivalence.lean
-- Null-difference equivalence restricted to Cauchy representatives, the
-- proof that it is an equivalence relation, the resulting setoid, and the
-- Cauchy real carrier as the quotient by that setoid.

import LRA.NumberSystems.RealNumbers.Constructions.Cauchy.Carrier

namespace LRA.NumberSystems.RealNumbers.Cauchy
open LRA.NumberSystems.Models
open LRA.NumberSystems.RationalNumbers

/-- Null-difference equivalence restricted to Cauchy representatives.

Mathematical statement (Lean): `def representative_equivalent (rationalSystem : RationalNumberSystem) (absolute_value_data : RationalMetricData rationalSystem) (first second : Representative rationalSystem absolute_value_data) : Prop`.


Logical form:

```lean
def representative_equivalent
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) : Prop :=
  equivalent rationalSystem absolute_value_data first.sequence second.sequence
```
-/
def representative_equivalent
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) : Prop :=
  equivalent rationalSystem absolute_value_data first.sequence second.sequence


/-- Cauchy equivalence is reflexive, symmetric, and transitive.

Mathematical statement (Lean): `theorem representative_equivalent_is_equivalence (rationalSystem : RationalNumberSystem) (absolute_value_data : RationalMetricData rationalSystem) : Equivalence (representative_equivalent rationalSystem absolute_value_data)`.

*Proof status:* proof pending


Logical form:

```lean
theorem representative_equivalent_is_equivalence
    (rational_model : DenselyOrderedFieldModel)
    (absolute_value_data : RationalMetricData rational_model) :
    Equivalence
      (representative_equivalent rational_model absolute_value_data)
```
-/
theorem representative_equivalent_is_equivalence
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Equivalence
      (representative_equivalent rationalSystem absolute_value_data) := by
  sorry

/-- The setoid used for the Cauchy quotient.

Mathematical statement (Lean): `def representative_setoid (rationalSystem : RationalNumberSystem) (absolute_value_data : RationalMetricData rationalSystem) : Setoid (Representative rationalSystem absolute_value_data)`.


Logical form:

```lean
def representative_setoid
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Setoid (Representative rationalSystem absolute_value_data) where
  r := representative_equivalent rationalSystem absolute_value_data
  iseqv := representative_equivalent_is_equivalence
    rationalSystem absolute_value_data
```
-/
def representative_setoid
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Setoid (Representative rationalSystem absolute_value_data) where
  r := representative_equivalent rationalSystem absolute_value_data
  iseqv := representative_equivalent_is_equivalence
    rationalSystem absolute_value_data


/-- The Cauchy real carrier is the quotient of rational Cauchy sequences.

Mathematical statement (Lean): `abbrev Carrier (rationalSystem : RationalNumberSystem) (absolute_value_data : RationalMetricData rationalSystem)`.


Logical form:

```lean
abbrev Carrier
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :=
  Quotient (representative_setoid rationalSystem absolute_value_data)
```
-/
abbrev Carrier
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :=
  Quotient (representative_setoid rationalSystem absolute_value_data)

end LRA.NumberSystems.RealNumbers.Cauchy
