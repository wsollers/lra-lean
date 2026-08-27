import Mathlib.Order.Lattice
import LRA.AlgebraicStructures.JoinSemilattice.Interface.Laws.Definition

namespace LRA.AlgebraicStructures

universe u

/-- Mathlib's own `SemilatticeSup` is exactly this: `⊔` is associative,
commutative, and idempotent. Safe as a plain theorem (not an `instance`) about
the explicit function `(· ⊔ ·)`, unlike the `Mul`-instance bridges elsewhere in
this tree — there's no competing-instance risk here at all, since nothing is
being registered as anyone's `Mul`/`Add`. -/
theorem ofSemilatticeSup {R : Type u} [SemilatticeSup R] :
    JoinSemilatticeLaws (Carrier := R) (· ⊔ ·) := by
  sorry

end LRA.AlgebraicStructures
