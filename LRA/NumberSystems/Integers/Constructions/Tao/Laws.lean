-- LRA/NumberSystems/Integers/Constructions/Tao/Laws.lean

import LRA.NumberSystems.Integers.Constructions.Tao.WellDefinedness

namespace LRA.NumberSystems.Integers.Tao

/-!
The source never broke the ring laws down individually here the way
`QuotientOrderedPairs.Laws` does. The aggregate structural realization is
`Instances.TaoIntegersFormDiscretelyOrderedIntegralDomain`; the stronger
integer-specific realization is `Instances.TaoRealizesIntegerNumberSystem`.
Breaking the structural certificate into per-law lemmas matching
`QuotientOrderedPairs.Laws`'s shape is tracked in `Integers/ProofOrder.md`.
-/

end LRA.NumberSystems.Integers.Tao
