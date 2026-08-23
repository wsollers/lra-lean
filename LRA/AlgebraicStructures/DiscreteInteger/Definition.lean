import LRA.AlgebraicStructures.DiscreteInteger.Laws.Definition
import LRA.AlgebraicStructures.Ring.Definition

namespace LRA.AlgebraicStructures

                                                                                     
structure DiscreteIntegerConceptSignature extends RingConceptSignature where
  succ : LRA.Operation.UnaryOperation carrier
  pred : LRA.Operation.UnaryOperation carrier

end LRA.AlgebraicStructures
