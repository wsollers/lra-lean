
import LRA.NumberSystems.RealNumbers.Extensions

namespace LRA.NumberSystems.RealNumbers.IntervalArithmetic
open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

/--
`Interval` TODO

Predicate logic:

  structure Interval (real_model : RealModel) where
  lower : real_model.signature.carrier
  upper : real_model.signature.carrier

Predicate logic (unfolded):

  structure Interval (real_model : RealModel) where
  lower : real_model.signature.carrier
  upper : real_model.signature.carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure Interval (real_model : RealModel) where
  lower : real_model.signature.carrier
  upper : real_model.signature.carrier
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
structure Interval (real_model : RealModel) where
  lower : real_model.signature.carrier
  upper : real_model.signature.carrier

/--
`valid` TODO

Predicate logic:

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (interval : LRA.NumberSystems.RealNumbers.IntervalArithmetic.Interval real_model), real_model.leInst.1 interval.lower interval.upper

Predicate logic (unfolded):

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (interval : LRA.NumberSystems.RealNumbers.IntervalArithmetic.Interval real_model), real_model.leInst.1 interval.1 interval.2

Logical form (Lean):

```lean
def valid
    (real_model : RealModel)
    (interval : Interval real_model) : Prop :=
  real_model.signature.le interval.lower interval.upper
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def valid
    (real_model : RealModel)
    (interval : Interval real_model) : Prop :=
  real_model.signature.le interval.lower interval.upper

/--
`contains` TODO

Predicate logic:

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (interval : LRA.NumberSystems.RealNumbers.IntervalArithmetic.Interval real_model) (value : real_model.signature.carrier), (real_model.signature.le interval.lower value ∧ real_model.signature.le value interval.upper)

Predicate logic (unfolded):

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (interval : LRA.NumberSystems.RealNumbers.IntervalArithmetic.Interval real_model) (value : real_model.signature.toCarrierBundle.1), (real_model.signature.toOrderedRingConceptSignature.2 interval.1 value ∧ real_model.signature.toOrderedRingConceptSignature.2 value interval.2)

Logical form (Lean):

```lean
def contains
    (real_model : RealModel)
    (interval : Interval real_model)
    (value : real_model.signature.carrier) : Prop :=
  real_model.signature.le interval.lower value ∧
    real_model.signature.le value interval.upper
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def contains
    (real_model : RealModel)
    (interval : Interval real_model)
    (value : real_model.signature.carrier) : Prop :=
  real_model.signature.le interval.lower value ∧
    real_model.signature.le value interval.upper

/--
`width` TODO

Predicate logic:

  def width
    (real_model : RealModel)
    (interval : Interval real_model) : real_model.signature.carrier :=
  real_model.signature.add interval.upper
    (real_model.signature.neg interval.lower)

Predicate logic (unfolded):

  def width
    (real_model : RealModel)
    (interval : Interval real_model) : real_model.signature.carrier :=
  real_model.signature.add interval.upper
    (real_model.signature.neg interval.lower) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def width
    (real_model : RealModel)
    (interval : Interval real_model) : real_model.signature.carrier :=
  real_model.signature.add interval.upper
    (real_model.signature.neg interval.lower)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def width
    (real_model : RealModel)
    (interval : Interval real_model) : real_model.signature.carrier :=
  real_model.signature.add interval.upper
    (real_model.signature.neg interval.lower)

/--
`enclosure_addition` TODO

Predicate logic:

  def enclosure_addition
    (real_model : RealModel)
    (first second : Interval real_model) : Interval real_model where
  lower := real_model.signature.add first.lower second.lower
  upper := real_model.signature.add first.upper second.upper

