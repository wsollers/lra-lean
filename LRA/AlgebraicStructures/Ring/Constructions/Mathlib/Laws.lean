import Mathlib.Algebra.Ring.Defs
import LRA.AlgebraicStructures.Ring.Interface.Laws.Definition
import LRA.AlgebraicStructures.AbelianGroup.Constructions.Mathlib.Laws
import LRA.AlgebraicStructures.Semiring.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures

universe u

instance {R : Type u} [_root_.Ring R] [Nonempty R] : RingLaws R := by
  sorry

end LRA.AlgebraicStructures
