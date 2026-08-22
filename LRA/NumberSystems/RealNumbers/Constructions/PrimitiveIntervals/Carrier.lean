-- LRA/NumberSystems/RealNumbers/Constructions/PrimitiveIntervals/Carrier.lean
-- The pre-carrier: rational closed intervals, containment, inclusion,
-- overlap, width, interval sequences, admissible representative
-- sequences, and the degenerate interval at a rational point.

import LRA.UniversalAlgebra.Quotient.RepresentativeCompatibility
import LRA.VolumeII.NumberSystems.Models

namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervals

open LRA.NumberSystems.Models

/-!
Lean module: LRA.NumberSystems.RealNumbers.PrimitiveIntervals
Source: LRA/VolumeII/RealNumbers/PrimitiveIntervals.lean (docs/number-systems/gpt-07-reals-interval-arithmetic.md)
Verification status: definitions and final theorem statements complete; proofs pending

Moved from `LRA.VolumeII.RealNumbers.PrimitiveIntervals` (previously one
1676-line file covering the whole pipeline); split per §1.6.1 into `Carrier`
(this file), `Equivalence`, `WellFoundedness`, `Operations`,
`WellDefinedness`, `Laws`, `Behavior`, `Instances`. See
`RealNumbers/ProofOrder.md`.

Migration note: the source module doc comment (reproduced verbatim below)
claims this construction is "definitionally independent of the Cantor and
Cauchy real constructions." That claim is preserved as written even though
the source file itself imports `LRA.VolumeII.RealNumbers.Cauchy` and
references it in `persistent_overlap_iff_endpoint_null` (moved to
`Behavior.lean`, repointed to the migrated Cauchy construction). This
migration's policy is to move content unchanged rather than silently "fix"
an inconsistent source, so the apparent contradiction is flagged here
without altering the original wording that follows.

This construction is definitionally independent of the Cantor and Cauchy real
constructions. Its primitive equivalence is persistent cross-level overlap.
-/

variable (rational_model : DenselyOrderedFieldModel)

/--
**[Abbrev — Rational]**

Mathematical statement (Lean): `abbrev Rational`.


Logical form:

```lean
abbrev Rational := rational_model.signature.carrier
```
-/
abbrev Rational := rational_model.signature.carrier


/-- Reflexivity of the rational non-strict order.

Mathematical statement (Lean): `theorem nonstrict_order_reflexive (value : Rational rational_model) : rational_model.signature.le value value`.

*Proof status:* proof pending


Logical form:

```lean
theorem nonstrict_order_reflexive
    (value : Rational rational_model) :
    rational_model.signature.le value value
```
-/
theorem nonstrict_order_reflexive
    (value : Rational rational_model) :
    rational_model.signature.le value value := by
  sorry

/-- Definition 1.1: a rational closed interval.

Mathematical statement (Lean): `structure RationalInterval`.


Logical form:

```lean
structure RationalInterval where
  left_endpoint : Rational rational_model
  right_endpoint : Rational rational_model
  endpoints_are_ordered :
    rational_model.signature.le left_endpoint right_endpoint
```
-/
structure RationalInterval where
  left_endpoint : Rational rational_model
  right_endpoint : Rational rational_model
  endpoints_are_ordered :
    rational_model.signature.le left_endpoint right_endpoint


/-- Definition 1.2: membership in a rational closed interval.

Mathematical statement (Lean): `def contains (interval : RationalInterval rational_model) (value : Rational rational_model) : Prop`.


Logical form:

```lean
def contains
    (interval : RationalInterval rational_model)
    (value : Rational rational_model) : Prop :=
  rational_model.signature.le interval.left_endpoint value ∧
  rational_model.signature.le value interval.right_endpoint
```
-/
def contains
    (interval : RationalInterval rational_model)
    (value : Rational rational_model) : Prop :=
  rational_model.signature.le interval.left_endpoint value ∧
  rational_model.signature.le value interval.right_endpoint


/-- Definition 1.3: interval inclusion.

Mathematical statement (Lean): `def subset (inner outer : RationalInterval rational_model) : Prop`.


Logical form:

```lean
def subset
    (inner outer : RationalInterval rational_model) : Prop :=
  rational_model.signature.le
      outer.left_endpoint inner.left_endpoint ∧
  rational_model.signature.le
      inner.right_endpoint outer.right_endpoint
```
-/
def subset
    (inner outer : RationalInterval rational_model) : Prop :=
  rational_model.signature.le
      outer.left_endpoint inner.left_endpoint ∧
  rational_model.signature.le
      inner.right_endpoint outer.right_endpoint


/-- Definition 1.4: interval overlap.

Mathematical statement (Lean): `def overlaps (first second : RationalInterval rational_model) : Prop`.


Logical form:

```lean
def overlaps
    (first second : RationalInterval rational_model) : Prop :=
  ∃ value,
    contains rational_model first value ∧
    contains rational_model second value
```
-/
def overlaps
    (first second : RationalInterval rational_model) : Prop :=
  ∃ value,
    contains rational_model first value ∧
    contains rational_model second value


/-- Definition 1.5: interval width.

Mathematical statement (Lean): `def width (interval : RationalInterval rational_model) : Rational rational_model`.


Logical form:

```lean
def width
    (interval : RationalInterval rational_model) : Rational rational_model :=
  rational_model.signature.Subtraction
    interval.right_endpoint interval.left_endpoint
```
-/
def width
    (interval : RationalInterval rational_model) : Rational rational_model :=
  rational_model.signature.Subtraction
    interval.right_endpoint interval.left_endpoint

/--
**[Abbrev — IntervalSequence]**

Mathematical statement (Lean): `abbrev IntervalSequence`.


Logical form:

```lean
abbrev IntervalSequence := Nat → RationalInterval rational_model
```
-/
abbrev IntervalSequence := Nat → RationalInterval rational_model


/-- Definition 1.6: an admissible nested shrinking interval sequence.

Mathematical statement (Lean): `structure Representative`.


Logical form:

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


/-- Definition 2.1: the degenerate interval at a rational point.

Mathematical statement (Lean): `def degenerate_interval (value : Rational rational_model) : RationalInterval rational_model`.


Logical form:

```lean
def degenerate_interval
    (value : Rational rational_model) : RationalInterval rational_model where
  left_endpoint := value
  right_endpoint := value
  endpoints_are_ordered := nonstrict_order_reflexive rational_model value
```
-/
def degenerate_interval
    (value : Rational rational_model) : RationalInterval rational_model where
  left_endpoint := value
  right_endpoint := value
  endpoints_are_ordered := nonstrict_order_reflexive rational_model value

end LRA.NumberSystems.RealNumbers.PrimitiveIntervals
