-- LRA/NumberSystems/RealNumbers/Constructions/Cantor/Carrier.lean
-- The pre-carrier: endpoint intervals over a rational model and nested
-- interval sequences whose widths converge to zero.

import LRA.VolumeII.NumberSystems.Models

namespace LRA.NumberSystems.RealNumbers.Cantor
open LRA.NumberSystems.Models

/-!
Volume II label: cantor-nested-interval-reals
Lean module: LRA.NumberSystems.RealNumbers.Cantor
Source: LRA/VolumeII/RealNumbers/Cantor.lean
Verification status: statement-accepted-proof-pending

Moved from `LRA.VolumeII.RealNumbers.Cantor` (previously one file covering
the whole pipeline); split per §1.6.1 into `Carrier` (this file),
`Equivalence`, `WellFoundedness`, `Operations`, `WellDefinedness`, `Laws`,
`Behavior`, `Instances`. See `RealNumbers/ProofOrder.md`.
-/

/--
**[Structure — EndpointInterval]**

Mathematical statement (Lean): `structure EndpointInterval (rational_model : DenselyOrderedFieldModel)`.


Logical form:

```lean
structure EndpointInterval (rational_model : DenselyOrderedFieldModel) where
  lower : rational_model.signature.carrier
  upper : rational_model.signature.carrier
  lower_le_upper :
    rational_model.signature.le lower upper
```
-/
structure EndpointInterval (rational_model : DenselyOrderedFieldModel) where
  lower : rational_model.signature.carrier
  upper : rational_model.signature.carrier
  lower_le_upper :
    rational_model.signature.le lower upper

/--
**[Structure — NestedIntervalSequence]**

Mathematical statement (Lean): `structure NestedIntervalSequence (rational_model : DenselyOrderedFieldModel)`.


Logical form:

```lean
structure NestedIntervalSequence (rational_model : DenselyOrderedFieldModel) where
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
-/
structure NestedIntervalSequence (rational_model : DenselyOrderedFieldModel) where
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
