import Mathlib.Algebra.Group.Defs
import LRA.AlgebraicStructures.AdditiveMonoid.Interface.Laws.Definition
import LRA.AlgebraicStructures.AdditiveSemigroup.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures

universe u

instance {R : Type u} [_root_.AddMonoid R] [Nonempty R] : AdditiveMonoidLaws R := by
  sorry

end LRA.AlgebraicStructures
