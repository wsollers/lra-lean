-- LRA/NumberSystems/RealNumbers/Constructions/Cauchy/Carrier.lean
-- The pre-carrier: rational metric data, sequences, distance, positivity,
-- the Cauchy and null conditions, sequence equivalence, and the Cauchy
-- representative structure.

import LRA.UniversalAlgebra.Quotient.RepresentativeCompatibility
import LRA.VolumeII.NumberSystems.Models

namespace LRA.NumberSystems.RealNumbers.Cauchy

open LRA.NumberSystems.Models

/-!
Lean module: LRA.NumberSystems.RealNumbers.Cauchy
Source: LRA/VolumeII/RealNumbers/Cauchy.lean
Verification status: definitions complete; proofs pending

Moved from `LRA.VolumeII.RealNumbers.Cauchy` (previously one file covering
the whole pipeline); split per §1.6.1 into `Carrier` (this file),
`Equivalence`, `WellFoundedness`, `Operations`, `WellDefinedness`, `Laws`,
`Behavior`, `Instances`. See `RealNumbers/ProofOrder.md`.
-/


/-- Absolute-value data required to state the rational Cauchy condition.

Mathematical statement (Lean): `structure RationalMetricData (rational_model : DenselyOrderedFieldModel)`.


Logical form:

```lean
structure RationalMetricData (rational_model : DenselyOrderedFieldModel) where
  absolute_value :
    rational_model.signature.carrier → rational_model.signature.carrier
  absolute_value_zero :
    absolute_value rational_model.signature.zero = rational_model.signature.zero
  absolute_value_negation :
    ∀ value,
      absolute_value (rational_model.signature.neg value) =
        absolute_value value
  triangle_inequality :
    ∀ first second,
      rational_model.signature.le
        (absolute_value
          (rational_model.signature.add first second))
        (rational_model.signature.add
          (absolute_value first)
          (absolute_value second))
  absolute_value_nonnegative :
    ∀ value,
      rational_model.signature.le
        rational_model.signature.zero
        (absolute_value value)
  absolute_value_eq_zero_iff :
    ∀ value,
      absolute_value value = rational_model.signature.zero ↔
        value = rational_model.signature.zero
```
-/
structure RationalMetricData (rational_model : DenselyOrderedFieldModel) where
  absolute_value :
    rational_model.signature.carrier → rational_model.signature.carrier
  absolute_value_zero :
    absolute_value rational_model.signature.zero = rational_model.signature.zero
  absolute_value_negation :
    ∀ value,
      absolute_value (rational_model.signature.neg value) =
        absolute_value value
  triangle_inequality :
    ∀ first second,
      rational_model.signature.le
        (absolute_value
          (rational_model.signature.add first second))
        (rational_model.signature.add
          (absolute_value first)
          (absolute_value second))
  absolute_value_nonnegative :
    ∀ value,
      rational_model.signature.le
        rational_model.signature.zero
        (absolute_value value)
  absolute_value_eq_zero_iff :
    ∀ value,
      absolute_value value = rational_model.signature.zero ↔
        value = rational_model.signature.zero


/-- A rational sequence is a function from the natural numbers to the rational carrier.

Mathematical statement (Lean): `abbrev Sequence (rational_model : DenselyOrderedFieldModel)`.


Logical form:

```lean
abbrev Sequence (rational_model : DenselyOrderedFieldModel) :=
  Nat → rational_model.signature.carrier
```
-/
abbrev Sequence (rational_model : DenselyOrderedFieldModel) :=
  Nat → rational_model.signature.carrier


/-- The distance induced by rational subtraction and absolute value.

Mathematical statement (Lean): `def distance (rational_model : DenselyOrderedFieldModel) (absolute_value_data : RationalMetricData rational_model) (first second : rational_model.signature.carrier) : rational_model.signature.carrier`.


Logical form:

```lean
def distance
    (rational_model : DenselyOrderedFieldModel)
    (absolute_value_data : RationalMetricData rational_model)
    (first second : rational_model.signature.carrier) :
    rational_model.signature.carrier :=
  absolute_value_data.absolute_value
    (rational_model.signature.Subtraction first second)
```
-/
def distance
    (rational_model : DenselyOrderedFieldModel)
    (absolute_value_data : RationalMetricData rational_model)
    (first second : rational_model.signature.carrier) :
    rational_model.signature.carrier :=
  absolute_value_data.absolute_value
    (rational_model.signature.Subtraction first second)


/-- A rational number is positive when it is strictly greater than zero.

Mathematical statement (Lean): `def is_positive (rational_model : DenselyOrderedFieldModel) (value : rational_model.signature.carrier) : Prop`.


Logical form:

