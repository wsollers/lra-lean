import LRA.VolumeI.AlgebraicStructures.CommutativeSemigroup.Laws.Definition
import LRA.VolumeI.AlgebraicStructures.Semiring.Laws.Definition

namespace LRA.AlgebraicStructures

universe u

/-!
Commutative semiring law certificates.
-/

/-- Commutative semiring laws. -/
class abbrev CommutativeSemiringLaws (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R

end LRA.AlgebraicStructures
