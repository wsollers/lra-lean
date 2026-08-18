import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/-!
Additive commutativity certificates.
-/

/-- Addition is commutative. -/
class AdditiveCommutativeLaws (R : Type u) [Add R] : Prop where
  AddCommutative :
    LRA.Operation.Laws.Commutative.Commutative (fun a b : R => a + b)

section Wrappers

variable {R : Type u}

/-- Addition is commutative. -/
theorem AddCommutative [Add R] [AdditiveCommutativeLaws R] :
    ∀ a b : R, a + b = b + a :=
  AdditiveCommutativeLaws.AddCommutative

end Wrappers

end LRA.AlgebraicStructures
