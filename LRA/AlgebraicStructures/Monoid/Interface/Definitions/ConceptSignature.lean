import LRA.AlgebraicStructures.Monoid.Interface.Laws.Definition
import LRA.UniversalAlgebra.InterpretedOperationBundles

namespace LRA.AlgebraicStructures

/-- The UA-level signature for a monoid: `Semigroup`'s multiplicative
operation bundle plus a distinguished `one` element. -/
structure MonoidConceptSignature extends
    LRA.UniversalAlgebra.InterpretedOperationBundles.MultiplicativeOperationBundle where
  one : carrier

end LRA.AlgebraicStructures
