import LRA.AlgebraicStructures.DiscreteInteger.Laws.Definition
import LRA.AlgebraicStructures.Ring.Definition

namespace LRA.AlgebraicStructures

/-- The signature of a discrete integer-style ring with successor and predecessor. -/
structure DiscreteIntegerConceptSignature extends RingConceptSignature where
  succ : LRA.Operation.UnaryOperation carrier
  pred : LRA.Operation.UnaryOperation carrier

end LRA.AlgebraicStructures
