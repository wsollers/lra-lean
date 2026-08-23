import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

   
                                    
  

                               
class AdditiveCommutativeLaws (R : Type u) [Add R] : Prop where
  AddCommutative :
    LRA.Operation.Laws.Commutative.Commutative (fun a b : R => a + b)

section Wrappers

variable {R : Type u}

                               
theorem AddCommutative [Add R] [AdditiveCommutativeLaws R] :
    ∀ a b : R, a + b = b + a :=
  AdditiveCommutativeLaws.AddCommutative

end Wrappers

end LRA.AlgebraicStructures
