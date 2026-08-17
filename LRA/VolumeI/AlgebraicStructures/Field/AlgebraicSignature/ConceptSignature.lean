import LRA.VolumeI.AlgebraicStructures.CommutativeRing.AlgebraicSignature.ConceptSignature

namespace LRA.AlgebraicStructures

/-- The algebraic signature of a field with totalized inversion. -/
structure FieldConceptSignature extends CommutativeRingConceptSignature where
  inv : LRA.Operation.UnaryOperation carrier

end LRA.AlgebraicStructures
