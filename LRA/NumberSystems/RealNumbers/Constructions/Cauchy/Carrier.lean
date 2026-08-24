
import LRA.UniversalAlgebra.Quotient.RepresentativeCompatibility
import LRA.NumberSystems.RationalNumbers.Definition
import LRA.NumberSystems.Interface.ModelTheory.Model

namespace LRA.NumberSystems.RealNumbers.Cauchy

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers

/--
`RationalMetricData` TODO

Predicate logic:

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
  absolute_value_multiplication :
    ∀ first second,
      absolute_value
        (rationalSystem.FieldModel.signature.multiply first second) =
          rationalSystem.FieldModel.signature.multiply
            (absolute_value first)
            (absolute_value second)
  absolute_value_self_or_neg :
    ∀ value,
      absolute_value value = value ∨
        absolute_value value =
          rationalSystem.FieldModel.signature.neg value
  epsilon_split :
    ∀ epsilon,
      rationalSystem.FieldModel.signature.StrictOrder
        rationalSystem.FieldModel.signature.zero epsilon →
      ∃ smaller,
        rationalSystem.FieldModel.signature.StrictOrder
          rationalSystem.FieldModel.signature.zero smaller ∧
        rationalSystem.FieldModel.signature.le
          (rationalSystem.FieldModel.signature.add smaller smaller)
          epsilon

Predicate logic (unfolded):

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
  absolute_value_multiplication :
    ∀ first second,
      absolute_value
        (rationalSystem.FieldModel.signature.multiply first second) =
          rationalSystem.FieldModel.signature.multiply
            (absolute_value first)
            (absolute_value second)
  absolute_value_self_or_neg :
    ∀ value,
      absolute_value value = value ∨
        absolute_value value =
          rationalSystem.FieldModel.signature.neg value
  epsilon_split :
    ∀ epsilon,
      rationalSystem.FieldModel.signature.StrictOrder
        rationalSystem.FieldModel.signature.zero epsilon →
      ∃ smaller,
        rationalSystem.FieldModel.signature.StrictOrder
          rationalSystem.FieldModel.signature.zero smaller ∧
        rationalSystem.FieldModel.signature.le
          (rationalSystem.FieldModel.signature.add smaller smaller)
          epsilon (source fallback; no compiled unfold data available)

Logical form (Lean):

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
  absolute_value_multiplication :
    ∀ first second,
      absolute_value
        (rationalSystem.FieldModel.signature.multiply first second) =
          rationalSystem.FieldModel.signature.multiply
            (absolute_value first)
            (absolute_value second)
  absolute_value_self_or_neg :
    ∀ value,
      absolute_value value = value ∨
        absolute_value value =
          rationalSystem.FieldModel.signature.neg value
  epsilon_split :
    ∀ epsilon,
      rationalSystem.FieldModel.signature.StrictOrder
        rationalSystem.FieldModel.signature.zero epsilon →
      ∃ smaller,
        rationalSystem.FieldModel.signature.StrictOrder
          rationalSystem.FieldModel.signature.zero smaller ∧
        rationalSystem.FieldModel.signature.le
          (rationalSystem.FieldModel.signature.add smaller smaller)
          epsilon
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, Or.inl, Or.inr, use

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
  absolute_value_multiplication :
    ∀ first second,
      absolute_value
        (rationalSystem.FieldModel.signature.multiply first second) =
          rationalSystem.FieldModel.signature.multiply
            (absolute_value first)
            (absolute_value second)
  absolute_value_self_or_neg :
    ∀ value,
      absolute_value value = value ∨
        absolute_value value =
          rationalSystem.FieldModel.signature.neg value
  epsilon_split :
    ∀ epsilon,
      rationalSystem.FieldModel.signature.StrictOrder
        rationalSystem.FieldModel.signature.zero epsilon →
      ∃ smaller,
        rationalSystem.FieldModel.signature.StrictOrder
          rationalSystem.FieldModel.signature.zero smaller ∧
        rationalSystem.FieldModel.signature.le
          (rationalSystem.FieldModel.signature.add smaller smaller)
          epsilon

/--
`Sequence` TODO

Predicate logic:

  abbrev Sequence (rationalSystem : RationalNumberSystem) :=
  Nat → rationalSystem.FieldModel.signature.carrier

Predicate logic (unfolded):

  abbrev Sequence (rationalSystem : RationalNumberSystem) :=
  Nat → rationalSystem.FieldModel.signature.carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Sequence (rationalSystem : RationalNumberSystem) :=
  Nat → rationalSystem.FieldModel.signature.carrier
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
abbrev Sequence (rationalSystem : RationalNumberSystem) :=
  Nat → rationalSystem.FieldModel.signature.carrier

/--
`distance` TODO

Predicate logic:

  def distance
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : rationalSystem.FieldModel.signature.carrier) :
    rationalSystem.FieldModel.signature.carrier :=
  absolute_value_data.absolute_value
    (rationalSystem.FieldModel.signature.Subtraction first second)

Predicate logic (unfolded):

  def distance
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : rationalSystem.FieldModel.signature.carrier) :
    rationalSystem.FieldModel.signature.carrier :=
  absolute_value_data.absolute_value
    (rationalSystem.FieldModel.signature.Subtraction first second) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def distance
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : rationalSystem.FieldModel.signature.carrier) :
    rationalSystem.FieldModel.signature.carrier :=
  absolute_value_data.absolute_value
    (rationalSystem.FieldModel.signature.Subtraction first second)
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
def distance
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : rationalSystem.FieldModel.signature.carrier) :
    rationalSystem.FieldModel.signature.carrier :=
  absolute_value_data.absolute_value
    (rationalSystem.FieldModel.signature.Subtraction first second)

