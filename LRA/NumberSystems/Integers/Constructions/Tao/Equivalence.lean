-- LRA/NumberSystems/Integers/Constructions/Tao/Equivalence.lean

import LRA.NumberSystems.Integers.Constructions.Tao.Carrier

namespace LRA.NumberSystems.Integers.Tao

/-- Definition 1.2: Tao equality of formal differences.

Logical form:

```lean
def equivalent
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : Prop :=
  whole_data.addition first.minuend second.subtrahend =
    whole_data.addition second.minuend first.subtrahend
```
-/
def equivalent
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : Prop :=
  whole_data.addition first.minuend second.subtrahend =
    whole_data.addition second.minuend first.subtrahend


/-- Theorem 1.3: Tao equality is an equivalence relation.

*Proof status:* proof pending

Logical form:

```lean
theorem equivalent_is_equivalence_relation
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    Equivalence (equivalent whole_data)
```
-/
theorem equivalent_is_equivalence_relation
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    Equivalence (equivalent whole_data) := by
  sorry

/--
**[Def — setoid]**

Logical form:

```lean
def setoid (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    Setoid (FormalDifference whole_data) where
  r := equivalent whole_data
  iseqv := equivalent_is_equivalence_relation whole_data
```
-/
def setoid (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    Setoid (FormalDifference whole_data) where
  r := equivalent whole_data
  iseqv := equivalent_is_equivalence_relation whole_data


/-- Definition 1.4: Tao integer carrier.

Logical form:

```lean
abbrev Carrier (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :=
  Quotient (setoid whole_data)
```
-/
abbrev Carrier (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :=
  Quotient (setoid whole_data)

end LRA.NumberSystems.Integers.Tao
