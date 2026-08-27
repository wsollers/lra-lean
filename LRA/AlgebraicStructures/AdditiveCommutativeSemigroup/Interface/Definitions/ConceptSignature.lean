import LRA.AlgebraicStructures.AdditiveCommutativeSemigroup.Interface.Laws.Definition
import LRA.AlgebraicStructures.AdditiveSemigroup.Interface.Definitions.ConceptSignature

namespace LRA.AlgebraicStructures

/-- An additive commutative semigroup shares its interpreted-operation signature
with a plain additive semigroup — commutativity is a law on that one operation,
not an additional operation in the signature. -/
abbrev AdditiveCommutativeSemigroupConceptSignature :=
  AdditiveSemigroupConceptSignature

end LRA.AlgebraicStructures
