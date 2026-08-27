import Mathlib.Data.Real.Basic
import LRA.AlgebraicStructures.Lattice.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.Lattice.Examples

/-- `(ℝ, max, min)` — any total order is a lattice, join/meet given by
`max`/`min`; `ℝ` in particular. Free via the generic Mathlib bridge, dual
pair to `JoinSemilattice.Examples.RealsUnderMax`/`MeetSemilattice.Examples.
RealsUnderMin`. -/
example :
    LRA.AlgebraicStructures.LatticeLaws (max : Real → Real → Real) (min : Real → Real → Real) :=
  LRA.AlgebraicStructures.ofLattice

end LRA.AlgebraicStructures.Lattice.Examples
