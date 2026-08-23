import LRA.AlgebraicStructures.Group.Laws.Definition
import LRA.AlgebraicStructures.Monoid.Definition

namespace LRA.AlgebraicStructures

                                                                                           
structure GroupConceptSignature extends MonoidConceptSignature where
  inverse : LRA.Operation.UnaryOperation carrier

end LRA.AlgebraicStructures
