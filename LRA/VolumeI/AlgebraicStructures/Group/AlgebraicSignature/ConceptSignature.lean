import LRA.VolumeI.AlgebraicStructures.Monoid.AlgebraicSignature.ConceptSignature

namespace LRA.AlgebraicStructures

/-- The algebraic signature of a multiplicative group: multiplication, one, and inverse. -/
structure GroupConceptSignature extends MonoidConceptSignature where
  inverse : LRA.Operation.UnaryOperation carrier

end LRA.AlgebraicStructures
