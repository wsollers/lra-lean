import LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.Carrier
import LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.Equivalence
import LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.WellFoundedness

/-!
Canonical import route for the Presburger construction of the natural
numbers, realized against `LRA.Set.PredicateSet`. This is the bare Peano
carrier only -- the order relation, addition, and the migration of the
existing generic `LRA.VolumeII.PeanoSystems.Presburger` content (which
stays where it is for now) are separate, later work. See
`LRA/NumberSystems/NaturalNumbers/ProofOrder.md`.
-/
