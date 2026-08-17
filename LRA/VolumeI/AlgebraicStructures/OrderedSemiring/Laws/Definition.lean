import LRA.VolumeI.AlgebraicStructures.Semiring.Laws.Definition
import LRA.VolumeI.Order.Laws.LinearOrder.Definition
import LRA.VolumeI.Order.Laws.OperationCompatibility.Definition

namespace LRA.AlgebraicStructures

open LRA.Order

universe u

/-!
Ordered semiring law certificates.

The ordered-semiring law bundle composes canonical semiring laws with the
canonical Volume I order and order-operation compatibility laws. It does not
define an independent order theory.
-/

/-- Ordered semiring laws. -/
class abbrev OrderedSemiringLaws (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] [LE R] : Prop :=
  SemiringLaws R,
  LinearOrderLaws R,
  AdditionRespectsOrderLaws R, MultiplicationRespectsOrderLaws R

end LRA.AlgebraicStructures
