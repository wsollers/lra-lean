
import LRA.UniversalAlgebra.Quotient.RepresentativeCompatibility
import LRA.NumberSystems.Integers.Interface.ModelTheory.Model
import LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.Model
import LRA.NumberSystems.RealNumbers.Interface.ModelTheory.Model

namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervals

open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

variable (rational_model : RationalModel)

/--
`Rational` TODO

Predicate logic:

  abbrev Rational := rational_model.signature.carrier

Predicate logic (unfolded):

  abbrev Rational := rational_model.signature.carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Rational := rational_model.signature.carrier
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
abbrev Rational := rational_model.signature.carrier

/--
`nonstrict_order_reflexive` TODO

Predicate logic:

  rational_model.signature.le value value

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (value : rational_model.signature.toCarrierBundle.1), rational_model.signature.toOrderedRingConceptSignature.2 value value

Logical form (Lean):

```lean
theorem nonstrict_order_reflexive
    (value : Rational rational_model) :
    rational_model.signature.le value value
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
theorem nonstrict_order_reflexive
    (value : Rational rational_model) :
    rational_model.signature.le value value := by
  sorry

/--
`RationalInterval` TODO

Predicate logic:

  structure RationalInterval where
  left_endpoint : Rational rational_model
  right_endpoint : Rational rational_model
  endpoints_are_ordered :
    rational_model.signature.le left_endpoint right_endpoint

Predicate logic (unfolded):

  structure RationalInterval where
  left_endpoint : Rational rational_model
  right_endpoint : Rational rational_model
  endpoints_are_ordered :
    rational_model.signature.le left_endpoint right_endpoint (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure RationalInterval where
  left_endpoint : Rational rational_model
  right_endpoint : Rational rational_model
  endpoints_are_ordered :
    rational_model.signature.le left_endpoint right_endpoint
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
structure RationalInterval where
  left_endpoint : Rational rational_model
  right_endpoint : Rational rational_model
  endpoints_are_ordered :
    rational_model.signature.le left_endpoint right_endpoint

/--
`contains` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (interval : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.RationalInterval rational_model) (value : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Rational rational_model), (rational_model.signature.le interval.left_endpoint value ∧ rational_model.signature.le value interval.right_endpoint)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (interval : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.RationalInterval rational_model) (value : rational_model.signature.toCarrierBundle.1), (rational_model.signature.toOrderedRingConceptSignature.2 interval.1 value ∧ rational_model.signature.toOrderedRingConceptSignature.2 value interval.2)

Logical form (Lean):

```lean
def contains
    (interval : RationalInterval rational_model)
    (value : Rational rational_model) : Prop :=
  rational_model.signature.le interval.left_endpoint value ∧
  rational_model.signature.le value interval.right_endpoint
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
    (interval : RationalInterval rational_model)
    (value : Rational rational_model) : Prop :=
  rational_model.signature.le interval.left_endpoint value ∧
  rational_model.signature.le value interval.right_endpoint

/--
`subset` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (inner outer : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.RationalInterval rational_model), (rational_model.signature.le outer.left_endpoint inner.left_endpoint ∧ rational_model.signature.le inner.right_endpoint outer.right_endpoint)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (inner outer : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.RationalInterval rational_model), (rational_model.signature.toOrderedRingConceptSignature.2 outer.1 inner.1 ∧ rational_model.signature.toOrderedRingConceptSignature.2 inner.2 outer.2)

Logical form (Lean):

```lean
def subset
    (inner outer : RationalInterval rational_model) : Prop :=
  rational_model.signature.le
      outer.left_endpoint inner.left_endpoint ∧
  rational_model.signature.le
      inner.right_endpoint outer.right_endpoint
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
def subset
    (inner outer : RationalInterval rational_model) : Prop :=
  rational_model.signature.le
      outer.left_endpoint inner.left_endpoint ∧
  rational_model.signature.le
      inner.right_endpoint outer.right_endpoint

/--
`overlaps` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (first second : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.RationalInterval rational_model), Exists fun value => (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.contains rational_model first value ∧ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.contains rational_model second value)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (first second : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.RationalInterval rational_model), Exists fun value => ((rational_model.signature.toOrderedRingConceptSignature.2 first.1 value ∧ rational_model.signature.toOrderedRingConceptSignature.2 value first.2) ∧ (rational_model.signature.toOrderedRingConceptSignature.2 second.1 value ∧ rational_model.signature.toOrderedRingConceptSignature.2 value second.2))

Logical form (Lean):

```lean
def overlaps
    (first second : RationalInterval rational_model) : Prop :=
  ∃ value,
    contains rational_model first value ∧
    contains rational_model second value
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use, unfold

