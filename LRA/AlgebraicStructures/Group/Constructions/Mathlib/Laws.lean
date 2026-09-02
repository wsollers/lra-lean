import Mathlib.Algebra.Group.Defs
import LRA.AlgebraicStructures.Group.Interface.Laws.Definition
import LRA.AlgebraicStructures.Monoid.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures

universe u

instance {R : Type u} [_root_.Group R] [Nonempty R] : GroupLaws R := by
  sorry
end LRA.AlgebraicStructures
