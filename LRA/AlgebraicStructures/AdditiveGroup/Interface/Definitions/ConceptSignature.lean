import LRA.AlgebraicStructures.AdditiveGroup.Interface.Laws.Definition
import LRA.AlgebraicStructures.AdditiveMonoid.Interface.Definitions.ConceptSignature

namespace LRA.AlgebraicStructures

/-- The UA-level signature for an additive group: `AdditiveMonoid`'s
carrier/operation/`zero` bundle plus a distinguished `neg` operation. -/
structure AdditiveGroupConceptSignature extends AdditiveMonoidConceptSignature where
  neg : LRA.Operation.UnaryOperation carrier

end LRA.AlgebraicStructures
