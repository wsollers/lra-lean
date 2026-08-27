import Mathlib.Algebra.Group.Defs
import LRA.AlgebraicStructures.Monoid.Interface.Laws.Definition
import LRA.AlgebraicStructures.Semigroup.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures

universe u

instance {R : Type u} [_root_.Monoid R] [Nonempty R] : MonoidLaws R := by
  sorry

end LRA.AlgebraicStructures
