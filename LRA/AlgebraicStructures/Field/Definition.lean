import LRA.AlgebraicStructures.Field.Laws.Definition
import LRA.AlgebraicStructures.CommutativeRing.Definition

namespace LRA.AlgebraicStructures

                                                                   
structure FieldConceptSignature extends CommutativeRingConceptSignature where
  inv : LRA.Operation.UnaryOperation carrier

end LRA.AlgebraicStructures
