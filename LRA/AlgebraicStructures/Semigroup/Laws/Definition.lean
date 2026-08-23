import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

   
                           
  

                                                                            
class MultiplicativeSemigroupLaws (R : Type u) [Mul R] : Prop where
  MulAssociative :
    LRA.Operation.Laws.Associative.Associative (fun a b : R => a * b)

section Wrappers

variable {R : Type u}

                                     
theorem MulAssociative [Mul R] [MultiplicativeSemigroupLaws R] :
    ∀ a b c : R, (a * b) * c = a * (b * c) := by
  sorry

end Wrappers

end LRA.AlgebraicStructures
