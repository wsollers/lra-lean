import LRA.AlgebraicStructures.Group.Interface.Laws.Definition
import LRA.AlgebraicStructures.Monoid.Interface.Definitions.ConceptSignature

namespace LRA.AlgebraicStructures

/-- The UA-level signature for a group: `Monoid`'s carrier/operation/`one`
bundle plus a distinguished `inverse` operation. -/
structure GroupConceptSignature extends MonoidConceptSignature where
  inverse : LRA.Operation.UnaryOperation carrier

end LRA.AlgebraicStructures
