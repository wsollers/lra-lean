import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/-!
Semigroup law certificates.
-/

/-- Multiplication specializes the canonical operation associativity law. -/
class MultiplicativeSemigroupLaws (R : Type u) [Mul R] : Prop where
  MulAssociative :
    LRA.Operation.Laws.Associative.Associative (fun a b : R => a * b)

section Wrappers

variable {R : Type u}

/-- Multiplication is associative. -/
theorem MulAssociative [Mul R] [MultiplicativeSemigroupLaws R] :
    ∀ a b c : R, (a * b) * c = a * (b * c) := by
  sorry

end Wrappers

end LRA.AlgebraicStructures
