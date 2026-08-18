import LRA.VolumeI.AlgebraicStructures.AdditiveMonoid.Laws.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/-!
Additive group law certificates.
-/

/-- Negation gives two-sided additive inverses. -/
class AdditiveInverseLaws (R : Type u)
    [Add R] [Neg R] [OfNat R 0] : Prop where
  NegAddCancel :
    LRA.Operation.Laws.Inverse.LeftInverse
      (fun a b : R => a + b) 0 (fun a : R => -a)
  AddNegCancel :
    LRA.Operation.Laws.Inverse.RightInverse
      (fun a b : R => a + b) 0 (fun a : R => -a)

/-- Subtraction is addition of the negation. -/
class SubtractionCompatibilityLaw (R : Type u)
    [Sub R] [Add R] [Neg R] : Prop where
  SubEqAddNeg : ∀ a b : R, a - b = a + -b

/-- Additive group laws. -/
class abbrev AdditiveGroupLaws (R : Type u)
    [Add R] [Neg R] [OfNat R 0] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R, AdditiveInverseLaws R

section Wrappers

variable {R : Type u}

/-- The negation is a left additive inverse. -/
theorem NegAddCancel [Add R] [Neg R] [OfNat R 0]
    [AdditiveInverseLaws R] :
    ∀ a : R, -a + a = 0 :=
  AdditiveInverseLaws.NegAddCancel

/-- The negation is a right additive inverse. -/
theorem AddNegCancel [Add R] [Neg R] [OfNat R 0]
    [AdditiveInverseLaws R] :
    ∀ a : R, a + -a = 0 :=
  AdditiveInverseLaws.AddNegCancel

/-- Subtraction is addition of the negation. -/
theorem SubEqAddNeg [Sub R] [Add R] [Neg R]
    [SubtractionCompatibilityLaw R] :
    ∀ a b : R, a - b = a + -b :=
  SubtractionCompatibilityLaw.SubEqAddNeg

end Wrappers

end LRA.AlgebraicStructures
