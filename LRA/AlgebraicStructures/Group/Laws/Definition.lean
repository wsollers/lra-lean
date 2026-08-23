import LRA.AlgebraicStructures.Monoid.Laws.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

                                             

                                                         
class MultiplicativeGroupInverseLaws (R : Type u)
    [Mul R] [Inv R] [OfNat R 1] : Prop where
  InvMulCancel :
    LRA.Operation.Laws.Inverse.LeftInverse
      (fun a b : R => a * b) 1 (fun a : R => a⁻¹)
  MulInvCancel :
    LRA.Operation.Laws.Inverse.RightInverse
      (fun a b : R => a * b) 1 (fun a : R => a⁻¹)

                                 
class abbrev GroupLaws (R : Type u)
    [Mul R] [Inv R] [OfNat R 1] : Prop :=
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeGroupInverseLaws R

section Wrappers

variable {R : Type u}

                                                    
theorem InvMulCancel [Mul R] [Inv R] [OfNat R 1]
    [MultiplicativeGroupInverseLaws R] :
    ∀ a : R, a⁻¹ * a = 1 := by
  sorry

                                                     
theorem MulInvCancelGroup [Mul R] [Inv R] [OfNat R 1]
    [MultiplicativeGroupInverseLaws R] :
    ∀ a : R, a * a⁻¹ = 1 := by
  sorry

end Wrappers

end LRA.AlgebraicStructures
