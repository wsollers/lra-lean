import LRA.AlgebraicStructures.MeetSemilattice.Interface.Laws.Definition
import LRA.UniversalAlgebra.InterpretedOperationBundles

namespace LRA.AlgebraicStructures

/-- The UA-level signature for a meet-semilattice: one carrier, one binary
operation (`meet`), named distinctly from `Mul`/`Add` since — unlike every
other subject in this tree — the operation here is never packaged as a type's
`Mul`/`Add` instance (see `Interface/Laws/Definition.lean`'s doc comment). -/
structure MeetSemilatticeConceptSignature extends
    LRA.UniversalAlgebra.InterpretedOperationBundles.CarrierBundle where
  meet : LRA.Operation.BinaryOperation carrier

end LRA.AlgebraicStructures
