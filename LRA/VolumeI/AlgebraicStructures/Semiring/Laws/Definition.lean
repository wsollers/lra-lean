import LRA.VolumeI.AlgebraicStructures.AdditiveCommutativeSemigroup.Laws.Definition
import LRA.VolumeI.AlgebraicStructures.AdditiveMonoid.Laws.Definition
import LRA.VolumeI.AlgebraicStructures.Monoid.Laws.Definition
import LRA.VolumeI.AlgebraicStructures.Semiring.Laws.Distributive
import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/-!
Semiring law certificates.
-/

/-- Zero absorbs multiplication. -/
class ZeroAbsorbingLaws (R : Type u) [Mul R] [OfNat R 0] : Prop where
  ZeroMul :
    LRA.Operation.Laws.Absorbing.LeftAbsorbing (fun a b : R => a * b) 0
  MulZero :
    LRA.Operation.Laws.Absorbing.RightAbsorbing (fun a b : R => a * b) 0

/-- Semiring laws. -/
class abbrev SemiringLaws (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R

section Wrappers

variable {R : Type u}

/-- Zero absorbs multiplication on the left. -/
theorem ZeroMul [Mul R] [OfNat R 0] [ZeroAbsorbingLaws R] :
    ∀ a : R, 0 * a = 0 :=
  ZeroAbsorbingLaws.ZeroMul

/-- Zero absorbs multiplication on the right. -/
theorem MulZero [Mul R] [OfNat R 0] [ZeroAbsorbingLaws R] :
    ∀ a : R, a * 0 = 0 :=
  ZeroAbsorbingLaws.MulZero

end Wrappers

end LRA.AlgebraicStructures