Predicate logic (unfolded):

  def enclosure_addition
    (real_model : RealModel)
    (first second : Interval real_model) : Interval real_model where
  lower := real_model.signature.add first.lower second.lower
  upper := real_model.signature.add first.upper second.upper (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def enclosure_addition
    (real_model : RealModel)
    (first second : Interval real_model) : Interval real_model where
  lower := real_model.signature.add first.lower second.lower
  upper := real_model.signature.add first.upper second.upper
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def enclosure_addition
    (real_model : RealModel)
    (first second : Interval real_model) : Interval real_model where
  lower := real_model.signature.add first.lower second.lower
  upper := real_model.signature.add first.upper second.upper

/--
`enclosure_addition_is_valid` TODO

Predicate logic:

  (∀ real_model ∈ RealModel), valid real_model (enclosure_addition real_model first second)

Predicate logic (unfolded):

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (first second : LRA.NumberSystems.RealNumbers.IntervalArithmetic.Interval real_model), (real_model.signature.toOrderedRingConceptSignature.2 first.1 first.2 ∧ real_model.signature.toOrderedRingConceptSignature.2 second.1 second.2) → real_model.signature.toOrderedRingConceptSignature.2 (LRA.NumberSystems.RealNumbers.IntervalArithmetic.enclosure_addition real_model first second).1 (LRA.NumberSystems.RealNumbers.IntervalArithmetic.enclosure_addition real_model first second).2

Logical form (Lean):

```lean
theorem enclosure_addition_is_valid
    (real_model : RealModel)
    (first second : Interval real_model)
    (first_valid : valid real_model first)
    (second_valid : valid real_model second) :
    valid real_model (enclosure_addition real_model first second)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem enclosure_addition_is_valid
    (real_model : RealModel)
    (first second : Interval real_model)
    (first_valid : valid real_model first)
    (second_valid : valid real_model second) :
    valid real_model (enclosure_addition real_model first second) := by
  sorry

/--
`EnclosesBinaryOperation` TODO

Predicate logic:

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

Predicate logic (unfolded):

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
          (point_operation first_value second_value) (source fallback; no compiled unfold data available)

Logical form (Lean):

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

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

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
`addition_enclosure_is_sound` TODO

Predicate logic:

  (∀ real_model ∈ RealModel), EnclosesBinaryOperation real_model (enclosure_addition real_model) real_model.signature.add

Predicate logic (unfolded):

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel), LRA.NumberSystems.RealNumbers.IntervalArithmetic.EnclosesBinaryOperation real_model (fun first second => { lower := real_model.signature.toBooleanRingOperationBundle.2 first.1 second.1, upper := real_model.signature.toBooleanRingOperationBundle.2 first.2 second.2 }) real_model.signature.toBooleanRingOperationBundle.2

Logical form (Lean):

```lean
theorem addition_enclosure_is_sound
    (real_model : RealModel) :
    EnclosesBinaryOperation real_model
      (enclosure_addition real_model)
      real_model.signature.add
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem addition_enclosure_is_sound
    (real_model : RealModel) :
    EnclosesBinaryOperation real_model
      (enclosure_addition real_model)
      real_model.signature.add := by
  sorry

/--
`dependency_can_make_enclosures_strict` TODO

Predicate logic:

  (∀ real_model ∈ RealModel), ∃ interval ∈ Interval real_model, ∃ expression_enclosure direct_enclosure ∈ Interval real_model, (∀ value, contains real_model direct_enclosure value → contains real_model expression_enclosure value) ∧ expression_enclosure ≠ direct_enclosure

Predicate logic (unfolded):

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel), Exists fun interval => Exists fun expression_enclosure => Exists fun direct_enclosure => (∀ (value : real_model.signature.toCarrierBundle.1), (real_model.signature.toOrderedRingConceptSignature.2 direct_enclosure.1 value ∧ real_model.signature.toOrderedRingConceptSignature.2 value direct_enclosure.2) → (real_model.signature.toOrderedRingConceptSignature.2 expression_enclosure.1 value ∧ real_model.signature.toOrderedRingConceptSignature.2 value expression_enclosure.2) ∧ expression_enclosure = direct_enclosure → False)

Logical form (Lean):

```lean
theorem dependency_can_make_enclosures_strict
    (real_model : RealModel) :
    ∃ interval : Interval real_model,
      ∃ expression_enclosure direct_enclosure : Interval real_model,
        (∀ value, contains real_model direct_enclosure value →
          contains real_model expression_enclosure value) ∧
        expression_enclosure ≠ direct_enclosure
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

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
