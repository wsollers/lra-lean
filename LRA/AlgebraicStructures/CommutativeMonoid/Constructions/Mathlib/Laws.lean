import Mathlib.Algebra.Group.Defs
import LRA.AlgebraicStructures.CommutativeMonoid.Interface.Laws.Definition
import LRA.AlgebraicStructures.Monoid.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures

universe u

instance {R : Type u} [_root_.CommMonoid R] [Nonempty R] : CommutativeMonoidLaws R := by
  sorry
end LRA.AlgebraicStructures