```lean
def is_positive
    (rational_model : DenselyOrderedFieldModel)
    (value : rational_model.signature.carrier) : Prop :=
  rational_model.signature.StrictOrder rational_model.signature.zero value
```
-/
def is_positive
    (rational_model : DenselyOrderedFieldModel)
    (value : rational_model.signature.carrier) : Prop :=
  rational_model.signature.StrictOrder rational_model.signature.zero value


/-- The epsilon-tail definition of a rational Cauchy sequence.

Mathematical statement (Lean): `def is_cauchy (rational_model : DenselyOrderedFieldModel) (absolute_value_data : RationalMetricData rational_model) (sequence : Sequence rational_model) : Prop`.


Logical form:

```lean
def is_cauchy
    (rational_model : DenselyOrderedFieldModel)
    (absolute_value_data : RationalMetricData rational_model)
    (sequence : Sequence rational_model) : Prop :=
  ∀ epsilon,
    is_positive rational_model epsilon →
    ∃ threshold : Nat,
      ∀ first_index second_index : Nat,
        threshold ≤ first_index →
        threshold ≤ second_index →
        rational_model.signature.StrictOrder
          (distance rational_model absolute_value_data
            (sequence first_index)
            (sequence second_index))
          epsilon
```
-/
def is_cauchy
    (rational_model : DenselyOrderedFieldModel)
    (absolute_value_data : RationalMetricData rational_model)
    (sequence : Sequence rational_model) : Prop :=
  ∀ epsilon,
    is_positive rational_model epsilon →
    ∃ threshold : Nat,
      ∀ first_index second_index : Nat,
        threshold ≤ first_index →
        threshold ≤ second_index →
        rational_model.signature.StrictOrder
          (distance rational_model absolute_value_data
            (sequence first_index)
            (sequence second_index))
          epsilon


/-- A null sequence converges to rational zero.

Mathematical statement (Lean): `def is_null (rational_model : DenselyOrderedFieldModel) (absolute_value_data : RationalMetricData rational_model) (sequence : Sequence rational_model) : Prop`.


Logical form:

```lean
def is_null
    (rational_model : DenselyOrderedFieldModel)
    (absolute_value_data : RationalMetricData rational_model)
    (sequence : Sequence rational_model) : Prop :=
  ∀ epsilon,
    is_positive rational_model epsilon →
    ∃ threshold : Nat,
      ∀ index : Nat,
        threshold ≤ index →
        rational_model.signature.StrictOrder
          (absolute_value_data.absolute_value (sequence index))
          epsilon
```
-/
def is_null
    (rational_model : DenselyOrderedFieldModel)
    (absolute_value_data : RationalMetricData rational_model)
    (sequence : Sequence rational_model) : Prop :=
  ∀ epsilon,
    is_positive rational_model epsilon →
    ∃ threshold : Nat,
      ∀ index : Nat,
        threshold ≤ index →
        rational_model.signature.StrictOrder
          (absolute_value_data.absolute_value (sequence index))
          epsilon


/-- Two rational sequences are equivalent when their pointwise difference is null.

Mathematical statement (Lean): `def equivalent (rational_model : DenselyOrderedFieldModel) (absolute_value_data : RationalMetricData rational_model) (first second : Sequence rational_model) : Prop`.


Logical form:

```lean
def equivalent
    (rational_model : DenselyOrderedFieldModel)
    (absolute_value_data : RationalMetricData rational_model)
    (first second : Sequence rational_model) : Prop :=
  is_null rational_model absolute_value_data
    (fun index =>
      rational_model.signature.Subtraction
        (first index)
        (second index))
```
-/
def equivalent
    (rational_model : DenselyOrderedFieldModel)
    (absolute_value_data : RationalMetricData rational_model)
    (first second : Sequence rational_model) : Prop :=
  is_null rational_model absolute_value_data
    (fun index =>
      rational_model.signature.Subtraction
        (first index)
        (second index))


/-- The carrier of admissible Cauchy-sequence representatives.

Mathematical statement (Lean): `structure Representative (rational_model : DenselyOrderedFieldModel) (absolute_value_data : RationalMetricData rational_model)`.


Logical form:

```lean
structure Representative
    (rational_model : DenselyOrderedFieldModel)
    (absolute_value_data : RationalMetricData rational_model) where
  sequence : Sequence rational_model
  sequence_is_cauchy :
    is_cauchy rational_model absolute_value_data sequence
```
-/
structure Representative
    (rational_model : DenselyOrderedFieldModel)
    (absolute_value_data : RationalMetricData rational_model) where
  sequence : Sequence rational_model
  sequence_is_cauchy :
    is_cauchy rational_model absolute_value_data sequence

end LRA.NumberSystems.RealNumbers.Cauchy
