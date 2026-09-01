import Mathlib.Algebra.Order.Ring.Defs
import LRA.AlgebraicStructures.OrderedRing.Interface.Laws.Definition
import LRA.AlgebraicStructures.Ring.Constructions.Mathlib.Laws
import LRA.Order.Interop.Mathlib.Certificates

namespace LRA.AlgebraicStructures

universe u

instance {R : Type u} [_root_.Ring R] [_root_.PartialOrder R]
    [_root_.IsOrderedRing R] [Nonempty R] : OrderedRingLaws R := by
  sorry

end LRA.AlgebraicStructures
