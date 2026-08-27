import Mathlib.Data.Set.Basic
import LRA.Set.Interop.Switch
import LRA.AlgebraicStructures.MeetSemilattice.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.MeetSemilattice.Examples

/-- `(LRA_Set α, ∩)` is a meet-semilattice: intersection is associative,
commutative, and idempotent (`A ∩ A = A`) directly, with no order structure
needed to state it — the algebraic definition on its own terms, dual to
`JoinSemilattice.Examples.UnionSemilattice`. -/
theorem intersectionIsMeetSemilattice {α : Type u} :
    LRA.AlgebraicStructures.MeetSemilatticeLaws
      (Inter.inter : LRA.Set.LRA_Set α → LRA.Set.LRA_Set α → LRA.Set.LRA_Set α) := by
  sorry

end LRA.AlgebraicStructures.MeetSemilattice.Examples
