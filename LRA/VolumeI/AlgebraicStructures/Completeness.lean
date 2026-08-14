import LRA.VolumeI.AlgebraicStructures.Bundles
import LRA.VolumeI.Order.Completeness

namespace LRA.VolumeI.AlgebraicStructures

universe u v

/-!
Order completeness, parameterized by a set backend.

Completeness is second-order: "every nonempty bounded-above *subset* has
a least upper bound" quantifies over subsets, so -- exactly as with
`PeanoSystem`'s induction -- the statement must choose what "subset"
means. `SetObject` is a set backend over the carrier, connected by
`Membership R SetObject`, and the law is stated through the Order
chapter's own `LeastUpperBoundProperty`. Instantiating `SetObject` with
Mathlib's `Set R` recovers the classical (full, Henkin-maximal) notion;
other backends give genuinely weaker completeness -- the choice is part
of the assertion, not a convention.
-/

/-- Least-upper-bound completeness of the order on `R`, relative to the
subsets provided by the backend `SetObject`.

Logical form:

```lean
class OrderCompletenessLaws (R : Type u) (SetObject : Type v)
    [LE R] [Membership R SetObject] : Prop where
  Completeness :
    LRA.VolumeI.Order.LeastUpperBoundProperty
      SetObject (fun a b : R => a ≤ b)
```
-/
class OrderCompletenessLaws (R : Type u) (SetObject : Type v)
    [LE R] [Membership R SetObject] : Prop where
  Completeness :
    LRA.VolumeI.Order.LeastUpperBoundProperty
      SetObject (fun a b : R => a ≤ b)

/-- A complete ordered field: the ordered-field bundle together with
backend-relative order completeness. The classical characterization of
`ℝ` takes `SetObject := Set R`.

Deliberately a plain `abbrev`, not a `class abbrev`: at theorem sites,
write the two brackets `[OrderedFieldLaws R] [OrderCompletenessLaws R
SetObject]` -- a class-level bundle here would register instance
projections whose `SetObject` argument is undetermined at search time,
polluting every order-law synthesis with metavariable subgoals. Two
brackets is also the honest mixin style: completeness is a separate
capability with its own parameter.

Logical form:

```lean
abbrev CompleteOrderedFieldLaws
    (R : Type u) (SetObject : Type v)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
    [Membership R SetObject] : Prop :=
  OrderedFieldLaws R ∧ OrderCompletenessLaws R SetObject
```
-/
abbrev CompleteOrderedFieldLaws
    (R : Type u) (SetObject : Type v)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
    [Membership R SetObject] : Prop :=
  OrderedFieldLaws R ∧ OrderCompletenessLaws R SetObject

section Wrappers

variable {R : Type u} {SetObject : Type v}

/-- Every nonempty subset (from the chosen backend) with an upper bound
has a supremum.

Logical form:

```lean
theorem Completeness [LE R] [Membership R SetObject]
    [OrderCompletenessLaws R SetObject] :
    LRA.VolumeI.Order.LeastUpperBoundProperty
      SetObject (fun a b : R => a ≤ b)
```
-/
theorem Completeness [LE R] [Membership R SetObject]
    [OrderCompletenessLaws R SetObject] :
    LRA.VolumeI.Order.LeastUpperBoundProperty
      SetObject (fun a b : R => a ≤ b) :=
  OrderCompletenessLaws.Completeness

end Wrappers

end LRA.VolumeI.AlgebraicStructures
