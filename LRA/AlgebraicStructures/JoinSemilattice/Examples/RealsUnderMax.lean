import Mathlib.Data.Real.Basic
import LRA.AlgebraicStructures.JoinSemilattice.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.JoinSemilattice.Examples

/-- `(ℝ, max)` is a join-semilattice — comes for free from the Mathlib bridge,
since `ℝ` is a linear (hence lattice) order and `max = (· ⊔ ·)` for a linear
order. Distinct from `CommutativeSemigroup.Examples.RealsUnderMax` (which packages
the same fact as a `Mul`-typeclass instance via a wrapper structure); here
`join` is `max` itself, no wrapper needed. -/
example : LRA.AlgebraicStructures.JoinSemilatticeLaws (max : Real → Real → Real) :=
  LRA.AlgebraicStructures.ofSemilatticeSup

end LRA.AlgebraicStructures.JoinSemilattice.Examples
