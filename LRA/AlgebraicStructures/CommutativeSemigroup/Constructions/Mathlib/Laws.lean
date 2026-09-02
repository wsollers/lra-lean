import Mathlib.Algebra.Group.Defs
import LRA.AlgebraicStructures.CommutativeSemigroup.Interface.Laws.Definition
import LRA.AlgebraicStructures.Semigroup.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures

universe u

instance {R : Type u} [_root_.CommSemigroup R] [Nonempty R] :
    CommutativeSemigroupLaws R := by
  sorry
end LRA.AlgebraicStructures
