-- LRA/NumberSystems/Integers/Constructions/QuotientOrderedPairs/Equivalence.lean
-- Formal-difference equality, and the quotient carrier it defines.

import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs.Carrier

namespace LRA.NumberSystems.Integers.QuotientOrderedPairs

/-- Equality of formal differences by cross-addition.

Logical form:

```lean
def equivalent
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (first second : Representative whole_data) : Prop :=
  whole_data.addition first.positive_coordinate second.negative_coordinate =
    whole_data.addition second.positive_coordinate first.negative_coordinate
```
-/
def equivalent
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (first second : Representative whole_data) : Prop :=
  whole_data.addition first.positive_coordinate second.negative_coordinate =
    whole_data.addition second.positive_coordinate first.negative_coordinate


/-- Formal-difference equality is an equivalence relation.

*Proof status:* proof pending

Logical form:

```lean
theorem equivalent_is_equivalence_relation
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Equivalence (equivalent whole_data)
```
-/
theorem equivalent_is_equivalence_relation
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Equivalence (equivalent whole_data) := by
  sorry


/-- Setoid of formal differences.

Logical form:

```lean
def representative_setoid (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Setoid (Representative whole_data) where
  r := equivalent whole_data
  iseqv := equivalent_is_equivalence_relation whole_data
```
-/
def representative_setoid (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Setoid (Representative whole_data) where
  r := equivalent whole_data
  iseqv := equivalent_is_equivalence_relation whole_data


/-- Canonical integer carrier.

Logical form:

```lean
abbrev Carrier (whole_data : WholeNumberArithmeticForQuotientPairs) :=
  Quotient (representative_setoid whole_data)
```
-/
abbrev Carrier (whole_data : WholeNumberArithmeticForQuotientPairs) :=
  Quotient (representative_setoid whole_data)

end LRA.NumberSystems.Integers.QuotientOrderedPairs
