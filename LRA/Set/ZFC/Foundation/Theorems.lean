import LRA.Set.ZFC.Axioms.Foundation
import LRA.Set.ZFC.Definitions
import LRA.Set.ZFC.Pairing.Theorems

   
                                                                         
                    
  

namespace LRA.Set.ZFC

                                                                              
theorem FoundationWitnessExists
    (A : Set) (nonempty : ∃ w : Set, w ∈ A) :
    ∃ x : Set, IsFoundationWitness A x := by
  sorry

                                    
theorem NoSetIsMemberOfItself (A : Set) :
    A ∉ A := by
  sorry

end LRA.Set.ZFC
