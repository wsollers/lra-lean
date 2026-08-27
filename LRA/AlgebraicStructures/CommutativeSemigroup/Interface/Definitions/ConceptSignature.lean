import LRA.AlgebraicStructures.CommutativeSemigroup.Interface.Laws.Definition
import LRA.AlgebraicStructures.Semigroup.Interface.Definitions.ConceptSignature

namespace LRA.AlgebraicStructures

/-- A commutative semigroup shares its interpreted-operation signature with a
plain semigroup — commutativity is a law on that one operation, not an
additional operation in the signature. -/
abbrev CommutativeSemigroupConceptSignature :=
  SemigroupConceptSignature

end LRA.AlgebraicStructures
