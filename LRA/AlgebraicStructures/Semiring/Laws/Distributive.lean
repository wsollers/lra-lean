import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

   
                                                          
  

                                                
class DistributiveLaws (R : Type u) [Add R] [Mul R] : Prop where
  LeftDistributive :
    LRA.Operation.Laws.Distributive.LeftDistributive
      (fun a b : R => a * b) (fun a b : R => a + b)
  RightDistributive :
    LRA.Operation.Laws.Distributive.RightDistributive
      (fun a b : R => a * b) (fun a b : R => a + b)

section Wrappers

variable {R : Type u} [Add R] [Mul R] [DistributiveLaws R]

                                                              
theorem LeftDistributive : ∀ a b c : R, a * (b + c) = a * b + a * c := by
  exact DistributiveLaws.LeftDistributive

                                                               
theorem RightDistributive : ∀ a b c : R, (a + b) * c = a * c + b * c := by
  exact DistributiveLaws.RightDistributive

end Wrappers

end LRA.AlgebraicStructures
