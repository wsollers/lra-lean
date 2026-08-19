-- LRA/NumberSystems/Integers/Constructions/Tao/Operations.lean

import LRA.NumberSystems.Integers.Constructions.Tao.WellFoundedness

namespace LRA.NumberSystems.Integers.Tao

/-- Definition 2.1: zero as `0 -- 0`.

Logical form:

```lean
def zero_representative
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    FormalDifference whole_data where
  minuend := whole_data.zero
  subtrahend := whole_data.zero
```
-/
def zero_representative
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    FormalDifference whole_data where
  minuend := whole_data.zero
  subtrahend := whole_data.zero


/-- Definition 2.2: embedding of whole numbers as `n -- 0`.

Logical form:

```lean
def whole_embedding_representative
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (value : whole_data.carrier) : FormalDifference whole_data where
  minuend := value
  subtrahend := whole_data.zero
```
-/
def whole_embedding_representative
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (value : whole_data.carrier) : FormalDifference whole_data where
  minuend := value
  subtrahend := whole_data.zero

/--
**[Def — whole_embedding]**

Logical form:

```lean
def whole_embedding
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    whole_data.carrier → Carrier whole_data :=
  fun value => Quotient.mk (setoid whole_data)
    (whole_embedding_representative whole_data value)
```
-/
def whole_embedding
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    whole_data.carrier → Carrier whole_data :=
  fun value => Quotient.mk (setoid whole_data)
    (whole_embedding_representative whole_data value)

/--
**[Theorem — whole_embedding_is_injective]**

*Proof status:* proof pending

Logical form:

```lean
theorem whole_embedding_is_injective
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    ∀ first second,
      whole_embedding whole_data first = whole_embedding whole_data second →
        first = second
```
-/
theorem whole_embedding_is_injective
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    ∀ first second,
      whole_embedding whole_data first = whole_embedding whole_data second →
        first = second := by
  sorry


/-- Definition 3.1: raw Tao addition.

Logical form:

```lean
def representative_addition
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : FormalDifference whole_data where
  minuend := whole_data.addition first.minuend second.minuend
  subtrahend := whole_data.addition first.subtrahend second.subtrahend
```
-/
def representative_addition
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : FormalDifference whole_data where
  minuend := whole_data.addition first.minuend second.minuend
  subtrahend := whole_data.addition first.subtrahend second.subtrahend


/-- Definition 3.2: raw Tao negation.

Logical form:

```lean
def representative_negation
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (value : FormalDifference whole_data) : FormalDifference whole_data where
  minuend := value.subtrahend
  subtrahend := value.minuend
```
-/
def representative_negation
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (value : FormalDifference whole_data) : FormalDifference whole_data where
  minuend := value.subtrahend
  subtrahend := value.minuend


/-- Definition 4.1: raw Tao multiplication.

Logical form:

```lean
def representative_multiplication
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : FormalDifference whole_data where
  minuend :=
    whole_data.addition
      (whole_data.multiplication first.minuend second.minuend)
      (whole_data.multiplication first.subtrahend second.subtrahend)
  subtrahend :=
    whole_data.addition
      (whole_data.multiplication first.minuend second.subtrahend)
      (whole_data.multiplication first.subtrahend second.minuend)
```
-/
def representative_multiplication
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : FormalDifference whole_data where
  minuend :=
    whole_data.addition
      (whole_data.multiplication first.minuend second.minuend)
      (whole_data.multiplication first.subtrahend second.subtrahend)
  subtrahend :=
    whole_data.addition
      (whole_data.multiplication first.minuend second.subtrahend)
      (whole_data.multiplication first.subtrahend second.minuend)

/--
**[Def — nonnegative]**

Logical form:

```lean
def nonnegative
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (value : FormalDifference whole_data) : Prop :=
  whole_data.nonstrict_order value.subtrahend value.minuend
```
-/
def nonnegative
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (value : FormalDifference whole_data) : Prop :=
  whole_data.nonstrict_order value.subtrahend value.minuend

/--
**[Def — representative_strict_order]**

Logical form:

```lean
def representative_strict_order
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : Prop :=
  whole_data.nonstrict_order
    (whole_data.addition first.minuend second.subtrahend)
    (whole_data.addition second.minuend first.subtrahend) ∧
  ¬ equivalent whole_data first second
```
-/
def representative_strict_order
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : Prop :=
  whole_data.nonstrict_order
    (whole_data.addition first.minuend second.subtrahend)
    (whole_data.addition second.minuend first.subtrahend) ∧
  ¬ equivalent whole_data first second

end LRA.NumberSystems.Integers.Tao
