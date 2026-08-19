-- LRA/NumberSystems/RealNumbers/Constructions/PrimitiveIntervals/Operations.lean
-- The choice-free endpoint specifications of the Minkowski sum, interval
-- negation, and the corner-product min/max product; the distinguished
-- zero and one classes; and the eventual-strict-separation order on
-- representatives.
--
-- Distribution note: the source defines `interval_addition`,
-- `interval_negation`, `interval_multiplication`,
-- `representative_addition`, `representative_negation`, and
-- `representative_multiplication` via `Classical.choose` applied to the
-- `..._exists_uniquely` / `..._preserves_admissibility` theorems that this
-- pipeline's naming convention would otherwise place in
-- `WellDefinedness.lean`. Since `WellDefinedness.lean` imports this file
-- (not the reverse), those six `Classical.choose` definitions moved to
-- `WellDefinedness.lean` alongside the existence theorems they invoke,
-- immediately following each theorem exactly as ordered in the source, so
-- that every stage file only ever references declarations already in
-- scope. This file keeps the predicate-only specifications (`IsIntervalSum`,
-- `IsIntervalNegation`, `IsCornerProduct`, `IsIntervalProduct`), which need
-- no existence proof to state.

import LRA.NumberSystems.RealNumbers.Constructions.PrimitiveIntervals.WellFoundedness

namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervals
open LRA.NumberSystems.Models

variable (rational_model : RationalModel)

/-- Definition 3.1: endpoint specification of the Minkowski sum.

Mathematical statement (Lean): `def IsIntervalSum (first second result : RationalInterval rational_model) : Prop`.


Logical form:

```lean
def IsIntervalSum
    (first second result : RationalInterval rational_model) : Prop :=
  result.left_endpoint =
      rational_model.signature.add
        first.left_endpoint second.left_endpoint ∧
  result.right_endpoint =
      rational_model.signature.add
        first.right_endpoint second.right_endpoint
```
-/
def IsIntervalSum
    (first second result : RationalInterval rational_model) : Prop :=
  result.left_endpoint =
      rational_model.signature.add
        first.left_endpoint second.left_endpoint ∧
  result.right_endpoint =
      rational_model.signature.add
        first.right_endpoint second.right_endpoint


/-- Definition 3.2: endpoint specification of interval negation.

Mathematical statement (Lean): `def IsIntervalNegation (interval result : RationalInterval rational_model) : Prop`.


Logical form:

```lean
def IsIntervalNegation
    (interval result : RationalInterval rational_model) : Prop :=
  result.left_endpoint =
      rational_model.signature.neg interval.right_endpoint ∧
  result.right_endpoint =
      rational_model.signature.neg interval.left_endpoint
```
-/
def IsIntervalNegation
    (interval result : RationalInterval rational_model) : Prop :=
  result.left_endpoint =
      rational_model.signature.neg interval.right_endpoint ∧
  result.right_endpoint =
      rational_model.signature.neg interval.left_endpoint


/-- The four corner products of two intervals.

Mathematical statement (Lean): `def IsCornerProduct (first second : RationalInterval rational_model) (value : Rational rational_model) : Prop`.


Logical form:

```lean
def IsCornerProduct
    (first second : RationalInterval rational_model)
    (value : Rational rational_model) : Prop :=
  value = rational_model.signature.multiply
      first.left_endpoint second.left_endpoint ∨
  value = rational_model.signature.multiply
      first.left_endpoint second.right_endpoint ∨
  value = rational_model.signature.multiply
      first.right_endpoint second.left_endpoint ∨
  value = rational_model.signature.multiply
      first.right_endpoint second.right_endpoint
```
-/
def IsCornerProduct
    (first second : RationalInterval rational_model)
    (value : Rational rational_model) : Prop :=
  value = rational_model.signature.multiply
      first.left_endpoint second.left_endpoint ∨
  value = rational_model.signature.multiply
      first.left_endpoint second.right_endpoint ∨
  value = rational_model.signature.multiply
      first.right_endpoint second.left_endpoint ∨
  value = rational_model.signature.multiply
      first.right_endpoint second.right_endpoint


/-- Definition 3.3: minimum/maximum specification of an interval product.

Mathematical statement (Lean): `def IsIntervalProduct (first second result : RationalInterval rational_model) : Prop`.


Logical form:

```lean
def IsIntervalProduct
    (first second result : RationalInterval rational_model) : Prop :=
  (∀ corner,
    IsCornerProduct rational_model first second corner →
    rational_model.signature.le result.left_endpoint corner) ∧
  (∀ corner,
    IsCornerProduct rational_model first second corner →
    rational_model.signature.le corner result.right_endpoint) ∧
  IsCornerProduct rational_model first second result.left_endpoint ∧
  IsCornerProduct rational_model first second result.right_endpoint
```
-/
def IsIntervalProduct
    (first second result : RationalInterval rational_model) : Prop :=
  (∀ corner,
    IsCornerProduct rational_model first second corner →
    rational_model.signature.le result.left_endpoint corner) ∧
  (∀ corner,
    IsCornerProduct rational_model first second corner →
    rational_model.signature.le corner result.right_endpoint) ∧
  IsCornerProduct rational_model first second result.left_endpoint ∧
  IsCornerProduct rational_model first second result.right_endpoint


/-- Definition 3.7: zero and one.

Mathematical statement (Lean): `noncomputable def zero : Carrier rational_model`.


Logical form:

```lean
noncomputable def zero : Carrier rational_model :=
  rational_embedding rational_model rational_model.signature.zero
```
-/
noncomputable def zero : Carrier rational_model :=
  rational_embedding rational_model rational_model.signature.zero

/--
**[Def — one]**

Mathematical statement (Lean): `noncomputable def one : Carrier rational_model`.


Logical form:

```lean
noncomputable def one : Carrier rational_model :=
  rational_embedding rational_model rational_model.signature.one
```
-/
noncomputable def one : Carrier rational_model :=
  rational_embedding rational_model rational_model.signature.one


/-- Definition 4.1: eventual strict separation.

Mathematical statement (Lean): `def representative_strict_order (first second : Representative rational_model) : Prop`.


Logical form:

```lean
def representative_strict_order
    (first second : Representative rational_model) : Prop :=
  ∃ first_index second_index,
    rational_model.signature.StrictOrder
      (first.interval first_index).right_endpoint
      (second.interval second_index).left_endpoint
```
-/
def representative_strict_order
    (first second : Representative rational_model) : Prop :=
  ∃ first_index second_index,
    rational_model.signature.StrictOrder
      (first.interval first_index).right_endpoint
      (second.interval second_index).left_endpoint

end LRA.NumberSystems.RealNumbers.PrimitiveIntervals
