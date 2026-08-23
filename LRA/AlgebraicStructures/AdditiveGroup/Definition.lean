import LRA.AlgebraicStructures.AdditiveGroup.Laws.Definition
import LRA.AlgebraicStructures.AdditiveMonoid.Definition

namespace LRA.AlgebraicStructures

                                                                                  
structure AdditiveGroupConceptSignature extends AdditiveMonoidConceptSignature where
  neg : LRA.Operation.UnaryOperation carrier

end LRA.AlgebraicStructures
