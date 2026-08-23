import LRA.Set
import LRA.Set.PredicateSet
import LRA.Set.ZFC
import LRA.Set.ZFCSet
import LRA.Set.Model
import LRA.SetSystems

/-!
The Peano-system working type: the set-theoretic presentation of §1.6.10's
generic axiomatic layer.

A Peano system is stated generically over any set backend: `Element` is
the carrier, `SetObject` the backend's sets over it, connected by Lean's
`Membership` class -- so `PeanoSystem Element SetObject` works at
`LRA.Set.ZFCSet`/`LRA.Set.ZFCSet`, `Alpha`/`LRASet Alpha`, Mathlib's
`Alpha`/`Set Alpha`, or `ZFSet`/`ZFSet` alike, resolved from the argument
types. Only what is genuinely Peano stays bundled: the distinguished
element, the successor operation, and the axioms.

This is `PeanoSystem`'s own `Definition.lean` in the sense §1.7.1 fixes for
every concept in this migration: the working type code proves things about,
kept apart from `Interface/Signature/Definition.lean`'s `LRA.Logic.Signature`
presentation the same way §1.2 keeps the arrow and the set-theoretic triple
apart. The two are not duplicates of one idea; they are the two
presentations every concept here carries, and both are load-bearing --
`NaturalNumbers/Construction/NModel.lean`'s `NModel` extends this structure
directly, and `PeanoSystems/Presburger/PresburgerModel.lean`'s
`PresburgerModel.toPeanoSystem` produces a value of it as the evidence that a
Presburger model satisfies Peano's axioms.
-/

namespace LRA.NumberSystems.PeanoSystem

universe u v

/--
**[Definition - Peano System]**

A Peano system is a carrier equipped with a distinguished element, a
successor operation, and the Peano axioms.

Mathematical statement (Lean): `structure PeanoSystem`.


Logical form:

```lean
structure PeanoSystem (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  one : Element
  successor : Element -> Element
  one_not_successor :
    forall element : Element,
      successor element ≠ one
  successor_injective :
    forall first_element second_element : Element,
      successor first_element = successor second_element ->
      first_element = second_element
  induction :
    forall subset : SetObject,
      one ∈ subset ->
      (forall element : Element,
        element ∈ subset ->
        successor element ∈ subset) ->
      forall element : Element,
        element ∈ subset
```
-/
structure PeanoSystem (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  one : Element
  successor : Element -> Element
  one_not_successor :
    forall element : Element,
      successor element ≠ one
  successor_injective :
    forall first_element second_element : Element,
      successor first_element = successor second_element ->
      first_element = second_element
  induction :
    forall subset : SetObject,
      one ∈ subset ->
      (forall element : Element,
        element ∈ subset ->
        successor element ∈ subset) ->
      forall element : Element,
        element ∈ subset

/--
**[Definition - Predicate-Set Comprehension Adequacy for a Peano-System Backend]**

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

/--
`PeanoSystemFromTex` abbreviates the displayed type or object for peano system from tex.

Logical form:

```lean
abbrev PeanoSystemFromTex := @PeanoSystem
```
-/
abbrev PeanoSystemFromTex := @PeanoSystem

/--
**[Definition - Successor-Closed Subset of a Peano System]**

A subset of a Peano system is successor-closed exactly when membership is
preserved by the successor operation.

Mathematical statement (Lean): `def SuccessorClosedSubset (ps : PeanoSystem Element SetObject) (subset : SetObject) : Prop`.


Logical form:

```lean
def SuccessorClosedSubset
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject) : Prop :=
  forall element : Element,
    element ∈ subset ->
    ps.successor element ∈ subset
```
-/
def SuccessorClosedSubset
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject) : Prop :=
  forall element : Element,
    element ∈ subset ->
    ps.successor element ∈ subset

/--
**[Definition - Inductive Subset of a Peano System]**

A subset is inductive exactly when it contains the distinguished element and is
successor-closed.

Mathematical statement (Lean): `def InductiveSubsetOfPeanoSystem (ps : PeanoSystem Element SetObject) (subset : SetObject) : Prop`.


Logical form:

```lean
def InductiveSubsetOfPeanoSystem
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject) : Prop :=
  ps.one ∈ subset /\
    SuccessorClosedSubset ps subset
```
-/
def InductiveSubsetOfPeanoSystem
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject) : Prop :=
  ps.one ∈ subset /\
    SuccessorClosedSubset ps subset

/--
**[Definition - Full Predicate Induction for a Peano System]**

Full predicate induction quantifies over every Lean predicate on the carrier,
not only over subsets already represented by the backend `SetObject`.

Logical form:

```lean
def FullPredicateInduction
    (ps : PeanoSystem Element SetObject) : Prop :=
  forall predicate : Set Element,
    predicate ps.one ->
    (forall element : Element,
      predicate element ->
      predicate (ps.successor element)) ->
    forall element : Element,
      predicate element
```
-/
def FullPredicateInduction
    (ps : PeanoSystem Element SetObject) : Prop :=
  forall predicate : Set Element,
    predicate ps.one ->
    (forall element : Element,
      predicate element ->
      predicate (ps.successor element)) ->
    forall element : Element,
      predicate element

/--
**[Theorem - Comprehension Adequacy Implies Full Predicate Induction]**

If every Lean predicate is represented by a backend subset, then the bundled
backend-relative induction axiom upgrades to full predicate induction.

Logical form:

```lean
theorem FullPredicateInductionOfComprehensionAdequacy
    (ps : PeanoSystem Element SetObject)
    (adequacy : PredicateSetComprehensionAdequacy Element SetObject) :
    FullPredicateInduction ps
```
-/
theorem FullPredicateInductionOfComprehensionAdequacy
    (ps : PeanoSystem Element SetObject)
    (adequacy : PredicateSetComprehensionAdequacy Element SetObject) :
    FullPredicateInduction ps := by
  intro predicate baseCase successorStep element
  have representedBase : ps.one ∈ adequacy.Represent predicate :=
    (adequacy.MembershipIff predicate ps.one).2 baseCase
  have representedStep :
      forall candidate : Element,
        candidate ∈ adequacy.Represent predicate ->
        ps.successor candidate ∈ adequacy.Represent predicate := by
    intro candidate hCandidate
    exact (adequacy.MembershipIff predicate (ps.successor candidate)).2
      (successorStep candidate
        ((adequacy.MembershipIff predicate candidate).1 hCandidate))
  exact (adequacy.MembershipIff predicate element).1
    (ps.induction (adequacy.Represent predicate) representedBase representedStep element)

end

end LRA.NumberSystems.PeanoSystem
