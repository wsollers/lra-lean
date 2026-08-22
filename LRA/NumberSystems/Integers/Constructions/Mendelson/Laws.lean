-- LRA/NumberSystems/Integers/Constructions/Mendelson/Laws.lean

import LRA.NumberSystems.Integers.Constructions.Mendelson.WellDefinedness

namespace LRA.NumberSystems.Integers.Mendelson

/-!
The source never broke the ring laws down individually here the way
`QuotientOrderedPairs.Laws` does -- the aggregate existence claim that the
quotient forms an ordered ring is `Instances.mendelson_integers_form_ordered_ring`
instead, since it is a registration into `LRA.NumberSystems.Models.DiscretelyOrderedIntegralDomainModel`
rather than a standalone law. Breaking it into per-law lemmas matching
`QuotientOrderedPairs.Laws`'s shape is tracked as a gap in
`Integers/ProofOrder.md`.
-/

end LRA.NumberSystems.Integers.Mendelson
