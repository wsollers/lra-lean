import LRA.VolumeI.AlgebraicStructures.AdditiveCommutativeSemigroup.Laws.Definition
import LRA.VolumeI.AlgebraicStructures.AdditiveGroup.Laws.Definition

namespace LRA.AlgebraicStructures

universe u

/-!
Abelian group law certificates.
-/

/-- Abelian group laws in additive notation. -/
class abbrev AbelianGroupLaws (R : Type u)
    [Add R] [Neg R] [OfNat R 0] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R, AdditiveInverseLaws R,
  AdditiveCommutativeLaws R

end LRA.AlgebraicStructures
