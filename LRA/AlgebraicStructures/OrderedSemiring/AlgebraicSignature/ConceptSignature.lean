import LRA.AlgebraicStructures.Semiring.Definition

namespace LRA.AlgebraicStructures

/-!
Algebraic signature for ordered semirings.
-/

/-- The enriched signature of an ordered semiring: semiring operations and an order relation. -/
structure OrderedSemiringConceptSignature extends SemiringConceptSignature where
  le : carrier → carrier → Prop

end LRA.AlgebraicStructures
