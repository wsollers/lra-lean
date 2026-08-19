-- LRA/NumberSystems/IntegerStructure/Definition.lean
-- The integer-structure working type: the set-theoretic presentation of the
-- generic, backend-agnostic two-sided Peano axioms.

import LRA.Set
import LRA.Set.PredicateSet
import LRA.Set.ZFC
import LRA.Set.ZFCSet
import LRA.Set.Model
import LRA.SetSystems

/-!
`IntegerStructure` is to the integers what `LRA.NumberSystems.PeanoSystem`
is to the naturals: a generic, base-agnostic axiomatic characterization, not
a numbered construction. Where a Peano system is one-sided (a base with no
predecessor, and induction that only walks forward), an integer structure is
two-sided: successor and predecessor are mutual inverses, `0`/`1`/`-1` are
related by one step of each, no forward walk from `0` ever returns to `0`,
and induction walks both directions at once.

Signature (Element, `0`, `1`, `-1`, `S`, `P`):

* `P (S x) = x` and `S (P x) = x` — successor and predecessor are inverse
  bijections;
* `S 0 = 1` and `P 0 = -1` — the two named neighbours of the base;
* aperiodicity — no positive number of forward steps from `0` returns to
  `0`, so the structure is infinite in both directions and never collapses
  into a cyclic group;
* two-sided induction — any `SetObject`-backed subset containing `0` and
  closed under both `S` and `P` is everything.

As with `PeanoSystem`, `Element` is the carrier and `SetObject` is the
backend's sets over it, connected by `Membership` — so this same structure
is realized against `LRA.Set.ZFCSet`, `PredicateSet Element`, or a postulated
axiom backend alike, exactly as `PeanoSystem` is. Only what is genuinely
integer-structure stays bundled here: the two operations, the three
distinguished elements, and the axioms.

Promoted from `LRA.VolumeII.Integers.Polish.IntegerStructure`, which proved
this categoricity result concretely against Lean's built-in `Int` rather
than generically against a second `IntegerStructure` model. That proven,
`Int`-specific development stays with the Polish construction that motivated
it (`Integers/Constructions/Polish/`); this module is the generic interface
it is one instance of. Reconciling the two is tracked in
`Integers/ProofOrder.md`.
-/

namespace LRA.NumberSystems.IntegerStructure

universe u v

/-- `iterate f n x` applies `f` to `x` a total of `n` times. Restated here
(rather than reused from a library) for the same reason every other generic-
layer module in this migration restates its own primitives: the core stays
Mathlib-free. -/
def iterate {Alpha : Type u} (f : Alpha -> Alpha) : Nat -> Alpha -> Alpha
  | 0, x => x
  | n + 1, x => f (iterate f n x)

/--
**[Definition - Integer Structure]**

An integer structure is a carrier equipped with zero, one, negative one,
mutually-inverse successor/predecessor operations, aperiodicity, and
two-sided induction.

Logical form:

```lean
structure IntegerStructure (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  zero : Element
  one : Element
  negativeOne : Element
  successor : Element -> Element
  predecessor : Element -> Element
  predecessor_successor :
    forall element : Element, predecessor (successor element) = element
  successor_predecessor :
    forall element : Element, successor (predecessor element) = element
  successor_zero : successor zero = one
  predecessor_zero : predecessor zero = negativeOne
  aperiodic :
    forall iterations : Nat, 0 < iterations ->
      iterate successor iterations zero ≠ zero
  induction :
    forall subset : SetObject,
      zero ∈ subset ->
      (forall element : Element, element ∈ subset -> successor element ∈ subset) ->
      (forall element : Element, element ∈ subset -> predecessor element ∈ subset) ->
      forall element : Element, element ∈ subset
```
-/
structure IntegerStructure (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  zero : Element
  one : Element
  negativeOne : Element
  successor : Element -> Element
  predecessor : Element -> Element
  predecessor_successor :
    forall element : Element, predecessor (successor element) = element
  successor_predecessor :
    forall element : Element, successor (predecessor element) = element
  successor_zero : successor zero = one
  predecessor_zero : predecessor zero = negativeOne
  aperiodic :
    forall iterations : Nat, 0 < iterations ->
      iterate successor iterations zero ≠ zero
  induction :
    forall subset : SetObject,
      zero ∈ subset ->
      (forall element : Element, element ∈ subset -> successor element ∈ subset) ->
      (forall element : Element, element ∈ subset -> predecessor element ∈ subset) ->
      forall element : Element, element ∈ subset

section

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/-- A subset closed under both successor and predecessor. -/
def TwoSidedClosedSubset
    (is : IntegerStructure Element SetObject)
    (subset : SetObject) : Prop :=
  (forall element : Element, element ∈ subset -> is.successor element ∈ subset) /\
  (forall element : Element, element ∈ subset -> is.predecessor element ∈ subset)

/-- A subset is inductive exactly when it contains zero and is closed under
both successor and predecessor. -/
def InductiveSubsetOfIntegerStructure
    (is : IntegerStructure Element SetObject)
    (subset : SetObject) : Prop :=
  is.zero ∈ subset /\ TwoSidedClosedSubset is subset

end

end LRA.NumberSystems.IntegerStructure
