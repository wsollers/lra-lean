import LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.Carrier
import LRA.NumberSystems.PeanoSystem.Definition

/-!
Packaging `PresburgerElement` into a
`LRA.NumberSystems.PeanoSystem.PeanoSystem` value. Unlike `VonNeumann`, no
new `Membership` instance is needed: `PredicateSet.Definition` already
supplies `Membership PresburgerElement (PredicateSet PresburgerElement)`,
and (also unlike `VonNeumann`) the carrier needs no subtype restriction --
`PresburgerElement` was built fresh to contain exactly the naturals, not
carved out of a larger ambient type.
-/

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Presburger

open LRA.Set

/-- The Presburger construction, packaged as a `PeanoSystem` over its own
carrier and `PredicateSet` subsets -- the same shape `VonNeumannPeanoSystem`
uses for its own (ZFC) backend. -/
def PresburgerPeanoSystem :
    LRA.NumberSystems.PeanoSystem.PeanoSystem
      PresburgerElement (PredicateSet PresburgerElement) where
  one := PresburgerElement.zero
  successor := PresburgerElement.succ
  one_not_successor := PresburgerZeroIsNotSuccessor
  successor_injective := PresburgerSuccessorInjective
  induction := PresburgerInductionPrinciple

universe u v
variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/-- The three Peano properties, as a single `Prop` about a *generic*
`PresburgerModel` -- moved, unchanged in substance, from
`LRA.VolumeII.PeanoSystems.Presburger.PresburgerArithmetic`. -/
def PresburgerArithmetic
    (model : PresburgerModel Element SetObject) : Prop :=
  (forall element : Element,
    model.successor element ≠ model.zero) /\
  (forall first_element second_element : Element,
    model.successor first_element = model.successor second_element ->
      first_element = second_element) /\
  (forall subset : SetObject,
    model.zero ∈ subset ->
    (forall element : Element,
      element ∈ subset ->
      model.successor element ∈ subset) ->
    forall element : Element,
      element ∈ subset)

end LRA.NumberSystems.NaturalNumbers.Constructions.Presburger
