-- LRA/NumberSystems/Integers/Constructions/Mendelson/Laws.lean

import LRA.NumberSystems.Integers.Constructions.Mendelson.WellDefinedness

namespace LRA.NumberSystems.Integers.Mendelson

/-!
The source never broke the ring laws down individually here the way
`QuotientOrderedPairs.Laws` does. The aggregate structural realization is
`Instances.MendelsonIntegersFormDiscretelyOrderedIntegralDomain`; the stronger
integer-specific realization is `Instances.MendelsonRealizesIntegerNumberSystem`.
Breaking the structural certificate into per-law lemmas matching
`QuotientOrderedPairs.Laws`'s shape is tracked in `Integers/ProofOrder.md`.
-/

end LRA.NumberSystems.Integers.Mendelson
