import Mathlib.Order.Lattice
import LRA.AlgebraicStructures.DistributiveLattice.Interface.Laws.Definition

namespace LRA.AlgebraicStructures

universe u

/-- Mathlib's `DistribLattice R` is exactly this: a `Lattice` where `⊔`/`⊓`
distribute over each other (`le_sup_inf` and its dual). Safe as a plain
theorem (not an `instance`), same reasoning as `Lattice`'s own bridge. -/
theorem ofDistribLattice {R : Type u} [_root_.DistribLattice R] :
    LRA.AlgebraicStructures.DistributiveLatticeLaws
      (Carrier := R) (· ⊔ ·) (· ⊓ ·) := by
  sorry

end LRA.AlgebraicStructures
