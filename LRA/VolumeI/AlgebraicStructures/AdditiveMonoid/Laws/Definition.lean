import LRA.VolumeI.AlgebraicStructures.AdditiveSemigroup.Laws.Definition
import LRA.VolumeI.Operations.Laws.Identity.Definition

namespace LRA.AlgebraicStructures

universe u

/-!
Additive monoid law certificates.
-/

/-- Zero is a two-sided identity for addition. -/
class AdditiveIdentityLaws (R : Type u) [Add R] [OfNat R 0] : Prop where
  ZeroAdd :
    LRA.Operation.Laws.Identity.LeftIdentity (fun a b : R => a + b) 0
  AddZero :
    LRA.Operation.Laws.Identity.RightIdentity (fun a b : R => a + b) 0

/-- Additive monoid laws. -/
class abbrev AdditiveMonoidLaws (R : Type u) [Add R] [OfNat R 0] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R

section Wrappers

variable {R : Type u}

/-- Zero is a left identity for addition. -/
theorem ZeroAdd [Add R] [OfNat R 0] [AdditiveIdentityLaws R] :
    ∀ a : R, 0 + a = a :=
  AdditiveIdentityLaws.ZeroAdd

/-- Zero is a right identity for addition. -/
theorem AddZero [Add R] [OfNat R 0] [AdditiveIdentityLaws R] :
    ∀ a : R, a + 0 = a :=
  AdditiveIdentityLaws.AddZero

end Wrappers

end LRA.AlgebraicStructures
