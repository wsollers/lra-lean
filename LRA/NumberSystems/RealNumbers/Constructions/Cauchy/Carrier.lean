-- LRA/NumberSystems/RealNumbers/Constructions/Cauchy/Carrier.lean
-- The pre-carrier: rational metric data, sequences, distance, positivity,
-- the Cauchy and null conditions, sequence equivalence, and the Cauchy
-- representative structure.

import LRA.UniversalAlgebra.Quotient.RepresentativeCompatibility
import LRA.NumberSystems.RationalNumbers.Definition
import LRA.VolumeII.NumberSystems.Models

namespace LRA.NumberSystems.RealNumbers.Cauchy

open LRA.NumberSystems.Models
open LRA.NumberSystems.RationalNumbers

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

Mathematical statement (Lean): `structure RationalMetricData (rationalSystem : RationalNumberSystem)`.


Logical form:

```lean
structure RationalMetricData (rationalSystem : RationalNumberSystem) where
  absolute_value :
    rationalSystem.FieldModel.signature.carrier →
      rationalSystem.FieldModel.signature.carrier
  absolute_value_zero :
    absolute_value rationalSystem.FieldModel.signature.zero =
      rationalSystem.FieldModel.signature.zero
  absolute_value_negation :
    ∀ value,
      absolute_value (rationalSystem.FieldModel.signature.neg value) =
        absolute_value value
  triangle_inequality :
    ∀ first second,
      rationalSystem.FieldModel.signature.le
        (absolute_value
          (rationalSystem.FieldModel.signature.add first second))
        (rationalSystem.FieldModel.signature.add
          (absolute_value first)
          (absolute_value second))
  absolute_value_nonnegative :
    ∀ value,
      rationalSystem.FieldModel.signature.le
        rationalSystem.FieldModel.signature.zero
        (absolute_value value)
  absolute_value_eq_zero_iff :
    ∀ value,
      absolute_value value = rationalSystem.FieldModel.signature.zero ↔
        value = rationalSystem.FieldModel.signature.zero
```
-/
structure RationalMetricData (rationalSystem : RationalNumberSystem) where
  absolute_value :
    rationalSystem.FieldModel.signature.carrier →
      rationalSystem.FieldModel.signature.carrier
  absolute_value_zero :
    absolute_value rationalSystem.FieldModel.signature.zero =
      rationalSystem.FieldModel.signature.zero
  absolute_value_negation :
    ∀ value,
      absolute_value (rationalSystem.FieldModel.signature.neg value) =
        absolute_value value
  triangle_inequality :
    ∀ first second,
      rationalSystem.FieldModel.signature.le
        (absolute_value
          (rationalSystem.FieldModel.signature.add first second))
        (rationalSystem.FieldModel.signature.add
          (absolute_value first)
          (absolute_value second))
  absolute_value_nonnegative :
    ∀ value,
      rationalSystem.FieldModel.signature.le
        rationalSystem.FieldModel.signature.zero
        (absolute_value value)
  absolute_value_eq_zero_iff :
    ∀ value,
      absolute_value value = rationalSystem.FieldModel.signature.zero ↔
        value = rationalSystem.FieldModel.signature.zero


/-- A rational sequence is a function from the natural numbers to the rational carrier.

Mathematical statement (Lean): `abbrev Sequence (rationalSystem : RationalNumberSystem)`.


Logical form:

```lean
abbrev Sequence (rationalSystem : RationalNumberSystem) :=
  Nat → rationalSystem.FieldModel.signature.carrier
```
-/
abbrev Sequence (rationalSystem : RationalNumberSystem) :=
  Nat → rationalSystem.FieldModel.signature.carrier


/-- The distance induced by rational subtraction and absolute value.

Mathematical statement (Lean): `def distance (rationalSystem : RationalNumberSystem) (absolute_value_data : RationalMetricData rationalSystem) (first second : rationalSystem.FieldModel.signature.carrier) : rationalSystem.FieldModel.signature.carrier`.


Logical form:

```lean
def distance
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : rationalSystem.FieldModel.signature.carrier) :
    rationalSystem.FieldModel.signature.carrier :=
  absolute_value_data.absolute_value
    (rationalSystem.FieldModel.signature.Subtraction first second)
```
-/
def distance
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : rationalSystem.FieldModel.signature.carrier) :
    rationalSystem.FieldModel.signature.carrier :=
  absolute_value_data.absolute_value
    (rationalSystem.FieldModel.signature.Subtraction first second)


