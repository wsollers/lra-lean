import Mathlib.Data.Nat.GCD.Basic
import LRA.AlgebraicStructures.Lattice.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.Lattice.Examples

/-- `(ℕ, lcm, gcd)` — the divisibility lattice: join is the least common
multiple, meet is the greatest common divisor. Dual pair to
`MeetSemilattice.Examples.GcdOnNaturals`, now paired with `lcm` to give the
full lattice the user's spec describes for `(ℕ_{>0}, ∣)`. Stated on all of
`ℕ` rather than the positive naturals, same reasoning as `GcdOnNaturals`: the
lattice identities need no positivity side-condition to state (though `lcm`/
`gcd` at `0` are degenerate — `gcd 0 0 = 0`, `lcm 0 n = 0` — the algebraic
laws still hold throughout `ℕ`). -/
theorem divisibilityIsLattice :
    LRA.AlgebraicStructures.LatticeLaws Nat.lcm Nat.gcd := by
  sorry

end LRA.AlgebraicStructures.Lattice.Examples
