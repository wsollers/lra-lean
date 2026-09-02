import Mathlib.Data.Set.Basic
import LRA.Set.Interop.Switch
import LRA.AlgebraicStructures.BoundedLattice.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.BoundedLattice.Examples

/-- `(𝒫(X), ∪, ∩, ∅, X)` — the power set of `X`, bounded below by `∅` and
above by `X` itself (the universal set on `X`). Direct, no order structure
needed to state it. -/
theorem powerSetIsBoundedLattice {α : Type u} :
    LRA.AlgebraicStructures.BoundedLatticeLaws
      (Union.union : LRA.Set.LRA_Set α → LRA.Set.LRA_Set α → LRA.Set.LRA_Set α)
      (Inter.inter : LRA.Set.LRA_Set α → LRA.Set.LRA_Set α → LRA.Set.LRA_Set α)
      (∅ : LRA.Set.LRA_Set α) (Set.univ : LRA.Set.LRA_Set α) := by
  sorry
end LRA.AlgebraicStructures.BoundedLattice.Examples
