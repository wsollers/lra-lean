import LRA.AlgebraicStructures.Semigroup.Laws.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/-!
Monoid law certificates.
-/

/-- One is a two-sided identity for multiplication. -/
class MultiplicativeIdentityLaws (R : Type u) [Mul R] [OfNat R 1] : Prop where
  OneMul :
    LRA.Operation.Laws.Identity.LeftIdentity (fun a b : R => a * b) 1
  MulOne :
    LRA.Operation.Laws.Identity.RightIdentity (fun a b : R => a * b) 1

/-- Monoid laws. -/
class abbrev MonoidLaws (R : Type u) [Mul R] [OfNat R 1] : Prop :=
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R

section Wrappers

variable {R : Type u}

/-- One is a left identity for multiplication. -/
theorem OneMul [Mul R] [OfNat R 1] [MultiplicativeIdentityLaws R] :
    ∀ a : R, 1 * a = a := by
  sorry

/-- One is a right identity for multiplication. -/
theorem MulOne [Mul R] [OfNat R 1] [MultiplicativeIdentityLaws R] :
    ∀ a : R, a * 1 = a := by
  sorry

end Wrappers

end LRA.AlgebraicStructures
