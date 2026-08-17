import LRA.VolumeI.AlgebraicStructures.Ring.Laws.Definition
import LRA.VolumeI.Order.Laws.PartialOrder.Definition
import LRA.VolumeI.Order.Laws.OperationCompatibility.Definition

namespace LRA.AlgebraicStructures

open LRA.Order

universe u

/-!
Ordered ring law certificates.
-/

/-- Ordered ring laws with a partial order. -/
class abbrev OrderedRingLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LE R] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveInverseLaws R, AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R,
  LRA.Order.PartialOrderLaws R,
  AdditionRespectsOrderLaws R, MultiplicationRespectsOrderLaws R

end LRA.AlgebraicStructures
