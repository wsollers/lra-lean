import LRA.NaturalNumbers.Constructions.Presburger.Carrier
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

namespace LRA.NaturalNumbers.Constructions.Presburger

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

end LRA.NaturalNumbers.Constructions.Presburger