-/
def overlaps
    (first second : RationalInterval rational_model) : Prop :=
  ∃ value,
    contains rational_model first value ∧
    contains rational_model second value

/--
`width` TODO

Predicate logic:

  def width
    (interval : RationalInterval rational_model) : Rational rational_model :=
  rational_model.signature.Subtraction
    interval.right_endpoint interval.left_endpoint

Predicate logic (unfolded):

  def width
    (interval : RationalInterval rational_model) : Rational rational_model :=
  rational_model.signature.Subtraction
    interval.right_endpoint interval.left_endpoint (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def width
    (interval : RationalInterval rational_model) : Rational rational_model :=
  rational_model.signature.Subtraction
    interval.right_endpoint interval.left_endpoint
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
    (interval : RationalInterval rational_model) : Rational rational_model :=
  rational_model.signature.Subtraction
    interval.right_endpoint interval.left_endpoint

/--
`IntervalSequence` TODO

Predicate logic:

  abbrev IntervalSequence := Nat → RationalInterval rational_model

Predicate logic (unfolded):

  abbrev IntervalSequence := Nat → RationalInterval rational_model (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev IntervalSequence := Nat → RationalInterval rational_model
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
abbrev IntervalSequence := Nat → RationalInterval rational_model

/--
`Representative` TODO

Predicate logic:

  structure Representative where
  interval : IntervalSequence rational_model
  nested :
    ∀ index,
      subset rational_model (interval (index + 1)) (interval index)
  widths_converge_to_zero :
    ∀ epsilon,
      rational_model.signature.StrictOrder
        rational_model.signature.zero epsilon →
      ∃ threshold : Nat,
        ∀ index,
          threshold ≤ index →
          rational_model.signature.StrictOrder
            (width rational_model (interval index)) epsilon

Predicate logic (unfolded):

  structure Representative where
  interval : IntervalSequence rational_model
  nested :
    ∀ index,
      subset rational_model (interval (index + 1)) (interval index)
  widths_converge_to_zero :
    ∀ epsilon,
      rational_model.signature.StrictOrder
        rational_model.signature.zero epsilon →
      ∃ threshold : Nat,
        ∀ index,
          threshold ≤ index →
          rational_model.signature.StrictOrder
            (width rational_model (interval index)) epsilon (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure Representative where
  interval : IntervalSequence rational_model
  nested :
    ∀ index,
      subset rational_model (interval (index + 1)) (interval index)
  widths_converge_to_zero :
    ∀ epsilon,
      rational_model.signature.StrictOrder
        rational_model.signature.zero epsilon →
      ∃ threshold : Nat,
        ∀ index,
          threshold ≤ index →
          rational_model.signature.StrictOrder
            (width rational_model (interval index)) epsilon
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
structure Representative where
  interval : IntervalSequence rational_model
  nested :
    ∀ index,
      subset rational_model (interval (index + 1)) (interval index)
  widths_converge_to_zero :
    ∀ epsilon,
      rational_model.signature.StrictOrder
        rational_model.signature.zero epsilon →
      ∃ threshold : Nat,
        ∀ index,
          threshold ≤ index →
          rational_model.signature.StrictOrder
            (width rational_model (interval index)) epsilon

/--
`degenerate_interval` TODO

Predicate logic:

  def degenerate_interval
    (value : Rational rational_model) : RationalInterval rational_model where
  left_endpoint := value
  right_endpoint := value
  endpoints_are_ordered := nonstrict_order_reflexive rational_model value

Predicate logic (unfolded):

  def degenerate_interval
    (value : Rational rational_model) : RationalInterval rational_model where
  left_endpoint := value
  right_endpoint := value
  endpoints_are_ordered := nonstrict_order_reflexive rational_model value (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def degenerate_interval
    (value : Rational rational_model) : RationalInterval rational_model where
  left_endpoint := value
  right_endpoint := value
  endpoints_are_ordered := nonstrict_order_reflexive rational_model value
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
def degenerate_interval
    (value : Rational rational_model) : RationalInterval rational_model where
  left_endpoint := value
  right_endpoint := value
  endpoints_are_ordered := nonstrict_order_reflexive rational_model value

end LRA.NumberSystems.RealNumbers.PrimitiveIntervals
