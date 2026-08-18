-- LRA/VolumeII/Reals/IntervalArithmetic.lean
-- Interval arithmetic over an existing real field.

import LRA.VolumeII.RealNumbers.Extensions

namespace LRA.NumberSystems.RealNumbers.IntervalArithmetic
open LRA.NumberSystems.Models

/-!
Volume II label: interval-arithmetic-over-reals
Lean module: LRA.NumberSystems.RealNumbers.IntervalArithmetic
Source: docs/number-systems/gpt-08d-interval-arithmetic-over-RealNumbers.md
Verification status: statement-accepted-proof-pending
-/

open LRA.NumberSystems.Models

/--
**[Structure — Interval]**

Mathematical statement (Lean): `structure Interval (real_model : RealModel)`.


Logical form:

```lean
structure Interval (real_model : RealModel) where
  lower : real_model.signature.carrier
  upper : real_model.signature.carrier
```
-/
structure Interval (real_model : RealModel) where
  lower : real_model.signature.carrier
  upper : real_model.signature.carrier

/--
**[Def — valid]**

Mathematical statement (Lean): `def valid (real_model : RealModel) (interval : Interval real_model) : Prop`.


Logical form:

```lean
def valid
    (real_model : RealModel)
    (interval : Interval real_model) : Prop :=
  real_model.signature.le interval.lower interval.upper
```
-/
def valid
    (real_model : RealModel)
    (interval : Interval real_model) : Prop :=
  real_model.signature.le interval.lower interval.upper

/--
**[Def — contains]**

Mathematical statement (Lean): `def contains (real_model : RealModel) (interval : Interval real_model) (value : real_model.signature.carrier) : Prop`.


Logical form:

```lean
def contains
    (real_model : RealModel)
    (interval : Interval real_model)
    (value : real_model.signature.carrier) : Prop :=
  real_model.signature.le interval.lower value ∧
    real_model.signature.le value interval.upper
```
-/
def contains
    (real_model : RealModel)
    (interval : Interval real_model)
    (value : real_model.signature.carrier) : Prop :=
  real_model.signature.le interval.lower value ∧
    real_model.signature.le value interval.upper

/--
**[Def — width]**

Mathematical statement (Lean): `def width (real_model : RealModel) (interval : Interval real_model) : real_model.signature.carrier`.


Logical form:

```lean
def width
    (real_model : RealModel)
    (interval : Interval real_model) : real_model.signature.carrier :=
  real_model.signature.add interval.upper
    (real_model.signature.neg interval.lower)
```
-/
def width
    (real_model : RealModel)
    (interval : Interval real_model) : real_model.signature.carrier :=
  real_model.signature.add interval.upper
    (real_model.signature.neg interval.lower)

/--
**[Def — enclosure_addition]**

Mathematical statement (Lean): `def enclosure_addition (real_model : RealModel) (first second : Interval real_model) : Interval real_model`.


Logical form:

```lean
def enclosure_addition
    (real_model : RealModel)
    (first second : Interval real_model) : Interval real_model where
  lower := real_model.signature.add first.lower second.lower
  upper := real_model.signature.add first.upper second.upper
```
-/
def enclosure_addition
    (real_model : RealModel)
    (first second : Interval real_model) : Interval real_model where
  lower := real_model.signature.add first.lower second.lower
  upper := real_model.signature.add first.upper second.upper

/--
**[Theorem — enclosure_addition_is_valid]**

Mathematical statement (Lean): `theorem enclosure_addition_is_valid (real_model : RealModel) (first second : Interval real_model) (first_valid : valid real_model first) (second_valid : valid real_model second) : valid real_model (enclosure_addition real_model first second)`.

*Proof status:* proof pending


Logical form:

```lean
theorem enclosure_addition_is_valid
    (real_model : RealModel)
    (first second : Interval real_model)
    (first_valid : valid real_model first)
    (second_valid : valid real_model second) :
    valid real_model (enclosure_addition real_model first second)
```
-/
theorem enclosure_addition_is_valid
    (real_model : RealModel)
    (first second : Interval real_model)
    (first_valid : valid real_model first)
    (second_valid : valid real_model second) :
    valid real_model (enclosure_addition real_model first second) := by
  sorry

/--
**[Structure — EnclosesBinaryOperation]**

Mathematical statement (Lean): `structure EnclosesBinaryOperation (real_model : RealModel) (interval_operation : Interval real_model → Interval real_model → Interval real_model) (point_operation : real_model.signature.carrier → real_model.signature.carrier → real_model.signature.carrier)...`.


Logical form:

```lean
structure EnclosesBinaryOperation
    (real_model : RealModel)
    (interval_operation : Interval real_model → Interval real_model → Interval real_model)
    (point_operation :
      real_model.signature.carrier → real_model.signature.carrier →
        real_model.signature.carrier) : Prop where
  encloses :
    ∀ first_interval second_interval first_value second_value,
      contains real_model first_interval first_value →
      contains real_model second_interval second_value →
      valid real_model first_interval →
      valid real_model second_interval →
        contains real_model
          (interval_operation first_interval second_interval)
          (point_operation first_value second_value)
```
-/
structure EnclosesBinaryOperation
    (real_model : RealModel)
    (interval_operation : Interval real_model → Interval real_model → Interval real_model)
    (point_operation :
      real_model.signature.carrier → real_model.signature.carrier →
        real_model.signature.carrier) : Prop where
  encloses :
    ∀ first_interval second_interval first_value second_value,
      contains real_model first_interval first_value →
      contains real_model second_interval second_value →
      valid real_model first_interval →
      valid real_model second_interval →
        contains real_model
          (interval_operation first_interval second_interval)
          (point_operation first_value second_value)

/--
**[Theorem — addition_enclosure_is_sound]**

Mathematical statement (Lean): `theorem addition_enclosure_is_sound (real_model : RealModel) : EnclosesBinaryOperation real_model (enclosure_addition real_model) real_model.signature.add`.

*Proof status:* proof pending


Logical form:

```lean
theorem addition_enclosure_is_sound
    (real_model : RealModel) :
    EnclosesBinaryOperation real_model
      (enclosure_addition real_model)
      real_model.signature.add
```
-/
theorem addition_enclosure_is_sound
    (real_model : RealModel) :
    EnclosesBinaryOperation real_model
      (enclosure_addition real_model)
      real_model.signature.add := by
  sorry

/--
**[Theorem — dependency_can_make_enclosures_strict]**

Mathematical statement (Lean): `theorem dependency_can_make_enclosures_strict (real_model : RealModel) : ∃ interval : Interval real_model, ∃ expression_enclosure direct_enclosure : Interval real_model, (∀ value, contains real_model direct_enclosure value → contains real_model expression_e...`.

*Proof status:* proof pending


Logical form:

```lean
theorem dependency_can_make_enclosures_strict
    (real_model : RealModel) :
    ∃ interval : Interval real_model,
      ∃ expression_enclosure direct_enclosure : Interval real_model,
        (∀ value, contains real_model direct_enclosure value →
          contains real_model expression_enclosure value) ∧
        expression_enclosure ≠ direct_enclosure
```
-/
theorem dependency_can_make_enclosures_strict
    (real_model : RealModel) :
    ∃ interval : Interval real_model,
      ∃ expression_enclosure direct_enclosure : Interval real_model,
        (∀ value, contains real_model direct_enclosure value →
          contains real_model expression_enclosure value) ∧
        expression_enclosure ≠ direct_enclosure := by
  sorry

end LRA.NumberSystems.RealNumbers.IntervalArithmetic
