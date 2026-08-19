import LRA.Set.PredicateSet.Definition
import LRA.NumberSystems.PeanoSystem.Definition

/-!
The Presburger carrier: a fresh native inductive type, backed by
`LRA.Set.PredicateSet` for its notion of subset -- the type-theoretic
counterpart to `NaturalNumbers.Constructions.VonNeumann`'s ZFC-derived one
and the (not yet built) Landau construction's directly-postulated one. See
`LRA/NumberSystems/NaturalNumbers/ProofOrder.md`'s Backends section.

This carrier is deliberately a *fresh* inductive type, not Lean/Mathlib's
own `Nat` -- the point of a construction here is to build the naturals up,
the same way `VonNeumann` builds up from ZFC rather than borrowing
Mathlib's answer. Substitutability for `Nat` is a separate, later proof
(`Interface/Interop/Mathlib/`, once the system layer exists), not something
this carrier gets for free by being defined as `Nat`.

Every theorem below is `sorry`, per the same discipline as `VonNeumann`'s
files -- but flagged explicitly where that discipline is arguably wasted
motion: `zero`/`succ` being an `inductive` type means Lean's kernel
generates injectivity, no-confusion, and the recursion principle
automatically, so the three Peano properties below are not really open
mathematical questions to work through by hand, the way the ZFC ones are --
each is close to `PresburgerElement.noConfusion`/`.succ.inj`/`.rec` applied
directly. Left `sorry` anyway, for you to decide whether to fill in as
one-liners or treat the same as everything else.
-/

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Presburger

open LRA.Set

/-- The Presburger carrier: zero, and successor. -/
inductive PresburgerElement where
  | zero
  | succ (n : PresburgerElement)

/-- Presburger's own order relation, `<`, defined directly by structural
recursion rather than in terms of addition -- Presburger arithmetic's
signature is `{0, S, +, <}` with `<` primitive, not derived. -/
def PresburgerLessThan : PresburgerElement → PresburgerElement → Prop
  | _, .zero => False
  | .zero, .succ _ => True
  | .succ m, .succ n => PresburgerLessThan m n

/-- Zero is not the successor of any element. Free via
`PresburgerElement.noConfusion`. -/
theorem PresburgerZeroIsNotSuccessor :
    ∀ n : PresburgerElement, PresburgerElement.succ n ≠ PresburgerElement.zero := by
  sorry

/-- Successor is injective. Free via `PresburgerElement.succ.inj`. -/
theorem PresburgerSuccessorInjective :
    ∀ m n : PresburgerElement,
      PresburgerElement.succ m = PresburgerElement.succ n → m = n := by
  sorry

/-- Induction on the Presburger carrier. Free via `PresburgerElement.rec`,
with `subset` as the motive. -/
theorem PresburgerInductionPrinciple :
    ∀ subset : PredicateSet PresburgerElement,
      PresburgerElement.zero ∈ subset →
      (∀ n : PresburgerElement, n ∈ subset → PresburgerElement.succ n ∈ subset) →
      ∀ n : PresburgerElement, n ∈ subset := by
  sorry

/-!
`PresburgerModel` below is the *generic* Presburger interface -- any
`Membership Element SetObject` backend, with the order relation as extra
bundled data over `PeanoSystem`'s three fields. It is not hard-committed to
`PresburgerElement`; moved here, unmoved in substance, from
`LRA.VolumeII.PeanoSystems.Presburger.PresburgerModel` when that generic
tree was collapsed into this construction. `PresburgerElement`/
`PresburgerLessThan` above are one particular (concrete) way to build a
value of it, not the only one this generic struct allows.
-/

universe u v

/-- `PresburgerModel` packages the data and laws for a Presburger model,
generic over any set backend. -/
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

/-- Every `PresburgerModel` is (via its zero/successor/induction fields
alone, forgetting `lessThan`) a `PeanoSystem`. -/
def PresburgerModel.toPeanoSystem
    {Element : Type u} {SetObject : Type v} [Membership Element SetObject]
    (model : PresburgerModel Element SetObject) :
    LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject where
  one := model.zero
  successor := model.successor
  one_not_successor := model.zero_not_successor
  successor_injective := model.successor_injective
  induction := model.induction

end LRA.NumberSystems.NaturalNumbers.Constructions.Presburger
