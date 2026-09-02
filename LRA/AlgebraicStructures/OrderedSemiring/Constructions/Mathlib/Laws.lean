import Mathlib.Algebra.Order.Ring.Defs
import LRA.AlgebraicStructures.OrderedSemiring.Interface.Laws.Definition
import LRA.AlgebraicStructures.Semiring.Constructions.Mathlib.Laws
import LRA.Order.Interop.Mathlib.Certificates

namespace LRA.AlgebraicStructures

universe u

instance {R : Type u} [_root_.Semiring R] [_root_.LinearOrder R]
    [_root_.IsOrderedRing R] [Nonempty R] : OrderedSemiringLaws R := by
  sorry
end LRA.AlgebraicStructures
