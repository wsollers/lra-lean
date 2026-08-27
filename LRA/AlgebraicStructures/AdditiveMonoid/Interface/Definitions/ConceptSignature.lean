import LRA.AlgebraicStructures.AdditiveMonoid.Interface.Laws.Definition
import LRA.UniversalAlgebra.InterpretedOperationBundles

namespace LRA.AlgebraicStructures

/-- The UA-level signature for an additive monoid: `AdditiveSemigroup`'s
additive operation bundle plus a distinguished `zero` element. -/
structure AdditiveMonoidConceptSignature extends
    LRA.UniversalAlgebra.InterpretedOperationBundles.AdditiveOperationBundle where
  zero : carrier

end LRA.AlgebraicStructures
