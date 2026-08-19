import LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.Carrier
import LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.Equivalence
import LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.WellFoundedness
import LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.Operations
import LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.Instances

/-!
Canonical import route for the Presburger construction of the natural
numbers, realized against `LRA.Set.PredicateSet`. Both the concrete
`PresburgerElement` carrier and the generic `PresburgerModel` interface
(moved here from `LRA.VolumeII.PeanoSystems.Presburger`) live here now.
See `LRA/NumberSystems/NaturalNumbers/ProofOrder.md`.
-/
