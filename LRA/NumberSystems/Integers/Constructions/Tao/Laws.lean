-- LRA/NumberSystems/Integers/Constructions/Tao/Laws.lean

import LRA.NumberSystems.Integers.Constructions.Tao.WellDefinedness

namespace LRA.NumberSystems.Integers.Tao

/-!
The source never broke the ring laws down individually here the way
`QuotientOrderedPairs.Laws` does -- the aggregate existence claim that the
quotient forms an ordered ring is `Instances.tao_integers_form_ordered_ring`
instead, since it is a registration into `LRA.NumberSystems.Models.IntegerModel`
rather than a standalone law. Breaking it into per-law lemmas matching
`QuotientOrderedPairs.Laws`'s shape is tracked as a gap in
`Integers/ProofOrder.md`.
-/

end LRA.NumberSystems.Integers.Tao
