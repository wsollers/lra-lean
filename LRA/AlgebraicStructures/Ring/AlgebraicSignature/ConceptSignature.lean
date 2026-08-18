import LRA.AlgebraicStructures.Semiring.AlgebraicSignature.ConceptSignature

namespace LRA.AlgebraicStructures

/-- The algebraic signature of a ring: semiring operations plus negation. -/
structure RingConceptSignature extends SemiringConceptSignature where
  neg : LRA.Operation.UnaryOperation carrier

end LRA.AlgebraicStructures
