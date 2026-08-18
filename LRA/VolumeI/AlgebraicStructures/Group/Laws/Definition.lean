import LRA.VolumeI.AlgebraicStructures.Monoid.Laws.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/-! Multiplicative group law certificates. -/

/-- Inversion gives two-sided multiplicative inverses. -/
class MultiplicativeGroupInverseLaws (R : Type u)
    [Mul R] [Inv R] [OfNat R 1] : Prop where
  InvMulCancel :
    LRA.Operation.Laws.Inverse.LeftInverse
      (fun a b : R => a * b) 1 (fun a : R => a⁻¹)
  MulInvCancel :
    LRA.Operation.Laws.Inverse.RightInverse
      (fun a b : R => a * b) 1 (fun a : R => a⁻¹)

/-- Multiplicative group laws. -/
class abbrev GroupLaws (R : Type u)
    [Mul R] [Inv R] [OfNat R 1] : Prop :=
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeGroupInverseLaws R

section Wrappers

variable {R : Type u}

/-- The inverse is a left multiplicative inverse. -/
theorem InvMulCancel [Mul R] [Inv R] [OfNat R 1]
    [MultiplicativeGroupInverseLaws R] :
    ∀ a : R, a⁻¹ * a = 1 :=
  MultiplicativeGroupInverseLaws.InvMulCancel

/-- The inverse is a right multiplicative inverse. -/
theorem MulInvCancelGroup [Mul R] [Inv R] [OfNat R 1]
    [MultiplicativeGroupInverseLaws R] :
    ∀ a : R, a * a⁻¹ = 1 :=
  MultiplicativeGroupInverseLaws.MulInvCancel

end Wrappers

end LRA.AlgebraicStructures
