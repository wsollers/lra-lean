-- LRA/NumberSystems/Integers/Constructions/Mendelson/Operations.lean

import LRA.NumberSystems.Integers.Constructions.Mendelson.WellFoundedness

namespace LRA.NumberSystems.Integers.Mendelson

/-- Definition 2.1: raw Mendelson addition.

Logical form:

```lean
def representative_addition
    (positive_data : PositiveNaturalPairData)
    (first second : PositivePair positive_data) : PositivePair positive_data where
  left := positive_data.addition first.left second.left
  right := positive_data.addition first.right second.right
```
-/
def representative_addition
    (positive_data : PositiveNaturalPairData)
    (first second : PositivePair positive_data) : PositivePair positive_data where
  left := positive_data.addition first.left second.left
  right := positive_data.addition first.right second.right


/-- Definition 2.2: raw additive inverse.

Logical form:

```lean
def representative_negation
    (positive_data : PositiveNaturalPairData)
    (value : PositivePair positive_data) : PositivePair positive_data where
  left := value.right
  right := value.left
```
-/
def representative_negation
    (positive_data : PositiveNaturalPairData)
    (value : PositivePair positive_data) : PositivePair positive_data where
  left := value.right
  right := value.left


/-- Definition 3.1: raw Mendelson multiplication.

Logical form:

```lean
def representative_multiplication
    (positive_data : PositiveNaturalPairData)
    (first second : PositivePair positive_data) : PositivePair positive_data where
  left :=
    positive_data.addition
      (positive_data.multiplication first.left second.left)
      (positive_data.multiplication first.right second.right)
  right :=
    positive_data.addition
      (positive_data.multiplication first.left second.right)
      (positive_data.multiplication first.right second.left)
```
-/
def representative_multiplication
    (positive_data : PositiveNaturalPairData)
    (first second : PositivePair positive_data) : PositivePair positive_data where
  left :=
    positive_data.addition
      (positive_data.multiplication first.left second.left)
      (positive_data.multiplication first.right second.right)
  right :=
    positive_data.addition
      (positive_data.multiplication first.left second.right)
      (positive_data.multiplication first.right second.left)

/--
**[Def — positive_class]**

Logical form:

```lean
def positive_class
    (positive_data : PositiveNaturalPairData)
    (value : PositivePair positive_data) : Prop :=
  positive_data.nonstrict_order value.right value.left ∧
    ¬ equivalent positive_data value
      { left := positive_data.one, right := positive_data.one }
```
-/
def positive_class
    (positive_data : PositiveNaturalPairData)
    (value : PositivePair positive_data) : Prop :=
  positive_data.nonstrict_order value.right value.left ∧
    ¬ equivalent positive_data value
      { left := positive_data.one, right := positive_data.one }

/--
**[Def — representative_strict_order]**

Logical form:

```lean
def representative_strict_order
    (positive_data : PositiveNaturalPairData)
    (first second : PositivePair positive_data) : Prop :=
  positive_class positive_data
    { left := positive_data.addition second.left first.right
      right := positive_data.addition first.left second.right }
```
-/
def representative_strict_order
    (positive_data : PositiveNaturalPairData)
    (first second : PositivePair positive_data) : Prop :=
  positive_class positive_data
    { left := positive_data.addition second.left first.right
      right := positive_data.addition first.left second.right }

end LRA.NumberSystems.Integers.Mendelson