/--
`is_positive` TODO

Predicate logic:

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (value : rationalSystem.FieldModel.signature.carrier), rationalSystem.FieldModel.ltInst.1 rationalSystem.FieldModel.signature.zero value

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (value : rationalSystem.FieldModel.signature.toCarrierBundle.1), rationalSystem.FieldModel.ltInst.1 rationalSystem.FieldModel.signature.toZeroOneBundle.2 value

Logical form (Lean):

```lean
def is_positive
    (rationalSystem : RationalNumberSystem)
    (value : rationalSystem.FieldModel.signature.carrier) : Prop :=
  rationalSystem.FieldModel.signature.StrictOrder
    rationalSystem.FieldModel.signature.zero value
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
def is_positive
    (rationalSystem : RationalNumberSystem)
    (value : rationalSystem.FieldModel.signature.carrier) : Prop :=
  rationalSystem.FieldModel.signature.StrictOrder
    rationalSystem.FieldModel.signature.zero value

/--
`is_cauchy` TODO

Predicate logic:

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (sequence : LRA.NumberSystems.RealNumbers.Cauchy.Sequence rationalSystem) (epsilon : rationalSystem.FieldModel.signature.carrier), LRA.NumberSystems.RealNumbers.Cauchy.is_positive rationalSystem epsilon → Exists fun threshold => ∀ (first_index second_index : Nat), instLENat.le threshold first_index → instLENat.le threshold second_index → rationalSystem.FieldModel.signature.StrictOrder (LRA.NumberSystems.RealNumbers.Cauchy.distance rationalSystem absolute_value_data (sequence first_index) (sequence second_index)) epsilon

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (sequence : Nat → rationalSystem.FieldModel.signature.toCarrierBundle.1) (epsilon : rationalSystem.FieldModel.signature.toCarrierBundle.1), rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.toZeroOneBundle.2 epsilon → Exists fun threshold => ∀ (first_index second_index : Nat), instLENat.1 threshold first_index → instLENat.1 threshold second_index → rationalSystem.FieldModel.signature.toOrderedRingSignature.2 (absolute_value_data.1 (rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (sequence first_index) (rationalSystem.FieldModel.signature.toRingConceptSignature.2 (sequence second_index)))) epsilon

Logical form (Lean):

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

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

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

/--
`is_null` TODO

Predicate logic:

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (sequence : LRA.NumberSystems.RealNumbers.Cauchy.Sequence rationalSystem) (epsilon : rationalSystem.FieldModel.signature.carrier), LRA.NumberSystems.RealNumbers.Cauchy.is_positive rationalSystem epsilon → Exists fun threshold => ∀ (index : Nat), instLENat.le threshold index → rationalSystem.FieldModel.signature.StrictOrder (absolute_value_data.absolute_value (sequence index)) epsilon

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (sequence : Nat → rationalSystem.FieldModel.signature.toCarrierBundle.1) (epsilon : rationalSystem.FieldModel.signature.toCarrierBundle.1), rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.toZeroOneBundle.2 epsilon → Exists fun threshold => ∀ (index : Nat), instLENat.1 threshold index → rationalSystem.FieldModel.signature.toOrderedRingSignature.2 (absolute_value_data.1 (sequence index)) epsilon

Logical form (Lean):

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

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

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

/--
`equivalent` TODO

Predicate logic:

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (first second : LRA.NumberSystems.RealNumbers.Cauchy.Sequence rationalSystem) (epsilon : rationalSystem.FieldModel.signature.carrier), LRA.NumberSystems.RealNumbers.Cauchy.is_positive rationalSystem epsilon → Exists fun threshold => ∀ (index : Nat), instLENat.le threshold index → rationalSystem.FieldModel.signature.StrictOrder (absolute_value_data.absolute_value ((fun index => rationalSystem.FieldModel.signature.Subtraction (first index) (second index)) index)) epsilon

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (first second : Nat → rationalSystem.FieldModel.signature.toCarrierBundle.1) (epsilon : rationalSystem.FieldModel.signature.toCarrierBundle.1), rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.toZeroOneBundle.2 epsilon → Exists fun threshold => ∀ (index : Nat), instLENat.1 threshold index → rationalSystem.FieldModel.signature.toOrderedRingSignature.2 (absolute_value_data.1 ((fun index => rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (first index) (rationalSystem.FieldModel.signature.toRingConceptSignature.2 (second index))) index)) epsilon

Logical form (Lean):

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
def equivalent
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Sequence rationalSystem) : Prop :=
  is_null rationalSystem absolute_value_data
    (fun index =>
      rationalSystem.FieldModel.signature.Subtraction
        (first index)
        (second index))

/--
`Representative` TODO

Predicate logic:

  structure Representative
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) where
  sequence : Sequence rationalSystem
  sequence_is_cauchy :
    is_cauchy rationalSystem absolute_value_data sequence

Predicate logic (unfolded):

  structure Representative
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) where
  sequence : Sequence rationalSystem
  sequence_is_cauchy :
    is_cauchy rationalSystem absolute_value_data sequence (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure Representative
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) where
  sequence : Sequence rationalSystem
  sequence_is_cauchy :
    is_cauchy rationalSystem absolute_value_data sequence
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
structure Representative
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) where
  sequence : Sequence rationalSystem
  sequence_is_cauchy :
    is_cauchy rationalSystem absolute_value_data sequence

end LRA.NumberSystems.RealNumbers.Cauchy
