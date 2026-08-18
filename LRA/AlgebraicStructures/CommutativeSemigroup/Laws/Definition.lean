import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/-!
Commutative semigroup multiplicative law certificates.
-/

/-- Multiplication is commutative. -/
class MultiplicativeCommutativeLaws (R : Type u) [Mul R] : Prop where
  MulCommutative :
    LRA.Operation.Laws.Commutative.Commutative (fun a b : R => a * b)

section Wrappers

variable {R : Type u}

/-- Multiplication is commutative. -/
theorem MulCommutative [Mul R] [MultiplicativeCommutativeLaws R] :
    ∀ a b : R, a * b = b * a :=
  MultiplicativeCommutativeLaws.MulCommutative

end Wrappers

end LRA.AlgebraicStructures
