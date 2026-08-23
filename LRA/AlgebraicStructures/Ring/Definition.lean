import LRA.AlgebraicStructures.Ring.Laws.Definition
import LRA.AlgebraicStructures.Semiring.Definition

namespace LRA.AlgebraicStructures

                                                                            
structure RingConceptSignature extends SemiringConceptSignature where
  neg : LRA.Operation.UnaryOperation carrier

end LRA.AlgebraicStructures
