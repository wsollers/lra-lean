import LRA.VolumeI.Set

/-!
Current TeX-facing Peano-system carrier for Volume II.

This is the root namespace for the active Volume II Peano-system buildout.

A Peano system is stated generically over any set backend: `Element` is
the carrier, `SetObject` the backend's sets over it, connected by Lean's
`Membership` class -- so `PeanoSystem Element SetObject` works at
`LRA.Set.ZFCSet`/`LRA.Set.ZFCSet`, `Alpha`/`LRASet Alpha`, Mathlib's
`Alpha`/`Set Alpha`, or `ZFSet`/`ZFSet` alike, resolved from the argument
types. Only what is genuinely Peano stays bundled: the distinguished
element, the successor operation, and the axioms.
-/

namespace LRA.NumberSystems.PeanoSystems

universe u v

/--
**[Definition - Peano System]**

A one-based Peano system is a carrier equipped with a distinguished element,
a successor operation, and the Peano axioms.

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

end

end LRA.NumberSystems.PeanoSystems
