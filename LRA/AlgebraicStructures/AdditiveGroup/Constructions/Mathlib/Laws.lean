import Mathlib.Algebra.Group.Defs
import LRA.AlgebraicStructures.AdditiveGroup.Interface.Laws.Definition
import LRA.AlgebraicStructures.AdditiveMonoid.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures

universe u

instance {R : Type u} [_root_.AddGroup R] [Nonempty R] : AdditiveGroupLaws R := by
  sorry
end LRA.AlgebraicStructures
