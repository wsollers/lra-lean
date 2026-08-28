import LRA.AlgebraicStructures.CommutativeMonoid.Interface.Laws.Definition
import LRA.AlgebraicStructures.Monoid.Interface.Definitions.ConceptSignature

namespace LRA.AlgebraicStructures

/-- The UA-level signature for a commutative monoid is exactly `Monoid`'s —
commutativity is a `Laws`-level property (`MultiplicativeCommutativeLaws`),
not a new signature element. -/
abbrev CommutativeMonoidConceptSignature :=
  MonoidConceptSignature

end LRA.AlgebraicStructures
