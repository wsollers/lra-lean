import LRA.AlgebraicStructures.Group.Laws.Definition
import LRA.AlgebraicStructures.Monoid.Definition

namespace LRA.AlgebraicStructures

/-- The algebraic signature of a multiplicative group: multiplication, one, and inverse. -/
structure GroupConceptSignature extends MonoidConceptSignature where
  inverse : LRA.Operation.UnaryOperation carrier

end LRA.AlgebraicStructures
