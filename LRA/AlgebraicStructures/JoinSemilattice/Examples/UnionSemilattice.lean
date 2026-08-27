import Mathlib.Data.Set.Basic
import LRA.Set.Interop.Switch
import LRA.AlgebraicStructures.JoinSemilattice.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.JoinSemilattice.Examples

/-- `(LRA_Set α, ∪)` is a join-semilattice: union is associative, commutative,
and idempotent (`A ∪ A = A`) directly, with no order structure needed to state
it — this is the algebraic definition on its own terms, distinct from
`CommutativeSemigroup.Examples.UnionSemilattice` (which packages the same fact
as a `Mul`-typeclass instance via a wrapper structure; here `join` is the
explicit union function itself, no wrapper needed). -/
theorem unionIsJoinSemilattice {α : Type u} :
    LRA.AlgebraicStructures.JoinSemilatticeLaws
      (Union.union : LRA.Set.LRA_Set α → LRA.Set.LRA_Set α → LRA.Set.LRA_Set α) := by
  sorry

end LRA.AlgebraicStructures.JoinSemilattice.Examples
