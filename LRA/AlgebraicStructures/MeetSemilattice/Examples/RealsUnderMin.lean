import Mathlib.Data.Real.Basic
import LRA.AlgebraicStructures.MeetSemilattice.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.MeetSemilattice.Examples

/-- `(ℝ, min)` is a meet-semilattice — comes for free from the Mathlib bridge,
since `ℝ` is a linear (hence lattice) order and `min = (· ⊓ ·)` for a linear
order. Dual to `JoinSemilattice.Examples.RealsUnderMax`. -/
example : LRA.AlgebraicStructures.MeetSemilatticeLaws (min : Real → Real → Real) :=
  LRA.AlgebraicStructures.ofSemilatticeInf

end LRA.AlgebraicStructures.MeetSemilattice.Examples
