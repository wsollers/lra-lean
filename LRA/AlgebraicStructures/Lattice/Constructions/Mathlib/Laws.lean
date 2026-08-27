import Mathlib.Order.Lattice
import LRA.AlgebraicStructures.Lattice.Interface.Laws.Definition

namespace LRA.AlgebraicStructures

universe u

/-- Mathlib's own `Lattice` is exactly this: `⊔`/`⊓` are each associative,
commutative, and idempotent, plus the two absorption laws
(`sup_inf_self`/`inf_sup_self`) connecting them. Safe as a plain theorem (not
an `instance`) about the explicit functions `(· ⊔ ·)`/`(· ⊓ ·)`, same reasoning
as `JoinSemilattice`/`MeetSemilattice`'s own bridges — no competing-instance
risk since nothing here is registered as anyone's `Mul`/`Add`. -/
theorem ofLattice {R : Type u} [_root_.Lattice R] :
    LatticeLaws (Carrier := R) (· ⊔ ·) (· ⊓ ·) := by
  sorry

end LRA.AlgebraicStructures
