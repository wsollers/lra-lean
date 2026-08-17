import LRA.VolumeI.AlgebraicStructures.CommutativeSemigroup.Laws.Definition
import LRA.VolumeI.AlgebraicStructures.Ring.Laws.Definition

namespace LRA.AlgebraicStructures

universe u

/-!
Commutative ring law certificates.
-/

/-- Commutative ring laws. -/
class abbrev CommutativeRingLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveInverseLaws R, AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R

end LRA.AlgebraicStructures
