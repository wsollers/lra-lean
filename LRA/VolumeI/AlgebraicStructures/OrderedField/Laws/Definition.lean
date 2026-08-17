import LRA.VolumeI.AlgebraicStructures.Field.Laws.Definition
import LRA.VolumeI.Order.Laws.LinearOrder.Definition
import LRA.VolumeI.Order.Laws.OperationCompatibility.Definition

namespace LRA.AlgebraicStructures

open LRA.Order

universe u

/-!
Ordered field law certificates.
-/

/-- Ordered field laws. -/
class abbrev OrderedFieldLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveInverseLaws R, AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R,
  NontrivialityLaw R, MultiplicativeInverseLaws R,
  LinearOrderLaws R,
  AdditionRespectsOrderLaws R, MultiplicationRespectsOrderLaws R

end LRA.AlgebraicStructures
