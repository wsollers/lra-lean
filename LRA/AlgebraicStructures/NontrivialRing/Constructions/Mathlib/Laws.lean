import Mathlib.Algebra.Ring.Defs
import LRA.AlgebraicStructures.NontrivialRing.Interface.Laws.Definition
import LRA.AlgebraicStructures.Ring.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures

universe u

instance {R : Type u} [_root_.Ring R] [_root_.NeZero (1 : R)] [Nonempty R] :
    NontrivialRingLaws R := by
  sorry

end LRA.AlgebraicStructures
