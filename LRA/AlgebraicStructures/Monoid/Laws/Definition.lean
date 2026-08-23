import LRA.AlgebraicStructures.Semigroup.Laws.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

   
                        
  

                                                      
class MultiplicativeIdentityLaws (R : Type u) [Mul R] [OfNat R 1] : Prop where
  OneMul :
    LRA.Operation.Laws.Identity.LeftIdentity (fun a b : R => a * b) 1
  MulOne :
    LRA.Operation.Laws.Identity.RightIdentity (fun a b : R => a * b) 1

                   
class abbrev MonoidLaws (R : Type u) [Mul R] [OfNat R 1] : Prop :=
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R

section Wrappers

variable {R : Type u}

                                                 
theorem OneMul [Mul R] [OfNat R 1] [MultiplicativeIdentityLaws R] :
    ∀ a : R, 1 * a = a := by
  sorry

                                                  
theorem MulOne [Mul R] [OfNat R 1] [MultiplicativeIdentityLaws R] :
    ∀ a : R, a * 1 = a := by
  sorry

end Wrappers

end LRA.AlgebraicStructures
