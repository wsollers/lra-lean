import LRA.VolumeI.AlgebraicStructures.Ring.AlgebraicSignature.ConceptSignature

namespace LRA.AlgebraicStructures

/-- The signature of a discrete integer-style ring with successor and predecessor. -/
structure DiscreteIntegerConceptSignature extends RingConceptSignature where
  succ : LRA.Operation.UnaryOperation carrier
  pred : LRA.Operation.UnaryOperation carrier

end LRA.AlgebraicStructures
