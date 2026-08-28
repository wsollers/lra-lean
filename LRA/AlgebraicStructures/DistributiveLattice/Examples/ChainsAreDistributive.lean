import Mathlib.Data.Real.Basic
import LRA.AlgebraicStructures.DistributiveLattice.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.DistributiveLattice.Examples

/-- Every chain (totally ordered set) is a distributive lattice, `join :=
max`, `meet := min` — `ℝ` in particular. Free via the generic Mathlib bridge:
any `LinearOrder` is a `DistribLattice` in Mathlib. Dual pair to
`Lattice.Examples.RealsUnderMaxMin`, now with the (automatic, for any chain)
distributivity claim on top. -/
example :
    LRA.AlgebraicStructures.DistributiveLatticeLaws
      (max : Real → Real → Real) (min : Real → Real → Real) :=
  LRA.AlgebraicStructures.ofDistribLattice

end LRA.AlgebraicStructures.DistributiveLattice.Examples
