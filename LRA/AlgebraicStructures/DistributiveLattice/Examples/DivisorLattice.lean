import Mathlib.Data.Nat.GCD.Basic
import LRA.AlgebraicStructures.DistributiveLattice.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.DistributiveLattice.Examples

/-- `(ℕ, lcm, gcd)` — the divisibility lattice is distributive: `lcm`
distributes over `gcd` and vice versa. Direct, dual pair to
`Lattice.Examples.DivisibilityLattice` and `MeetSemilattice.Examples.
GcdOnNaturals`, now with the distributivity claim added on top of the plain
lattice one. -/
theorem divisorLatticeIsDistributive :
    LRA.AlgebraicStructures.DistributiveLatticeLaws Nat.lcm Nat.gcd := by
  sorry

end LRA.AlgebraicStructures.DistributiveLattice.Examples
