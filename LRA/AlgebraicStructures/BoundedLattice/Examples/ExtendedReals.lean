import Mathlib.Data.EReal.Basic
import LRA.AlgebraicStructures.BoundedLattice.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.BoundedLattice.Examples

/-- `(ℝ̄, max, min, -∞, +∞)` — Mathlib's own `EReal` (`CompleteLinearOrder`,
hence `Lattice` + `BoundedOrder` generically), free via the generic Mathlib
bridge. -/
example :
    LRA.AlgebraicStructures.BoundedLatticeLaws
      (max : EReal → EReal → EReal) (min : EReal → EReal → EReal) ⊥ ⊤ :=
  LRA.AlgebraicStructures.ofBoundedOrder

end LRA.AlgebraicStructures.BoundedLattice.Examples
