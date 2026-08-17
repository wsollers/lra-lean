import LRA.VolumeI.AlgebraicStructures.NontrivialRing.Laws.Definition
import LRA.VolumeI.Operations.Laws.Inverse.Definition

namespace LRA.AlgebraicStructures

universe u

/-!
Division ring law certificates.

The inverse operation is total. The `0⁻¹ = 0` convention is recorded as a law
rather than hidden in downstream adapters.
-/

/-- Multiplicative inverses for nonzero elements, with totalized zero. -/
class MultiplicativeInverseLaws (R : Type u)
    [Mul R] [Inv R] [OfNat R 0] [OfNat R 1] : Prop where
  MulInvCancel : ∀ a : R, a ≠ 0 →
    LRA.Operation.Laws.Inverse.RightInverseOf
      (fun x y : R => x * y) 1 a a⁻¹
  InvZero : (0 : R)⁻¹ = 0

/-- Division is multiplication by the inverse. -/
class DivisionCompatibilityLaw (R : Type u)
    [Div R] [Mul R] [Inv R] : Prop where
  DivEqMulInv : ∀ a b : R, a / b = a * b⁻¹

/-- Division ring laws, allowing noncommutative multiplication. -/
class abbrev DivisionRingLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] : Prop :=
  RingLaws R, NontrivialityLaw R, MultiplicativeInverseLaws R

section Wrappers

variable {R : Type u}

/-- Nonzero elements cancel against their inverses. -/
theorem MulInvCancel [Mul R] [Inv R] [OfNat R 0] [OfNat R 1]
    [MultiplicativeInverseLaws R] :
    ∀ a : R, a ≠ 0 → a * a⁻¹ = 1 :=
  MultiplicativeInverseLaws.MulInvCancel

/-- The inverse of zero is zero, by convention. -/
theorem InvZero [Mul R] [Inv R] [OfNat R 0] [OfNat R 1]
    [MultiplicativeInverseLaws R] :
    (0 : R)⁻¹ = 0 :=
  MultiplicativeInverseLaws.InvZero

/-- Division is multiplication by the inverse. -/
theorem DivEqMulInv [Div R] [Mul R] [Inv R]
    [DivisionCompatibilityLaw R] :
    ∀ a b : R, a / b = a * b⁻¹ :=
  DivisionCompatibilityLaw.DivEqMulInv

end Wrappers

end LRA.AlgebraicStructures
