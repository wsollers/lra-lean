import LRA.AlgebraicStructures.DivisionRing.Laws.Definition
import LRA.AlgebraicStructures.Field.Definition

namespace LRA.AlgebraicStructures

/-- A division ring has the field operation signature; commutativity is not part of the signature. -/
abbrev DivisionRingConceptSignature :=
  FieldConceptSignature

end LRA.AlgebraicStructures
