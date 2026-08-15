import LRA.VolumeII.PeanoSystems.Presburger.Presburger
import LRA.VolumeII.PeanoSystems.PeanoSystem

/-!
First-order model data for the Presburger signature.

Like `PeanoSystem`, a Presburger model is generic over any set backend via
`Membership Element SetObject`; only the Presburger-specific data (zero,
successor, order, axioms) stays bundled.
-/

namespace LRA.NumberSystems.PeanoSystems

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`PresburgerModel` packages the data and laws for presburger model.

Logical form:

```lean
structure PresburgerModel (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  zero : Element
  successor : Element -> Element
  zero_not_successor :
    forall element : Element,
      successor element ≠ zero
  successor_injective :
    forall first_element second_element : Element,
      successor first_element = successor second_element ->
      first_element = second_element
  induction :
    forall subset : SetObject,
      zero ∈ subset ->
      (forall element : Element,
        element ∈ subset ->
        successor element ∈ subset) ->
      forall element : Element,
        element ∈ subset
  lessThan : Element -> Element -> Prop
```
-/
structure PresburgerModel (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  zero : Element
  successor : Element -> Element
  zero_not_successor :
    forall element : Element,
      successor element ≠ zero
  successor_injective :
    forall first_element second_element : Element,
      successor first_element = successor second_element ->
      first_element = second_element
  induction :
    forall subset : SetObject,
      zero ∈ subset ->
      (forall element : Element,
        element ∈ subset ->
        successor element ∈ subset) ->
      forall element : Element,
        element ∈ subset
  lessThan : Element -> Element -> Prop

/--
`PresburgerModel.toPeanoSystem` defines the displayed object for to peano system.

Logical form:

```lean
def PresburgerModel.toPeanoSystem
    (model : PresburgerModel Element SetObject) :
    PeanoSystem Element SetObject where
  one := model.zero
  successor := model.successor
  one_not_successor := model.zero_not_successor
  successor_injective := model.successor_injective
  induction := model.induction
```
-/
def PresburgerModel.toPeanoSystem
    (model : PresburgerModel Element SetObject) :
    PeanoSystem Element SetObject where
  one := model.zero
  successor := model.successor
  one_not_successor := model.zero_not_successor
  successor_injective := model.successor_injective
  induction := model.induction

/- Volume II label: def:presburger-arithmetic
   Lean declaration: LRA.NumberSystems.PeanoSystems.PresburgerArithmetic
   Status: pending -/
/--
`PresburgerArithmetic` defines the displayed object for presburger arithmetic.

Logical form:

```lean
def PresburgerArithmetic
    (_model : PresburgerModel Element SetObject) : Prop := True
```
-/
def PresburgerArithmetic
    (_model : PresburgerModel Element SetObject) : Prop := True

end LRA.NumberSystems.PeanoSystems
