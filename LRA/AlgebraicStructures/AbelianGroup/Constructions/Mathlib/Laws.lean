import Mathlib.Algebra.Group.Defs
import LRA.AlgebraicStructures.AbelianGroup.Interface.Laws.Definition
import LRA.AlgebraicStructures.AdditiveCommutativeSemigroup.Constructions.Mathlib.Laws
import LRA.AlgebraicStructures.AdditiveGroup.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures

universe u

instance {R : Type u} [_root_.AddCommGroup R] [Nonempty R] : AbelianGroupLaws R := by
  sorry
end LRA.AlgebraicStructures
