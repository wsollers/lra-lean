import LRA.VolumeI.AlgebraicStructures.Field.AlgebraicSignature.ConceptSignature

namespace LRA.AlgebraicStructures

/-- The enriched signature of an ordered field: field operations and an order relation. -/
structure OrderedFieldConceptSignature extends FieldConceptSignature where
  le : carrier → carrier → Prop

end LRA.AlgebraicStructures
