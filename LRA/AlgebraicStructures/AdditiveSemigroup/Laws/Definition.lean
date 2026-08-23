import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

   
                                    

                                                                    
                                                                     
                                     
  

                                                                      
class AdditiveSemigroupLaws (R : Type u) [Add R] : Prop where
  AddAssociative :
    LRA.Operation.Laws.Associative.Associative (fun a b : R => a + b)

section Wrappers

variable {R : Type u}

                               
theorem AddAssociative [Add R] [AdditiveSemigroupLaws R] :
    ∀ a b c : R, (a + b) + c = a + (b + c) :=
  AdditiveSemigroupLaws.AddAssociative

end Wrappers

end LRA.AlgebraicStructures
