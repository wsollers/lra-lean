-- LRA/NumberSystems/Integers/Constructions/Mendelson/Equivalence.lean

import LRA.NumberSystems.Integers.Constructions.Mendelson.Carrier

namespace LRA.NumberSystems.Integers.Mendelson

/-- Definition 1.2: Mendelson positive-pair equivalence.

Logical form:

```lean
def equivalent
    (positive_data : PositiveNaturalPairData)
    (first second : PositivePair positive_data) : Prop :=
  positive_data.addition first.left second.right =
    positive_data.addition second.left first.right
```
-/
def equivalent
    (positive_data : PositiveNaturalPairData)
    (first second : PositivePair positive_data) : Prop :=
  positive_data.addition first.left second.right =
    positive_data.addition second.left first.right

/-- Formal-difference equality is an equivalence relation.

*Proof status:* proof pending

Logical form:

```lean
theorem equivalent_is_equivalence_relation
    (positive_data : PositiveNaturalPairData) :
    Equivalence (equivalent positive_data)
```
-/
theorem equivalent_is_equivalence_relation
    (positive_data : PositiveNaturalPairData) :
    Equivalence (equivalent positive_data) := by
  sorry

/--
**[Def — setoid]**

Logical form:

```lean
def setoid (positive_data : PositiveNaturalPairData) :
    Setoid (PositivePair positive_data) where
  r := equivalent positive_data
  iseqv := equivalent_is_equivalence_relation positive_data
```
-/
def setoid (positive_data : PositiveNaturalPairData) :
    Setoid (PositivePair positive_data) where
  r := equivalent positive_data
  iseqv := equivalent_is_equivalence_relation positive_data


/-- Definition 1.3: Mendelson integer carrier.

Logical form:

```lean
abbrev Carrier (positive_data : PositiveNaturalPairData) :=
  Quotient (setoid positive_data)
```
-/
abbrev Carrier (positive_data : PositiveNaturalPairData) :=
  Quotient (setoid positive_data)

end LRA.NumberSystems.Integers.Mendelson