/-- A rational number is positive when it is strictly greater than zero.

Mathematical statement (Lean): `def is_positive (rationalSystem : RationalNumberSystem) (value : rationalSystem.FieldModel.signature.carrier) : Prop`.


Logical form:

```lean
def is_positive
    (rationalSystem : RationalNumberSystem)
    (value : rationalSystem.FieldModel.signature.carrier) : Prop :=
  rationalSystem.FieldModel.signature.StrictOrder
    rationalSystem.FieldModel.signature.zero value
```
-/
def is_positive
    (rationalSystem : RationalNumberSystem)
    (value : rationalSystem.FieldModel.signature.carrier) : Prop :=
  rationalSystem.FieldModel.signature.StrictOrder
    rationalSystem.FieldModel.signature.zero value


/-- The epsilon-tail definition of a rational Cauchy sequence.

Mathematical statement (Lean): `def is_cauchy (rationalSystem : RationalNumberSystem) (absolute_value_data : RationalMetricData rationalSystem) (sequence : Sequence rationalSystem) : Prop`.


Logical form:

```lean
def is_cauchy
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (sequence : Sequence rationalSystem) : Prop :=
  ∀ epsilon,
    is_positive rationalSystem epsilon →
    ∃ threshold : Nat,
      ∀ first_index second_index : Nat,
        threshold ≤ first_index →
        threshold ≤ second_index →
        rationalSystem.FieldModel.signature.StrictOrder
          (distance rationalSystem absolute_value_data
            (sequence first_index)
            (sequence second_index))
          epsilon
```
-/
def is_cauchy
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (sequence : Sequence rationalSystem) : Prop :=
  ∀ epsilon,
    is_positive rationalSystem epsilon →
    ∃ threshold : Nat,
      ∀ first_index second_index : Nat,
        threshold ≤ first_index →
        threshold ≤ second_index →
        rationalSystem.FieldModel.signature.StrictOrder
          (distance rationalSystem absolute_value_data
            (sequence first_index)
            (sequence second_index))
          epsilon


/-- A null sequence converges to rational zero.

Mathematical statement (Lean): `def is_null (rationalSystem : RationalNumberSystem) (absolute_value_data : RationalMetricData rationalSystem) (sequence : Sequence rationalSystem) : Prop`.


Logical form:

```lean
def is_null
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (sequence : Sequence rationalSystem) : Prop :=
  ∀ epsilon,
    is_positive rationalSystem epsilon →
    ∃ threshold : Nat,
      ∀ index : Nat,
        threshold ≤ index →
        rationalSystem.FieldModel.signature.StrictOrder
          (absolute_value_data.absolute_value (sequence index))
          epsilon
```
-/
def is_null
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (sequence : Sequence rationalSystem) : Prop :=
  ∀ epsilon,
    is_positive rationalSystem epsilon →
    ∃ threshold : Nat,
      ∀ index : Nat,
        threshold ≤ index →
        rationalSystem.FieldModel.signature.StrictOrder
          (absolute_value_data.absolute_value (sequence index))
          epsilon


/-- Two rational sequences are equivalent when their pointwise difference is null.

Mathematical statement (Lean): `def equivalent (rationalSystem : RationalNumberSystem) (absolute_value_data : RationalMetricData rationalSystem) (first second : Sequence rationalSystem) : Prop`.


Logical form:

```lean
def equivalent
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Sequence rationalSystem) : Prop :=
  is_null rationalSystem absolute_value_data
    (fun index =>
      rationalSystem.FieldModel.signature.Subtraction
        (first index)
        (second index))
```
-/
def equivalent
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Sequence rationalSystem) : Prop :=
  is_null rationalSystem absolute_value_data
    (fun index =>
      rationalSystem.FieldModel.signature.Subtraction
        (first index)
        (second index))


/-- The carrier of admissible Cauchy-sequence representatives.

Mathematical statement (Lean): `structure Representative (rationalSystem : RationalNumberSystem) (absolute_value_data : RationalMetricData rationalSystem)`.


Logical form:

```lean
structure Representative
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) where
  sequence : Sequence rationalSystem
  sequence_is_cauchy :
    is_cauchy rationalSystem absolute_value_data sequence
```
-/
structure Representative
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) where
  sequence : Sequence rationalSystem
  sequence_is_cauchy :
    is_cauchy rationalSystem absolute_value_data sequence

end LRA.NumberSystems.RealNumbers.Cauchy
