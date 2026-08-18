import LRA.AlgebraicStructures.AdditiveMonoid.Definition

namespace LRA.AlgebraicStructures

/-- The algebraic signature of an additive group: addition, zero, and negation. -/
structure AdditiveGroupConceptSignature extends AdditiveMonoidConceptSignature where
  neg : LRA.Operation.UnaryOperation carrier

end LRA.AlgebraicStructures
