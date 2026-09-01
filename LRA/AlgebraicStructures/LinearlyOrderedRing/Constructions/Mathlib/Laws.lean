import Mathlib.Algebra.Order.Ring.Defs
import LRA.AlgebraicStructures.LinearlyOrderedRing.Interface.Laws.Definition
import LRA.AlgebraicStructures.OrderedRing.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures

universe u

instance {R : Type u} [_root_.Ring R] [_root_.LinearOrder R]
    [_root_.IsStrictOrderedRing R] [Nonempty R] :
    LinearlyOrderedRingLaws R := by
  sorry

end LRA.AlgebraicStructures
