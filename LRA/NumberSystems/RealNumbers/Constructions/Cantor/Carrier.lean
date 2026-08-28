
import LRA.NumberSystems.Integers.Interface.ModelTheory.Model
import LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.Model
import LRA.NumberSystems.RealNumbers.Interface.ModelTheory.Model

namespace LRA.NumberSystems.RealNumbers.Cantor
open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

/--
`EndpointInterval` TODO

Predicate logic:

  structure EndpointInterval (rational_model : RationalModel) where
  lower : rational_model.signature.carrier
  upper : rational_model.signature.carrier
  lower_le_upper :
    rational_model.signature.le lower upper

Predicate logic (unfolded):

  structure EndpointInterval (rational_model : RationalModel) where
  lower : rational_model.signature.carrier
  upper : rational_model.signature.carrier
  lower_le_upper :
    rational_model.signature.le lower upper (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure EndpointInterval (rational_model : RationalModel) where
  lower : rational_model.signature.carrier
  upper : rational_model.signature.carrier
  lower_le_upper :
    rational_model.signature.le lower upper
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
structure EndpointInterval (rational_model : RationalModel) where
  lower : rational_model.signature.carrier
  upper : rational_model.signature.carrier
  lower_le_upper :
    rational_model.signature.le lower upper

/--
`NestedIntervalSequence` TODO

Predicate logic:

  structure NestedIntervalSequence (rational_model : RationalModel) where
  interval : Nat → EndpointInterval rational_model
  nested :
    ∀ index : Nat,
      rational_model.signature.le
        (interval index).lower ((interval (index + 1)).lower) ∧
      rational_model.signature.le
        ((interval (index + 1)).upper) (interval index).upper
  widths_converge_to_zero :
    ∀ positive_tolerance : rational_model.signature.carrier,
      rational_model.signature.StrictOrder rational_model.signature.zero positive_tolerance →
        ∃ index : Nat,
          rational_model.signature.StrictOrder
            (rational_model.signature.add
              (interval index).upper
              (rational_model.signature.neg (interval index).lower))
            positive_tolerance

Predicate logic (unfolded):

  structure NestedIntervalSequence (rational_model : RationalModel) where
  interval : Nat → EndpointInterval rational_model
  nested :
    ∀ index : Nat,
      rational_model.signature.le
        (interval index).lower ((interval (index + 1)).lower) ∧
      rational_model.signature.le
        ((interval (index + 1)).upper) (interval index).upper
  widths_converge_to_zero :
    ∀ positive_tolerance : rational_model.signature.carrier,
      rational_model.signature.StrictOrder rational_model.signature.zero positive_tolerance →
        ∃ index : Nat,
          rational_model.signature.StrictOrder
            (rational_model.signature.add
              (interval index).upper
              (rational_model.signature.neg (interval index).lower))
            positive_tolerance (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure NestedIntervalSequence (rational_model : RationalModel) where
  interval : Nat → EndpointInterval rational_model
  nested :
    ∀ index : Nat,
      rational_model.signature.le
        (interval index).lower ((interval (index + 1)).lower) ∧
      rational_model.signature.le
        ((interval (index + 1)).upper) (interval index).upper
  widths_converge_to_zero :
    ∀ positive_tolerance : rational_model.signature.carrier,
      rational_model.signature.StrictOrder rational_model.signature.zero positive_tolerance →
        ∃ index : Nat,
          rational_model.signature.StrictOrder
            (rational_model.signature.add
              (interval index).upper
              (rational_model.signature.neg (interval index).lower))
            positive_tolerance
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
structure NestedIntervalSequence (rational_model : RationalModel) where
  interval : Nat → EndpointInterval rational_model
  nested :
    ∀ index : Nat,
      rational_model.signature.le
        (interval index).lower ((interval (index + 1)).lower) ∧
      rational_model.signature.le
        ((interval (index + 1)).upper) (interval index).upper
  widths_converge_to_zero :
    ∀ positive_tolerance : rational_model.signature.carrier,
      rational_model.signature.StrictOrder rational_model.signature.zero positive_tolerance →
        ∃ index : Nat,
          rational_model.signature.StrictOrder
            (rational_model.signature.add
              (interval index).upper
              (rational_model.signature.neg (interval index).lower))
            positive_tolerance

end LRA.NumberSystems.RealNumbers.Cantor
