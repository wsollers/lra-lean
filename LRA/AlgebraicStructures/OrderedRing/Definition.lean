import LRA.AlgebraicStructures.OrderedRing.Laws.Definition
import LRA.AlgebraicStructures.Ring.Definition

namespace LRA.AlgebraicStructures

                                                                                        
structure OrderedRingConceptSignature extends RingConceptSignature where
  le : carrier → carrier → Prop

end LRA.AlgebraicStructures
