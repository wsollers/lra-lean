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

/--
**[Definition - Predicate-Set Comprehension Adequacy for an Integer-Structure Backend]**

An adequacy certificate packages an explicit representation of every Lean
predicate on the carrier by a backend `SetObject`, together with exact
membership reflection.

Logical form:

```lean
structure PredicateSetComprehensionAdequacy
    (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  Represent : Set Element -> SetObject
  MembershipIff :
    forall (predicate : Set Element) (element : Element),
      element ∈ Represent predicate ↔ predicate element
```
-/
structure PredicateSetComprehensionAdequacy
    (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  Represent : Set Element -> SetObject
  MembershipIff :
    forall (predicate : Set Element) (element : Element),
      element ∈ Represent predicate ↔ predicate element

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

/--
**[Definition - Full Two-Sided Predicate Induction for an Integer Structure]**

Full two-sided induction quantifies over every Lean predicate on the carrier,
not only over subsets already represented by the backend `SetObject`.

Logical form:

```lean
def FullTwoSidedPredicateInduction
    (is : IntegerStructure Element SetObject) : Prop :=
  forall predicate : Set Element,
    predicate is.zero ->
    (forall element : Element,
      predicate element ->
      predicate (is.successor element)) ->
    (forall element : Element,
      predicate element ->
      predicate (is.predecessor element)) ->
    forall element : Element,
      predicate element
```
-/
def FullTwoSidedPredicateInduction
    (is : IntegerStructure Element SetObject) : Prop :=
  forall predicate : Set Element,
    predicate is.zero ->
    (forall element : Element,
      predicate element ->
      predicate (is.successor element)) ->
    (forall element : Element,
      predicate element ->
      predicate (is.predecessor element)) ->
    forall element : Element,
      predicate element

/--
**[Theorem - Comprehension Adequacy Implies Full Two-Sided Predicate Induction]**

If every Lean predicate is represented by a backend subset, then the bundled
backend-relative two-sided induction axiom upgrades to full predicate
induction.

Logical form:

```lean
theorem FullTwoSidedPredicateInductionOfComprehensionAdequacy
    (is : IntegerStructure Element SetObject)
    (adequacy : PredicateSetComprehensionAdequacy Element SetObject) :
    FullTwoSidedPredicateInduction is
```
-/
theorem FullTwoSidedPredicateInductionOfComprehensionAdequacy
    (is : IntegerStructure Element SetObject)
    (adequacy : PredicateSetComprehensionAdequacy Element SetObject) :
    FullTwoSidedPredicateInduction is := by
  intro predicate baseCase successorStep predecessorStep element
  have representedBase : is.zero ∈ adequacy.Represent predicate :=
    (adequacy.MembershipIff predicate is.zero).2 baseCase
  have representedSuccessor :
      forall candidate : Element,
        candidate ∈ adequacy.Represent predicate ->
        is.successor candidate ∈ adequacy.Represent predicate := by
    intro candidate hCandidate
    exact (adequacy.MembershipIff predicate (is.successor candidate)).2
      (successorStep candidate
        ((adequacy.MembershipIff predicate candidate).1 hCandidate))
  have representedPredecessor :
      forall candidate : Element,
        candidate ∈ adequacy.Represent predicate ->
        is.predecessor candidate ∈ adequacy.Represent predicate := by
    intro candidate hCandidate
    exact (adequacy.MembershipIff predicate (is.predecessor candidate)).2
      (predecessorStep candidate
        ((adequacy.MembershipIff predicate candidate).1 hCandidate))
  exact (adequacy.MembershipIff predicate element).1
    (is.induction
      (adequacy.Represent predicate)
      representedBase
      representedSuccessor
      representedPredecessor
      element)

end

end LRA.NumberSystems.IntegerStructure
