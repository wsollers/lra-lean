import LRA.VolumeI.AlgebraicStructures.Ring.AlgebraicSignature.ConceptSignature

namespace LRA.AlgebraicStructures

/-- The enriched signature of an ordered ring: ring operations and an order relation. -/
structure OrderedRingConceptSignature extends RingConceptSignature where
  le : carrier → carrier → Prop

end LRA.AlgebraicStructures
