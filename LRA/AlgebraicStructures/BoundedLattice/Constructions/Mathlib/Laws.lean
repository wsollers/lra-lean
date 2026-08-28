import Mathlib.Order.Lattice
import Mathlib.Order.BoundedOrder.Basic
import LRA.AlgebraicStructures.BoundedLattice.Interface.Laws.Definition

namespace LRA.AlgebraicStructures

universe u

/-- Mathlib's `[Lattice R] [BoundedOrder R]` is exactly this: `⊥`/`⊤` are
two-sided identities for `⊔`/`⊓` respectively (`bot_sup_eq`/`top_inf_eq` give
the "generating" halves directly; the "absorbing" halves follow the same way
`BoundedLatticeLaws`'s own doc comment derives them). Safe as a plain theorem
(not an `instance`), same no-instance-diamond reasoning as `Lattice`'s own
bridge. -/
theorem ofBoundedOrder {R : Type u} [_root_.Lattice R] [_root_.BoundedOrder R] :
    LRA.AlgebraicStructures.BoundedLatticeLaws
      (Carrier := R) (· ⊔ ·) (· ⊓ ·) ⊥ ⊤ := by
  sorry

end LRA.AlgebraicStructures
