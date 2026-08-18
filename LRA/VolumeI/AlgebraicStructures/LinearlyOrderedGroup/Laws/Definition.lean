import LRA.VolumeI.AlgebraicStructures.OrderedGroup.Laws.Definition
import LRA.Order.Laws.LinearOrder.Definition
namespace LRA.AlgebraicStructures

universe u

/-- Linearly ordered group laws. -/
class abbrev LinearlyOrderedGroupLaws (R : Type u)
    [Mul R] [Inv R] [OfNat R 1] [LE R] : Prop :=
  GroupLaws R, LRA.Order.LinearOrderLaws R,
  MultiplicativeOrderCompatibilityLaws R

end LRA.AlgebraicStructures
