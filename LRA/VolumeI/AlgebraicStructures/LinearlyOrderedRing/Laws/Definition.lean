import LRA.VolumeI.AlgebraicStructures.OrderedRing.Laws.Definition
import LRA.Order.Laws.LinearOrder.Definition
namespace LRA.AlgebraicStructures

universe u

/-- Linearly ordered ring laws. -/
class abbrev LinearlyOrderedRingLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LE R] : Prop :=
  RingLaws R, LRA.Order.LinearOrderLaws R,
  LRA.Order.AdditionRespectsOrderLaws R,
  LRA.Order.MultiplicationRespectsOrderLaws R

end LRA.AlgebraicStructures
