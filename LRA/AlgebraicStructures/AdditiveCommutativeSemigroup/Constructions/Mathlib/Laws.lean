import Mathlib.Algebra.Group.Defs
import LRA.AlgebraicStructures.AdditiveCommutativeSemigroup.Interface.Laws.Definition
import LRA.AlgebraicStructures.AdditiveSemigroup.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures

universe u

instance {R : Type u} [_root_.AddCommSemigroup R] [Nonempty R] :
    AdditiveCommutativeSemigroupLaws R := by
  sorry
end LRA.AlgebraicStructures
