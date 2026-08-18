import LRA.AlgebraicStructures.Semiring.Definition

namespace LRA.AlgebraicStructures

/-- The algebraic signature of a ring: semiring operations plus negation. -/
structure RingConceptSignature extends SemiringConceptSignature where
  neg : LRA.Operation.UnaryOperation carrier

end LRA.AlgebraicStructures
