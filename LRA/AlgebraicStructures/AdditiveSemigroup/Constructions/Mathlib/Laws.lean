import Mathlib.Algebra.Group.Defs
import LRA.AlgebraicStructures.AdditiveSemigroup.Interface.Laws.Definition

namespace LRA.AlgebraicStructures

universe u

instance {R : Type u} [_root_.AddSemigroup R] [Nonempty R] : AdditiveSemigroupLaws R := by
  sorry

end LRA.AlgebraicStructures
